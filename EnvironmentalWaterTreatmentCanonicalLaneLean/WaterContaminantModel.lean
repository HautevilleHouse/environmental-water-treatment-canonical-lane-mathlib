import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure ContaminantSpecies where
  name : String
  molecularWeight : Float
  solubility : Float
  toxicityThreshold : Float

def ContaminantSpeciesAdmissible (c : ContaminantSpecies) : Prop :=
  c.molecularWeight > 0.0 ∧ c.solubility ≥ 0.0 ∧ c.toxicityThreshold > 0.0

structure WaterContaminantPackage where
  species : ContaminantSpecies
  concentration : Float
  temperature : Float
  ph : Float
  speciesAdmissible : ContaminantSpeciesAdmissible species
  concentrationNonnegative : concentration ≥ 0.0
  temperatureInRange : 273.15 ≤ temperature ∧ temperature ≤ 373.15
  phInRange : 0.0 ≤ ph ∧ ph ≤ 14.0

def WaterContaminantAdmissible (P : WaterContaminantPackage) : Prop :=
  P.speciesAdmissible ∧ P.concentrationNonnegative ∧ P.temperatureInRange ∧ P.phInRange

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse