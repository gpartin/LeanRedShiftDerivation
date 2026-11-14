# REDSHIFTLW-001 Stage 6: native source profile

Stage 6 formalizes the source-profile handoff from the coupled phase branch. It
proves in Lean that the energetic content assigned to the evolved,
coarse-grained source profile is the native c40 root potential.

The accompanying numerical handoff evolves a localized helical Psi initial
configuration with the reciprocal c40 update, reconstructs the chi profile
after evolution, and checks response, hold-window stationarity, energy
conservation, and timestep convergence. The profile is not prescribed and no
external source term is used.

In plain language, this stage says that the source profile is measured after
the framework evolves; it is not inserted by hand. It does not yet derive the
effective potential map, the redshift equation, or full Einstein closure.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage06.ps1
```

