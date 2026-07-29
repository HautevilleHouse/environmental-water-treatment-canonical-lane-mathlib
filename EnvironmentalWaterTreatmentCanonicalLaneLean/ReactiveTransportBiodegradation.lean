import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure ReactiveTransportBiodegradationPackage where
  microbialSpecies : Type u
  degradationPathway : Prop
  monodKinetics : Prop
  electronAcceptorLimitation : Prop
  biomassGrowth : Prop

structure ReactiveTransportBiodegradationEvidence
    (R : ReactiveTransportBiodegradationPackage) where
  degradationPathwayClosed : R.degradationPathway
  monodKineticsClosed : R.monodKinetics
  electronAcceptorLimitationClosed : R.electronAcceptorLimitation
  biomassGrowthClosed : R.biomassGrowth

def ReactiveTransportBiodegradationClosed
    (R : ReactiveTransportBiodegradationPackage) : Prop :=
  R.degradationPathway ∧ R.monodKinetics ∧
  R.electronAcceptorLimitation ∧ R.biomassGrowth

theorem reactive_transport_biodegradation_closed_from_evidence
    (R : ReactiveTransportBiodegradationPackage)
    (E : ReactiveTransportBiodegradationEvidence R) :
    ReactiveTransportBiodegradationClosed R := by
  exact And.intro E.degradationPathwayClosed
    (And.intro E.monodKineticsClosed
      (And.intro E.electronAcceptorLimitationClosed E.biomassGrowthClosed))

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse