import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure DisinfectionKineticsPackage where
  disinfectant : Type u
  pathogen : Type v
  inactivationModel : Prop
  ctValueConstraint : Prop
  residualDecay : Prop

structure DisinfectionKineticsEvidence (D : DisinfectionKineticsPackage) where
  inactivationModelClosed : D.inactivationModel
  ctValueConstraintClosed : D.ctValueConstraint
  residualDecayClosed : D.residualDecay

def DisinfectionKineticsClosed (D : DisinfectionKineticsPackage) : Prop :=
  D.inactivationModel ∧ D.ctValueConstraint ∧ D.residualDecay

theorem disinfection_kinetics_closed_from_evidence
    (D : DisinfectionKineticsPackage) (E : DisinfectionKineticsEvidence D) :
    DisinfectionKineticsClosed D := by
  exact And.intro E.inactivationModelClosed
    (And.intro E.ctValueConstraintClosed E.residualDecayClosed)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse