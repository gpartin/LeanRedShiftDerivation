# LeanRedShiftDerivation — REDSHIFTLW-001 Stages 1-12

This public repository contains all twelve promoted Lean stages of the LFM
redshift derivation. Stage 1 establishes the root action handoff from the
finite C19 lattice geometry and checks its kinetic/potential decomposition.
Stage 2 derives the native local clock relation and verifies its positive
linearized frequency scale from the same root action. Stage 3 derives the local
rotating-frequency relation and the bookkeeping identity for one plus the
redshift ratio. Stage 4 audits the uniform Psi branch and records its scoped
no-go result while retaining the compatible null-polarization algebra. Stage 5
formalizes the coupled nonzero-Psi/nonzero-chi phase branch, including its
zero-gap phase tangent and positive propagating phase contracts. Stage 6
records that the evolved source profile is evaluated with the native c40 root
potential rather than a prescribed or externally sourced profile. Stage 7
reconstructs the operational potential from the dimensionless native clock
lapse and validates its native source-energy map on a held-out source strength.
Stage 8 formalizes the operational receiver/emitter frequency relation and
tests it with forward/reverse packets and no-source controls. Stage 9 performs
the fixed-physical-scale weak-field GR comparison while keeping the physical
geometry and signal wavelength fixed. Stage 10 derives the native speed/time
conversion family while explicitly leaving the absolute SI length anchor free.
Stage 11 compares the relational prediction with published benchmark ratios
without treating those observations as LFM model inputs. Stage 12 wires the
formal handoffs into `RedshiftLWStrictFormalCertificate` and closes the core
symbolic certificate chain.

The package includes the Lean toolchain declaration, mathlib lockfile, source
modules, and fresh-checkout verifiers. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage12.ps1
```

For a platform-independent release check, run:

```text
python scripts/verify_release.py
```

Publication documentation:

- [`docs/CLAIMS.md`](docs/CLAIMS.md) separates proved Lean statements from
  numerical or physical claims that remain outside this repository.
- [`docs/REPRODUCIBILITY.md`](docs/REPRODUCIBILITY.md) gives the clean-checkout
  procedure and identifies the formal entrypoints.
- [`docs/REGISTRY_SCOPE.md`](docs/REGISTRY_SCOPE.md) identifies the narrow
  theorem suitable for external theorem registries and states its exact limits.
- [`docs/SUBMISSION_TRACKER.md`](docs/SUBMISSION_TRACKER.md) records external
  preservation, verification, and listing requests without treating a listing
  as scientific endorsement.

Closing claim boundary: the twelve-stage core battery passes as an operational,
dimensionless derivation and certificate. It does not claim a derived SI
length anchor, Earth-source magnitude, full Einstein field-equation closure,
or uniqueness of the massless sector. Separate massless-sector, source-range,
and Einstein-closure investigations are outside this release.

Several late-stage results are deliberately interface identities: they verify
that the declared readouts compose consistently. They do not prove that the
root action dynamically forms a source profile or that Einstein gravity has
been derived. See `docs/CLAIMS.md` before citing the artifact.

Project-authored content is available under [MIT](LICENSE) or
[CC0-1.0](LICENSE-CC0), at the recipient's option. See
[LICENSING.md](LICENSING.md) for scope and third-party terms.

