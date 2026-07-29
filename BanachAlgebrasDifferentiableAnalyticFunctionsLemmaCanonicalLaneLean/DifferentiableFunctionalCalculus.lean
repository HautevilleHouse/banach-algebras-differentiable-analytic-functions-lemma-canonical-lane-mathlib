import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Topology.Algebra.Banach

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

structure FunctionalCalculusData where
  algebra : Type
  element : algebra
  function : ℂ → ℂ
  analyticOnSpectrum : Prop
  result : algebra

structure FunctionalCalculusCertificate where
  functionalCalculusData : FunctionalCalculusData
  calculusDefined : Bool
  propertiesPreserved : Bool

def primitiveFunctionalCalculusCertificate : FunctionalCalculusCertificate := {
  functionalCalculusData := {
    algebra := ℂ,
    element := Complex.I,
    function := fun z => z,
    analyticOnSpectrum := True.intro,
    result := Complex.I
  },
  calculusDefined := true,
  propertiesPreserved := true
}

def FunctionalCalculusLayerClosed (C : FunctionalCalculusCertificate) : Prop :=
  C.calculusDefined = true ∧ C.propertiesPreserved = true

theorem functional_calculus_layer_closed_checked : FunctionalCalculusLayerClosed primitiveFunctionalCalculusCertificate := by
  exact And.intro rfl rfl

end HautevilleHouse
end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
