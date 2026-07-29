import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure ReactorHydraulicsModel (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A) where
  flowPattern : Type u
  hydraulicRetentionTime : Prop
  mixingZoneCharacterization : Prop
  deadZoneFraction : Prop
  tracerResponseCurve : Prop

structure ReactorHydraulicsEvidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B) where
  hydraulicRetentionTimeClosed : R.hydraulicRetentionTime
  mixingZoneCharacterizationClosed : R.mixingZoneCharacterization
  deadZoneFractionClosed : R.deadZoneFraction
  tracerResponseCurveClosed : R.tracerResponseCurve

def ReactorHydraulicsClosed (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B) : Prop :=
  R.hydraulicRetentionTime ∧ R.mixingZoneCharacterization ∧
  R.deadZoneFraction ∧ R.tracerResponseCurve

theorem reactor_hydraulics_closed_from_evidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B)
    (E : ReactorHydraulicsEvidence F A B R) : ReactorHydraulicsClosed F A B R := by
  exact And.intro E.hydraulicRetentionTimeClosed
    (And.intro E.mixingZoneCharacterizationClosed
      (And.intro E.deadZoneFractionClosed E.tracerResponseCurveClosed))

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse