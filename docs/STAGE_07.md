# REDSHIFTLW-001 Stage 7: operational potential map

Stage 7 formalizes the operational potential readout from the native clock
lapse. It proves in Lean the identity

`1 + 2 * operationalPotential = clockLapse^2`.

The accompanying numerical handoff reconstructs the source profile from native
c40 evolution, defines the dimensionless potential from the measured clock
lapse, fits the source-energy coefficient on two source strengths, and tests it
on a third held-out strength. The clock-potential identity and native source
data pass without inserting a redshift target or a metric into the dynamics.

In plain language, this stage converts the locally measured clock change into
the potential-like quantity needed for the later redshift equation. It does not
yet derive the operational redshift equation, the continuum GR match, or full
Einstein closure.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage07.ps1
```

