# AI-for-science benchmark state

**Tier:** reference
**Domain:** ai_for_science
**Decision question.** For a given AI-for-science benchmark claim, what is its
verification state — is the dataset version pinned, the eval harness available,
the checkpoint released, leakage audited, and the result independently re-run —
and therefore how much should the frontier trust it?

This is domain #2: the same primitive as the math frontiers (a claim, its
evidence, its verification state, its review), applied where the object is a
**benchmark claim** rather than a theorem. Every record here is a claim at a
position on the verification ladder (author-reported → artifact-available →
independently reproduced → disputed), not an assertion that the score is true.
The frontier's content is the trust-*state*, not the numbers. All records are
gap-flagged: an unreproduced claim is an open verification obligation.

## Objects
- benchmark claim findings (MiniF2F, ProteinGym), each carrying dataset-version,
  harness, checkpoint, leakage, and reproduction state
- meta records pinning the dataset-version and track-conflation hazards
- faithfulness / leakage hazard records (the under-checked axes)
