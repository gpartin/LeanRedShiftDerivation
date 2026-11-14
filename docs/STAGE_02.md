# REDSHIFTLW-001 Stage 2: native clock

Stage 2 extends the public root-action handoff with the local clock branch.
It uses the clock force already defined by the root action and proves in Lean:

- the clock force expansion around the native vacuum value;
- the linearized clock-frequency-squared relation
  `2 * chi0^2 / B`;
- positivity of that native local clock scale after reducing the geometry
  constants to `chi0 = 19` and `B = 1197`.

In plain language, this stage establishes how the framework's local clock
responds to a small displacement around its native state. It is still a local
clock handoff, not a proof of a source-generated long-range gravitational
potential or full Einstein redshift closure.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage02.ps1
```

