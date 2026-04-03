import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p0_main
theorem Gallian_1
    {G : Type*} [Group G] [Fintype G] [IsCyclic G]
    (x : G) (hG : Fintype.card G = 15)
    (h :
        (x ^ 3 = x ^ 5 ∧ x ^ 3 ≠ x ^ 9) ∨
        (x ^ 3 = x ^ 9 ∧ x ^ 3 ≠ x ^ 5) ∨
        (x ^ 5 = x ^ 9 ∧ x ^ 5 ≠ x ^ 3)) :
    orderOf (x ^ 13) = 3 := by
  sorry
end p0_main

namespace p1_main
theorem Gallian_2
    {G : Type*} [Group G] (a : G) (n k : ℕ)
    (hord : orderOf a = n) :
    Subgroup.closure ({a ^ k} : Set G)
      = Subgroup.closure ({a ^ Nat.gcd n k} : Set G) := by
  sorry
end p1_main

namespace p2_main
theorem Gallian_3
    {G : Type*} [Group G] (a : G) (n k : ℕ)
    (hord : orderOf a = n) :
    orderOf (a ^ k) = n / Nat.gcd n k := by
  sorry
end p2_main

namespace p3_main
theorem Gallian_4
    (n : ℕ) (hn : 3 ≤ n) :
    (∃ H : Subgroup (DihedralGroup n), Nonempty (↥H ≃ Fin 4)) ↔ Even n := by
  sorry
end p3_main

namespace p4_main
theorem Gallian_5
    (n : ℕ) (hn : Even n) :
    ∃ H : Subgroup (DihedralGroup n), Nonempty (↥H ≃ Fin 4) := by
  sorry
end p4_main

namespace p5_main
theorem Gallian_6 :
  ¬ ∃ H : Subgroup (↥(alternatingGroup (Fin 5))),
      Nat.card H = 30 := by
  sorry
end p5_main

namespace p6_main
theorem Gallian_7
  (G : Type*) [Group G]
  (h_nonab : ¬ ∀ a b : G, a * b = b * a) :
  ¬ IsCyclic (MulAut G) := by
  sorry
end p6_main

