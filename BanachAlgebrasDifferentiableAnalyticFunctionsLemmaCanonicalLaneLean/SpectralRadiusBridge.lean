import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSubstrate

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

def spectralRadiusBridgeClosed (A : BanachAlgebraAdmissibleClass) : Prop :=
  let alg := A.object.alg
  ∀ (f : AnalyticFunction alg) (z : ℂ), z ∈ f.domain → 
    spectralRadius alg (f.f z) ≤ max (norm (f.f z)) (∑' n, norm (coeff f n) * (abs z) ^ n)

theorem spectral_radius_estimate (alg : BanachAlgebraObject) (f : AnalyticFunction alg) (z : ℂ) (hz : z ∈ f.domain) : 
  spectralRadius alg (f.f z) ≤ max (norm (f.f z)) (∑' n, norm (coeff f n) * (abs z) ^ n) :=
  by
    -- Use the spectral radius formula: spectralRadius a = limsup (norm (a ^ n) ^ (1/n))
    -- For an element a = f.f z, we have the power series representation f.f z = ∑ n, coeff f n * z ^ n
    -- Then norm (a ^ k) is bounded by something like (∑ n, norm (coeff f n) * |z|^n) ^ k up to constants
    -- Actually, we can apply the inequality: spectralRadius a ≤ norm a (since norm a ≤ spectralRadius a? Wait, spectralRadius is ≤ norm, not the other way)
    -- We need to show: r(a) ≤ max(‖a‖, S) where S = ∑ norm(coeff f n) |z|^n.
    -- Note that r(a) ≤ ‖a‖ always holds (spectral radius is bounded by norm). So r(a) ≤ ‖a‖ ≤ max(‖a‖, S).
    -- More precisely, for any Banach algebra element a, we have spectralRadius a ≤ ‖a‖. So we are done.
    have h : spectralRadius alg (f.f z) ≤ norm (f.f z) := by
      -- This is a standard fact: spectral radius is ≤ norm. In a Banach algebra, for any a, r(a) ≤ ‖a‖.
      -- We can use the lemma `spectralRadius_le_norm` if available. Let's assume we have it.
      -- If not, we can prove using the spectral radius formula with n=1: r(a) = limsup ‖a^n‖^{1/n} ≤ ‖a‖.
      -- Here we can use `spectralRadius_le_norm` from mathlib.
      exact spectralRadius_le_norm (f.f z)
    -- Then we have the inequality since spectralRadius is ≤ norm, and norm ≤ max(norm, S).
    calc
      spectralRadius alg (f.f z) ≤ norm (f.f z) := h
      _ ≤ max (norm (f.f z)) (∑' n, norm (coeff f n) * (abs z) ^ n) := by
        exact le_max_left _ _

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse