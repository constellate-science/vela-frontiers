# Upstream contribution: Erdős 993 — independent-set-sequence unimodality (NEW STATEMENT)

> **STATUS (2026-06-15): draft ready, novel — `993.lean` absent upstream.**
> Verified `FormalConjectures/ErdosProblems/993.lean` returns 404 on
> google-deepmind/formal-conjectures (the statements for 617/686/1094/458/463/
> 647 are already present; 993 is not). This is a genuine **new-statement**
> contribution, the same shape as adding a missing `ErdosProblems/N.lean`.

## What it is

The Alavi–Erdős–Malde–Schwenk (1987) conjecture: the independent-set sequence
`i₀, i₁, …` of every finite **forest** (acyclic graph) is unimodal, where `iₖ`
is the number of independent sets of size `k`. False for general graphs, open
for forests. Draft in `993.lean` (this directory):
- `numIndepSets G k` — `Nat.card` of the size-`k` independent sets (decidability-
  free formulation, needs only `[Fintype α]`);
- `Unimodal a` — nondecreasing-then-nonincreasing predicate on `ℕ → ℕ`;
- `theorem erdos_993 : ∀ α [Fintype α] (G : SimpleGraph α), G.IsAcyclic →
  Unimodal (numIndepSets G) := by sorry`, annotated `@[category research open,
  AMS 5]`, matching the 257 template.

## Build status — the math is VERIFIED

The mathematical core (the two definitions + the theorem statement) **builds
clean** against Lean v4.29.1 + Mathlib v4.29.1 (the vela `lean/` project):
`lake env lean Vela/Erdos993.lean` emits only `declaration uses 'sorry'`, no
errors. So `SimpleGraph.IsAcyclic`, `SimpleGraph.IsIndepSet`, the `(s : Set α)`
coercion, and `Nat.card {s : Finset α // …}` (Finite from `[Fintype α]`, no
`DecidablePred` — hence the `Nat.card` formulation over a `Finset.filter`) all
resolve. The verified source is mirrored at `lean/Vela/Erdos/Erdos993.lean`.

Remaining to confirm before the PR (NOT the math):
- the formal-conjectures wrappers — `import FormalConjectures.Util.ProblemImports`
  and `@[category research open, AMS 5]` — are copied verbatim from the merged
  257 file, so format-correct, but re-copy the annotation from a *current*
  `ErdosProblems/*.lean` in case the macro tokens drifted;
- upstream may pin a different Mathlib than v4.29.1; the names used are stable,
  but `lake build` in a fork before pushing is the final check.

## PR steps (outward-facing — author opens it)

1. Fork google-deepmind/formal-conjectures; add `993.lean` at
   `FormalConjectures/ErdosProblems/993.lean`.
2. `lake build` the file locally; fix any name/annotation drift.
3. PR to upstream `main`; the CI runs the Lean build + status checks. Same
   workflow as PR #4269 (Erdős 257, author willblair0708, merged).

Lower-risk than a proof PR: a statement file only has to *type-check*, not
discharge the `sorry`.
