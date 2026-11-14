# REDSHIFTLW-001 Stage 10: native physical calibration

Stage 10 formalizes the native speed/time conversion family. It proves in Lean
that, for any nonzero external length anchor, the corresponding time scale

`tau0 = ell0 * v_native / c_SI`

recovers the chosen physical light speed.

The accompanying numerical handoff checks convergence of the native
coupled-phase carrier speed at resolutions 64, 128, and 256, then tests the
conversion identity for two diagnostic length scales. It deliberately leaves
the absolute SI length anchor as a free parameter because the c40 equations do
not derive that anchor.

In plain language, this stage tells us how to translate the framework's native
clock and distance units into physical time once a physical length convention
is supplied. It does not pretend that the framework has derived the meter
scale, and it does not yet perform observational benchmarking.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage10.ps1
```

