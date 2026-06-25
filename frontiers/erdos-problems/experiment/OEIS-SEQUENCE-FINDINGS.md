# Verified OEIS sequence findings for M7 curation

Cited deep-research pass (2026-06-09): 5 search angles, 15 sources fetched, 66 claims extracted, 25
adversarially verified (3-vote), 24 confirmed / 1 refuted. Every numeric value below is traceable to
the cited OEIS page or named reference. This is the verified basis for the held-out thresholds in
`held-out-bounds.v1.json`; nothing here was guessed.

## The headline correction

**A309370 is the maximum size of a Sidon subset of the hypercube {0,1}^n** (componentwise ordinary
integer addition, sums in {0,1,2}^n), conjectured ~2^(n/2+1) — NOT "max Sidon subset of [1,n]". This
explains the large recorded values (a(18)≥1010, etc.): they are best-known **lower bounds**, not
interval counts. The binary `verify_sidon` already in the repo is the correct verifier. The prior
mislabeling confused it with A143824. [oeis.org/A309370, 3-0]

## Per-sequence table

| Seq | Definition | Verifier | Proven values (largest proven) | Frontier (best-known) |
|---|---|---|---|---|
| **A309370** | max Sidon subset of {0,1}^n | `sidon` | a(0..6)=1,2,3,5,7,12,15 (n=6) | a(16)≥505, a(18)≥1010, a(19)≥1435, a(20)≥1989, a(21)≥2694, a(22)≥3770 (Blair) |
| **A143824** | max Sidon subset of [1,n] | `sidon_interval` | a(4)=3, a(18..22)=6, a(100)=12, a(500)=26 | — (sqrt(n) growth) |
| **A003022** | optimal Golomb ruler length, n marks | `golomb` (minimize) | a(2..28), e.g. a(28)=585 (n=28 marks) | — |
| **A227590** | = A003022(n)+1 | `golomb` | a(1..28), a(28)=586 | — |
| **A003002** | max 3-AP-free subset of [1..n] | needs no-3-AP check | a(0..14)=0,1,2,2,3,4,4,4,4,5,5,6,6,7,8; a(82)=23, a(211)=43 | — |
| **A005346** | van der Waerden W(2,n) | **none** | a(1..6)=1,3,9,35,178,1132 (W(2,6)) | existence; no witness |
| **A005115** | smallest prime ending n-term prime AP | **none** | 2,3,7,23,29,157,907,… | number theory; no witness |
| A003003/4/5 | **not verified this pass** | — | — | fetch oeis.org directly before wiring |

Cap-set numbers (A090245, max cap in AG(n,3)/F_3^n), all proven: n=1..6 = **2,4,9,20,45,112**
(Bose 1947, Pellegrino 1970, Edel-Ferret-Landjev-Storme 2002, Potechin 2008). `cap` verifier.

## What got wired (verified + sound)

Two calibration instances, both constellation nodes, both `sidon_interval`, both with achievability
witnesses confirmed/cited:

- **erdos-14** → `sidon_interval`, n=100, target **12** (A143824 a(100)=12, proven). A 12-element
  Sidon set in [1,100] was constructed and verified (`achievability-witnesses.v1.json`).
- **erdos-530** → `sidon_interval`, n=500, target **26** (A143824 a(500)=26, proven). Harder rung.

`sidon:4` was corrected from a buggy **6** to the proven **7** (A309370 a(4)=7, re-verified
exhaustively). The full A309370 ladder (proven a(0..6), frontier a(16..22)) is recorded in the
held-out bounds for any future hypercube-Sidon node.

The hardened mock now reports **TESTABLE but UNDERPOWERED (2 instances)** instead of UNDECIDABLE.

## Remaining curation to power the run

- The A309370 hypercube items (n8..n19) carry `erdos_number: null`, so they are not constellation
  nodes and never enter the run. To use them, tie them to a node or run them as a standalone
  discovery bank.
- Add more `sidon_interval` calibration rungs (other [1,N] with cited A143824 values) and the Golomb
  (`golomb`, needs minimization mode) and 3-AP-free (`A003002`, needs a no-3-AP verifier) families to
  reach the power target (~25 discordant pairs).
- A005346 and A005115 are existence/number-theory with no cheap witness; keep them out of the
  discovery stratum.
- A003003/A003004/A003005 were not verified; fetch their OEIS pages before wiring any threshold.

## Caveats (from the verification)

- A309370 frontier lower bounds are author-contributed and time-sensitive (strengthened between Jun
  02 and Jun 05 2026); re-fetch oeis.org/A309370 before any confirmatory freeze.
- Golomb optimality is proven only through n=28 marks; cap only through n=6.
- One refuted claim: an off-by-one Wikipedia cap-set mapping; the A090245 indexing above is correct.
