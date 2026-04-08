import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p26_main
theorem dawkins_2_4_1c
  (f g h : ℝ → ℝ)
  (hf : Filter.Tendsto f (𝓝 8) (𝓝 (-3)))
  (hg : Filter.Tendsto g (𝓝 8) (𝓝 5))
  (hh : Filter.Tendsto h (𝓝 8) (𝓝 2)) :
  Filter.Tendsto (fun x => g x * h x - f x) (𝓝 8) (𝓝 13) := by
  sorry
end p26_main

namespace p27_main
theorem dawkins_2_7_3c :
  Filter.Tendsto (fun x : ℝ => (4 - 5 * x^2) / (6 * x^2 + 2 * x)) atTop (𝓝 (-5 / 6 : ℝ)) := by
  sorry
end p27_main

namespace p28_main
theorem dawkins_3_4_4:
  deriv (λ x : ℝ => 6 * x^2 / (4 - x)) = (λ x => (48 * x - 6 * x^2) / (4 - x)^2) := by
sorry
end p28_main

namespace p29_main
theorem dawkins_3_4_3:
  deriv (λ x : ℝ => (1 + 2*x + 3*x^2) * (5*x + 8*x^2 - x^3)) =
  λ x => 5 + 36*x + 90*x^2 + 88*x^3 - 15*x^4 := by
sorry
end p29_main

namespace p30_main
theorem dawkins_3_5_9:
  deriv (λ x : ℝ => (1 + 2*x + 3*x^2) * (5*x + 8*x^2 - x^3)) =
  λ x => 5 + 36*x + 90*x^2 + 88*x^3 - 15*x^4 := by
sorry
end p30_main

namespace p31_main
theorem dawkins_3_7_1 :
  deriv (fun x : ℝ => 2 * Real.sin x + 5 * Real.arccos x) =
    (fun x : ℝ => 2 * Real.cos x - 5 / Real.sqrt (1 - x^2)) := by
  sorry
end p31_main

namespace p32_main
theorem dawkins_3_9_18 :
  deriv (fun x : ℝ => x^3 * Real.log (x ^ 5)) =
    fun x => 3 * x ^ 2 * Real.log (x ^ 5) + 5 * x ^ 2 := by
  sorry
end p32_main

namespace p33_main
theorem dawkins_4_10_c :
  Filter.Tendsto (fun x : ℝ => Real.exp x / x^5) atTop atTop := by
  sorry
end p33_main

namespace p34_main
theorem dawkins_4_9_3 :
  { p : ℝ × ℝ | p.2 = p.1^2 + 1 ∧
      ∀ q : ℝ × ℝ, q.2 = q.1^2 + 1 → dist q (0, 2) ≥ dist p (0, 2) } =
    { (1 / Real.sqrt 2, 3 / 2), (-1 / Real.sqrt 2, 3 / 2) } := by
  sorry
end p34_main

namespace p35_main
theorem dawkins_5_2_6
  (C : ℝ) :
  ∀ x : ℝ,
  ∫ t : ℝ, t^(1/3) + 10 * t^(3/5) = (3/4) * x^(4/3) + (25/4) * x^(8/5) + C := by
sorry
end p35_main

namespace p36_main
theorem dawkins_5_3_8
  (C : ℝ) :
  ∀ x : ℝ,
  ∫ t : ℝ, (5 * t - 3 * t^5) * exp (t^6 - 5 * t^2) = -1/2 * exp (x^6 - 5 * x^2) + C := by
sorry
end p36_main

namespace p37_main
theorem strang_7_1_13
  (C : ℝ) :
  ∀ x : ℝ,
  ∫ t : ℝ, sin (log t) = x / 2 * (sin (log x) - cos (log x)) + C := by
sorry
end p37_main

namespace p38_main
theorem strang_7_1_32 :
  ∫ x in (0 : ℝ)..(3 : ℝ), Real.log (x^2 + 1) =
    3 * Real.log 10 - 6 + 2 * Real.arctan 3 := by
  sorry
end p38_main

