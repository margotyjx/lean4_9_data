import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace BenchmarkData49
namespace complex_analysis_4_9

namespace p75_main
theorem question_1 :
    (∮ z in C((5 : ℂ), (5 : ℝ)),
        (1 : ℂ) / (z^2 - 1) : ℂ)
      = (Real.pi : ℂ) * Complex.I := by
  sorry
end p75_main

namespace p76_main
theorem question_2
    (D : Set ℂ) (f : ℂ → ℂ)
    (hDopen : IsOpen D)
    (hDconn : IsConnected D)
    (h_analytic : AnalyticOn ℂ f D)
    (h_nonzero : ∀ z ∈ D, f z ≠ 0)
    (h_const : ∀ ⦃z w⦄, z ∈ D → w ∈ D → f z = f w) :
    ¬ ∃ z0 ∈ D, ∀ z ∈ D, ‖f z0‖ ≤ ‖f z‖ := by
  sorry
end p76_main

namespace p77_main
theorem question_3 :
    ∃ f : ℂ → ℂ,
      TendstoUniformlyOn
        (fun n (z : ℂ) => ∑ j in Finset.Icc 1 n, (1 / z)^j)
        f
        atTop
        { z : ℂ | 5 ≤ ‖z‖ } := by
  admit
end p77_main

namespace p78_main
theorem question_4
    (p : Polynomial ℂ) (n : ℕ)
    (hdeg : p.degree = n)
    (hlead : p.leadingCoeff ≠ 0) :
    ∃ R > 0,
      (∮ z in C(0, R),
        (p.derivative.eval z) / (p.eval z)) =
        (2 * (n : ℂ)) * (Real.pi : ℂ) * Complex.I := by
  sorry
end p78_main

namespace p79_main
theorem question_5 :
    Nat.card { z : ℂ | ‖z‖ < 1 ∧ z^6 + 4 * z^2 - 1 = 0 } = 2 := by
  sorry
end p79_main

namespace p80_main
theorem question_6
    (p : Polynomial ℂ) (n : ℕ)
    (hp : p.natDegree = n) :
    Multiset.card p.roots = n := by
  admit
end p80_main

namespace p81_main
theorem question_7
    (n : ℤ) (hn : n ≠ (-1 : ℤ))
    (Γ : ℝ → ℂ)
    (hΓ_closed : Γ 0 = Γ 1)
    (hΓ_away  : ∀ t : ℝ, Γ t ≠ 0) :
    (∫ t in (0 : ℝ)..1, (Γ t) ^ (n : ℤ) * deriv Γ t) = 0 := by
  sorry
end p81_main

namespace p82_main
theorem question_8
    (f : ℂ → ℂ) :
    (∃ a b : ℂ, ∀ z : ℂ, f z ∈ Set.compl (segment ℝ a b)) →
    (∃ c : ℂ, ∀ z : ℂ, f z = c) := by
  sorry
end p82_main

namespace p83_main
theorem question_9
    (P : Polynomial ℂ)
    (hP : P.natDegree ≠ 0) :
    Function.Surjective (fun z : ℂ => P.eval z) := by
  sorry
end p83_main

namespace p84_main
theorem question_10
    (U : Set ℂ) (p : ℂ) (f : ℂ → ℂ)
    (hU : IsOpen U) (hp : p ∈ U)
    (hhol : DifferentiableOn ℂ f (U \ {p})) :
    ∀ (r : ℝ), 0 < r → Metric.ball p r ⊆ U →
      ∀ (a b : ℂ),
        (Set.image f (Metric.ball p r \ {p})) ∩ (segment ℝ a b) ≠ ∅ := by
  sorry
end p84_main

namespace p85_main
theorem question_11 :
  integralOverSquareBoundary = (4 : ℂ) * (Real.exp Real.pi - 1) := by
  sorry
end p85_main

namespace p86_main
noncomputable
def g (γ : ℝ → ℂ) (z : ℂ) : ℂ :=
  ∫ s in (0 : ℝ)..1,
      ((γ s)^3 + 2 * γ s) / (γ s - z)^3 * deriv γ s

theorem question_12
    (γ : ℝ → ℂ)
    (hγ_closed : γ 0 = γ 1)
    (Inside Outside : (ℝ → ℂ) → ℂ → Prop)
    (z : ℂ) :
    (Inside γ z → g γ z = 6 * Real.pi * Complex.I * z) ∧
    (Outside γ z → g γ z = 0) := by
  sorry
end p86_main

namespace p87_main
theorem question_13
    (residueAt : (ℂ → ℂ) → ℂ → ℂ) :
    residueAt
      (fun z : ℂ => Complex.sinh z / (z ^ 4 * (1 - z ^ 2)))
      0
      = (7 : ℂ) / 6 := by
  sorry
end p87_main

namespace p88_main
theorem question_14 :
  ∀ z : ℂ,
    (z + 1) / (z^2 + 9)
      =
    ((3 : ℂ) + Complex.I) / 6 / (z - 3 * Complex.I)
      +
    ((3 : ℂ) - Complex.I) / 6 / (z + 3 * Complex.I) := by
  sorry
end p88_main

namespace p89_main
theorem question_15 :
  ∀ z : ℂ,
    Complex.exp z / (z^2 + (Real.pi : ℂ)^2)
      =
    ((Complex.I : ℂ) / (2 * (Real.pi : ℂ))) / (z - Complex.I * (Real.pi : ℂ))
      +
    (-(Complex.I : ℂ) / (2 * (Real.pi : ℂ))) / (z + Complex.I * (Real.pi : ℂ)) := by
  sorry
end p89_main

end complex_analysis_4_9
end BenchmarkData49
