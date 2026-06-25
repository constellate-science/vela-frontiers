# examples/sidon-sets

A minimal additive-combinatorics frontier on Sidon sets and N(h, k)
bounds. Built as a concrete answer to Timothy Gowers's blog post
"A recent experience with ChatGPT-5.5-Pro" (gowers.wordpress.com,
2026-05-08).

## What Gowers asks for

> Perhaps there should be a different repository where AI-produced
> results can live...results would be included only if a human
> mathematician was prepared to certify that they were correct, or,
> better still, that they had been formalized by a proof assistant.

Vela's substrate already does this. Every event carries
`actor.type: "human" | "agent"`. AI-drafted proposals stay as
proposals until a human reviewer signs an accept event. The v0.75
Carina spec adds a fourteenth primitive, `Proof`, with fields for
`tool` (Lean / Coq / Isabelle / Agda / Metamath / Rocq), version,
script locator (content-addressed), verifier output hash, and
`verified_at` timestamp.

This example wires the doctrine end-to-end on a non-biology
domain.

## Shape

21 findings, 29 events, 35 proposal records, 1 proof-script artifact.
Of the proposal records, 28 have already been applied into the current
frontier and 7 unsupported `finding.add` proposals have been rejected
because they had no source refs or evidence spans. No proposal-review
or strict-signal blockers are currently open.

The frontier covers the additive-combinatorics curriculum a
graduate student would meet on the way to the AI-drafted
improvement: Sidon-set foundations (Erdos-Turan, Singer,
Lindstrom, B_h sets), 3-AP-free and Roth-type bounds (Behrend,
Roth, Bourgain, Sanders, Bloom-Sisask), Szemeredi and Gowers
norms (Szemeredi, Gowers's quantitative proof, Green-Tao-Ziegler
inverse theorem), sumset structure (Plunnecke-Ruzsa, Ruzsa
covering, Freiman), Bohr-set Fourier analysis (Bourgain), and
the polynomial method (Croot-Lev-Pach, Ellenberg-Gijswijt,
Schoen-Shkredov). The original three findings remain the
load-bearing ones for the AI-attribution demonstration:

- **vf_63f4bcd4f4904a08**: classical Sidon-set existence
  (Erdos-Turan 1941). Confidence 0.95. Asserted by
  `agent:research-bot-2026-05-09`. Scaffolding for the harder
  claims below.
- **vf_0baa77910460c953**: Nathanson's open problem on N(h, k)
  bounds. Confidence 0.55. Asserted by
  `agent:research-bot-2026-05-09`. The frontier records the
  open question; no claim of resolution yet.
- **vf_3bde881fed68d7dd**: the AI-drafted improvement.
  Source: `model_output` ("ChatGPT-5.5-Pro session, 2026-05-08,
  ~2 hours guided"). The h-squared-dissociated set construction
  reduces the diameter from exponential to polynomial in k.
  Confidence 0.40, because the AI session draft is not yet
  certified.

The 18 curriculum findings (Singer through Schoen-Shkredov) are
asserted under `agent:research-bot-2026-05-09` at confidence
0.85, then await reviewer attestation under a human key. They
sit in the same epistemic tier as any other unattested agent
draft: visible in the frontier, replay-deterministic, and
distinguishable from human-attested truth.

The v0.342 source-location wave adds exact arXiv locators and
abstract spans for three methodology findings: Croot-Lev-Pach
(`vf_7273c1823848f6e3`), Bloom-Sisask
(`vf_f16e736879b4b42c`), and Ellenberg-Gijswijt
(`vf_eee5b19763f3c625`). This is source-location repair only. It
does not promote those findings to accepted-core or certify a formal
proof.

The later v0.107 proposal wave is also visible but not promoted:
Green-Tao, Croot-Lev-Pach, Bose-Chowla, Erdos-Ko, Ruzsa,
Cilleruelo, and Tao higher-order Fourier analysis each sit as
pending `finding.add` proposals. Their reviewer work order lives in
`review/strict-signal-remediation.v1.md`, and the generic packet
builder can package them with:

```bash
./scripts/build-strict-signal-review-packet.sh examples/sidon-sets /tmp/vela-sidon-strict-packet
```

That packet is read-only. It does not count as review and does not
change frontier truth.

## The chain

```
asserted        vev_bafff34df7ac6c1c
                actor:        agent:research-bot-2026-05-09
                kind:         finding.add
                target:       vf_3bde881fed68d7dd

reviewed        vev_22c1fb678f86bdbb
                actor:        reviewer:will-blair
                kind:         finding.review
                payload:      status=needs_revision
                reason:       Bound and construction look correct
                              under the Nathanson hypothesis but I
                              want a Lean stub before promoting to
                              accepted-core.

artifact added  examples/sidon-sets/.vela/artifacts/
                Lean 4 stub at content_hash sha256:290bfbff96...
                target:       vf_3bde881fed68d7dd
                metadata:     carina_kind=proof_script,
                              carina_proof_tool=lean4,
                              carina_proof_tool_version=4.7.0
```

The promote-to-accepted-core event is intentionally NOT here.
The substrate documents what is certified and what is not. A
future reviewer (or a future Lean run) closes the gap by
replacing the `sorry` placeholders in the proof-script
artifact, computing the verifier output hash, registering a
Carina Proof primitive (`vpf_<id>`) pointing at the script +
verifier output, and writing a `finding.review` accept event
under their reviewer key.

## Try it

From the repo root:

```bash
# See the chain.
vela lineage examples/sidon-sets vf_3bde881fed68d7dd

# Verify replay determinism.
vela integrity examples/sidon-sets --json

# List the bundled Carina primitives, including Proof.
vela carina list

# Print the Proof schema this example will eventually populate.
vela carina schema proof

# Open the local Workbench.
vela serve --path examples/sidon-sets
```

## Doctrine notes

- The agent reviewer id (`agent:research-bot-2026-05-09`) is
  separate from any human reviewer. Verdicts attribute to the
  agent; a human can re-review later. See
  `docs/AI_ATTRIBUTION.md`.
- The Lean stub is a sketch with `sorry`. The substrate records
  the slot the proof artifact will eventually fill, not the
  proof itself. The `verifier_output_hash` field on the Carina
  Proof primitive is what makes the certification falsifiable:
  a third party can re-run Lean on the script and check the
  hash matches.
- This example is the second reference frontier in v0.76 (the
  first is `examples/early-ad/` from v0.74). It validates that
  Vela is domain-agnostic: the same substrate that hosts BBB
  pericyte findings hosts additive-combinatorics findings, with
  the same audit trail and the same certification semantics.

## What the substrate does NOT decide

- Credit assignment between human and AI on the underlying
  improvement.
- Whether the `model_output` source type is acceptable for an
  arXiv-style preprint. That is a community / journal call.
- Whether the Lean stub's eventual proof is correct. Lean
  decides; Vela records.

## See also

- Gowers, T. "A recent experience with ChatGPT-5.5-Pro."
  gowers.wordpress.com, 2026-05-08.
- `docs/AI_ATTRIBUTION.md`. The AI vs human-reviewer doctrine.
- `docs/CARINA.md` §v0.3. The Proof primitive spec.
- `docs/EVENT_LOG.md`. How a reviewer reads the event log.
- `examples/early-ad/`. The first reference frontier.
