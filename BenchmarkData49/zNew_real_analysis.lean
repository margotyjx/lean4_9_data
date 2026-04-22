import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p318_main
theorem extra1 :
  let A : Matrix (Fin 2) (Fin 2) ℝ := !![2, 1; 1, 3]
  ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin A)‖ = (5 + Real.sqrt 5) / 2 := by
  sorry
end p318_main

namespace p318_transformed
def A : Matrix (Fin 2) (Fin 2) ℝ :=
  !![2, 1;
    1, 3]
theorem max_yT_A_x :
    sSup {r : ℝ |
      ∃ x y : EuclideanSpace ℝ (Fin 2),
        ‖x‖ = 1 ∧
        ‖y‖ = 1 ∧
        r = ⟪y, A.mulVec x⟫_ℝ} = (5 + Real.sqrt 5) / 2 := by
  sorry
end p318_transformed

namespace p319_main
theorem extra2 :
  let f : ℝ → ℝ := fun x => Real.sqrt (x ^ 2 + 1)
  (⨆ x, ⨆ y, ⨆ (_ : x ≠ y), ‖f x - f y‖ / ‖x - y‖) = 1 := by
  sorry
end p319_main

namespace p319_transformed
noncomputable def f (x : ℝ) : ℝ := Real.sqrt (x^2 + 1)
theorem problem_statement :
    (∀ x y : ℝ, ‖f x - f y‖ ≤ ‖x - y‖) ∧
    (∀ α : ℝ, 0 < α → α < 1 →
      ∃ x₀ y₀ : ℝ, ‖f x₀ - f y₀‖ > α * ‖x₀ - y₀‖) := by
  sorry
end p319_transformed

namespace p320_main
theorem extra3 :
  let S : Set (ℝ × ℝ) := {(0, 0), (2, 0), (0, 1)}
  convexHull ℝ S = {p : ℝ × ℝ | 0 ≤ p.1 ∧ 0 ≤ p.2 ∧ p.1 / 2 + p.2 ≤ 1} := by
  sorry
end p320_main

namespace p320_transformed
def S : Set (ℝ × ℝ) :=
  {p | p = (0, 0) ∨ p = (2, 0) ∨ p = (0, 1)}
theorem convexHull_S :
    convexHull ℝ S =
      {p : ℝ × ℝ | p.1 ≥ 0 ∧ p.2 ≥ 0 ∧ p.1 / 2 + p.2 ≤ 1} := by
  sorry
end p320_transformed

