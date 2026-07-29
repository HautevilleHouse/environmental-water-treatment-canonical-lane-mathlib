import EnvironmentalWaterTreatmentCanonicalLaneLean.WaterContaminantModel

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure FentonReagent where
  fe2Concentration : Float
  h2o2Concentration : Float
  ph : Float
  fe2Nonnegative : fe2Concentration ≥ 0.0
  h2o2Nonnegative : h2o2Concentration ≥ 0.0
  phInRange : 2.0 ≤ ph ∧ ph ≤ 4.0

def fentonReactionRate (F : FentonReagent) (contaminant : ContaminantSpecies) : Float :=
  F.fe2Concentration * F.h2o2Concentration * contaminant.solubility

structure FentonReactionPackage where
  reagent : FentonReagent
  contaminant : ContaminantSpecies
  rateComputed : Prop
  degradationEfficiency : Float
  efficiencyNonnegative : degradationEfficiency ≥ 0.0
  ratePositive : rateComputed

def FentonReactionClosed (F : FentonReactionPackage) : Prop :=
  F.rateComputed ∧ F.efficiencyNonnegative

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse