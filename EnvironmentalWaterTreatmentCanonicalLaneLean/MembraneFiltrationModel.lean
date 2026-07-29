import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure MembraneFiltrationModelPackage where
  membraneType : Type u
  poreSizeDistribution : Prop
  rejectionCoefficient : Prop
  foulingMechanism : Prop
  fluxDeclineLaw : Prop

structure MembraneFiltrationModelEvidence (M : MembraneFiltrationModelPackage) where
  poreSizeDistributionClosed : M.poreSizeDistribution
  rejectionCoefficientClosed : M.rejectionCoefficient
  foulingMechanismClosed : M.foulingMechanism
  fluxDeclineLawClosed : M.fluxDeclineLaw

def MembraneFiltrationModelClosed (M : MembraneFiltrationModelPackage) : Prop :=
  M.poreSizeDistribution ∧ M.rejectionCoefficient ∧
  M.foulingMechanism ∧ M.fluxDeclineLaw

theorem membrane_filtration_model_closed_from_evidence
    (M : MembraneFiltrationModelPackage)
    (E : MembraneFiltrationModelEvidence M) :
    MembraneFiltrationModelClosed M := by
  exact And.intro E.poreSizeDistributionClosed
    (And.intro E.rejectionCoefficientClosed
      (And.intro E.foulingMechanismClosed E.fluxDeclineLawClosed))

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse