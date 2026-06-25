# Frontiers

Git-backed frontier directories. Each `<name>/` is a full frontier with its
`.vela/` event log committed, re-derived on every PR by the `vela-check` Action
(see the root README) — a required status check on `main`. The Action
auto-discovers every frontier here and gates each one.

Math wedge:

- `sidon-sets/` — Sidon sets / OEIS A309370 (`vfr_496956067dc5ad79`), the keystone.
- `erdos-problems/` — Erdős problems certificate lanes (`vfr_37aec80d874a0239`), 32 frozen witnesses across 14 verifier kinds.
- `quantum-codes/` — quantum error-correcting codes (`vfr_001f148c07eebecb`).
- `formal-conjectures-lean/` — Formal Conjectures, Lean (`vfr_97d7d25957384f80`).
- `benchmark-state/` — benchmark claim-state (MiniF2F / ProteinGym) (`vfr_efc649fd772a1ff1`).
- `prover-lane/` — Erdős certificate generators + ledger (`vfr_b354d1ae5d88038b`).

Witness frontiers (Sidon, Erdős) are `reproduce`d from scratch by the frozen
verifiers on every PR. Claim/cert frontiers carry no witnesses, so they are
gated by `check` + hash-parity (the recomputed `event_log_hash` +
`snapshot_hash` must equal the committed `vela.lock`).

To contribute: fork this repo, add or edit a witness under a frontier, and open
a PR. The frozen verifiers re-derive it; a reviewer's human-key-signed accept
lands the change.

```bash
vela reproduce frontiers/<name>   # re-verify witnesses (if any)
vela check     frontiers/<name>   # structural / signal gate
```
