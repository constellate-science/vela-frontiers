# Upstream contribution: Erdős 829 — `sumRep_cubes_three`

> **DO NOT SUBMIT — DUPLICATE.** A 2026-06-14 diligence check found existing upstream work: draft PR #4194 (closes the same trio, updated 2026-06-13). Submitting this PR would duplicate active work. The proof remains a genuine, kernel-verified Vela-internal result; it is NOT a novel upstream contribution. Steps below kept for reference only.


The proof is **24 lines**, under the repo's 25–50 line in-repo cap, so this is
the simple **inline** route: the proof goes directly in the PR (no fork-hosting,
no `formal_proof` annotation). This is the recommended *first* PR — lowest
friction, and it clears the one-time Google CLA that gates every later PR.

`origin` in `~/personal/formal-conjectures` is upstream DeepMind (no push
access), so the branch goes to your fork (`willblair0708/formal-conjectures`).

## Prerequisite (once)

Sign the Google CLA at <https://cla.developers.google.com/> (CONTRIBUTING.md).

## Steps

The proven `829.lean` is the current working-tree version (kernel-clean: axioms
propext / Classical.choice / Quot.sound, no sorryAx). The working tree also has
other modified files (1150.lean, 828.lean) — commit **only** 829.lean for this PR.

```bash
cd ~/personal/formal-conjectures
git checkout -b erdos-829-sumrep-cubes-three
git add FormalConjectures/ErdosProblems/829.lean    # ONLY this file
git commit -m "Prove Erdos829.sumRep_cubes_three (3 is not a sum of two cubes)"
git remote add fork https://github.com/willblair0708/formal-conjectures.git   # once, if absent
git push fork erdos-829-sumrep-cubes-three
# then open a PR from your fork's branch to google-deepmind/formal-conjectures:main
```

**PR title:** `Prove Erdos829.sumRep_cubes_three`

**PR body:**
> Closes the `test`-category `sorry` for `sumRep_cubes_three`: the number of
> ordered representations of 3 as a sum of two perfect cubes is 0 (3 is not a sum
> of two cubes). Proof is by reducing `sumRep` to the cardinality of a filtered
> antidiagonal of 3; the bound `k ≤ k^3` rules out 2 and 3 as cubes, and the four
> pairs `(a,b)` with `a + b = 3` each contain a 2 or a 3. Builds clean, no
> `sorry`/`native_decide`, kernel-verified.

## Recommended: fold in the two sibling lemmas

`829.lean` has two more trivial `test`-category sorrys right next to this one —
`sumRep_cubes_zero` (`= 1`, the pair `(0,0)`) and `sumRep_cubes_two` (`= 1`, the
pair `(1,1)`). They are the same kind of one-line antidiagonal computation. A PR
that closes **all three** of the 829 `test` lemmas is cleaner and more natural to
review than closing one of three. Say the word and I'll prove the other two
(same technique) and update this PR to the trio before you push.
