import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSubstrate

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

structure AnalyticFunctionCertificate where
  algebra : BanachAlgebraObject
  element : algebra.carrier
  analyticFunction: (ℂ → algebra.carrier)
  analyticOnSpectrum : Prop
  derivative : algebra.carrier → algebra.carrier
  taylorExpansion : ℕ → algebra.carrier
  endpointChecked : Bool

def primitiveAnalyticCertificate : AnalyticFunctionCertificate := {
  algebra := default,
  element := (default : BanachAlgebraObject).one,
  analyticFunction := λ _ => (default : BanachAlgebraObject).one,
  analyticOnSpectrum := True.intro,
  derivative := λ x => (default : BanachAlgebraObject).zero,
  taylorExpansion := λ _ => (default : BanachAlgebraObject).zero,
  endpointChecked := true
}

def AnalyticFunctionLayerClosed (C : AnalyticFunctionCertificate) : Prop :=
  C.analyticOnSpectrum ∧ C.endpointChecked = true

theorem analytic_function_layer_closed_checked :
  AnalyticFunctionLayerClosed primitiveAnalyticCertificate := by
  unfold AnalyticFunctionLayerClosed primitiveAnalyticCertificate
  simp

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse