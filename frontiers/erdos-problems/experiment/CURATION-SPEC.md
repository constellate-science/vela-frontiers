# Curating genuine discovery instances for M7

What it takes to turn a dataset item into a sound, testable connection-thesis instance, and why the
held-out bounds must be *verified*, never guessed. This is the gating work the hardened verifier
(`AMENDMENT-verifier-hardening.md`) exposed: the gate is now sound, but the dataset has zero genuine
discovery targets, so M7 reports `UNDECIDABLE` until real instances are curated.

## A testable instance needs all four of these

1. **It is a constellation node.** The runner only attempts items whose `erdos_number` is a node in
   `constellation/erdos-oeis-constellation.v1.json`. If it is not a node, arm D (constellation
   context) has no neighborhood to surface, so arm D collapses to arm A and the instance cannot test
   the thesis. Synthetic problems bolted on outside the graph are useless here.
2. **It has a cheap, deterministic verifier.** One of `verify_construction.VERIFIERS`. The proposer
   must exhibit a witness the gate re-derives. Current map for the additive/coding strata:
   - integer Sidon set (A309370 family, max Sidon subset of an interval) -> `sidon_interval` (added
     this cycle; the prior dispatch wrongly routed these to the binary `sidon` verifier).
   - binary Sidon in GF(2)^n -> `sidon`.
   - cap set in F_3^n -> `cap`; Golomb ruler -> `golomb`; B_h set -> `bh`; etc.
   - A problem with no software witness check (a pure existence/number-theory conjecture, e.g.
     A005115 "longest AP of primes") has no cheap verifier and cannot be a discovery instance here.
3. **It has a VERIFIED held-out best-known bound**, entered in `held-out-bounds.v1.json` keyed
   `construction:n`, with `mode: discovery` (size must strictly beat it) or `mode: calibration`
   (size must meet a recorded optimum). This is the hard part and the dangerous part:
   - A bound set too LOW makes trivial witnesses "solve" (the exact hole we just closed).
   - A bound set too HIGH makes the instance unsolvable and silently drops it from the comparison.
   - **The bound must come from a verified source**: an OEIS term, a published optimum, or a value
     computed-and-proven in-repo (e.g. `sidon:4 = 6`, brute-forced over GF(2)^4). Never a guess.
4. **Real parameters.** `construction`, `n`, and any `params` on the item, so the runner stops
   defaulting (today open items default to `oeis_match` a(6) and `exact_recompute` sidon:4).

## The difficulty band that actually carries signal

The thesis is testable only on instances that are neither trivial nor impossible for the proposer:

- **Too easy / recallable** (low published terms, e.g. a(6)): all arms solve from pretraining, no
  signal. This is why `oeis_match` was demoted to calibration.
- **Too hard** (beat a frontier lower bound in one shot): all arms fail, no discordant pairs, no
  signal, even though a solve would be a genuine new result.
- **The band that works**: a known optimum at an `n` large enough that the proposer cannot recall it
  and must reconstruct it, where related-problem context could plausibly help. A graded ladder of
  such calibration instances (same family, rising n) is the cleanest design, all tied to the family's
  constellation node so arm D's neighborhood is constant and only difficulty varies.

## Status of the existing additive nodes

`erdos-3, -14, -30, -138, -142, -155, -169, -200, -201, -530, sidon-A309370-n19` are tagged
`sidon_additive` and sit in the constellation, but carry no `construction`/`n` and no bound, so they
collapse to the trivial default. Each needs, confirmed against a verified source before wiring:
its actual quantity and verifier (`sidon_interval` vs `bh` vs `golomb` ...), its `n`, its
best-known bound, and its mode. Do not wire any of them on an assumed value.

## Two correct ways to get the bounds

1. **You supply/confirm them.** For the handful you know cold (the A309370 frontier, the cap-set
   records), give the `(construction, n, bound, mode)` and I wire them and re-run.
2. **A cited deep-research pass.** Establish, with sources, the current definition and best-known
   values for each candidate (OEIS pages, the literature), then wire only the verified ones.

Until at least a few instances clear all four bars with verified bounds, M7's honest verdict stays
`UNDECIDABLE`, and that is the correct state to report rather than a fabricated result.
