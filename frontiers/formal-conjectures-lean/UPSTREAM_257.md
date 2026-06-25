# Upstream contribution: Erdős 257 — `tsum_top_eq` (THE submittable one)

> **SUBMITTED 2026-06-14:** opened inline (35-line golfed proof) as https://github.com/google-deepmind/formal-conjectures/pull/4269 (author willblair0708). cla/google PASS, OPEN + MERGEABLE; Lean-build CI pending. Steps below kept for reference.


Unlike 1150 / 829 / 828, this one is **genuinely unclaimed**: verified
2026-06-14 — no open PR, no PR ever mentioning `tsum_top_eq`, no `formal_proof`
annotation, the only issue (#2055) closed. It is a real novel upstream
contribution. Kernel-clean (axioms propext / Classical.choice / Quot.sound, no
sorryAx).

The identity: `∑_{n≥1} 1/(2^n − 1) = ∑_{n≥1} d(n)/2^n` (d = number of divisors),
the divisor-counting rewrite of a Lambert series. `@[category textbook]`.

## Two routes — pick one

The proof is **~83 lines**, over the repo's 25–50 line in-repo cap.

**(A) Hosted-fork route (works now, keeps the upstream `sorry`):** host the proof
in your fork and PR a `formal_proof using formal_conjectures at "<fork-url>"`
annotation onto `tsum_top_eq` upstream. Same mechanics as `UPSTREAM_1150.md`.
Lower-value: the sorry stays upstream.

**(B) Golf-to-inline route (better — actually fills the sorry upstream):** shrink
the proof under 50 lines (most of the bulk is the two summability-by-domination
steps), then PR it **inline**, replacing the `sorry`. This is the stronger
contribution and the cleaner single PR. Recommended if the proof golfs down.

## Steps (route A, or route B after golfing)

```bash
cd ~/personal/formal-conjectures
git checkout -b erdos-257-tsum-lambert
git add FormalConjectures/ErdosProblems/257.lean   # ONLY this file
git commit -m "feat(ErdosProblems/257): prove tsum_top_eq (Lambert series divisor identity)"
gh repo fork google-deepmind/formal-conjectures --remote --remote-name fork   # once
git push fork erdos-257-tsum-lambert
gh pr create --repo google-deepmind/formal-conjectures \
  --head willblair0708:erdos-257-tsum-lambert \
  --title "feat(ErdosProblems/257): prove tsum_top_eq" \
  --body "<body below>"
```
Note the conventional-commit PR title style `feat(ErdosProblems/NNN): ...` matches
the repo's merged-PR convention. For route A, the committed file should be the
*annotation-only* change (sorry kept) + the proof hosted on the fork branch.

**PR body:**
> Proves `erdos_257.variants.tsum_top_eq`, the Lambert-series divisor identity
> `∑_{n≥1} 1/(2^n − 1) = ∑_{n≥1} d(n)/2^n`. It instantiates Mathlib's
> `tsum_pow_div_one_sub_eq_tsum_sigma` at `r = 1/2`, `k = 0`, rewrites both sides
> (`(1/2)^n/(1−(1/2)^n) = 1/(2^n−1)`, `σ₀(n)·(1/2)^n = d(n)/2^n`), bridges the
> `ℕ⁺` sum to the `ℕ` sum (the `n=0` term vanishes on both sides), and discharges
> summability by geometric domination. Kernel-verified, no `sorry`/`native_decide`.

(Google CLA: signed.)
