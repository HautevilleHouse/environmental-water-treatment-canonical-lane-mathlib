import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure TreatmentEfficiencyEndpoint (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B) where
  effluentConcentration : Type u
  removalEfficiency : Prop
  dischargeCompliance : Prop
  endpointAchieved : Prop

structure TreatmentEfficiencyEndpointEvidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B)
    (Epkg : TreatmentEfficiencyEndpoint F A B R) where
  removalEfficiencyClosed : Epkg.removalEfficiency
  dischargeComplianceClosed : Epkg.dischargeCompliance
  endpointAchievedClosed : Epkg.endpointAchieved

def TreatmentEfficiencyEndpointClosed (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B)
    (Epkg : TreatmentEfficiencyEndpoint F A B R) : Prop :=
  Epkg.removalEfficiency ∧ Epkg.dischargeCompliance ∧ Epkg.endpointAchieved

theorem treatment_efficiency_endpoint_closed_from_evidence (F : ContaminantTransportPDE)
    (A : AdsorptionIsothermPackage F)
    (B : BiologicalDegradationKinetics F A)
    (R : ReactorHydraulicsModel F A B)
    (Epkg : TreatmentEfficiencyEndpoint F A B R)
    (E : TreatmentEfficiencyEndpointEvidence F A B R Epkg) :
    TreatmentEfficiencyEndpointClosed F A B R Epkg := by
  exact And.intro E.removalEfficiencyClosed
    (And.intro E.dischargeComplianceClosed E.endpointAchievedClosed)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse