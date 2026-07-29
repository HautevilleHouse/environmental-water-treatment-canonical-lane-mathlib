import HautevilleHouse.EnvironmentalWaterTreatmentCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WaterTreatmentWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse
