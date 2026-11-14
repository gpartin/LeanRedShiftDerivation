# REDSHIFTLW-001 Stage 12: strict integrated certificate

Stage 12 is the final core Lean stage. It wires the symbolic handoffs from
Stages 6–11 into `RedshiftLWStrictFormalCertificate`:

- native source-profile potential;
- operational potential map;
- operational receiver/emitter redshift relation;
- fixed-scale weak-field GR relation;
- native physical calibration family;
- observational uncertainty contract.

The certificate proves the symbolic interfaces and their ordering. Numerical
source, packet, continuum, calibration, benchmark, and hardcoding evidence
remain separate executable receipts; they are not silently converted into Lean
theorems.

The final local runner also checks that all required modules exist, the
hardcoding audit passes, the aggregate Lean package builds, and the root facade
compiles.

The twelve-stage core battery therefore closes at the operational,
dimensionless level. It does not claim an SI length anchor, Earth-source
magnitude, full Einstein field-equation closure, or uniqueness of the massless
sector.

## Reproduce

From a fresh checkout with Lean 4.33.1 available:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\verify_stage12.ps1
```

