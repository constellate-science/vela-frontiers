# examples/erdos-problems

A reference frontier on problems posed by or jointly attributed to
Paul Erdős (1913 to 1996), spanning combinatorics, number theory,
graph theory, additive combinatorics, and Ramsey theory. Built as
a third reference frontier alongside `examples/early-ad`
(biomedical) and `examples/sidon-sets` (additive combinatorics)
to demonstrate that Vela's substrate-honesty doctrine works on
mathematical content where claims are formally checkable in ways
that biomedical claims are not.

## Shape

- 1 accepted finding (the catalog scope claim seed).
- 15 agent-drafted finding-add proposals queued for human review,
  one per problem, under `agent:vela-curation-bot`.
- Each proposal cites a primary reference (the original Erdős
  paper or the canonical resolution paper).
- Status mix: 8 solved, 4 open, 3 partial.

## What's covered

Solved (8):

- Erdős-Ko-Rado theorem (1961)
- Erdős-Szekeres theorem (1935)
- Erdős discrepancy problem (1932 conjecture; Tao 2015)
- Erdős distinct distances problem (1946 conjecture; Guth-Katz 2010)
- Erdős-Faber-Lovász conjecture (1972; Kang-Kelly-Kühn-Methuku-Osthus
  2021 for sufficiently large n)
- Erdős-Heilbronn conjecture (1964; Dias da Silva and Hamidoune 1996)
- Erdős-Ginzburg-Ziv theorem (1961)
- Erdős sumset conjecture (1976 conjecture;
  Moreira-Richter-Robertson 2019)
- Erdős-Pósa theorem (1965)

Open (4):

- Erdős unit distance problem (1946)
- Erdős-Straus conjecture (1948)
- Erdős-Turán additive-bases conjecture (1941; h=2 case)
- Sunflower conjecture at the C^k bound (Erdős-Ko 1960; partial
  resolution by Alweiss-Lovett-Wu-Zhang 2020)

Partial:

- Erdős conjecture on arithmetic progressions (1936; Green-Tao 2008
  resolves the prime case)
- Erdős minimum-overlap problem (1955; iteratively improved bounds)

## Try it

From the repo root:

```bash
# Inspect the seed claim and the queued proposals.
vela log examples/erdos-problems
vela inbox examples/erdos-problems

# Lock the frontier and verify the lock.
vela lock examples/erdos-problems
vela lock examples/erdos-problems --check

# Generate static documentation.
vela doc examples/erdos-problems
open examples/erdos-problems/doc/index.html

# Run the integrity check.
vela check examples/erdos-problems
```

## Source

Drafted from public mathematical literature. Each proposal cites
the original Erdős statement and the canonical resolution paper
where applicable. The agent author is `agent:vela-curation-bot`;
nothing is auto-accepted. A reviewer with mathematical-domain
expertise reviews via the standard `vela inbox` flow before
proposals become accepted state.

The Erdős Problems database at https://erdosproblems.com tracks
1,217 problems with formal status; this frontier is a small
hand-curated 16-finding subset chosen to span the major domains
Erdős worked in, with a balance of solved, partial, and open
problems for substrate-demonstration purposes.

## Why this frontier

Mathematical claims are checkable in a way biomedical claims are
not. A theorem either has a verified proof or it does not; the
status field is unambiguous. This makes the frontier the cleanest
substrate-demonstration test bed: every assertion can be cross-
referenced against the primary literature, and the agent-drafted
proposals carry no privacy or compliance burden.

The frontier also opens a path to Lean adjacency: any of the
solved problems above could in principle be formalized in Lean
4 and attached to the finding via the v0.75 Carina `Proof`
primitive. That work is deferred; this frontier ships only the
structured-claim layer.
