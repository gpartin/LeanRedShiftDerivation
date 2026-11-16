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
| Palomar | Narrow coupled-phase theorem | Toolchain-incompatible; not submitted in the current release form | The prior private submission link no longer resolves after the account migration; the package currently pins Lean/mathlib `v4.33.1`, below the venue's stated Lean >=4.35/module-system requirement | Port and verify a separate submission branch before opening a new Palomar submission; do not relabel the current release as eligible | On compatible port |
| [Lax Lean Archive](https://laxarchive.org/contributing.html) | Narrow coupled-phase theorem | WSL client ready; not initialized or submitted | Ubuntu/WSL has Node `v22.23.5` and Lax `0.1.51`; the current agent instructions were reviewed, but no Lax concept/proof package has been created or represented as submitted | Scaffold the concept/proof package, obtain human sign-off on the concept files, run `lax build`, push the exact commit, then submit; registration remains a separate irreversible decision | 2026-11-16 |
| [Lemmata PR #19](https://github.com/ZIB-IOL/lemmata/pull/19) | Narrow coupled-phase theorem | Draft pull request; substantive Lean checks pass | Full 4,560-job build, archive-wide kernel replay, 749/749 source-object parity, strict MyST render, and a 22,013-declaration axiom/export audit passed; the PR discloses inherited Windows adversarial/browser harness deviations without changing validation code | Await maintainer/Linux-cluster review of the disclosed platform-specific harness deviations before marking ready | 2026-11-18 |
| [VibeRegistry PR #14](https://github.com/GasStationManager/VibeRegistry/pull/14) | Narrow coupled-phase comparator | Draft pull request; verification incomplete and merge state unstable | A bounded draft entry was opened; the independent specification compiles, but the full local comparator lacks its Go/landrun/cargo/nanoda toolchain and has no verification verdict | Resolve the comparator toolchain and unstable merge state or await maintainer review; keep the pull request draft until independently verified | 2026-11-18 |
| [Lean Pool issue #826](https://github.com/LeanPool/lean-pool/issues/826) | Full project proposal | Submitted; awaiting triage | A bounded project-fit proposal links the public repository, immutable release, and DOI | Respond to maintainer questions; do not describe the proposal as acceptance | 2026-11-22 |
| [Best-of-Lean4 PR #299](https://github.com/34j/best-of-lean4/pull/299) | Project listing | Submitted; awaiting review | A one-project listing pull request was opened against the public release | Monitor checks and review; revise only in response to reproducible feedback | 2026-11-22 |
| [Formalization Corpus issue #11](https://github.com/dzackgarza/formalization-corpus/issues/11) | Repository indexing | Submitted; awaiting maintainer response | An indexing request was filed with the immutable repository and DOI | Respond to maintainer questions and record any indexed identifier | 2026-11-22 |
| Project Intentions | Community coordination | Manual-only; not submitted | No Redshift issue exists | G. D. Partin must personally write any post; do not submit AI-written Lean-community comments | Manual |
| Constraint Systems Institute | Project listing | Planned; not submitted | No Redshift request has been sent | Prepare a concise archive/listing request and obtain action-time approval before sending | 2026-11-18 |
| Lean Zulip | Community publicity | Excluded | The user explicitly excluded Zulip after the prior moderation event | Do not post | Closed |

## Update rule

For every status change, update the status, last event, next action, and
follow-up date in this file. Preserve failed or incomplete submissions as such;
do not convert an intake, listing, announcement, or draft pull request into a
verification claim.
