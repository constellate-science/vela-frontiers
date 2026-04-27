# vela-frontiers

Public mirror of locator-bound published artifacts for
[Vela](https://vela-site.fly.dev) — the substrate source lives in a
separate, currently private repository; only the artifacts that the
public Vela hub at `vela-hub.fly.dev` references via signed
`network_locator` URLs live here.

This repo exists for one reason: **`vela registry pull` needs a public
URL to fetch published frontier manifests from.** The hub stores a
signed manifest pointing at a `network_locator`; clients verify the
manifest signature and then fetch the locator URL to pull the actual
frontier state. That fetch needs to resolve over plain HTTP.

## What lives here

```
frontiers/
├── alzheimers-therapeutics.json   # canonical Alzheimer's Therapeutics frontier
│                                  # (vfr_bd912b3e29e334ab, 86 signed claims)
├── bbb-alzheimer.json             # historical v0.29 BBB Flagship snapshot
├── bbb-extension.json             # historical extension probe
└── will-alzheimer-landscape.json  # hand-curated 12-claim landscape

benchmarks/
├── leaderboard.json               # VelaBench submissions manifest
├── gold-alzheimers.json           # canonical gold (86 claims, derived
│                                  # deterministically from the canonical
│                                  # frontier via scripts/gold-from-frontier.py)
└── results/                       # per-submission scored output
    ├── alzheimers-therapeutics.json
    ├── bbb-alzheimer.json
    ├── bbb-extension.json
    └── will-alzheimer-landscape.json
```

## Pulling the canonical frontier

```bash
vela registry pull vfr_bd912b3e29e334ab \
    --from https://vela-hub.fly.dev/entries \
    --out alzheimers-therapeutics.json

# verifies snapshot + event-log hashes against the signed hub manifest
# fetches the network_locator URL (this repo) to materialize the frontier
# verifies the owner_pubkey signature on the manifest envelope
```

## What does NOT live here

The Vela substrate source — `crates/vela-protocol`, `crates/vela-cli`,
`crates/vela-scientist`, `crates/vela-hub`, the site source, the
agent prompts, dev tooling, the in-progress `.vela/` working
directories. That code is in active substrate development and lives
in a separate repository.

When the substrate reaches a public-ready state, that repository
will become public alongside this one. Until then: this mirror is
the integrity contract for anyone pulling published frontiers from
the Vela hub.

## License

Frontier files in this repository are CC-BY-4.0 unless the embedded
provenance declares otherwise on a per-source-paper basis. VelaBench
gold + result files are CC-BY-4.0.
