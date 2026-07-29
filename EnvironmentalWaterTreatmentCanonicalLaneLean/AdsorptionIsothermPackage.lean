import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure AdsorptionIsothermPackage (F : ContaminantTransportPDE) where
  isothermModel : Type u
  equilibriumConstant : Type v
  langmuirParameter : Prop
  freundlichParameter : Prop
  adsorptionCapacity : Prop
  surfaceReactionKinetics : Prop

structure AdsorptionIsothermEvidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F) where
  langmuirParameterClosed : A.langmuirParameter
  freundlichParameterClosed : A.freundlichParameter
  adsorptionCapacityClosed : A.adsorptionCapacity
  surfaceReactionKineticsClosed : A.surfaceReactionKinetics

def AdsorptionIsothermClosed (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F) : Prop :=
  A.langmuirParameter ∧ A.freundlichParameter ∧
  A.adsorptionCapacity ∧ A.surfaceReactionKinetics

theorem adsorption_isotherm_closed_from_evidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F) (E : AdsorptionIsothermEvidence F A) :
    AdsorptionIsothermClosed F A := by
  exact And.intro E.langmuirParameterClosed
    (And.intro E.freundlichParameterClosed
      (And.intro E.adsorptionCapacityClosed E.surfaceReactionKineticsClosed))

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse