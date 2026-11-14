import RedshiftLWFormal.Core.RedshiftLW002NativeClock

namespace RedshiftLWFormal

noncomputable section

def RedshiftLWStage03 : Prop :=
  ∀ (radius : ℝ), radius ≠ 0 →
    redshiftLWLocalRotatingFrequencySquared radius = radius^2

theorem redshiftLW_local_rotating_frequency_squared
    (radius : ℝ) (hRadius : radius ≠ 0) :
    redshiftLWLocalRotatingFrequencySquared radius = radius^2 := by
  unfold redshiftLWLocalRotatingFrequencySquared redshiftLWLocalPsiForce
  field_simp

theorem redshiftLW_stage03_equation : RedshiftLWStage03 := by
  intro radius hRadius
  exact redshiftLW_local_rotating_frequency_squared radius hRadius

theorem redshiftLW_one_plus_redshift
    (omegaEmitter omegaReceiver : ℝ) (hReceiver : omegaReceiver ≠ 0) :
    1 + redshiftLWRedshift omegaEmitter omegaReceiver =
      omegaEmitter / omegaReceiver := by
  unfold redshiftLWRedshift
  field_simp
  ring

end
end RedshiftLWFormal

