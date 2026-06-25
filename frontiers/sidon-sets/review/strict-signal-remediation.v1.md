# Strict signal remediation v1

Date: 2026-05-20

This ledger records the Sidon-set strict-signal remediation pass. It
is now a verdict record for the proposal-review lane and a remaining
evidence-span work order. It records what was adjudicated before this
non-biomedical reference frontier could be treated as lower-debt
reviewed state.

## Current strict boundary

Command:

```bash
vela check examples/sidon-sets --strict --json
```

Current result:

| Check | Status | Count |
|---|---:|---:|
| Schema | pass | 21 findings checked |
| Events | pass | 29 events checked |
| State integrity | pass | 29 events checked |
| Signals | pass | 0 blocking signals |
| Methodology | pass with warnings | 20 warnings |
| Frontier graph | pass with info | 21 info records |

Signal blocker breakdown:

| Kind | Count | Meaning | Required resolution |
|---|---:|---|---|
| `pending_proposal_review` | 0 | The seven unsupported finding.add proposals were rejected. | Keep the rejected proposal history visible; do not promote unsourced frontier truth. |
| `needs_human_review` | 0 | No entity-normalization blockers are currently open. | Keep entity review clear unless new findings introduce unresolved entities. |

Supporting diagnostic debt:

| Rule | Count | Required resolution |
|---|---:|---|
| `L002` methodology warning | 19 | High-confidence theoretical claims should preserve source scope and review status because they do not have independent replication records. |
| `L004` methodology warning | 1 | The unusually high confidence on the classical Sidon-set existence claim should remain visible until the frontier records a stronger proof or review basis. |
| Evidence-atom quality review warnings | 79 | Attach theorem, proposition, page, section, proof-script, or source-locator spans where available. These are review warnings, not release-blocking failures. |

## Work order

No unresolved wave-1 finding blockers are named here. The current
strict-signal packet still carries three low-priority wave findings
because the v0.342 source-location proposals changed reviewable frontier
state. Agent prework may prepare source locators, theorem labels, and
proof-script references, but it must not promote or reject pending
proposals by itself.

The v0.342 source-location wave repaired three methodology findings
without changing their assertions or review status:

| Finding | Evidence atom | Locator | Span event | Locator event |
|---|---|---|---|---|
| `vf_7273c1823848f6e3` | `vea_a92afe2675590334` | `arxiv:1605.01506` | `vev_34883b43241d8c83` | `vev_3956d574eccd4a4e` |
| `vf_f16e736879b4b42c` | `vea_73acfebcd3de1dc6` | `arxiv:2007.03528` | `vev_5a5e570b6781367a` | `vev_151647ca41c94b0f` |
| `vf_eee5b19763f3c625` | `vea_94fe872efeb6e477` | `arxiv:1605.09223` | `vev_3b8bca3bf09d4358` | `vev_dcf6b2c8872cd07a` |

## Proposal review disposition

These seven proposals were rejected by `reviewer:solo-maintainer`
because each had no `source_refs` and no evidence spans. The decision
does not say the named theorem is false. It says the proposal did not
carry enough source-grounded state to promote into frontier truth.

| Proposal | Proposed finding | Source title | Disposition |
|---|---|---|---|
| `vpr_51f69f5123255164` | `vf_eef55d01b7df0fa9` | Green-Tao 2008 | rejected: no source refs or evidence spans |
| `vpr_2c472e28d0c49f36` | `vf_3af13d937db0a00b` | Croot-Lev-Pach 2017 | rejected: no source refs or evidence spans |
| `vpr_68ccf87c8c2cb987` | `vf_8679fce6b4231a88` | Bose-Chowla 1962 | rejected: no source refs or evidence spans |
| `vpr_08e1cc9af5a2d43b` | `vf_2f88cb8636b54834` | Erdos-Ko 1957 | rejected: no source refs or evidence spans |
| `vpr_d619346a962a29ff` | `vf_5a188a48b5253ffe` | Ruzsa 1996 | rejected: no source refs or evidence spans |
| `vpr_f51ae4c8da75740a` | `vf_013da185b81df2b4` | Cilleruelo 2010 | rejected: no source refs or evidence spans |
| `vpr_2d6cbeca13b7a1c4` | `vf_bfafae73e6095459` | Tao 2007 higher-order Fourier analysis | rejected: no source refs or evidence spans |

## Reviewer constraints

- Do not clear future `pending_proposal_review` rows with an
  agent-only decision.
- Do not batch-accept all seven proposals because they are familiar
  named results.
- Prefer a narrow accepted event over a broad high-confidence claim.
- If a proposal lacks a precise source locator, record a hold or a
  revision request rather than silently promoting it.
- If a proposal is accepted, regenerate the frontier lock and proof
  packet afterward.

## Exit condition

This ledger is complete for proposal-review blockers. Remaining
non-biomedical quality work is evidence-span and methodology review.
The proposal-review exit condition is:

1. `vela check examples/sidon-sets --strict --json` reports signal
   blockers at `0`.
2. Evidence CI remains `ok: true` with `release_blocking_failed: 0`.
3. The proof packet is regenerated and validates after the review
   proposal decisions land.
4. `atlases/additive-combinatorics/snapshot.json` is rematerialized
   after the proposal-state hash changes.
5. The README and handoff docs state the resulting proposal-review
   status without treating agent prework as review.
