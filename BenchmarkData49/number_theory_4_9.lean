import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p218_main
theorem question_1 (n : ℕ) :
  Nonempty (Group (Units (ZMod n))) := by
  sorry
end p218_main

namespace p219_main
theorem question_2 (p : ℕ) (hp : 0 < p)
    (h1 : Nat.Prime p) (h2 : Nat.Prime (p^2 + 2)) :
    p = 3 := by
  sorry
end p219_main

namespace p220_main
theorem question_3 :
  3^45 % 100 = 43 := by
  sorry
end p220_main

namespace p221_main
def torsionSubgroup (G : Type*) [AddCommGroup G] : AddSubgroup G :=
{ carrier := { g : G | ∃ n : ℕ, n ≠ 0 ∧ n • g = 0 }
  zero_mem' := by
    refine ⟨1, by decide, ?_⟩
    simp
  add_mem' := by
    intro x y hx hy
    rcases hx with ⟨m, hm, hx⟩
    rcases hy with ⟨n, hn, hy⟩
    refine ⟨m * n, Nat.mul_ne_zero hm hn, ?_⟩
    have hx0 : (m * n) • x = 0 := by
      have : (m * n) • x = n • (m • x) := by
        simpa [Nat.mul_comm] using (smul_smul n m x).symm
      simp [this, hx]
    have hy0 : (m * n) • y = 0 := by
      have : (m * n) • y = m • (n • y) := by
        simpa using (smul_smul m n y).symm
      simp [this, hy]
    simp [nsmul_add, hx0, hy0]
  neg_mem' := by
    intro x hx
    rcases hx with ⟨n, hn, hx⟩
    refine ⟨n, hn, ?_⟩
    simp [nsmul_neg, hx] }

theorem question_4
  (G : Type*) [AddCommGroup G] [Module.Finite ℤ G] :
  Finite (torsionSubgroup G) := by
  sorry
end p221_main

namespace p222_main
abbrev PadicAlgCl (p : ℕ) [Fact p.Prime] : Type :=
  AlgebraicClosure (ℚ_[p])
noncomputable def zetaSeriesSeq
    (p : ℕ) [Fact p.Prime]
    (ζ : ℕ → PadicAlgCl p) : ℕ → PadicAlgCl p :=
  fun N =>
    ∑ n ∈ (Finset.range (N + 1)).filter (fun n => n ≠ 0 ∧ Nat.Coprime n p),
      ζ n * (algebraMap (ℚ_[p]) (PadicAlgCl p) (p : ℚ_[p])) ^ n
theorem question_5
    (p : ℕ) [Fact p.Prime]
    (ζ : ℕ → PadicAlgCl p)
    (hζ : ∀ n : ℕ, n ≠ 0 → Nat.Coprime n p → IsPrimitiveRoot (ζ n) n)
    [TopologicalSpace (PadicAlgCl p)] [UniformSpace (PadicAlgCl p)] :
    CauchySeq (zetaSeriesSeq (p := p) ζ) ∧
      ¬ ∃ x : PadicAlgCl p,
        Filter.Tendsto (zetaSeriesSeq (p := p) ζ) Filter.atTop (𝓝 x) := by
  sorry
end p222_main

namespace p223_main
theorem question_6 (n : ℕ) (hn : 0 < n) :
  (n : ℕ) < 3^n := by
  sorry
end p223_main

namespace p224_main
theorem question_7 (p t : ℕ) (hp : Nat.Prime p) (ht : 0 < t) :
  Nat.totient (p^t) = p^t - p^(t-1) := by
  sorry
end p224_main

namespace p225_main
theorem question_8
  (k : Type) [Field k]
  (abs : k → ℝ)
  (h_abs : IsAbsoluteValue abs) :
  (∀ x y : k, abs (x + y) ≤ max (abs x) (abs y))
    ↔
  (∀ n : ℕ, 0 < n → abs (Nat.cast n : k) ≤ 1) := by
  sorry
end p225_main

namespace p226_main
theorem question_9 (n : ℕ) (hn : 0 < n) :
  ∃ a b c d : ℕ, a^2 + b^2 + c^2 + d^2 = n := by
  sorry
end p226_main

namespace p227_main
theorem question_10 :
  ¬ ∃ x y : ℤ, x^2 - 15 * y^2 = 3 := by
  sorry
end p227_main

