import RedshiftLWFormal.Core.RedshiftLW001RootAction

namespace RedshiftLWFormal

noncomputable section

def RedshiftLWStage02 : Prop :=
  redshiftLWClockLinearFrequencySquared =
      2 * redshiftLWChi0^2 / redshiftLWB ∧
    0 < redshiftLWClockLinearFrequencySquared

theorem redshiftLW_clock_force_expansion (e : ℝ) :
    redshiftLWClockForce (redshiftLWChi0 + e) =
      -(2 * redshiftLWChi0^2 * e + 3 * redshiftLWChi0 * e^2 + e^3) /
        redshiftLWB := by
  unfold redshiftLWClockForce redshiftLWChi0 redshiftLWB
  ring

theorem redshiftLW_stage02_native_clock : RedshiftLWStage02 := by
  constructor
  · rfl
  · have hChi : redshiftLWChi0 = 19 := by
      simpa [redshiftLWChi0] using chi0_from_c19_value
    have hB : redshiftLWB = 1197 := by
      simpa [redshiftLWB] using B_from_geometry_value
    unfold redshiftLWClockLinearFrequencySquared
    rw [hChi, hB]
    norm_num

end
end RedshiftLWFormal

