import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSubstrate

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

def bridgeClosed (A : BanachAlgebraAdmissibleClass) : Prop :=
  let alg := A.object.alg
  ∀ (f : AnalyticFunction alg), DifferentiableAt ℂ f.f (0 : ℂ)

theorem bridge_from_admissible_class (A : BanachAlgebraAdmissibleClass) : bridgeClosed A :=
  by
    intro f
    have h : f.analytic 0 := sorry
    -- construct derivative via power series
    exact h.differentiableAt

theorem analytic_implies_differentiable (alg : BanachAlgebraObject) (f : AnalyticFunction alg) (z : ℂ) (hz : z ∈ f.domain) : DifferentiableAt ℂ f.f z :=
  by
    have := f.analytic z hz
    rcases this with ⟨r, hr, a, ha⟩
    -- use uniform convergence to show complex differentiability
    sorry

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse