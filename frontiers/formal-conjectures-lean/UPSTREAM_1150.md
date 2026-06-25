# Upstream contribution: Erdős 1150 Parseval lower bound

> **DO NOT SUBMIT — DUPLICATE.** A 2026-06-14 diligence check found existing upstream work: open PR #4110 + issue #4109 (same parseval_lower_bound). Submitting this PR would duplicate active work. The proof remains a genuine, kernel-verified Vela-internal result; it is NOT a novel upstream contribution. Steps below kept for reference only.


The proof of `erdos_1150.variants.parseval_lower_bound` is **126 lines**, and
google-deepmind/formal-conjectures policy (CONTRIBUTING.md) is:

> Longer proofs (more than 25–50 lines) are not to be included in this
> repository. Instead, host your proof in your own repository and link to it
> using the `formal_proof` mechanism.

So the upstream contribution is **not** the inline proof — it is a one-line
`formal_proof using formal_conjectures at "<url>"` annotation on the theorem,
pointing at the full proof hosted in your fork. This mirrors what the XC0R fork
did for the 828 textbook variant.

`origin` in `~/personal/formal-conjectures` is upstream DeepMind directly (no
push access), so you need your fork (`willblair0708/formal-conjectures`).

## Step 1 — host the proof in your fork

The full proven `1150.lean` is the current working-tree version in
`~/personal/formal-conjectures` (kernel-clean: axioms = propext / Classical.choice
/ Quot.sound, no sorryAx). Push it to a branch on your fork:

```bash
cd ~/personal/formal-conjectures
git checkout -b erdos-1150-parseval-proof
git add FormalConjectures/ErdosProblems/1150.lean
git commit -m "Prove erdos_1150.variants.parseval_lower_bound (Parseval sqrt(n+1) lower bound)"
# add your fork as a remote if not present:
git remote add fork https://github.com/willblair0708/formal-conjectures.git   # once
git push fork erdos-1150-parseval-proof
```

Note the commit hash; the hosted file URL is then
`https://github.com/willblair0708/formal-conjectures/blob/<COMMIT>/FormalConjectures/ErdosProblems/1150.lean`
(append `#L49` to point at the theorem).

## Step 2 — PR the annotation to upstream

On a *second*, clean branch off upstream `main`, change only the attribute of
`parseval_lower_bound` (keep its `sorry` — the proof lives in your fork), adding
the `formal_proof` link:

```
@[category textbook, AMS 12 30, formal_proof using formal_conjectures at
"https://github.com/willblair0708/formal-conjectures/blob/<COMMIT>/FormalConjectures/ErdosProblems/1150.lean#L49"]
theorem erdos_1150.variants.parseval_lower_bound (P : ℂ[X]) (n : ℕ)
    ...
```

Open the PR against `google-deepmind/formal-conjectures`.

**PR title:** `Add formal_proof link for erdos_1150.variants.parseval_lower_bound`

**PR body:**
> Proves the textbook Parseval lower bound for Erdős Problem 1150: for any
> degree-n polynomial P over ℂ with all coefficients in {−1, 1},
> `sup_{|z|=1} |P(z)| ≥ √(n+1)`. The proof is a discrete Parseval argument via
> orthogonality of the (n+1)-th roots of unity (the mean of |P|² over those roots
> is Σ|aₖ|² = n+1, so the max — hence the sup over the circle — is ≥ √(n+1)).
> Kernel-verified, no `sorryAx`. Hosted in my fork per the >50-line policy; this
> PR adds the `formal_proof` link. The open Erdős 1150 conjecture itself (the
> (1+c)√n improvement) is untouched.

(The Google CLA must be signed once — CONTRIBUTING.md.)

## Optional alternative

You could instead host the proof in `willblair0708/verified-combinatorics`
(your existing public witness repo) and point the annotation there, keeping all
your verified artifacts in one place. Either works.
