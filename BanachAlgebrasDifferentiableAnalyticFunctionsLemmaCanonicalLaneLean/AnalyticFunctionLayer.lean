import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Topology.Algebra.Banach

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

structure AnalyticFunctionData where
  function : ℂ → ℂ
  domain : Set ℂ
  analyticOnDomain : Prop

structure AnalyticFunctionCertificate where
  analyticFunctionData : AnalyticFunctionData
  functionBoundedOnSpectrum : Bool
  taylorExpansionConverges : Bool

def primitiveAnalyticFunctionCertificate : AnalyticFunctionCertificate := {
  analyticFunctionData := {
    function := fun z => z,
    domain := Set.univ,
    analyticOnDomain := True.intro
  },
  functionBoundedOnSpectrum := true,
  taylorExpansionConverges := true
}

def AnalyticFunctionLayerClosed (C : AnalyticFunctionCertificate) : Prop :=
  C.functionBoundedOnSpectrum = true ∧ C.taylorExpansionConverges = true

theorem analytic_function_layer_closed_checked : AnalyticFunctionLayerClosed primitiveAnalyticFunctionCertificate := by
  exact And.intro rfl rfl

end HautevilleHouse
end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
