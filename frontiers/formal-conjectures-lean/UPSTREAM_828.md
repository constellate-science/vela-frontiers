# Upstream contribution: Erdős 828 — `phi_dvd_self_iff_pow2_pow3`

> **DO NOT SUBMIT — DUPLICATE.** A 2026-06-14 diligence check found existing upstream work: XC0R proof already linked in-repo (formal_proof annotation). Submitting this PR would duplicate active work. The proof remains a genuine, kernel-verified Vela-internal result; it is NOT a novel upstream contribution. Steps below kept for reference only.


The proof is **157 lines** (the full `↔`, both directions), well over the repo's
25–50 line in-repo cap, so this is the **hosted-fork + `formal_proof` annotation**
route (same as 1150). The theorem keeps its `sorry` upstream; the proof lives in
your fork and is linked via the annotation. Note: an `XC0R/formal-conjectures`
fork already carries a proof of this same lemma (the existing
`formal_proof using ... XC0R ...#L49` annotation on the theorem), so the
maintainers may prefer that one — your contribution is an independent proof; it
is fine to link it as an additional `formal_proof`, or to skip the PR and just
keep the verified result in Vela. Your call.

## Step 1 — host the proof in your fork

The proven `828.lean` is the current working-tree version (kernel-clean: axioms
propext / Classical.choice / Quot.sound, no sorryAx). Commit **only** 828.lean:

```bash
cd ~/personal/formal-conjectures
git checkout -b erdos-828-phi-dvd-proof
git add FormalConjectures/ErdosProblems/828.lean   # ONLY this file
git commit -m "Prove Erdos828 phi_dvd_self_iff_pow2_pow3 (totient-divides characterization)"
git remote add fork https://github.com/willblair0708/formal-conjectures.git   # once, if absent
git push fork erdos-828-phi-dvd-proof
```
Hosted URL: `https://github.com/willblair0708/formal-conjectures/blob/<COMMIT>/FormalConjectures/ErdosProblems/828.lean#L50`.

## Step 2 — PR the annotation (only if you want it upstream)

On a clean branch off upstream `main`, add a second `formal_proof using
formal_conjectures at "<your-fork-url>"` to the theorem's attribute (alongside
the existing XC0R one), keeping the `sorry`. Open the PR to
`google-deepmind/formal-conjectures`.

**PR title:** `Add formal_proof link for Erdos828 phi_dvd_self_iff_pow2_pow3`

**PR body:**
> An independent kernel-verified proof of the textbook characterization
> `φ(n) ∣ n ↔ n ≤ 1 ∨ n = 2^a · 3^b (a > 0)`. Forward direction by a 2-adic
> valuation argument: 2 ∣ n (else φ(n) is even and cannot divide odd n); writing
> n = 2^a·m (m odd), `v₂(φ m) ≤ 1` forces m to have at most one odd prime (two
> would give 4 ∣ φ m), and that prime p satisfies (p−1) ∣ 2 ⟹ p = 3. No `sorryAx`.

## Reality check

Because XC0R already has a proof linked, this PR is lower-value than the 1150 and
829 ones (which are not yet in the repo). My recommendation: PR **829 first**
(inline, novel), **1150 second** (novel, hosted), and treat **828 as optional** —
the Vela record already captures your independent proof, and that's the result
that matters most for the discovery thesis.
