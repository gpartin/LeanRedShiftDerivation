# REDSHIFTLW-001 Stage 8: operational redshift equation

Stage 8 formalizes the operational receiver/emitter frequency relation for a
stationary carrier. It proves in Lean that locally measured receiver and
emitter frequencies obey

`f_receiver / f_emitter = clockRate_emitter / clockRate_receiver`.

The accompanying numerical handoff launches finite-band packets in both
directions through an evolved c40 source background and repeats the measurement
with a no-source control. It independently fits endpoint signal rates, measures
native chi clock rates, checks packet direction, energy drift, and fit residuals,
and uses no target redshift value in the dynamics or estimator.

In plain language, this is the first stage where the operational redshift
relation is measured from the framework's own clocks and signal packet. It is
still a finite-lattice operational result; it does not yet prove the continuum
GR limit or full Einstein closure.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage08.ps1
```