namespace p39_main
theorem strang_7_2_25
  (C : ℝ) :
  ∀ x : ℝ,
  ∫ t : ℝ, cos t * sin (2 * t) = - (2 / 3) * (cos x) ^ 3 + C := by
sorry
end p39_main

namespace p40_main
theorem strang_7_2_34
  (a : ℕ → ℝ)
  (h : ∀ x ∈ Set.Icc 0 Real.pi, ∑' n, a n * Real.sin (n * x) = 1) :
  a 3 = 4 / (3 * Real.pi) := by
  sorry
end p40_main

namespace p41_main
theorem strang_7_3_28 :
  ∫ x in (1 : ℝ)..(4 : ℝ), (1 / Real.sqrt (x^2 - 1)) =
    Real.log (4 + Real.sqrt 15) := by
  sorry
end p41_main

namespace p42_main
theorem strang_7_3_33
  (C : ℝ) {n : ℕ} (hn : n ≠ 0) :
  ∀ x : ℝ,
  (∫ t : ℝ, t^(n+1) / (t^2 + 1)) = x^n / n - (∫ t : ℝ, t^(n-1) / (t^2 + 1)) + C := by
sorry
end p42_main

namespace p43_main
theorem strang_7_5_7 :
  Filter.Tendsto (fun a => ∫ x in a..1, Real.log x / x) (𝓝[>] 0) Filter.atBot := by
  sorry
end p43_main

namespace p44_main
theorem strang_9_3_26 :
  let sec := fun x : ℝ => 1 / Real.cos x
  ∫ θ in (0 : ℝ)..(Real.pi / 4 : ℝ),
      Real.sqrt ((sec θ)^2 + (deriv (fun θ : ℝ => sec θ) θ)^2) = 1 := by
  sorry
end p44_main

namespace p45_main
theorem strang_9_4_30
 (θ : ℝ) :
  Real.cos θ = (Complex.exp (Complex.I * θ) + Complex.exp (-Complex.I * θ)) / 2 := by
sorry
end p45_main

namespace p46_main
theorem strang_9_4_34
  (x : ℝ) :
  Complex.cos (Complex.I * x) = (Real.cosh x : ℂ) ∧
    Complex.sin (Complex.I * x) = Complex.I * (Real.sinh x : ℂ) := by
sorry
end p46_main

namespace p47_main
theorem strang_13_1_30
  {x₁ y₁ x₂ y₂ : ℝ}
  (h₁ : x₁ * y₁ = 1) (h₂ : x₂ * y₂ = 1) :
  ((x₁ + x₂) / 2) * ((y₁ + y₂) / 2) ≥ 1 := by
sorry
end p47_main

namespace p48_main
theorem strang_13_2_8
  (x y : ℝ) :
  (HasDerivAt (λ x0 => Real.log (x0 + 2 * y)) (1 / (x + 2 * y)) x) ∧
  (HasDerivAt (λ y0 => Real.log (x + 2 * y0)) (2 / (x + 2 * y)) y) := by
sorry
end p48_main

namespace p49_main
theorem strang_13_3_13
  {x y z : ℝ} :
  6 * (x - 4) + 12 * (y - 2) + 8 * (z - 3) = 0 ↔
  (x * 2 * 3 + 4 * y * 3 + 4 * 2 * z = 24 + 24) := by
sorry
end p49_main

namespace p50_main
theorem strang_13_5_11
 (f : ℂ → ℂ)
  (hf : ∀ z : ℂ, DifferentiableAt ℂ f z) :
  ∀ x y : ℝ,
    let u := fun (x y : ℝ) ↦ f (x + y * Complex.I)
    let D := iteratedFDeriv ℝ 2 (Function.uncurry u) (x, y)
    D ![0, 0] + D ![1, 1] = 0 := by
  sorry
end p50_main

namespace p51_main
theorem strang_14_2_31 :
  ∫ p in {p : ℝ × ℝ | p.1 ^ 2 + p.2 ^ 2 ≤ 1}, p.1 ^ 2 + p.2 ^ 2 = Real.pi / 2 := by
  sorry
end p51_main

