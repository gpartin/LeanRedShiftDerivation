# REDSHIFTLW-001 Stage 4: uniform Psi branch audit

Stage 4 audits the simplest spatially uniform Psi branch against the local
clock background. It proves in Lean:

- the uniform Psi gap is the square of the chi radius;
- the C19 structure factor is nonnegative;
- every uniform Psi mode is bounded below by its local gap;
- the uniform Psi gap vanishes only when the chi radius vanishes;
- at the native chi value, the uniform Psi gap is `361`, so this branch is not
  massless;
- the compatible null-polarization bilinear vanishes while its Hermitian norm
  remains `2`.

In plain language, this stage rules out the simplest uniform Psi branch as the
massless light sector without ruling out more complicated nonlinear,
inhomogeneous, or composite branches. It is a scoped branch audit, not a claim
that the whole framework lacks light.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage04.ps1
```

