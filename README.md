# LeanRedShiftDerivation — REDSHIFTLW-001 Stages 1-3

This public repository contains the first three promoted Lean stages of the LFM
redshift derivation. Stage 1 establishes the root action handoff from the
finite C19 lattice geometry and checks its kinetic/potential decomposition.
Stage 2 derives the native local clock relation and verifies its positive
linearized frequency scale from the same root action. Stage 3 derives the local
rotating-frequency relation and the bookkeeping identity for one plus the
redshift ratio.

The package includes the Lean toolchain declaration, mathlib lockfile, source
modules, and fresh-checkout verifiers. Run:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage03.ps1
```

Claim boundary: these are foundation stages only. They do not claim full
Einstein redshift closure. The local staging repository contains the later
operational, RCA, validation, and mass-support work.

