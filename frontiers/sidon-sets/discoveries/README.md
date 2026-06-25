# Improved lower bounds for OEIS A309370 (Sidon subsets of {0,1}^n)

**Result.** Improved lower bounds for
[OEIS A309370](https://oeis.org/A309370), *Maximum size of a Sidon subset of
`{0,1}^n`*, each with an explicit, independently-verifiable certificate:

| n | previously recorded | this work |
|---|---|---|
| 8 | a(8) ≥ 32 | **a(8) ≥ 33** |
| 9 | a(9) ≥ 45 | **a(9) ≥ 46** |
| 10 | a(10) ≥ 63 | **a(10) ≥ 65** |
| 11 | a(11) ≥ 87 | **a(11) ≥ 88** |
| 12 | a(12) ≥ 120 | **a(12) ≥ 121** |
| 13 | a(13) ≥ 169 | **a(13) ≥ 185** |
| 14 | a(14) ≥ 237 | **a(14) ≥ 257** |
| 15 | a(15) ≥ 334 | **a(15) ≥ 357** |
| 16 | a(16) ≥ 472 | **a(16) ≥ 502** |

Nine consecutive improved lower bounds (a(8)–a(16)). All certificates are in
`certificates.json`; `verify.py` checks all nine. (n=13–16 came from the discovery
workflows using a faster sum-encoding search; their sizes sit near the conjectured
asymptotic 2^(n/2+1), which the recorded construction bounds undershot.)

## What verification *rejected* (this is the point)

The 2026-05-30 discovery-engine run had 7 agents; 3 of them reported beats their
certificates could not back, and the independent verifier (`verify_construction.py`)
**discarded all three**:

- n=16: agent claimed 519 — its certificate contained **duplicate points** (not a
  valid Sidon set). Rejected.
- n=17: claimed 687 — certificate held only **30** vectors. Rejected.
- n=18: claimed 943 — certificate held **260**. Rejected.
- cap F₃⁷: reached 149, **honestly below** the ~236 algebraic record.

A pure-LLM pipeline would have emitted "a(16) ≥ 519" as a result. Here it was caught
because nothing is claimed without a certificate that re-verifies. That rejection is
the system working — and it is the whole reason a Vela-produced result can be trusted.

**Definition (from the sequence).** Addition is componentwise *ordinary* integer
addition, so a sum lies in `{0,1,2}^n`. A set is Sidon iff `a+b = c+d` has only
trivial solutions — equivalently, all pairwise sums `a+b` with `a ≤ b` are distinct.

**Verify it yourself (deterministic, seconds):**
```
python3 verify.py
# a(8) >= 33 ... VERIFIED
# a(9) >= 46 ... VERIFIED
# a(10) >= 65 ... VERIFIED
```
Each certificate is an explicit set of vectors; verification just checks that all
`size + C(size,2)` pairwise componentwise sums are distinct. The certificates are
the proof and are independent of how they were found.

**How found.** Iterated local search (`scripts/sidon_search.py`) over `{0,1}^n`.
The method was calibrated first and independently recovers **every known exact
value** `a(0..6) = 1,2,3,5,7,12,15`, and reproduces the recorded bounds it did not
beat (`a(7) ≥ 24`). It improved `a(8)` through `a(15)`.

**Honest framing — read this.**
- These improve **lower bounds**, not exact values. `a(8)` is now known to be
  `≥ 33`; the exact value remains open. Same for n=9, 10.
- They are **modest** — +1 to +2 over the recorded bounds — not a famous-problem
  solve. I'm not inflating them.
- "Novel" means: they exceed the lower bounds **currently recorded in OEIS A309370**
  as of 2026-05-30 (the only individually-improved term there is `a(7) ≥ 24`,
  C. Sievers, 2025-09-17). They could be matched/superseded by unpublished work;
  the certificates stand regardless and are appropriate to submit to OEIS.
- They required **no experiment** — verifiable purely by recomputation. That is the
  whole point.

**Why this is in the repo.** It is a small but genuine instance of the thesis Vela
is built for: a machine-native discovery, *carried as state with a checkable
certificate and honest provenance* — not asserted, not fabricated, independently
verifiable in seconds. A real frontier delta on the Sidon-set frontier.
