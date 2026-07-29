import EnvironmentalWaterTreatmentCanonicalLaneLean.WaterContaminantModel

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure LangmuirIsotherm where
  qMax : Float
  kL : Float
  qMaxPositive : qMax > 0.0
  kLPositive : kL > 0.0

def langmuirAdsorption (I : LangmuirIsotherm) (c : Float) : Float :=
  I.qMax * I.kL * c / (1 + I.kL * c)

structure FreundlichIsotherm where
  kF : Float
  n : Float
  kFPositive : kF > 0.0
  nPositive : n > 0.0

def freundlichAdsorption (I : FreundlichIsotherm) (c : Float) : Float :=
  I.kF * c ^ (1 / I.n)

structure AdsorptionIsothermPackage where
  langmuir : LangmuirIsotherm
  freundlich : FreundlichIsotherm
  isothermLangmuirClosed : Prop
  isothermFreundlichClosed : Prop

def AdsorptionIsothermClosed (A : AdsorptionIsothermPackage) : Prop :=
  A.isothermLangmuirClosed ∧ A.isothermFreundlichClosed

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse