import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure AdsorptionKineticsPackage where
  adsorbate : Type u
  adsorbent : Type v
  isothermModel : Prop
  rateExpression : Prop
  equilibriumConstant : Prop

structure AdsorptionKineticsEvidence (K : AdsorptionKineticsPackage) where
  isothermModelClosed : K.isothermModel
  rateExpressionClosed : K.rateExpression
  equilibriumConstantClosed : K.equilibriumConstant

def AdsorptionKineticsClosed (K : AdsorptionKineticsPackage) : Prop :=
  K.isothermModel ∧ K.rateExpression ∧ K.equilibriumConstant

theorem adsorption_kinetics_closed_from_evidence
    (K : AdsorptionKineticsPackage) (E : AdsorptionKineticsEvidence K) :
    AdsorptionKineticsClosed K := by
  exact And.intro E.isothermModelClosed
    (And.intro E.rateExpressionClosed E.equilibriumConstantClosed)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse