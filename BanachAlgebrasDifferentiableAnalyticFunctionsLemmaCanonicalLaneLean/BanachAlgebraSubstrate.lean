import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

structure BanachAlgebraObject where
  carrier : Type
  norm : carrier → ℝ
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier
  norm_mul : ∀ x y, norm (mul x y) ≤ norm x * norm y
  norm_one : norm one = 1
  complete : True  -- placeholder for completeness

default instance : Inhabited BanachAlgebraObject := ⟨{
  carrier := Unit,
  norm := λ _ => 0,
  add := λ _ _ => (),
  mul := λ _ _ => (),
  zero := (),
  one := (),
  norm_mul := λ _ _ => by simp,
  norm_one := by simp,
  complete := trivial
}⟩

structure SpectrumData where
  algebra : BanachAlgebraObject
  element : algebra.carrier
  spectrum : Set ℂ
  spectralRadius : ℝ

structure AdmittedTheoremObject where
  object : BanachAlgebraObject
  substrate : SpectrumData
  analyticFunctionChecked : Prop
  differentiabilityChecked : Prop
  lemmaEndpoint : Prop

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse