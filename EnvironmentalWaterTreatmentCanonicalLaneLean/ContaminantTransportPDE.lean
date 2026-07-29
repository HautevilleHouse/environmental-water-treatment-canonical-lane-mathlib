import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EnvironmentalWaterTreatmentCanonicalLaneLean

structure ContaminantTransportPDE where
  concentrationField : Type u
  timeParameter : Type v
  spatialVariable : Type w
  advectionCoefficient : Type x
  diffusionCoefficient : Type y
  reactionTerm : Type z
  advectionDiffusionEquation : Prop
  initialCondition : Prop
  boundaryCondition : Prop

structure ContaminantTransportEvidence (F : ContaminantTransportPDE) where
  advectionDiffusionEquationClosed : F.advectionDiffusionEquation
  initialConditionClosed : F.initialCondition
  boundaryConditionClosed : F.boundaryCondition

def ContaminantTransportClosed (F : ContaminantTransportPDE) : Prop :=
  F.advectionDiffusionEquation ∧ F.initialCondition ∧ F.boundaryCondition

theorem contaminant_transport_closed_from_evidence (F : ContaminantTransportPDE)
    (E : ContaminantTransportEvidence F) : ContaminantTransportClosed F := by
  exact And.intro E.advectionDiffusionEquationClosed
    (And.intro E.initialConditionClosed E.boundaryConditionClosed)

end EnvironmentalWaterTreatmentCanonicalLaneLean
end HautevilleHouse