# OEIS A309370 — submission package (improved lower bounds), ready to submit

*Maximum size of a Sidon subset of {0,1}^n* (componentwise ordinary integer addition).
This packages the verified improvements this project found, in a form ready for an OEIS
edit. Submitting is a deliberate external action — **Will should submit it** (it needs
an OEIS account and is outward-facing publishing); this file is the draft + the
evidence.

## The improvements (all independently verified by recomputation)

  a(8) >= 33   (OEIS comment had >= 32)
  a(9) >= 46   (OEIS comment had >= 45)
  a(10) >= 65   (OEIS comment had >= 63)
  a(11) >= 88   (OEIS comment had >= 87)
  a(12) >= 121   (OEIS comment had >= 120)
  a(13) >= 185   (OEIS comment had >= 169)
  a(14) >= 257   (OEIS comment had >= 237)
  a(15) >= 357   (OEIS comment had >= 334)
  a(16) >= 502   (OEIS comment had >= 472)

Nine consecutive improved lower bounds, a(8)–a(16). Each beats the lower bound currently
recorded in the A309370 comments (which derive from a construction that undershoots the
conjectured asymptotic 2^(n/2+1); the searched sets sit near that asymptotic).

## Draft comment for A309370

> Improved lower bounds from a verified computational search (iterated local search over
> {0,1}^n with a content-addressed sum encoding): a(8) >= 33, a(9) >= 46, a(10) >= 65, a(11) >= 88, a(12) >= 121, a(13) >= 185, a(14) >= 257, a(15) >= 357, a(16) >= 502.
> Explicit Sidon sets achieving each bound are available, and each is checkable in
> seconds (a set is valid iff its size + C(size,2) pairwise componentwise sums are all
> distinct). [link to certificates]

## How a reviewer verifies (seconds, no trust required)

```
python3 examples/sidon-sets/discoveries/verify.py
# re-checks every certificate: all pairwise componentwise sums distinct
```
Certificates (the explicit sets) are in `examples/sidon-sets/discoveries/certificates.json`.
Method calibrated first against the known EXACT values a(0..6) = 1,2,3,5,7,12,15, which it
recovers; it improved only the lower-bounded terms.

## Honesty notes for the submission

- These are LOWER BOUND improvements, not exact values; the exact a(n) for n>=7 remain open.
- "Improved" = beats the bound currently in the A309370 comments (verified 2026-05-30).
  If C. Sievers or others have posted larger values since, defer to those — the certificates
  stand regardless and the construction with the largest verified size wins.
- This is the genuine external-validation step: an OEIS editor (a real outside party)
  reviews and accepts/rejects a Vela-produced result. That acceptance is the "used by an
  outsider" milestone — the decision delta proxy for the math frontier.
