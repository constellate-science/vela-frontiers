# Frontiers

Git-backed frontier directories. Each `<name>/` is a full frontier with its
`.vela/` event log committed, re-derived on every PR by the `vela-check` Action
(see the root README) — a required status check on `main`.

- `sidon-sets/` — Sidon sets / OEIS A309370 (`vfr_496956067dc5ad79`), the
  keystone math frontier.

To contribute: fork this repo, add or edit a witness under a frontier, and open
a PR. The frozen verifiers re-derive it from scratch; a reviewer's
human-key-signed accept lands the change.

```bash
vela reproduce frontiers/sidon-sets   # re-verify every witness
vela check     frontiers/sidon-sets   # structural / signal gate
```
