import Lax725166.C19CoupledPhaseGap
import Mathlib

namespace Lax725166Proofs.C19CoupledPhaseGap

open Lax725166.C19CoupledPhaseGap

/--
---
conclusion: Lax725166.C19CoupledPhaseGap.structureFactor_nonnegative
---
Each face contribution is nonnegative because cosine is at most one.  Each
edge contribution is nonnegative because the product of two cosine values is
also at most one.
-/
theorem structureFactor_nonnegative (k0 k1 k2 : ℝ) :
    0 ≤ structureFactor k0 k1 k2 := by
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
  unfold structureFactor
  positivity

/--
---
conclusion: Lax725166.C19CoupledPhaseGap.phaseOmegaSquared_positive
---
The mode stiffness and reciprocal inertia factor are both strictly positive
under the theorem's explicit nonzero-radius and positive-mode assumptions.
-/
theorem phaseOmegaSquared_positive
    (psiRadius chiRadius k0 k1 k2 : ℝ)
    (hpsi : psiRadius ≠ 0)
    (hchi : chiRadius ≠ 0)
    (hmode : 0 < structureFactor k0 k1 k2) :
    0 < phaseOmegaSquared psiRadius chiRadius k0 k1 k2 := by
  unfold phaseOmegaSquared phaseStiffness chi0 substrateInertia
  have hpsi2 : 0 < psiRadius ^ 2 := sq_pos_of_ne_zero hpsi
  have hchi2 : 0 < chiRadius ^ 2 := sq_pos_of_ne_zero hchi
  positivity

end Lax725166Proofs.C19CoupledPhaseGap
