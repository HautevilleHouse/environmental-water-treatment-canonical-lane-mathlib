import HautevilleHouse.EnvironmentalWaterTreatmentCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse
