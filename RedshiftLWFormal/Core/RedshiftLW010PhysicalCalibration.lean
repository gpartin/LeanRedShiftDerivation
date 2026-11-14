import RedshiftLWFormal.Core.RedshiftLW009ContinuumMatch

namespace RedshiftLWFormal

noncomputable section

/-! Stage 15 formal boundary.  c40 supplies native units.  An external choice
of physical length scale fixes the corresponding time scale through the
native carrier speed and c_SI; the theorem deliberately leaves that length
anchor free. -/

def redshiftLWPhysicalTimeScale
    (lengthScale nativeSpeed cSI : ℝ) : ℝ :=
  lengthScale * nativeSpeed / cSI

def RedshiftLWStage10 : Prop :=
  ∀ (lengthScale nativeSpeed cSI : ℝ),
    lengthScale ≠ 0 → nativeSpeed ≠ 0 → cSI ≠ 0 →
      lengthScale / redshiftLWPhysicalTimeScale lengthScale nativeSpeed cSI
          * nativeSpeed = cSI

theorem redshiftLW_native_time_scale_identity
    (lengthScale nativeSpeed cSI : ℝ)
    (hLength : lengthScale ≠ 0)
    (hNativeSpeed : nativeSpeed ≠ 0)
    (hcSI : cSI ≠ 0) :
    lengthScale / redshiftLWPhysicalTimeScale lengthScale nativeSpeed cSI
        * nativeSpeed = cSI := by
  unfold redshiftLWPhysicalTimeScale
  field_simp [hLength, hNativeSpeed, hcSI]

theorem redshiftLW_stage10_physical_calibration : RedshiftLWStage10 := by
  intro lengthScale nativeSpeed cSI hLength hNativeSpeed hcSI
  exact redshiftLW_native_time_scale_identity lengthScale nativeSpeed cSI
    hLength hNativeSpeed hcSI

end
end RedshiftLWFormal

