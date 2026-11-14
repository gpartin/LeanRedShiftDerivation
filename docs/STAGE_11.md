# REDSHIFTLW-001 Stage 11: observational relational benchmark

Stage 11 formalizes the observation-matching contract. It proves in Lean that
when an observed ratio is within its stated uncertainty of a prediction, the
reported residual is within that uncertainty.

The accompanying numerical handoff compares the dimensionless relational
prediction with published Pound–Rebka–Snider and Gravity Probe A benchmark
records. The Pound–Rebka residual is evaluated in sigma units, and the Gravity
Probe A precision is recorded. The observations are benchmarks only; they are
not fitted inputs to the LFM dynamics.

In plain language, this stage checks that the relational result is compatible
with published redshift tests while being honest about what is still missing:
the framework has not derived an SI lattice length, Earth source mass, or
geopotential map, so an absolute LFM magnitude comparison remains deferred.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage11.ps1
```

