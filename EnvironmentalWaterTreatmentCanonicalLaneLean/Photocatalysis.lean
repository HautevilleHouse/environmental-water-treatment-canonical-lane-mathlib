import EnvironmentalWaterTreatmentCanonicalLaneLean.WaterContaminantModel

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure Photocatalyst where
  bandGap : Float
  surfaceArea : Float
  bandGapPositive : bandGap > 0.0
  surfaceAreaNonnegative : surfaceArea ≥ 0.0

structure PhotocatalysisProcess where
  catalyst : Photocatalyst
  lightIntensity : Float
  contaminant : ContaminantSpecies
  lightIntensityPositive : lightIntensity > 0.0

def reactionRate (P : PhotocatalysisProcess) : Float :=
  P.lightIntensity * P.catalyst.surfaceArea * P.contaminant.solubility

structure PhotocatalysisEvidence (P : PhotocatalysisProcess) where
  bandGapSuitable : P.catalyst.bandGap ≥ 3.0
  rateClosed : True

def PhotocatalysisClosed (P : PhotocatalysisProcess) : Prop :=
  P.catalyst.bandGap ≥ 3.0

theorem photocatalysis_closed_from_evidence (P : PhotocatalysisProcess) (E : PhotocatalysisEvidence P) :
    PhotocatalysisClosed P := by
  exact E.bandGapSuitable

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse