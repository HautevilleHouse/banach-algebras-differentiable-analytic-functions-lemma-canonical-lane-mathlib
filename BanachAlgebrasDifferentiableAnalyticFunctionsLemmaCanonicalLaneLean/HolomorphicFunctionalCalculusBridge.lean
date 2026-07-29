import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSpectrum
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.DifferentiableFunctionalCalculus
import HautevilleHouse.BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.AnalyticFunctionLayer

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.gateWitness

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∧ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact And.intro A.endpointSatisfied A.remainderRecorded

end HautevilleHouse
end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
