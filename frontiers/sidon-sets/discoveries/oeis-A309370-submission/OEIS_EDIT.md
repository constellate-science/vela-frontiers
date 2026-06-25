# OEIS A309370 — submission record + verification manifest (reconciled 2026-06-06)

**LIVE STATUS (web-checked 2026-06-06).** These bounds ARE on OEIS — the earlier "never
submitted / NOT on OEIS" note in this file was stale and is corrected here. The live page
carries three approved William Blair comments:
- Jun 02 2026: a(16)≥503, a(17)≥712, a(18)≥1010, a(19)≥1397, a(20)≥1941, a(21)≥2694, a(22)≥3770.
- Jun 03 2026: a(8)≥33, a(9)≥46, a(10)≥66.
- Jun 05 2026: a(9)≥47, a(11)≥92, a(12)≥133, a(13)≥185, a(14)≥257, a(15)≥364, **a(16)≥505,
  a(19)≥1435, a(20)≥1989** (the improved witnesses; these supersede the Jun-02 503/1397/1941).

A fourth edit (draft #64, **proposed / in editorial review** as of Jun 05 17:19) adds
**a(23)≥5179, a(24)≥7179** and updates the Blair Link to "n = 8..24". The Blair Link
(github.com/willblair0708/verified-combinatorics/tree/main/sidon-A309370) resolves; its README
and witnesses were synced to the best verified bounds on 2026-06-06.

**Verification (independent).** `scripts/sidon_a309370_reconcile.py` re-verified all on-disk
witnesses with a from-scratch base-3 componentwise-integer pairwise-sum-distinct check (NOT the
verifier that produced them) — 0 failures — and wrote `VERIFICATION_MANIFEST.json`. The repo's
own `verify.py` is green on every set including n=23 (5179) and n=24 (7179).

**Nothing left to submit by hand** except waiting on the n=23/24 draft to clear editorial
review. This file is now the evidence index, not a to-do. Any future OEIS edit is yours to make
under your own account; I do not submit under your identity.

## Verified bounds (use the larger witness where two exist)

| n | bound | witness file | prior on OEIS |
|---|-------|--------------|---------------|
| 16 | 505 | sidon_n16_size505.txt | 472 |
| 17 | 712 | sidon_n17_size712.txt | 662 |
| 18 | 1010 | sidon_n18_size1010.txt | 864 |
| 19 | 1435 | sidon_n19_size1435.txt | none |
| 20 | 1989 | sidon_n20_size1989.txt | none |
| 21 | 2694 | sidon_n21_size2694.txt | none |
| 22 | 3770 | sidon_n22_size3770.txt | none |

(Superseded smaller witnesses kept for audit: sidon_n16_size503, n17_size670, n19_size1397,
n20_size1941, n21_size2606, n22_size3567. The table above uses the larger, re-verified set.)

## Consolidated comment (ALREADY ON OEIS as the Jun 02/03/05 comments — for reference; do NOT re-submit)

```
%C A309370 a(16) >= 505, a(17) >= 712, a(18) >= 1010, a(19) >= 1435, a(20) >= 1989, a(21) >= 2694, a(22) >= 3770. - _Will Blair_, Jun 06 2026
%C A309370 The sets achieving these bounds were found by computer search (iterated local search with a middle-weight structural priority) and each was independently verified to be Sidon, i.e. all C(m,2)+m pairwise componentwise-integer sums are distinct.
%H A309370 Vela, <a href="https://github.com/willblair0708/verified-combinatorics/tree/main/sidon-A309370">Verified Sidon sets for n = 16..22</a>
```

Consistent with the page's own conjecture a(n) ~ 2^(n/2+1): 505<512, 1010<1024, 1989<2048,
i.e. these lower bounds sit just under the conjectured values.

## Before submitting

1. Confirm the witness files are pushed to the public repo so the %H link resolves.
2. An editor may ask you to fold the improved values into the existing bounds comment rather
   than add a new line — either is fine; let them merge.
3. The bounds beat the values *recorded on OEIS*. I have not exhaustively searched the
   literature for a better unrecorded construction; the honest claim is "improves the recorded
   lower bounds," not "world record." State it that way if asked.
