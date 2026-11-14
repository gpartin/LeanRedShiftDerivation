# LeanRedShiftDerivation - REDSHIFTLW-001 Stage 1

This public repository contains the first promoted Lean stage of the LFM
redshift derivation. Stage 1 establishes the root action handoff from the
finite C19 lattice geometry and checks its kinetic/potential decomposition.

Stage 1 proves:
- the directed C19 bond list has length 18;
- the geometry-derived constants reduce to chi0 = 19 and B = 1197;
- the root Lagrangian is kinetic energy minus root potential;
- the root Hamiltonian is kinetic energy plus root potential.

This is a foundation contract. It does not claim that full dynamically sourced
Einstein general-relativistic redshift has been proved. Later stages will be
promoted separately from the local research repository.

The package includes the Lean toolchain declaration, mathlib lockfile, source
modules, and a fresh-checkout verifier. Run:

powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage01.ps1
