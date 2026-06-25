# Reviewer guide: Additive combinatorics: Sidon sets and N(h,k) bounds

Use this packet as a reviewable frontier snapshot. Start with `scope.json`, then inspect `evidence-matrix.json`, `candidate-tensions.json`, `candidate-gaps.json`, and `candidate-bridges.json` before reading individual finding bundles.

## Suggested review loop

1. Confirm the bounded scope and source corpus in `scope.json`, `source-table.json`, and `sources/source-registry.json`.
2. Check high-confidence or high-link findings in `evidence-matrix.json`, then inspect exact source-grounded atoms in `evidence/evidence-atoms.json`.
3. Review `reviewer/source-debt.json` and `reviewer/research-trace-provenance.json` before treating packet wording as trusted state.
4. Inspect candidate tensions against the full finding bundles in `findings/full.json`.
5. Treat candidate gaps and bridges as leads requiring review, not as settled claims.
6. Use `mcp-session.json` to replay the conservative MCP investigation loop.
7. Verify checksums with `manifest.json` and `packet.lock.json` before comparing packet diffs.

## Caveats

- Candidate contradictions, gaps, and bridges require human review.
- Evidence ranking is heuristic: meta-analysis > RCT > cohort > case-control > case-report > in-vitro.
- PubMed prior-art checks are rough signals, not proof of novelty.
- Observer policy output is weighted reranking, not definitive disagreement.
- Retraction impact is simulated over declared dependency links.
