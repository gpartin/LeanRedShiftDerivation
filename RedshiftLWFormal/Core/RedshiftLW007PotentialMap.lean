import RedshiftLWFormal.Core.RedshiftLW006SourceProfile

namespace RedshiftLWFormal

noncomputable section

/-! Stage 12 formal boundary.  The operational potential is reconstructed from
the dimensionless native clock lapse.  This is a readout identity, not a new
dynamical metric field or an inserted redshift law. -/

def redshiftLWClockLapse (clockRate referenceRate : ℝ) : ℝ :=
  clockRate / referenceRate

def redshiftLWOperationalPotential (clockRate referenceRate : ℝ) : ℝ :=
  (redshiftLWClockLapse clockRate referenceRate ^ 2 - 1) / 2

def RedshiftLWStage07 : Prop :=
  ∀ (clockRate referenceRate : ℝ), referenceRate ≠ 0 →
    1 + 2 * redshiftLWOperationalPotential clockRate referenceRate =
      redshiftLWClockLapse clockRate referenceRate ^ 2

theorem redshiftLW_operational_potential_identity
    (clockRate referenceRate : ℝ) (_hReference : referenceRate ≠ 0) :
    1 + 2 * redshiftLWOperationalPotential clockRate referenceRate =
      redshiftLWClockLapse clockRate referenceRate ^ 2 := by
  unfold redshiftLWOperationalPotential redshiftLWClockLapse
  ring

theorem redshiftLW_stage07_potential_map : RedshiftLWStage07 := by
  intro clockRate referenceRate _hReference
  exact redshiftLW_operational_potential_identity clockRate referenceRate _hReference

end
end RedshiftLWFormal

