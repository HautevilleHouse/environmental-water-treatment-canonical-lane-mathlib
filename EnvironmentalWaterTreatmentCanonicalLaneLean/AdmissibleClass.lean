import HautevilleHouse.EnvironmentalWaterTreatmentCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure AdmissibleClass where
  object : WaterTreatmentAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WaterTreatmentWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse
