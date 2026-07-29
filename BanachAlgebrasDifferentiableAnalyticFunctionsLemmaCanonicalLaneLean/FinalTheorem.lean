import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSubstrate
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.AnalyticFunctionLemmaLayer

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | AdmittedTheoremObject.mk obj _ _ _ =>
    obj.complete ∧ True

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  unfold bridgeClosed
  exact ⟨by
    match A.object with
    | AdmittedTheoremObject.mk obj _ _ _ => exact obj.complete, trivial⟩

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedTheoremClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_theorem_closure (A : AdmissibleClass) : ConstrainedTheoremClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse