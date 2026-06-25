# One human accept → the first gate-Verified Vela finding

The finding **vf_e45b382d85f5ebde** — `OEIS A309370 a(14) >= 257` — already carries the
frozen `vela-verify` (Rust) attachment. Two **genuinely independent** re-verifications have
been drafted (different algorithms, different code paths, distinct `implementation_id`s):

- `att-a14-sumset.json`  — all pairwise SUMS distinct (`m(m+1)/2 = 33153`), `computational_search`
- `att-a14-diffset.json` — all ordered DIFFERENCES distinct (`m(m-1) = 65792`), `exact_arithmetic_recompute`,
  carrying a `formalism_fidelity` Survived probe (count / dim / binary match the claim text)

Both pass — see `verdict-a14.json` (reproduce with
`python3 scripts/verifiers/sidon_independent_checks.py examples/sidon-sets/witnesses/sidon-a14.witness.json`).

The substrate **refuses** to let an agent land verifier evidence (it is truth-bearing). That is
the human-in-the-loop boundary working as designed: an agent drafts, a key-holding human accepts.
With these two accepted, the gate reaches **Verified** for the first time on any Vela finding,
and — since the exact lane (assurance A3) is now reachable — the `sidon-exact-auto-v1` policy
auto-`permit`s it.

## Will, run (key custody):

```bash
vela attach examples/sidon-sets --target vf_e45b382d85f5ebde \
  --attachment-file examples/sidon-sets/pending-dual-verify/att-a14-sumset.json \
  --reviewer reviewer:will --reason "independent re-verification (pairwise-sum-set)"

vela attach examples/sidon-sets --target vf_e45b382d85f5ebde \
  --attachment-file examples/sidon-sets/pending-dual-verify/att-a14-diffset.json \
  --reviewer reviewer:will --reason "independent re-verification (difference-set) + formalism fidelity"

# then watch the gate flip and the policy permit on REAL evidence:
vela claim state examples/sidon-sets vf_e45b382d85f5ebde     # status -> gate Verified
vela policy evaluate examples/sidon-sets \
  --policy examples/sidon-sets/acceptance-policy.v1.json --finding vf_e45b382d85f5ebde
```
