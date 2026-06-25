# vela-frontiers

Public, independently verifiable frontier state for
[Vela](https://app.constellate.science), the protocol that moves scientific
activity into signed, replayable state. The Vela substrate (reducer, CLI, hub,
conformance) is open at
[constellate-science/vela](https://github.com/constellate-science/vela); the
public hub is at <https://hub.constellate.science>.

## Git-backed frontiers (the producer on-ramp)

Frontiers live here as **full git-backed directories** under
`frontiers/<name>/`, with their `.vela/` event log committed (not just a JSON
manifest). This is the producer on-ramp from ADR 0001: fork this repo, add or
edit a witness under a frontier, and open a PR. The `vela-check` GitHub Action
re-derives the frontier from a clean checkout on every PR, and is a required
status check on `main`:

- `vela reproduce` — the frozen verifiers re-run every witness from scratch.
- `vela check` — the structural / signal gate.
- hash-parity — the recomputed `event_log_hash` + `snapshot_hash` must equal the
  committed `vela.lock`, so the working tree IS the signed state.

A reviewer's accept stays a human-key-signed event committed in the PR; the
Action never signs. The first such frontier is `frontiers/sidon-sets`
(`vfr_496956067dc5ad79`, the A309370 keystone).

## Registry-pull manifests (still supported)

The hub can also serve a published frontier as a signed manifest pointing at a
`network_locator` URL; a client runs

```bash
vela registry pull <vfr_id> --from https://hub.constellate.science/entries
```

which verifies the manifest signature and the snapshot + event-log hashes, then
fetches the locator. No manifests are mirrored here at present: the retired
Alzheimer's cluster was removed in the 2026-06 math-wedge consolidation, and the
live math frontiers are served directly from the hub (and git-backed above).

## License

Frontier files in this repository are CC-BY-4.0 unless the embedded provenance
declares otherwise on a per-source-paper basis.
