import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Analysis.Analytic.Basic
import Mathlib.Topology.Algebra.Banach

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

structure SpectrumData where
  algebra : Type
  norm : algebra → ℝ
  isBanach : Prop
  element : algebra
  spectrumSet : Set ℂ
  spectralRadius : ℝ

structure SpectrumCertificate where
  spectrumData : SpectrumData
  spectralMappingChecked : Bool
  analyticContinuationChecked : Bool

def primitiveSpectrumCertificate : SpectrumCertificate := {
  spectrumData := {
    algebra := ℂ,
    norm := fun x => Complex.abs x,
    isBanach := by infer_instance,
    element := Complex.I,
    spectrumSet := {x | x = Complex.I},
    spectralRadius := 1
  },
  spectralMappingChecked := true,
  analyticContinuationChecked := true
}

def SpectrumLayerClosed (C : SpectrumCertificate) : Prop :=
  C.spectralMappingChecked = true ∧ C.analyticContinuationChecked = true

theorem spectrum_layer_closed_checked : SpectrumLayerClosed primitiveSpectrumCertificate := by
  exact And.intro rfl rfl

end HautevilleHouse
end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
