# REDSHIFTLW-001 Stage 9: fixed-scale weak-field GR match

Stage 9 formalizes the weak-field GR comparison for the operational redshift
relation. It proves in Lean that the squared operational receiver/emitter ratio
equals the ratio reconstructed from the operational clock potentials.

The accompanying numerical handoff holds the physical domain, source width,
endpoint separation, and signal wavelength fixed while refining the lattice at
resolutions 16, 20, and 24. It checks the operational relation, the
weak-field-GR prediction, energy behavior, and adjacent-resolution convergence.

In plain language, this stage checks that the clock-and-signal result behaves
like the weak-field GR redshift expression when the underlying grid is refined
without changing the physical experiment. It is a dimensionless operational
match, not an SI calibration or full Einstein closure claim.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage09.ps1
```

