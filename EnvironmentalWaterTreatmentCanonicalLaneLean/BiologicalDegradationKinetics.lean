import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure BiologicalDegradationKinetics (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F) where
  microbialGrowthModel : Type u
  substrateUtilization : Prop
  monodParameter : Prop
  halfSaturationConstant : Prop
  decayCoefficient : Prop

def BiologicalDegradationClosed (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A) : Prop :=
  B.substrateUtilization ∧ B.monodParameter ∧
  B.halfSaturationConstant ∧ B.decayCoefficient

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse