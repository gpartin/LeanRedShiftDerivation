# REDSHIFTLW-001 Stage 1: root action

Stage 1 is the first public Lean handoff. It formalizes the declared c40
complex-Psi/complex-chi root action ingredients used by the later derivation.

It proves, from the finite C19 geometry in the source:

- the directed C19 bond list has length 18;
- the geometry-derived constants reduce to `chi0 = 19` and `B = 1197`;
- the root Lagrangian is kinetic energy minus root potential;
- the root Hamiltonian is kinetic energy plus root potential.

This stage is a foundation contract. It does not claim that full dynamically
sourced Einstein general-relativistic redshift has been proved. Later stages
will be promoted separately from the local research repository.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage01.ps1
```

