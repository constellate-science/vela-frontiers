/-!
Sidon theorem slots for Vela v0.358.

This file is a proof-assistant-readable slot manifest. It records
where formal Lean work should attach to the Sidon frontier. It is not
a completed formalization and it intentionally declares no theorem,
axiom, or sorry.
-/

namespace Vela
namespace SidonSlots
namespace V0358

structure TheoremSlot where
  findingId : String
  sourceId : String
  evidenceAtomId : String
  theoremLocator : String
  formalizationStatus : String
  reviewCaveat : String
deriving Repr

def croot_lev_pach_z4_slot : TheoremSlot :=
  { findingId := "vf_7273c1823848f6e3"
    sourceId := "vs_b5e2d12c31e5aff7"
    evidenceAtomId := "vea_aa70162760bbe7f4"
    theoremLocator := "Croot-Lev-Pach 2016, arXiv:1605.01506, abstract and main theorem statement"
    formalizationStatus := "slot_only_not_formalized"
    reviewCaveat := "Source-grounded locator only. This is not a checked proof." }

def ellenberg_gijswijt_cap_set_slot : TheoremSlot :=
  { findingId := "vf_eee5b19763f3c625"
    sourceId := "vs_3d86039e17bccee8"
    evidenceAtomId := "vea_da5823dd5a21022c"
    theoremLocator := "Ellenberg-Gijswijt 2016, arXiv:1605.09223, abstract and cap-set theorem statement"
    formalizationStatus := "slot_only_not_formalized"
    reviewCaveat := "Source-grounded locator only. This is not a checked proof." }

def bloom_sisask_roth_log_barrier_slot : TheoremSlot :=
  { findingId := "vf_f16e736879b4b42c"
    sourceId := "vs_7d2d5a9a0f13bd38"
    evidenceAtomId := "vea_74798c142b62e1c4"
    theoremLocator := "Bloom-Sisask 2020, arXiv:2007.03528, abstract and main Roth-bound theorem statement"
    formalizationStatus := "slot_only_not_formalized"
    reviewCaveat := "Source-grounded locator only. This is not a checked proof." }

def allSlots : List TheoremSlot :=
  [ croot_lev_pach_z4_slot
  , ellenberg_gijswijt_cap_set_slot
  , bloom_sisask_roth_log_barrier_slot
  ]

end V0358
end SidonSlots
end Vela
