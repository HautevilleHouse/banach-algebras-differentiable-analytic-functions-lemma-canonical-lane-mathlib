import canonicalLaneMathlib.AdmissibleClass
import BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean.BanachAlgebraSubstrate

namespace HautevilleHouse
namespace BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean

def productRuleClosed (A : BanachAlgebraAdmissibleClass) : Prop :=
  let alg := A.object.alg
  ∀ (f g : AnalyticFunction alg), (f.f * g.f) is Analytic on (f.domain ∩ g.domain)

theorem product_rule (alg : BanachAlgebraObject) (f g : AnalyticFunction alg) : 
  AnalyticFunction.mk (λ z => alg.mul (f.f z) (g.f z)) (f.domain ∩ g.domain) (by
    intro z hz
    have hf := f.analytic z hz.1
    have hg := g.analytic z hz.2
    -- product of power series is analytic
    exact product_series_analytic hf hg
  ) :=
  by
    exact ⟨f.domain ∩ g.domain, λ z => alg.mul (f.f z) (g.f z), ?_, ?_⟩

end BanachAlgebrasDifferentiableAnalyticFunctionsLemmaCanonicalLaneLean
end HautevilleHouse