namespace p7_main
theorem Gallian_8
    (G : Type*) [CommGroup G] :
    Nonempty ({a : G // a ^ (2 : ℕ) = (1 : G)} ≃ ((Equiv.Perm (Fin 3)) →* G)) := by
  sorry
end p7_main

namespace p8_main
theorem Gallian_9
    (R : Type*) [NonUnitalCommSemiring R] [Nontrivial R]
    (h : ∀ {a : R}, a ≠ 0 → ∀ r : R, ∃ s : R, a * s = r) :
    ∃ e : R,
      (∀ x : R, e * x = x ∧ x * e = x) ∧
      (∀ {a : R}, a ≠ 0 → ∃ b : R, a * b = e ∧ b * a = e) := by
  sorry
end p8_main

namespace p9_main
theorem Gallian_10 :
  ∃ (G : Type*) (_ : AddGroup G) (H₁ H₂ H₃ : AddSubgroup G),
    H₁ ≠ ⊤ ∧ H₂ ≠ ⊤ ∧ H₃ ≠ ⊤ ∧
    ((H₁ : Set G) ∪ (H₂ : Set G) ∪ (H₃ : Set G) = Set.univ) := by
  sorry
end p9_main

namespace p10_main
def HasIndexThree {G : Type*} [Group G] [Fintype G] (H : Subgroup G) : Prop :=
  H.index = 3

theorem Gallian_11 :
  ∃ H : Subgroup (Equiv.Perm (Fin 3)),
    HasIndexThree (G := Equiv.Perm (Fin 3)) H ∧ ¬ H.Normal := by
  sorry
end p10_main

namespace p11_main
theorem Gallian_12 :
  ¬ ∃ H : AddSubgroup ℚ, H.FiniteIndex ∧ H ≠ ⊤ := by
  sorry
end p11_main

namespace p12_main
theorem Gallian_13
    (R : Type*) [Ring R] (a : R)
    (h : ∃ n : ℕ, 0 < n ∧ a ^ n = 0) :
    ∃ b : R, (1 - a) * b = 1 ∧ b * (1 - a) = 1 := by
  sorry
end p12_main

namespace p13_main
theorem Gallian_14
    (R : Type*) [CommRing R] [IsDomain R] [Fintype R] :
    ∀ a : R, a ≠ 0 → ∃ b : R, a * b = 1 ∧ b * a = 1 := by
  sorry
end p13_main

namespace p14_main
def nRootSet {G : Type*} [Group G] (n : ℕ) : Set G :=
  { g : G | g ^ n = (1 : G) }

theorem Gallian_15 :
  ∃ (G : Type*) (_ : Group G) (_ : Fintype G) (n : ℕ),
      0 < n ∧ ∀ H : Subgroup G, (H : Set G) ≠ nRootSet (G := G) n := by
  sorry
end p14_main

namespace p15_main
theorem Gallian_16
    {G H : Type*} [Group G] [Group H]
    (f : G →* H) (hf : Function.Surjective f)
    (hG : IsCyclic G) :
    IsCyclic H := by
  sorry
end p15_main

namespace p16_main
theorem Gallian_17 :
  ∃ (G H : Type*) (_ : Group G) (_ : Group H) (f : G →* H),
      Function.Surjective f ∧ IsCyclic H ∧ ¬ IsCyclic G := by
  sorry
end p16_main

namespace p17_main
theorem Gallian_18
    (F : Type*) [Field F] [Fintype F]
    (n : ℕ) (hcard : Fintype.card F = 2 ^ n) :
    CharP F 2 := by
  sorry
end p17_main

namespace p18_main
theorem Gallian_19
    (p : ℕ) [hp : Fact p.Prime] :
    ∃ f g : Polynomial (ZMod p),
      0 < f.natDegree ∧ 0 < g.natDegree ∧
      f * g = ((Polynomial.X : Polynomial (ZMod p)) ^ 4 + (1 : Polynomial (ZMod p))) := by
  sorry
end p18_main

namespace p19_main
theorem Q20
    (R : Type*) [CommRing R] :
    IsNoetherianRing R ↔ ∀ I : Ideal R, I.FG := by
  sorry
end p19_main

namespace p20_main
theorem Q21
    (G : Type*) [Group G] [Fintype G]
    (p q n : ℕ)
    (hp : Nat.Prime p) (hq : Nat.Prime q) (hq_lt_hp : q < p)
    (hcard : Fintype.card G = q * p ^ n) :
    ∃! H : Subgroup G, Subgroup.Normal H ∧ Nonempty (↥H ≃ Fin (p ^ n)) := by
  sorry
end p20_main

namespace p21_main
theorem Q22
  (G : Type*) [Group G] [Fintype G]
  (hG : Fintype.card G = 12) :
  ∃ p : ℕ, Nat.Prime p ∧ ∃ P : Sylow p G, (P : Subgroup G).Normal := by
  sorry
end p21_main

namespace p22_main
theorem Q23
    (z : ℂ) (hz : z ^ 2 = (3 : ℂ)) :
  let I : Ideal (Polynomial ℂ) :=
        Ideal.span ({Polynomial.X - Polynomial.C ((1 : ℂ) - z)} :
          Set (Polynomial ℂ))
  let f : Polynomial ℂ :=
        Polynomial.X ^ 3
        - Polynomial.C (3 : ℂ) * Polynomial.X ^ 2
        + Polynomial.C (2 : ℂ)
  (I.IsMaximal) ∧ (f ∈ I) := by
  sorry
end p22_main

namespace p23_main
theorem Q24
    (R : Type*) [CommRing R] :
    (LocalRing R) ↔ (∀ r s : R, r + s = (1 : R) → IsUnit r ∨ IsUnit s) := by
  sorry
end p23_main

namespace p24_main
theorem Q25 :
  (Ideal.span ({(3 : ℤ)} : Set ℤ)).IsMaximal ∧ (45 : ℤ) ∈ Ideal.span ({(3 : ℤ)} : Set ℤ) := by
  sorry
end p24_main

namespace p25_main
theorem Q26
    {R S : Type*}
    [CommRing R] [CommRing S]
    [LocalRing R]
    [Nontrivial S]
    (f : R →+* S)
    (hf : Function.Surjective f) :
    LocalRing S := by
  sorry
end p25_main

