import EnvironmentalWaterTreatmentCanonicalLaneLean.WaterContaminantModel

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure Microorganism where
  species : String
  degradationRate : Float
  optimalTemperature : Float
  optimalPh : Float
  degradationRatePositive : degradationRate > 0.0
  optimalTemperatureInRange : 273.15 ≤ optimalTemperature ∧ optimalTemperature ≤ 323.15
  optimalPhInRange : 4.0 ≤ optimalPh ∧ optimalPh ≤ 9.0

structure BiodegradationPackage where
  microbe : Microorganism
  contaminant : ContaminantSpecies
  temperature : Float
  ph : Float
  temperatureCloseToOptimal : Prop
  phCloseToOptimal : Prop
  degradationRate : Float
  degradationRateComputed : degradationRate = microbe.degradationRate * (1.0 - abs (temperature - microbe.optimalTemperature) / microbe.optimalTemperature)

def BiodegradationClosed (B : BiodegradationPackage) : Prop :=
  B.degradationRate > 0.0

structure BiodegradationEvidence (B : BiodegradationPackage) where
  degradationPositive : B.degradationRate > 0.0
  conditionsMet : B.temperatureCloseToOptimal ∧ B.phCloseToOptimal

theorem biodegradation_closed_from_evidence (B : BiodegradationPackage) (E : BiodegradationEvidence B) :
    BiodegradationClosed B := by
  exact E.degradationPositive

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse