import RedshiftLWFormal.Core.RedshiftLW004PsiBranchAudit

namespace RedshiftLWFormal

noncomputable section

/-! A coupled nonzero-Psi/nonzero-chi rotor has a phase tangent sector.  The
local c40 potential depends on the Hermitian norms, so a phase-only perturbation
does not change the local norm coupling at first order.  The C19 area term
provides the spatial stiffness.  This module formalizes the algebraic branch
relations and the two phase eigenvalue contracts; the numerical companion
checks them against the native action gradient and potential. -/

def redshiftLWCoupledPsiOmegaSquared (psiRadius chiRadius : ℝ) : ℝ :=
  psiRadius ^ 2 + chiRadius ^ 2

def redshiftLWCoupledChiOmegaSquared (psiRadius chiRadius : ℝ) : ℝ :=
  (psiRadius ^ 2 + chiRadius ^ 2 - redshiftLWChi0 ^ 2) / redshiftLWB

def redshiftLWPhaseStiffness
    (psiRadius chiRadius k0 k1 k2 : ℝ) : ℝ :=
  (psiRadius ^ 2 * chiRadius ^ 2 / redshiftLWChi0 ^ 2) *
    redshiftLWStructureFactor k0 k1 k2

def redshiftLWPhaseZeroOmegaSquared : ℝ := 0

def redshiftLWPhasePropagatingOmegaSquared
    (psiRadius chiRadius k0 k1 k2 : ℝ) : ℝ :=
  redshiftLWPhaseStiffness psiRadius chiRadius k0 k1 k2 *
    (1 / psiRadius ^ 2 + 1 / (redshiftLWB * chiRadius ^ 2))

theorem redshiftLW_coupled_rotor_psi_balance
    (psiRadius chiRadius : ℝ) :
    redshiftLWCoupledPsiOmegaSquared psiRadius chiRadius =
      psiRadius ^ 2 + chiRadius ^ 2 := by
  rfl

theorem redshiftLW_coupled_rotor_chi_balance
    (psiRadius chiRadius : ℝ) :
    redshiftLWCoupledChiOmegaSquared psiRadius chiRadius =
      (psiRadius ^ 2 + chiRadius ^ 2 - redshiftLWChi0 ^ 2) /
        redshiftLWB := by
  rfl

theorem redshiftLW_coupled_rotor_chi_frequency_is_real
    (psiRadius chiRadius : ℝ)
    (hB : 0 < redshiftLWB)
    (hchi : redshiftLWChi0 ^ 2 ≤ psiRadius ^ 2 + chiRadius ^ 2) :
    0 ≤ redshiftLWCoupledChiOmegaSquared psiRadius chiRadius := by
  unfold redshiftLWCoupledChiOmegaSquared
  exact div_nonneg (by linarith) (le_of_lt hB)

theorem redshiftLW_phase_zero_gap :
    redshiftLWPhaseZeroOmegaSquared = 0 := by
  rfl

theorem redshiftLW_phase_stiffness_nonnegative
    (psiRadius chiRadius k0 k1 k2 : ℝ) :
    0 ≤ redshiftLWPhaseStiffness psiRadius chiRadius k0 k1 k2 := by
  have hchi0 : redshiftLWChi0 = 19 := by
    simpa [redshiftLWChi0] using chi0_from_c19_value
  have hscale : 0 ≤
      psiRadius ^ 2 * chiRadius ^ 2 / redshiftLWChi0 ^ 2 := by
    rw [hchi0]
    positivity
  unfold redshiftLWPhaseStiffness
  exact mul_nonneg hscale
    (redshiftLW_structure_factor_nonnegative k0 k1 k2)

theorem redshiftLW_phase_propagating_gap_positive
    (psiRadius chiRadius k0 k1 k2 : ℝ)
    (hpsi : psiRadius ≠ 0)
    (hchi : chiRadius ≠ 0)
    (hmode : 0 < redshiftLWStructureFactor k0 k1 k2) :
    0 < redshiftLWPhasePropagatingOmegaSquared
      psiRadius chiRadius k0 k1 k2 := by
  have hchi0 : redshiftLWChi0 = 19 := by
    simpa [redshiftLWChi0] using chi0_from_c19_value
  have hB : redshiftLWB = 1197 := by
    simpa [redshiftLWB] using B_from_geometry_value
  unfold redshiftLWPhasePropagatingOmegaSquared redshiftLWPhaseStiffness
  rw [hchi0, hB]
  have hpsi2 : 0 < psiRadius ^ 2 := sq_pos_of_ne_zero hpsi
  have hchi2 : 0 < chiRadius ^ 2 := sq_pos_of_ne_zero hchi
  positivity

end
end RedshiftLWFormal

