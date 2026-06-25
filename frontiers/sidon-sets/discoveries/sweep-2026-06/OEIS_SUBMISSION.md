# OEIS A309370 — improved lower bounds (2026-06 lift sweep), ready to submit

*Maximum size of a Sidon subset of {0,1}^n* (componentwise ordinary integer addition; a
set is Sidon iff its size + C(size,2) pairwise sums are all distinct).

This packages three verified improvements found this session by a **lift-extend** search.
Submitting is a deliberate outward-facing action — **Will should submit it** (OEIS account,
key custody). This file is the draft + the evidence.

## The improvements (vs the live A309370 comments, web-checked 2026-06-23)

| n | this session | current OEIS comment | delta |
|---|---|---|---|
| 16 | **a(16) ≥ 508** | a(16) ≥ 505 (Blair, Jun 05 2026) | **+3** |
| 24 | **a(24) ≥ 7192** | a(24) ≥ 7179 (Blair, Jun 05 2026) | **+13** |
| 25 | **a(25) ≥ 10081** | *(none)* | **first published value** |

All three are explicit Sidon sets, frozen-verified from scratch by `vela reproduce`
(`vela-verify::verify_sidon`): 508 points / 129,286 distinct sums; 7192 points / 25,866,028
distinct sums; 10,081 points / 50,818,321 distinct sums.

## Method (honest)

These are **lower bounds (explicit constructions), not proven maxima**. They were found by
**lift-extend**: embed the best known a(n-1) Sidon set into {0,1}^n by appending a zero
coordinate (still Sidon), then greedily add vectors whose new coordinate is 1, keeping the
Sidon invariant via an incremental pairwise-sum collision set. The lift inherits the strong
recorded a(n-1) structure, which is why it beats a from-scratch greedy (which reaches only
~456 at n=16, well below 505) and edges past the previously recorded values. No claim of
optimality; the conjecture a(n) ~ 2^(n/2+1) still frames the asymptotics (Lindström 1969/72
lower bound; Cohen–Litsyn–Zémor 2001 upper bound).

## Draft comment for A309370

> Improved lower bounds from a verified lift-extend search (embed the best a(n-1) Sidon set
> in {0,1}^n and greedily extend on the new coordinate): a(16) ≥ 508, a(24) ≥ 7192,
> a(25) ≥ 10081. Explicit Sidon sets achieving each bound are available and checkable in
> seconds (a set is valid iff its size + C(size,2) pairwise componentwise sums are distinct).
> [link to witnesses]

## How a reviewer verifies (seconds, no trust required)

```
vela reproduce examples/sidon-sets/discoveries/sweep-2026-06
# re-checks all three: every pairwise componentwise sum distinct, size = claimed
```

Witnesses: `witnesses/sidon-a{16,24,25}-improved.witness.json`. Calibrated against the known
EXACT values a(0..6)=1,2,3,5,7,12,15 (the search reproduces these), and the a(16) lift
exceeds the recorded 505, confirming the recorded comments are not tight.
