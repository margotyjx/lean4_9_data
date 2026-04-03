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
namespace functional_analysis_4_9

namespace p121_main
def lpSpace (p : ℝ) : Type :=
  { a : ℕ → ℂ // Summable (fun j ↦ ‖a j‖ ^ p) }

noncomputable def lpNorm (p : ℝ) (a : lpSpace p) : ℝ :=
  (∑' j, ‖a.1 j‖ ^ p) ^ (1 / p)

theorem melrose_sp2009_1
    (p : ℝ) (hp : 1 < p) :
    ∃ (G₁ : NormedAddCommGroup (lpSpace p))
      (G₂ : NormedSpace ℝ (lpSpace p)), True := by
  sorry
end p121_main

namespace p122_main
theorem melrose_sp2009_2
  (E : Type*) [NormedAddCommGroup E] :
  Continuous (fun x : E => ‖x‖) := by
  sorry
end p122_main

namespace p123_main
theorem melrose_sp2009_3
  (f : ℝ → ℂ) (hf : MeasureTheory.Integrable f volume)
  (f_L : ℝ → ℝ → ℂ)
  (h_def : ∀ (L x : ℝ), f_L L x = if |x| ≤ L then f x else 0) :
  (∀ L > 0, MeasureTheory.Integrable (f_L L) volume) ∧
  Filter.Tendsto (fun L => ∫ x, ‖f_L L x - f x‖ ∂volume) Filter.atTop (𝓝 0) := by
  sorry
end p123_main

namespace p124_main
theorem melrose_sp2009_4
  (f : ℝ → ℝ)
  (L N : ℝ) (hL : 0 < L) (hN : 0 < N)
  (h_int : MeasureTheory.Integrable
    (fun x => if |x| ≤ L then f x else 0) volume) :
  MeasureTheory.Integrable
    (fun x =>
      let gL := if |x| ≤ L then f x else 0
      if gL ≤ N ∧ gL ≥ -N then gL else if gL > N then N else -N)
    volume := by
  sorry
end p124_main

namespace p125_main
theorem melrose_sp2009_5
  (f : ℝ → ℝ)
  (h_loc :
    ∀ x : ℝ,
      ∃ (ε : ℝ), 0 < ε ∧ MeasureTheory.IntegrableOn f (Metric.ball x ε) volume)
  (h_sq_int : MeasureTheory.Integrable (fun x : ℝ ↦ (f x)^2) volume) :
  (let
      gL (L x : ℝ) : ℝ :=
        if |x| ≤ L then f x else 0
    let
      gL_N (L N x : ℝ) : ℝ :=
        if gL L x ≤ -N then -N
        else if gL L x ≥ N then N
        else gL L x
    (∀ L > 0, MeasureTheory.Integrable (fun x ↦ (gL L x)^2) volume) ∧
    (∀ L > 0,
        Filter.Tendsto (fun N ↦ ∫ x, |(gL_N L N x)^2 - (gL L x)^2| ∂volume)
          Filter.atTop (𝓝 0)) ∧
    Filter.Tendsto (fun L ↦ ∫ x, |(gL L x)^2 - (f x)^2| ∂volume)
      Filter.atTop (𝓝 0)) := by
  sorry
end p125_main

namespace p126_main
def in_h21 (c : ℕ → ℂ) : Prop :=
  Summable (fun j : ℕ => (1 + (j : ℝ)^2) * ‖c j‖^2)

noncomputable def inner21 (c d : ℕ → ℂ) : ℂ :=
  ∑' j : ℕ, (1 + (j : ℝ)^2) * c j * star (d j)

noncomputable def norm21 (c : ℕ → ℂ) : ℝ :=
  Real.sqrt (∑' j : ℕ, (1 + (j : ℝ)^2) * ‖c j‖^2)

theorem melrose_sp2009_6 :
  (∀ c d : ℕ → ℂ,
      in_h21 c → in_h21 d →
      Summable (fun j : ℕ =>
        (1 + (j : ℝ)^2) * c j * star (d j)) ∧
      inner21 c d = star (inner21 d c) ∧
      0 ≤ Complex.re (inner21 c c) ∧
      (inner21 c c = 0 → c = 0)) ∧
  (∀ u : ℕ → (ℕ → ℂ),
      (∀ n, in_h21 (u n)) →
      (∀ ε > 0, ∃ N : ℕ, ∀ m n, m ≥ N → n ≥ N →
        norm21 (u m - u n) < ε) →
      ∃ l : ℕ → ℂ, in_h21 l ∧
        ∀ ε > 0, ∃ N : ℕ, ∀ n, n ≥ N →
          norm21 (u n - l) < ε) := by
  sorry
end p126_main

namespace p127_main
theorem melrose_sp2009_7
  (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] [TopologicalSpace.SeparableSpace H]
  (h_inf : ¬FiniteDimensional ℂ H) :
  ∃ (T : H ≃ₗᵢ[ℂ] H × H), ∀ u : H, ‖u‖ = ‖T u‖ := by
  sorry
end p127_main

namespace p128_main
theorem melrose_sp2009_8
  (H : Type*)
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] [TopologicalSpace.SeparableSpace H]
  (u : ℕ → H)
  (hconverge : ∀ v : H, CauchySeq (fun n : ℕ => (⟪u n, v⟫_ℂ : ℂ))) :
  ∃ C : ℝ, ∀ n : ℕ, ‖u n‖ ≤ C := by
  sorry
end p128_main

namespace p129_main
theorem melrose_sp2009_9
  (H : Type*)
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H] [TopologicalSpace.SeparableSpace H]
  (u : ℕ → H)
  (hCauchy : ∀ v : H, CauchySeq (fun n : ℕ => (⟪u n, v⟫_ℂ : ℂ))) :
  ∃ u_lim : H, ∀ v : H,
    Filter.Tendsto (fun n : ℕ => (⟪u n, v⟫_ℂ : ℂ)) Filter.atTop (𝓝 (⟪u_lim, v⟫_ℂ : ℂ)) := by
  sorry
end p129_main

namespace p130_main
theorem melrose_sp2009_10
  (H : Type*) [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [CompleteSpace H] [TopologicalSpace.SeparableSpace H]
  (u : ℕ → H)
  (e : ℕ → H)
  (h_orthonormal : Orthonormal ℂ e)
  (h_dense : Dense (Submodule.span ℂ (Set.range e) : Set H))
  (h_bdd : ∃ C : ℝ, ∀ n, ‖u n‖ ≤ C)
  (h_converge : ∀ j : ℕ, ∃ c : ℂ,
      Filter.Tendsto (fun n : ℕ => (⟪u n, e j⟫_ℂ : ℂ)) Filter.atTop (𝓝 c)) :
  ∀ v : H, CauchySeq (fun n : ℕ => (⟪u n, v⟫_ℂ : ℂ)) := by
  sorry
end p130_main

namespace p131_main
def mem_h2 (c : ℕ → ℂ) : Prop :=
  Summable (fun j : ℕ ↦ ((↑j + 1 : ℝ)^4) * ‖c j‖^2)

def mem_hNeg2 (d : ℕ → ℂ) : Prop :=
  Summable (fun j : ℕ ↦ ((↑j + 1 : ℝ)^(-4 : ℝ)) * ‖d j‖^2)

noncomputable def h2Norm (c : ℕ → ℂ) : ℝ :=
  Real.sqrt (∑' j : ℕ, ((↑j + 1 : ℝ)^4) * ‖c j‖^2)

theorem melrose_sp2009_11
  (T : (ℕ → ℂ) → ℂ)
  (h_add : ∀ c₁ c₂, T (c₁ + c₂) = T c₁ + T c₂)
  (h_smul : ∀ (α : ℂ) c, T (α • c) = α * T c)
  (h_bdd : ∃ C : ℝ, 0 ≤ C ∧
    ∀ c, mem_h2 c → ‖T c‖ ≤ C * h2Norm c) :
  ∃ d : ℕ → ℂ, mem_hNeg2 d ∧
    ∀ c, mem_h2 c → T c = ∑' j : ℕ, c j * d j := by
  sorry
end p131_main

namespace p132_main
theorem bollobas_2_12
  {X : Type*} [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X]
  (Y : Submodule ℝ X) (hY : IsClosed (Y : Set X)) (x : X) :
    ∃ y : Y, dist x (y : X) = Metric.infDist x (Y : Set X) := by
  sorry
end p132_main

namespace p133_main
theorem bollobas_3_13
  {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (A : Set X) (f₀ : {x : X // x ∈ A} → ℝ) :
  (∃ f : X →L[ℝ] ℝ, ‖f‖ ≤ 1 ∧ ∀ a : {x : X // x ∈ A}, f a = f₀ a) ↔
  ∀ (F : Finset {x : X // x ∈ A}) (l : {x : X // x ∈ A} → ℝ),
    (∀ a ∉ F, l a = 0) →
    |∑ a in F, l a * f₀ a| ≤ ‖∑ a in F, l a • (a : X)‖ := by
  sorry
end p133_main

namespace p134_main
theorem bollobas_3_14
  {X : Type*} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (Y : Submodule ℝ X) (x : X) :
  (Metric.infDist x (Y : Set X) ≥ 1) ↔
    ∃ (f : X →L[ℝ] ℝ),
      ‖f‖ ≤ 1 ∧
      f x = 1 ∧
      ∀ ⦃y : X⦄, y ∈ Y → f y = 0 := by
  sorry
end p134_main

namespace p135_main
theorem bollobas_5_15
    (f : ℝ → ℝ)
    (hf : ContDiff ℝ ⊤ f)
    (hvanish : ∀ x : ℝ, ∃ k : ℕ, ∀ n ≥ k, iteratedDeriv n f x = 0) :
    ∃ p : Polynomial ℝ, ∀ x, f x = p.eval x := by
  sorry
end p135_main

namespace p136_main
theorem bollobas_5_16
  (K : Set ℝ) (hK : K = Set.Icc 0 1)
    (F : ℕ → Set (ContinuousMap (Set.Icc 0 1) ℝ))
    (hF : ∀ n : ℕ,
    F n = { f | ∃ (t : ℝ) (ht : t ∈ Set.Icc 0 1),
      ∀ (h : ℝ) (hth : t + h ∈ Set.Icc 0 1),
        ‖(f ⟨t + h, hth⟩ - f ⟨t, ht⟩) / h‖ ≤ n })
  (hFn_closed : ∀ n : ℕ, 1 ≤ n → IsClosed (F n))
  (hFn_nowhere : ∀ n : ℕ, 1 ≤ n → IsNowhereDense (F n)) :
  Dense { f : ContinuousMap (Set.Icc (0 : ℝ) 1) ℝ |
    ∀ t (ht : t ∈ Set.Icc 0 1),
      ¬DifferentiableAt ℝ (fun x ↦ if hx : x ∈ Set.Icc 0 1 then f ⟨x, hx⟩ else 0) t } := by
  sorry
end p136_main

namespace p137_main
def TopologyFromNorm
  {V : Type*} [AddCommGroup V] [Module ℝ V]
  (norm : V → ℝ) (T : TopologicalSpace V) : Prop := True

def IsBanachForNorm
  {V : Type*} [AddCommGroup V] [Module ℝ V]
  (norm : V → ℝ) : Prop := True

theorem bollobas_5_17
  {V : Type*} [AddCommGroup V] [Module ℝ V]
  (norm₁ norm₂ : V → ℝ)
  (T₁ T₂ : TopologicalSpace V)
  (hT₁ : TopologyFromNorm norm₁ T₁)
  (hT₂ : TopologyFromNorm norm₂ T₂)
  (hB₁ : IsBanachForNorm norm₁)
  (hB₂ : IsBanachForNorm norm₂) :
  (T₁ = T₂) ∨ (¬ (T₁ ≤ T₂) ∧ ¬ (T₂ ≤ T₁)) := by
  sorry
end p137_main

namespace p138_main
theorem bollobas_5_18
  (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X]
  (S : Set X)
  (h : ∀ f : X →L[ℝ] ℝ, ∃ C : ℝ, ∀ x ∈ S, |f x| ≤ C) :
  ∃ K : ℝ, ∀ x ∈ S, ‖x‖ ≤ K := by
  sorry
end p138_main

namespace p139_main
theorem bollobas_5_19
  (X Y : Type*)
  [NormedAddCommGroup X] [NormedSpace ℝ X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y]
  (T : X →L[ℝ] Y) :
  IsClosed { p : X × Y | T p.1 = p.2 } ↔
    ∀ (x : ℕ → X) (y : Y),
      Filter.Tendsto x Filter.atTop (𝓝 0) →
      Filter.Tendsto (fun n => T (x n)) Filter.atTop (𝓝 y) →
      y = 0 := by
  sorry
end p139_main

namespace p140_main
theorem bollobas_5_20
  (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
  (x : ℕ → X)
  (repr : X → ℕ → ℝ)
  (repr_sum : ∀ v : X, HasSum (λ i ↦ repr v i • x i) v)
  (repr_linear : ∀ i, IsLinearMap ℝ (λ v : X => repr v i)) :
  ∃ C : ℝ, 0 ≤ C ∧
    ∃ P : ℕ → X →L[ℝ] X,
      (∀ n v, P n v = ∑ i in Finset.range (n + 1), repr v i • x i) ∧
      ∀ n, ‖P n‖ ≤ C := by
  sorry
end p140_main

namespace p141_main
theorem bollobas_5_21
  (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X]
  (x : ℕ → X)
  (h_summable : ∀ f : X →L[ℝ] ℝ, Summable (λ n ↦ |f (x n)|)) :
  ∃ M : ℝ, 0 ≤ M ∧ ∀ f : X →L[ℝ] ℝ, ∑' n, |f (x n)| ≤ M * ‖f‖ := by
  sorry
end p141_main

namespace p142_main
theorem bollobas_5_22
  (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X]
  (x : ℕ → X)
  (lin_indep : LinearIndependent ℝ x) :
  ¬CompleteSpace (Submodule.span ℝ (Set.range x)) := by
  sorry
end p142_main

namespace p143_main
theorem reedsimon_6_23
  (a b : ℝ) (hab : a < b)
  (K : ℝ × ℝ → ℝ)
  (hK : ContinuousOn K (Set.Icc a b ×ˢ Set.Icc a b)) :
  ∃ (T : ContinuousMap (Set.Icc a b) ℝ →L[ℝ] ContinuousMap (Set.Icc a b) ℝ),
    ∃ (Tₙ : ℕ → ContinuousMap (Set.Icc a b) ℝ →L[ℝ] ContinuousMap (Set.Icc a b) ℝ),
      (∀ n, FiniteDimensional ℝ (LinearMap.range (Tₙ n).toLinearMap)) ∧
      Filter.Tendsto (fun n => Tₙ n) Filter.atTop (𝓝 T) := by
  sorry
end p143_main

namespace p144_main
theorem rudin_2_24
  (X : Type*) [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
  (Y : Submodule ℝ X)
  (h_complement_meager : IsMeagre ((Y : Set X)ᶜ)) :
  (Y : Set X) = Set.univ := by
  sorry
end p144_main

namespace p145_main
theorem rudin_5_25
  (X Y : Type*)
  [NormedAddCommGroup X] [NormedSpace ℝ X] [CompleteSpace X]
  [NormedAddCommGroup Y] [NormedSpace ℝ Y] [CompleteSpace Y]
  (T : X →L[ℝ] Y)
  (Tstar : NormedSpace.Dual ℝ Y →L[ℝ] NormedSpace.Dual ℝ X)
  (hTstar_def : ∀ (ϕ : NormedSpace.Dual ℝ Y), Tstar ϕ = ϕ.comp T) :
  (Isometry T ∧ LinearMap.range T.toLinearMap = ⊤) ↔
  (Isometry Tstar ∧ LinearMap.range Tstar.toLinearMap = ⊤) := by
  sorry
end p145_main

end functional_analysis_4_9
end BenchmarkData49
