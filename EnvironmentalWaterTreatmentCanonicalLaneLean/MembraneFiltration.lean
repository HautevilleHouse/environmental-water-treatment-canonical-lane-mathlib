import EnvironmentalWaterTreatmentCanonicalLaneLean.WaterContaminantModel

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure Membrane where
  poreSize : Float
  material : String
  poreSizePositive : poreSize > 0.0

structure MembraneFiltrationPackage where
  membrane : Membrane
  contaminant : ContaminantSpecies
  pressure : Float
  flowRate : Float
  pressurePositive : pressure > 0.0
  flowRateNonnegative : flowRate ≥ 0.0
  rejectionRate : Float
  rejectionRateInRange : 0.0 ≤ rejectionRate ∧ rejectionRate ≤ 1.0

def MembraneFiltrationClosed (M : MembraneFiltrationPackage) : Prop :=
  M.rejectionRate ≥ 0.9

structure MembraneFiltrationEvidence (M : MembraneFiltrationPackage) where
  rejectionClosed : M.rejectionRate ≥ 0.9

theorem membrane_filtration_closed_from_evidence (M : MembraneFiltrationPackage) (E : MembraneFiltrationEvidence M) :
    MembraneFiltrationClosed M := by
  exact E.rejectionClosed

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse