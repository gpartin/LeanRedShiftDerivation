# Reproducibility

## Pinned environment

- Lean: `v4.33.1`
- Mathlib: pinned by `lake-manifest.json`
- Package: `RedshiftLWDerivation`
- Public entrypoint: `RedshiftLWFormal.lean`

## Clean checkout

```text
git clone https://github.com/gpartin/LeanRedShiftDerivation.git
cd LeanRedShiftDerivation
python scripts/verify_release.py
```

The verifier builds the complete public library, runs the publication axiom
report, and rejects first-party Lean source containing `sorry` or `admit`.

Windows users may also run the stage-specific PowerShell scripts under
`scripts/`; `verify_stage12.ps1` builds the complete ordered chain.

## Formal entrypoints

- Root action and geometry: `RedshiftLW001RootAction.lean`
- Clock and local frequency: stages 2–3
- Branch audit and coupled phase algebra: stages 4–5
- Operational handoff: stages 6–11
- Integrated interface certificate: `RedshiftLW012StrictCertificate.lean`

Read `CLAIMS.md` before interpreting the final certificate.
