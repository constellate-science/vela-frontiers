# prover-lane — verified results from the prover-in-the-loop foundry

A frontier holding the kernel-verified theorems the **prover-in-the-loop foundry**
closed (Program 1 of the Known→Unknown plan). Known proved lemmas compose into proofs
of open theorems: `vela foundry lean-targets` selects, a Claude proof-subagent produces
a candidate proof, the **Lean kernel** verifies it (`vela foundry lean-run`), and a
human signs the result into state. No model is in the trust path.

## Results (published to the hub)

Seven Erdős theorems, each a `sorry` in the formal-conjectures clone (HEAD `a1c9543`),
now kernel-clean (`{propext, Classical.choice, Quot.sound}`, no `sorryAx`),
independently re-verified, statements + definitions unchanged, zero cheats. Asserted
as findings and published under the maintainer key:

| Erdős | theorem |
|---|---|
| #12 | the good example (ported AlphaProof) |
| #17 | 97 is the least non-cluster-prime |
| #18 | 6 is a practical number |
| #138 | W(1) = 1 |
| #1052 | every unitary perfect number is even |
| #1052 (corollary) | no unitary perfect number is odd |
| #1054 | f(5) = 0 |

The proofs themselves are preserved at `scripts/foundry/prover-wave/erdos-proofs.patch`
(apply on FC HEAD `a1c9543`, then `vela foundry lean-run` re-verifies each).

Honest scope: these are tractable *formalization gaps* (textbook/test facts + one
known theorem), not research-open breakthroughs. The value is the loop producing them
as locally-verified state from a `sorry`, with the kernel as the trust.
