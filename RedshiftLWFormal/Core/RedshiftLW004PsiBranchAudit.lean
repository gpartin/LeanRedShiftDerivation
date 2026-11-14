import RedshiftLWFormal.Core.RedshiftLWDefinitions

namespace RedshiftLWFormal

noncomputable section

/-! The intended Dirac crosswalk assigns chi to the clock/mass background and
Psi to the propagating signal.  This module audits the corresponding
linearized uniform c40 branch.  It is a no-go certificate for that branch,
not a claim about every nonlinear or inhomogeneous solution. -/

def redshiftLWPsiUniformGap (chiRadius : ℝ) : ℝ :=
  chiRadius ^ 2

def redshiftLWPsiUniformModeOmegaSquared
    (chiRadius k0 k1 k2 : ℝ) : ℝ :=
  redshiftLWPsiUniformGap chiRadius +
    (chiRadius ^ 2 / redshiftLWChi0 ^ 2) *
      redshiftLWStructureFactor k0 k1 k2

def redshiftLWCompatibleNullPolarization : RedshiftLWComplex3 :=
  fun j => match j.1 with
    | 0 => 1
    | 1 => Complex.I
    | _ => 0

def redshiftLWBilinearDot (a b : RedshiftLWComplex3) : ℂ :=
  ∑ j, a j * b j

theorem redshiftLW_structure_factor_nonnegative (k0 k1 k2 : ℝ) :
    0 ≤ redshiftLWStructureFactor k0 k1 k2 := by
  have h0 : 0 ≤ 1 - Real.cos k0 := by
    linarith [Real.cos_le_one k0]
  have h1 : 0 ≤ 1 - Real.cos k1 := by
    linarith [Real.cos_le_one k1]
  have h2 : 0 ≤ 1 - Real.cos k2 := by
    linarith [Real.cos_le_one k2]
  have hp01 : Real.cos k0 * Real.cos k1 ≤ 1 := by
    have ha := Real.abs_cos_le_one k0
    have hb := Real.abs_cos_le_one k1
    have habs : |Real.cos k0 * Real.cos k1| ≤ 1 := by
      rw [abs_mul]
      calc
        |Real.cos k0| * |Real.cos k1| ≤ 1 * |Real.cos k1| :=
          mul_le_mul_of_nonneg_right ha (abs_nonneg _)
        _ ≤ 1 * 1 := mul_le_mul_of_nonneg_left hb (by positivity)
        _ = 1 := by norm_num
    exact le_trans (le_abs_self _) habs
  have hp02 : Real.cos k0 * Real.cos k2 ≤ 1 := by
    have ha := Real.abs_cos_le_one k0
    have hb := Real.abs_cos_le_one k2
    have habs : |Real.cos k0 * Real.cos k2| ≤ 1 := by
      rw [abs_mul]
      calc
        |Real.cos k0| * |Real.cos k2| ≤ 1 * |Real.cos k2| :=
          mul_le_mul_of_nonneg_right ha (abs_nonneg _)
        _ ≤ 1 * 1 := mul_le_mul_of_nonneg_left hb (by positivity)
        _ = 1 := by norm_num
    exact le_trans (le_abs_self _) habs
  have hp12 : Real.cos k1 * Real.cos k2 ≤ 1 := by
    have ha := Real.abs_cos_le_one k1
    have hb := Real.abs_cos_le_one k2
    have habs : |Real.cos k1 * Real.cos k2| ≤ 1 := by
      rw [abs_mul]
      calc
        |Real.cos k1| * |Real.cos k2| ≤ 1 * |Real.cos k2| :=
          mul_le_mul_of_nonneg_right ha (abs_nonneg _)
        _ ≤ 1 * 1 := mul_le_mul_of_nonneg_left hb (by positivity)
        _ = 1 := by norm_num
    exact le_trans (le_abs_self _) habs
  unfold redshiftLWStructureFactor
  positivity

theorem redshiftLW_uniform_psi_mode_lower_bound
    (chiRadius k0 k1 k2 : ℝ) :
    redshiftLWPsiUniformGap chiRadius ≤
      redshiftLWPsiUniformModeOmegaSquared chiRadius k0 k1 k2 := by
  have hchi0 : redshiftLWChi0 = 19 := by
    simpa [redshiftLWChi0] using chi0_from_c19_value
  have hscale : 0 ≤ chiRadius ^ 2 / redshiftLWChi0 ^ 2 := by
    rw [hchi0]
    positivity
  have hfactor := redshiftLW_structure_factor_nonnegative k0 k1 k2
  have hproduct : 0 ≤
      (chiRadius ^ 2 / redshiftLWChi0 ^ 2) *
        redshiftLWStructureFactor k0 k1 k2 :=
    mul_nonneg hscale hfactor
  unfold redshiftLWPsiUniformModeOmegaSquared
  linarith

theorem redshiftLW_uniform_psi_gap_zero_iff
    (chiRadius : ℝ) :
    redshiftLWPsiUniformGap chiRadius = 0 ↔ chiRadius = 0 := by
  unfold redshiftLWPsiUniformGap
  constructor
  · intro h
    nlinarith
  · intro h
    simp [h]

theorem redshiftLW_uniform_psi_clock_vacuum_no_go :
    redshiftLWPsiUniformGap redshiftLWChi0 = 361 ∧
      redshiftLWPsiUniformGap redshiftLWChi0 ≠ 0 := by
  have hchi0 : redshiftLWChi0 = 19 := by
    simpa [redshiftLWChi0] using chi0_from_c19_value
  rw [hchi0]
  norm_num [redshiftLWPsiUniformGap]

theorem redshiftLW_bilinear_null_polarization :
    redshiftLWBilinearDot redshiftLWCompatibleNullPolarization
      redshiftLWCompatibleNullPolarization = 0 := by
  simp [redshiftLWBilinearDot, redshiftLWCompatibleNullPolarization,
    Fin.sum_univ_succ]

theorem redshiftLW_bilinear_null_polarization_has_hermitian_norm :
    redshiftLWC3NormSq redshiftLWCompatibleNullPolarization = 2 := by
  norm_num [redshiftLWC3NormSq, redshiftLWCompatibleNullPolarization,
    Fin.sum_univ_succ]

end
end RedshiftLWFormal

