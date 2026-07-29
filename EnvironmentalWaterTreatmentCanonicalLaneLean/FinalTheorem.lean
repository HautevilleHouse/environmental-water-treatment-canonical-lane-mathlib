import canonicalLaneMathlib.AdmissibleClass
import EnvironmentalWaterTreatmentCanonicalLaneLean.TreatmentEfficiencyEndpoint

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

def ConstrainedWaterTreatmentClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_water_treatment_endgame (A : AdmissibleClass) :
    ConstrainedWaterTreatmentClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse