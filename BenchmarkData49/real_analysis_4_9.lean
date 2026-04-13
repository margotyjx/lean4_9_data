import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p266_main
theorem real_analysis_1 {f : ℝ → ℝ}
    (hf : Differentiable ℝ f)
    (h : ∀ x, deriv f x = 0) :
  ∃ c : ℝ, ∀ x, f x = c := by
  sorry
end p266_main

namespace p267_main
theorem real_analysis_2 {s : Set ℝ}
    (hs : IsCompact s) :
  IsClosed s ∧ ∃ b : ℝ, ∀ x ∈ s, |x| ≤ b := by
  sorry
end p267_main

namespace p268_main
theorem real_analysis_3 {x : ℕ → ℝ} {c : ℝ}
    (h : ∀ n, |x n| ≤ c) :
    ∃ phi : ℕ → ℕ,
      StrictMono phi ∧
      ∃ l : ℝ, ∀ ε > 0, ∃ N, ∀ n > N, |x (phi n) - l| < ε := by
  sorry
end p268_main

namespace p269_main
theorem real_analysis_4 (f : ℝ → ℝ)
    (h : ContinuousOn f (Set.Icc (-Real.pi) Real.pi)) :
  ∃ C : ℝ, ∀ x ∈ Set.Icc (-Real.pi) Real.pi, |f x| ≤ C := by
  sorry
end p269_main

namespace p270_main
theorem real_analysis_5 {x : ℕ → ℝ} {c : ℝ}
    (h_bound : ∀ n, x n ≤ c)
    (h_mono : ∀ n, x n ≤ x (n + 1)) :
  ∃ l, ∀ ε > 0, ∃ N, ∀ n > N, |x n - l| < ε := by
  sorry
end p270_main

namespace p271_main
theorem real_analysis_6 :
  ∃ f : ℝ → ℝ,
    Continuous f ∧
    (∀ x, f x ∈ Set.Icc (0 : ℝ) 1) ∧
    (∀ x ∈ Set.Icc (0 : ℝ) 1, f x = 0) ∧
    (∀ x ∈ Set.Icc (2 : ℝ) 3, f x = 1) := by
  sorry
end p271_main

namespace p272_main
theorem real_analysis_7 {X : Type*} [MetricSpace X] [CompleteSpace X]
  {U : ℕ → Set X}
  (hU_open : ∀ n, IsOpen (U n))
  (hU_dense : ∀ n, Dense (U n)) :
  Dense (⋂ n, U n) := by
  sorry
end p272_main

namespace p273_main
theorem real_analysis_8 :
  ∀ ε : ℝ, ε > 0 →
    ∃ p : Polynomial ℝ, ∀ x ∈ Set.Icc (-1 : ℝ) 1, abs (Polynomial.eval x p - abs x) < ε := by
  sorry
end p273_main

namespace p274_main
theorem real_analysis_9
    (f : ℕ → ℝ → ℝ)
    (hBound : ∃ M : ℝ, ∀ n x, x ∈ Set.Icc (0 : ℝ) 1 → |f n x| ≤ M)
    (hEquicont :
      ∀ ε > 0, ∃ δ > 0, ∀ n x y,
        x ∈ Set.Icc (0 : ℝ) 1 → y ∈ Set.Icc (0 : ℝ) 1 →
        |x - y| < δ → |f n x - f n y| < ε) :
  ∃ phi : ℕ → ℕ, StrictMono phi ∧
    ∃ g : ℝ → ℝ,
      ContinuousOn g (Set.Icc (0 : ℝ) 1) ∧
      (∀ ε > 0, ∃ N, ∀ n ≥ N, ∀ x ∈ Set.Icc (0 : ℝ) 1, |f (phi n) x - g x| < ε) := by
  sorry
end p274_main

namespace p275_main
theorem real_analysis_10
    (f : ℝ → ℝ)
    (hf : BoundedVariationOn f (Set.Icc (0 : ℝ) 2)) :
  ∃ g h : ℝ → ℝ,
    MonotoneOn g (Set.Icc (0 : ℝ) 2) ∧
    MonotoneOn h (Set.Icc (0 : ℝ) 2) ∧
    ∀ x ∈ Set.Icc (0 : ℝ) 2, f x = g x - h x := by
  sorry
end p275_main

namespace p276_main
theorem real_analysis_11 {a : ℕ → ℝ}
  (h_nonneg : ∀ n, 0 ≤ a n)
  (h_sum : Summable a) :
  Summable (fun n => (a n)^2) := by
  sorry
end p276_main

namespace p277_main
theorem real_analysis_12
  {α : Type*} [MeasurableSpace α] (μ : MeasureTheory.Measure α) [MeasureTheory.SigmaFinite μ]
  {p q : ENNReal}
  [Fact (1 ≤ p)] [Fact (1 ≤ q)]
  (hp1 : 1 < p.toReal) (hp2 : p ≠ ⊤) (hp3 : 1 < p)
  (hq1 : 1 < q.toReal) (hq2 : q ≠ ⊤)
  (hconj : 1 / p.toReal + 1 / q.toReal = 1) :
  ∃ Phi : (MeasureTheory.Lp ℝ q μ) → ((MeasureTheory.Lp ℝ p μ) → ℝ), True := by
  sorry
end p277_main

namespace p278_main
theorem real_analysis_13 :
  ∃ μ : MeasureTheory.Measure ℝ, ∀ f : ℝ → ℝ,
    ContinuousOn f (Set.Icc (0 : ℝ) 1) →
    (∫ x in Set.Icc (0 : ℝ) 1, f x) = ∫ x, f x ∂μ := by
  sorry
