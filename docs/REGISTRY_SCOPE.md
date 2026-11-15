# Narrow theorem-registry scope

The full repository is a twelve-stage formal research artifact. External
theorem registries should use a smaller statement whose assumptions and result
are both explicit.

## Recommended theorem

`RedshiftLWFormal.redshiftLW_phase_propagating_gap_positive`

The theorem states that the declared coupled phase branch has a strictly
positive squared propagating frequency whenever:

- both field radii are nonzero; and
- the C19 structure factor is strictly positive at the selected wave vector.

Its proof uses the C19-derived values `chi0 = 19` and `B = 1197`, positivity of
the native phase stiffness, and the proved nonnegativity of the C19 structure
factor.

## Supporting theorem

`RedshiftLWFormal.redshiftLW_structure_factor_nonnegative`

This proves that the explicit C19 Fourier structure factor is nonnegative for
all three real momentum components.

## Claim boundary

These are algebraic spectral statements for the declared branch. They do not
prove source formation, long-time nonlinear stability, a physical photon,
Einstein gravity, an absolute SI calibration, or observational agreement.

The operational endpoint theorem
`redshiftLW_operational_receiver_emitter_ratio` may be cited as a checked
readout identity, but it is not an independent dynamical prediction: it follows
from the declared measured-frequency definition and stationary-signal
assumption.

Provenance is mixed: human-directed research with AI-assisted Lean
implementation, testing, and review.
