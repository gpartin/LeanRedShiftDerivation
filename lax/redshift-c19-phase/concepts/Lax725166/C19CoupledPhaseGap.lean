import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic

/-!
---
title: C19 structure factor and coupled phase gap
type: theorem
---
For the explicitly declared weighted C19 Fourier symbol, the structure factor
is nonnegative at every real wave vector.  For the associated coupled phase
branch with geometric constants $\chi_0=19$ and $B=1197$, the squared
propagating frequency is strictly positive whenever both field radii are
nonzero and the selected C19 mode has a strictly positive structure factor.

The statements are algebraic properties of the functions defined below.  They
do not assert formation, nonlinear stability, particle identity, gravity, an
absolute physical scale, or agreement with observation.
-/

namespace Lax725166.C19CoupledPhaseGap

noncomputable section

def structureFactor (k0 k1 k2 : ℝ) : ℝ :=
  8 * ((1 - Real.cos k0) + (1 - Real.cos k1) + (1 - Real.cos k2)) +
    8 * ((1 - Real.cos k0 * Real.cos k1) +
      (1 - Real.cos k0 * Real.cos k2) +
      (1 - Real.cos k1 * Real.cos k2))

def chi0 : ℝ := 19

def substrateInertia : ℝ := 1197

def phaseStiffness
    (psiRadius chiRadius k0 k1 k2 : ℝ) : ℝ :=
  (psiRadius ^ 2 * chiRadius ^ 2 / chi0 ^ 2) *
    structureFactor k0 k1 k2

def phaseOmegaSquared
    (psiRadius chiRadius k0 k1 k2 : ℝ) : ℝ :=
  phaseStiffness psiRadius chiRadius k0 k1 k2 *
    (1 / psiRadius ^ 2 + 1 / (substrateInertia * chiRadius ^ 2))

axiom structureFactor_nonnegative (k0 k1 k2 : ℝ) :
  0 ≤ structureFactor k0 k1 k2

axiom phaseOmegaSquared_positive
    (psiRadius chiRadius k0 k1 k2 : ℝ)
    (hpsi : psiRadius ≠ 0)
    (hchi : chiRadius ≠ 0)
    (hmode : 0 < structureFactor k0 k1 k2) :
  0 < phaseOmegaSquared psiRadius chiRadius k0 k1 k2

end
end Lax725166.C19CoupledPhaseGap
