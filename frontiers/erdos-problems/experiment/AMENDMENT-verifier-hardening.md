# M7 amendment: verifier hardening + a dataset-readiness finding

Status: pre-run amendment to the signed pre-registration (`prereg.v1.json`, experiment
`vex_aa2c639988ecd9fa`). It fixes implementation gaps in the gate and the analysis so the result is
interpretable, and records a finding that blocks a *powered* discovery run until the dataset is
re-curated. No confirmatory run has been executed.

## Why this was needed

An adversarial audit of the frozen verifier and the runner, before spending a real run, found two
ways the experiment as-wired would have produced an uninterpretable (or falsely positive) result:

1. **The construction gate accepted a trivial witness.** `exact_recompute` checked only that a
   witness *is* a valid Sidon/cap/etc. set, not that it *achieves* anything. An empty witness passed
   ("0 points, 0 pairs"). "Solve" meant "produced a valid construction," which nothing satisfies, so
   any arm could score free solves.

2. **The bulk of the items reduce to pretraining recall.** All 63 open `oeis_match` items carry no
   `index`, so the runner defaults each to **a(6)** of a named OEIS sequence. Those are low,
   published terms a frontier LLM emits from memory, identically across all four arms. Eighty-five
   percent of the dataset cannot distinguish arm D from arm A, not because the thesis is false, but
   because the proposer recalls rather than reasons from context.

A deeper look showed the 11 open `exact_recompute` items carry **no `construction` and no `n`**, so
the runner collapses them all to a single `sidon:4` instance, and at least one (`A005115`, longest
AP of primes) is not a construction problem at all.

## What changed (faithful to the experiment's stated intent)

- **`exact_recompute` now requires clearing a held-out solve threshold.** A valid construction is
  necessary but not sufficient; the witness must reach the threshold or it rejects. Empty,
  sub-threshold, and unparameterized instances all reject. The threshold lives in
  `held-out-bounds.v1.json`, which the proposer never sees and the gate reads. Modes:
  `calibration` (size >= recorded optimum) and `discovery` (size > best-known lower bound).
- **One real threshold is seeded:** `sidon:4 = 6`, the true maximum Sidon set in GF(2)^4, established
  by brute force via `verify_construction.verify_sidon`. It is a calibration positive control, not a
  discovery target.
- **`oeis_match` is reclassified as a calibration / positive-control stratum** and excluded from the
  primary connection-thesis comparison. The runner now splits discovery vs calibration and reports
  both; the primary McNemar D-vs-A is computed on discovery items only.
- **Reject-vectors** (`scripts/test_m7_verifier_soundness.py`) prove the gate rejects empty,
  sub-threshold, non-Sidon, no-threshold, and recall-only witnesses, and the verifier's own
  self-test was updated to a threshold-clearing 6-point witness.

## The finding that gates a powered run

With the sound gate in place, the hardened mock now reports honestly:

```
n_discovery_items: 10   n_genuine_discovery_targets: 0   n_calibration_items: 63
verdict: UNDECIDABLE — 0 genuine discovery targets wired into the dataset.
```

There are **zero** genuine discovery instances: every open item is either recall-trivial
(`oeis_match` a(6)) or an unparameterized `exact_recompute` that collapses to the single `sidon:4`
calibration instance. So M7 cannot test the connection thesis on this dataset, and the sound verdict
is `UNDECIDABLE` rather than a fabricated positive. This is the audit working: it stops a meaningless
run.

## What unblocks a powered M7

Re-curate the discovery stratum with genuine, held-out-bounded instances:

- Construction problems at the frontier where the maximum is **unknown** (Sidon/cap/code families at
  `n` beyond the published A309370 / cap-set records), each parameterized with its real
  `(construction, n)` and its best-known lower bound entered in `held-out-bounds.v1.json` under
  `mode: discovery`. A "solve" is then a construction that strictly beats the best known, which is a
  genuine new result and one a Claude proposer cannot recall.
- Drop or down-weight `oeis_match` for discovery; keep it only as a calibration control.

Until that exists, the connection thesis stays untested by this harness, and that is the honest
state.

## Pre-registration status

Changing verification targets touches the signed prereg. These changes are implementation-gap fixes
that make the gate faithful to its stated intent, recorded here. The prereg `vex_` should be re-signed
to point at this amendment before any confirmatory run; that signing is a deliberate, key-holding
action, not done as part of this hardening.