end p278_main

namespace p279_main
theorem real_analysis_14
  (μ : MeasureTheory.Measure ℝ)
  (f_seq : ℕ → ℝ → ℝ) (f : ℝ → ℝ)
  (hUI : MeasureTheory.UnifIntegrable f_seq (1 : ENNReal) (μ.restrict (Set.Icc (0 : ℝ) 1)))
  (h_ae : ∀ᵐ x ∂(μ.restrict (Set.Icc (0 : ℝ) 1)),
            ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, |f_seq n x - f x| < ε) :
  MeasureTheory.IntegrableOn f (Set.Icc (0 : ℝ) 1) μ := by
  sorry
end p279_main

namespace p280_main
theorem real_analysis_15
  (μ : MeasureTheory.Measure ℝ) :
  ∃ T : ℕ → (MeasureTheory.Lp ℝ (2 : ENNReal) μ →L[ℝ] MeasureTheory.Lp ℝ (2 : ENNReal) μ),
    (∀ n : ℕ, ∀ f : MeasureTheory.Lp ℝ (2 : ENNReal) μ, ∀ᵐ x ∂μ,
       (T n f) x = (1 + Real.sin ((n : ℝ) * x) / (n : ℝ)) * f x) ∧
    (∃ M : ℝ, ∀ n : ℕ, ∀ f : MeasureTheory.Lp ℝ (2 : ENNReal) μ, ‖T n f‖ ≤ M * ‖f‖) := by
  sorry
end p280_main

namespace p281_main
theorem real_analysis_16 :
  ∃ f : ℝ → ℝ,
    (∀ ⦃u v : ℝ⦄, u ≠ v → |f u - f v| < |u - v|) ∧
    ¬ ∃ x : ℝ, f x = x := by
  sorry
end p281_main

namespace p282_main
theorem real_analysis_17
  {X : Type*} [MetricSpace X] [CompactSpace X] [Nonempty X]
  (f : X → X)
  (h : ∀ u v : X, u ≠ v → dist (f u) (f v) < dist u v) :
  ∃ x : X, f x = x := by
  sorry
end p282_main

namespace p283_main
theorem real_analysis_18
    (f : ℝ → ℝ)
    (hcont : ContinuousOn f (Set.Icc (0 : ℝ) 1))
    (h0 : f 0 < 0) (h1 : 0 < f 1) :
    ∃ c : ℝ, c ∈ Set.Ioo (0 : ℝ) 1 ∧ f c = 0 := by
  sorry
end p283_main

namespace p284_main
theorem real_analysis_19 :
  (∀ (X : Type*) (_ : MetricSpace X), CompleteSpace X →
    ∀ (u : ℕ → X), CauchySeq u →
      ∃ x : X, ∀ ε > 0, ∃ N : ℕ, ∀ n ≥ N, dist (u n) x < ε) := by
  sorry
end p284_main

namespace p285_main
theorem real_analysis_20 :
    ∃ (f : ℕ → ℝ → ℝ) (g : ℝ → ℝ),
      (∀ n, Continuous (f n)) ∧
      (∀ x, Filter.Tendsto (fun n ↦ f n x) Filter.atTop (nhds (g x))) ∧
      ¬ Continuous g := by
  sorry
end p285_main

namespace p286_main
theorem real_analysis_21
  {𝕜 X Y : Type*}
  [NormedField 𝕜]
  [NormedAddCommGroup X] [NormedSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [NormedSpace 𝕜 Y]
  (Tn : ℕ → X →L[𝕜] Y) (T : X → Y)
  (hconv : ∀ x : X, Filter.Tendsto (fun n => Tn n x) Filter.atTop (nhds (T x)))
  : ∃ S : X →L[𝕜] Y, ∀ x, S x = T x := by
  sorry
end p286_main

namespace p287_main
theorem real_analysis_22 :
  ∃ (f : Set.Icc (0 : ℝ) 1 → ℝ),
    (∀ u v : Set.Icc (0 : ℝ) 1, u ≠ v → ‖f u - f v‖ < ‖(u : ℝ) - v‖) ∧
    (∀ x : Set.Icc (0 : ℝ) 1, f x ≠ (x : ℝ)) := by
  sorry
end p287_main

namespace p288_main
theorem real_analysis_23 :
  ∃ f : ℝ → ℝ,
    (∀ u v : ℝ, u ≠ v → |f u - f v| < |u - v|) ∧
    ¬ (∃ c : ℝ, c < 1 ∧ ∀ u v : ℝ, u ≠ v → |f u - f v| < c * |u - v|) := by
  sorry
end p288_main

namespace p289_main
theorem real_analysis_24 :
  ∃ x : ℕ → ℝ,
    (∀ n, 1 ≤ n → |x (n + 1) - x n| < 1 / (2 * Real.sqrt n)) ∧
    ¬ CauchySeq x := by
  sorry
end p289_main

namespace p290_main
theorem real_analysis_25
    (a b : ℝ) (h : a < b) :
    ¬ Nonempty
      (((MeasureTheory.Lp ℝ (⊤ : ENNReal)
           (MeasureTheory.volume.restrict (Set.Icc a b)))
          →L[ℝ] ℝ)
        ≃ₗᵢ[ℝ]
        (MeasureTheory.Lp ℝ (1 : ENNReal)
           (MeasureTheory.volume.restrict (Set.Icc a b)))) := by
  sorry
end p290_main

