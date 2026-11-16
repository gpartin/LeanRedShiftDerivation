# External submission tracker

Last reconciled: 2026-11-15 (America/Los_Angeles)

This ledger separates publication, preservation, formal verification,
curated listing, and community publicity. A listing is not an endorsement of
the physical interpretation. Unless a row says otherwise, the immutable
public release is commit `e2f41976c32b3ef60470aa27f9eea6dcb10cbc26`
tagged `v0.12.0-research`.

| Destination | Scope | Status | Last event | Next action | Follow-up date |
| --- | --- | --- | --- | --- | --- |
| [GitHub repository](https://github.com/gpartin/LeanRedShiftDerivation) | Full 12-stage package | Published | Release [`v0.12.0-research`](https://github.com/gpartin/LeanRedShiftDerivation/releases/tag/v0.12.0-research) is public at the immutable release commit | Maintain reproducibility and respond to issues | On change |
| [Zenodo](https://doi.org/10.5281/zenodo.24236840) | Full archived release | Published | DOI `10.5281/zenodo.24236840` minted for version `1.0.0`; archive contains `LeanRedShiftDerivation-REDSHIFTLW-001.zip` | Publish a new Zenodo version only for a material release | On release |
| [Software Heritage snapshot `swh:1:snp:8671e94bd38eb4401426e8669cf058783bc83925`](https://archive.softwareheritage.org/swh:1:snp:8671e94bd38eb4401426e8669cf058783bc83925) | Full Git history | Archived | Save Code Now request `2653526` completed with task status `succeeded` and visit status `full` at `2026-11-15T23:13:48Z` | Request a new snapshot only after a material public release | On release |
| [Palomar candidate](https://github.com/gpartin/LeanRedShiftPalomar) | Narrow coupled-phase theorem | Compatible standalone port verified; awaiting required human authorization for intake | Dedicated commit `1fda57deeec99a6e467da0694e282efa4c5382bb` uses Lean/mathlib `v4.35.0-rc2`; the full official [Palomar preflight](https://github.com/gpartin/LeanRedShiftPalomar/actions/runs/43799817032) passed Comparator, challenge-provenance, source, and report checks on 2026-11-15 | G. D. Partin must confirm the exact repository, commit, `comparator.json`, and maintainer relationship before the time-limited intake handshake begins; permanent registration remains a later, separate approval | 2026-11-16 |
| [Lax Lean Archive](https://laxarchive.org/contributing.html) | Narrow coupled-phase theorem | Package verified locally; awaiting required human concept sign-off | Package `lax-725166` was created with separate concept and proof modules; the official Lax `0.1.51` full build compiled both layers, replayed the kernel proofs, and inspected one concept and two proofs successfully | G. D. Partin must approve the exact concept statement; after approval, submit the exact package commit. Registration remains a separate irreversible decision | 2026-11-16 |
| [Lemmata PR #19](https://github.com/ZIB-IOL/lemmata/pull/19) | Narrow coupled-phase theorem | Submitted; ready for maintainer review | Full 4,560-job build, archive-wide kernel replay, 749/749 source-object parity, strict MyST render, and a 22,013-declaration axiom/export audit passed; the pull request was advanced from draft on 2026-11-15 | Await maintainer/Linux-cluster review of the disclosed inherited platform-specific harness deviations | 2026-11-18 |
| [VibeRegistry PR #14](https://github.com/GasStationManager/VibeRegistry/pull/14) | Narrow coupled-phase comparator | Independently verified; ready for maintainer review | The Vibe Comparator matched the independent specification to the production theorem; NanoDa and Lean's default kernel both accepted the proof, and the machine-readable pass record is committed in the pull request | Await maintainer review; respond to reproducible findings without broadening the theorem's scope | 2026-11-18 |
| [Lean Pool issue #826](https://github.com/LeanPool/lean-pool/issues/826) | Full project proposal | Submitted; awaiting triage | A bounded project-fit proposal links the public repository, immutable release, and DOI | Respond to maintainer questions; do not describe the proposal as acceptance | 2026-11-22 |
| [Best-of-Lean4 PR #299](https://github.com/34j/best-of-lean4/pull/299) | Project listing | Submitted; awaiting review | A one-project listing pull request was opened against the public release | Monitor checks and review; revise only in response to reproducible feedback | 2026-11-22 |
| [Formalization Corpus issue #11](https://github.com/dzackgarza/formalization-corpus/issues/11) | Repository indexing | Submitted; awaiting maintainer response | An indexing request was filed with the immutable repository and DOI | Respond to maintainer questions and record any indexed identifier | 2026-11-22 |
| Project Intentions | Community coordination | Manual-only; not submitted | No Redshift issue exists | G. D. Partin must personally write any post; do not submit AI-written Lean-community comments | Manual |
| [Constraint Systems Institute](https://constraintsystemsinstitute.org/index.html) | Project listing | Submitted; awaiting response | A bounded archive/listing request was emailed to `amos@constraintsystemsinstitute.org` on 2026-11-15 with the public repository, immutable release, DOI, claim boundary, and AI-assistance disclosure | Await a response and answer any scope or reproducibility questions | 2026-11-22 |
| Lean Zulip | Community publicity | Excluded | The user explicitly excluded Zulip after the prior moderation event | Do not post | Closed |

## Update rule

For every status change, update the status, last event, next action, and
follow-up date in this file. Preserve failed or incomplete submissions as such;
do not convert an intake, listing, announcement, or draft pull request into a
verification claim.
