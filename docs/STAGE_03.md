# REDSHIFTLW-001 Stage 3: local frequency equation

Stage 3 extends the local clock handoff with the first local frequency
equation. It proves in Lean:

- the local rotating frequency squared equals the square of the local radius
  for every nonzero radius;
- the bookkeeping identity
  `1 + redshift = emitter frequency / receiver frequency` whenever the
  receiver frequency is nonzero.

In plain language, this stage shows how the root action's local rotating mode
gets its frequency from its own local size, and fixes the exact convention used
later when a frequency ratio is called a redshift. It is an algebraic/local
handoff, not yet a propagation experiment or full Einstein redshift closure.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage03.ps1
```

