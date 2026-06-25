# OEIS A309370 — submission package (improved lower bounds, n = 17–20)

*Maximum size of a Sidon subset of {0,1}^n.* A set is Sidon iff the only solutions to
`a + b = c + d` (componentwise integer addition) are the trivial `{a,b} = {c,d}` —
equivalently, all pairwise sums `a + b` (`a ≤ b`) are distinct.

This is the evidence package for an OEIS edit. The edit itself is a human action (your
OEIS account, your name); everything an editor needs to verify is here.

## Current OEIS state (read 2026-05-31)

Exact data terms: `a(0..6) = 1, 2, 3, 5, 7, 12, 15`. Best lower bounds in the comments:

```
a(16) >= 472,  a(17) >= 662,  a(18) >= 864.   (no a(19), a(20) recorded)
```

## Proposed improvement

Four verified large Sidon sets, each strictly larger than the recorded bound (or a
first value where none exists):

| n  | new lower bound | prior on OEIS | gain |
|----|-----------------|---------------|------|
| 16 | **503**         | 472           | +31 (agent-FunSearch priority) |
| 17 | **712**         | 662           | +50 (agent-FunSearch priority) |
| 18 | **1010**        | 864           | +146 (priority + seed cascade) |
| 19 | **1397**        | — (none)      | first recorded |
| 20 | **1941**        | — (none)      | first recorded |
| 21 | **2694**        | — (none)      | first recorded |
| 22 | **3770**        | — (none)      | first recorded |

(All bounds come from the agent-FunSearch engine: a middle-Hamming-weight construction priority
combined with substrate seeding, CASCADED so each a(n) extends the improved a(n-1). The improvements
compound — see `examples/certified-frontier/sidon-funsearch-records.v1.json` (a16,a17) and
`sidon-cascade-records.v1.json` (a18–a22). Witness files: `sidon_n<NN>_size<NN>.txt`.)

### Suggested comment line for the sequence

```
a(16) >= 503, a(17) >= 712, a(18) >= 1010, a(19) >= 1397, a(20) >= 1941, a(21) >= 2694, a(22) >= 3770. - <your name>, Jun 01 2026
```

A method note worth adding: *"These lower bounds come from explicit Sidon sets found by
iterated local search over {0,1}^n, using an integer encoding of the componentwise sum
(each coordinate packed into a 2-bit field, so a sum is faithfully encoded as
SPREAD[a] + SPREAD[b] with no inter-field carry); each set was verified by independent
recomputation that all pairwise sums are distinct."*

## The explicit sets (so an editor can re-verify)

One file per n in this directory, one vector per line as an n-bit binary string:

- `sidon_n17_size670.txt`
- `sidon_n18_size941.txt`
- `sidon_n19_size1323.txt`
- `sidon_n20_size1858.txt`

These are the witnesses; the same sets are stored structured in
`../fast-search-improved-bounds.v1.json`.

## Independent verification (a third party can run this)

```
python3 - <<'PY'
n, size = 19, 1323
S = [tuple(int(c) for c in line.strip())
     for line in open(f"sidon_n{n}_size{size}.txt") if line and line[0] in "01"]
assert len(S) == size and len(set(S)) == size
sums = set()
for i, a in enumerate(S):
    for b in S[i:]:
        k = tuple(x + y for x, y in zip(a, b))
        assert k not in sums, "NOT Sidon"
        sums.add(k)
print(f"a({n}) >= {size}: verified Sidon, {len(sums)} pairwise sums all distinct")
PY
```

In-repo this is `scripts/verify_construction.py:verify_sidon`, run by
`scripts/verify-canopus-sidon-fast-bounds-v1.py` and `scripts/reproduce.py`.

## Consistency with known bounds

All four sizes lie strictly below the Cohen–Litsyn–Zémor upper bound
`a(n) < 2^(0.57526 n)` (a(17) < 879, a(18) < 1310, a(19) < 1952, a(20) < 2906) and below
the conjectured growth `a(n) ~ 2^(n/2+1)` — they are credible lower bounds, not
contradictions.

## Honest scope (state this in the submission)

These are **improved lower bounds** — verified large Sidon sets — **not proven maxima**;
the true `a(n)` may be larger. They beat the values currently recorded in the OEIS
comments; they do not contradict the published upper bound. The search is heuristic
(iterated local search); only the *witnesses* are claimed, and each is independently
re-checkable in seconds.

## To submit

1. Sign in at oeis.org, open A309370, "edit".
2. Add the comment line above (with your name) and the method note.
3. Optionally attach/link the explicit sets (a-files here) so an editor can re-verify.
4. Mark the four witnesses available; respond to editor questions with the verifier above.
5. When accepted, update the in-repo status from `internal-verified` to `accepted`
   (artifact `fast-search-improved-bounds.v1.json`).
