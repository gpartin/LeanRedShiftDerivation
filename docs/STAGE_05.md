# REDSHIFTLW-001 Stage 5: coupled phase branch

Stage 5 formalizes the first coupled nonzero-Psi/nonzero-chi rotor branch. It
proves in Lean:

- the Psi and chi rotor balance relations are the declared action-derived
  algebraic balances;
- the coupled chi frequency is real under the stated nonnegative-frequency
  condition;
- the common phase tangent has exactly zero frequency gap;
- the C19 phase stiffness is nonnegative;
- a nonzero spatial mode has a strictly positive propagating phase gap.

In plain language, this stage identifies a more plausible light-carrier host
than the uniform Psi branch: a coupled medium can contain one phase motion that
is gapless and another that propagates with positive stiffness. This is a
branch contract only. It does not yet prove that the branch forms dynamically,
that it is the unique light sector, or that it produces Einstein redshift.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage05.ps1
```

