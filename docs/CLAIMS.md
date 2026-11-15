# Formal claim boundary

## What Lean proves

The checked source proves the statements actually written in the theorem
types, including:

- the finite C19 bond counts and the derived constants `chi0 = 19`,
  `kappa = 1/63`, and `B = 1197`;
- the declared kinetic/potential and Hamiltonian decompositions;
- the local clock-force expansion and positivity of its linearized frequency
  scale;
- the local rotating-frequency algebra;
- nonnegativity of the C19 structure factor, the scoped uniform-Psi gap
  obstruction, and the compatible complex null polarization;
- nonnegativity of the coupled phase stiffness and positivity of its
  propagating mode under the stated nonzero assumptions;
- exact algebraic endpoint clock/readout identities and their composition in
  `redshiftLW_strict_formal_certificate`.

## What the final certificate means

`redshiftLW_strict_formal_certificate` combines the formal interfaces from
stages 6–11. It certifies internal consistency of those declared interfaces.
It is not a theorem that the lattice action dynamically creates a source,
produces a unique massless carrier, or derives general relativity.

Stages 6, 7, 9, 10, and 11 include definitional or algebraic contracts. Their
value is to make the assumptions and handoffs machine-checkable. They must not
be cited as independent dynamical predictions.

## Not proved by this repository

- Euler–Lagrange variation of the complete action into executable evolution;
- formation or long-time stability of the numerical source profile;
- released-packet propagation through that profile;
- an independently derived mapping from source energy to an Earth-scale
  potential;
- an absolute SI length or time calibration;
- the Einstein field equations or a full GR solution;
- uniqueness of the physical massless sector;
- agreement with an observation without separately supplied numerical
  evidence.

Numerical evidence mentioned in stage prose is outside this repository and is
not silently promoted into a Lean theorem.
