---
title: Sidon-set agent policy
version: 1
agents_may:
  - propose_source_repair
  - propose_notation_normalization
  - propose_proof_artifact_link
  - propose_diff_pack
agents_must_not:
  - accept_proposal
  - resolve_open_problem
  - upgrade_bound_confidence_without_review
---

Agent policy for the Sidon-set additive-combinatorics frontier.

Agents may propose source repairs, notation normalization, proof-artifact
links, and Diff Packs. They must not accept proposals, resolve open problems,
or upgrade confidence in a bound without reviewer authority.
