-- examples/sidon-sets/artifacts/proof-scripts/
-- h_squared_dissociated_polynomial_diameter.lean
--
-- v0.76.5 stub. The substrate's Carina Proof primitive carries
-- (tool, tool_version, script_locator, verifier_output_hash,
-- verified_at, target_finding_id). This file is the
-- script_locator content for finding vf_3bde881fed68d7dd; its
-- sha256 hash IS the locator, and the verifier's success output
-- hash IS the certification.
--
-- The Lean code below is a SKETCH of the formalization site.
-- A real verification would: (1) define h-squared-dissociated
-- sets, (2) state the Sidon-set existence lemma, (3) prove the
-- diameter bound is polynomial in k via the explicit
-- construction, (4) replace the geometric component proof with
-- the polynomial-bounded one. Lines below name the obligations
-- without discharging them.
--
-- Source: Gowers (2026-05-08) describes ChatGPT-5.5-Pro
-- producing the underlying mathematical idea in roughly two
-- hours of guided interaction. The certification path Vela
-- documents is: agent-drafted finding -> human reviewer
-- needs_revision -> proof stub attached as artifact -> reviewer
-- promotes to accepted-core after Lean checks the script.
-- This file is the slot the Proof primitive points at; the Vela
-- substrate does not run Lean. A reviewer runs Lean externally
-- and records the verifier output hash.

import Mathlib.Combinatorics.Additive.SalemSpencer
import Mathlib.Order.Filter.Basic

namespace SidonHSquaredDissociated

/-- An h-squared-dissociated set in {1, ..., N}: every nontrivial
    sum a₁ + a₂ + ... + aₕ with each aᵢ in S and at most one
    repetition is unique. The h=2 case is the Sidon-set
    definition; h>=3 generalizes it. -/
def HSquaredDissociated (h : ℕ) (S : Finset ℕ) : Prop :=
  sorry

/-- Existence of a polynomial-diameter h-squared-dissociated set.
    For each k there is an h-squared-dissociated set of size k
    with diameter polynomial in k. This is the substantive claim
    the v0.76.5 Sidon-set example records as
    finding vf_3bde881fed68d7dd. -/
theorem hSquaredDissociated_polynomial_diameter (h : ℕ) (k : ℕ) :
    ∃ S : Finset ℕ,
      HSquaredDissociated h S ∧
      S.card = k ∧
      ∃ p : Polynomial ℕ,
        ∀ x ∈ S, x ≤ p.eval k := by
  sorry

/-- N(h, k) bound. The h-fold sumset of an h-squared-dissociated
    set of size k has cardinality at most polynomial in k, not
    exponential. This is the load-bearing claim the original
    Nathanson construction left exponential and the
    ChatGPT-5.5-Pro session reduced. -/
theorem N_h_k_polynomial_upper_bound (h k : ℕ) :
    ∃ p : Polynomial ℕ,
      sorry := by  -- N(h, k) <= p.eval k
  sorry

end SidonHSquaredDissociated

-- Verifier-output target. When this file passes `lake build`
-- (with `sorry` replaced by real proofs), the Vela Proof
-- primitive's `verifier_output_hash` records sha256 of Lean's
-- success output. Until then the artifact is a stub: the
-- substrate documents the slot, not the proof.
