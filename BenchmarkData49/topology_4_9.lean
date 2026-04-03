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
namespace topology_4_9

namespace p266_main
structure ExactFiniteComplex
    (𝕜 : Type*) [Field 𝕜]
    (m : ℕ)
    (A : ℕ → Type*)
    [∀ k, AddCommGroup (A k)] [∀ k, Module 𝕜 (A k)] :=
  (d : ∀ k, A k →ₗ[𝕜] A (k + 1))
  (exact_at_0 :
    LinearMap.ker (d 0) = ⊥)
  (exact_at_mid :
    ∀ k, k + 1 < m →
      LinearMap.range (d k) = LinearMap.ker (d (k + 1)))
  (exact_at_m :
    LinearMap.range (d (m - 1)) = ⊤)

theorem Tu_1
    (𝕜 : Type*) [Field 𝕜]
    (m : ℕ)
    (A : ℕ → Type*)
    [∀ k, AddCommGroup (A k)] [∀ k, Module 𝕜 (A k)]
    [∀ k, FiniteDimensional 𝕜 (A k)]
    (C : ExactFiniteComplex 𝕜 m A) :
    ∑ k in Finset.range (m + 1),
      (-1 : ℤ) ^ k * (FiniteDimensional.finrank 𝕜 (A k) : ℤ) = 0 := by
  sorry
end p266_main

namespace p267_main
variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
variable {H : Type*} [TopologicalSpace H] (I : ModelWithCorners ℝ E H)
variable {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [SmoothManifoldWithCorners I M]

theorem exists_fixed_point_free_homotopic_to_id
  [CompactSpace M]
  [I.Boundaryless]
  (v : (x : M) → TangentSpace I x)
  (h_smooth : ContMDiff I I.tangent ⊤ (fun x ↦ (⟨x, v x⟩ : TangentBundle I M)))
  (h_nowhere_zero : ∀ x, v x ≠ 0)
  : ∃ (F : ContinuousMap M M),
    ContinuousMap.Homotopic F (ContinuousMap.id M) ∧
    (∀ x, F x ≠ x) :=
by
  sorry
end p267_main

namespace p268_main
theorem Hatcher_3 (n : ℕ) :
  ∃ H :
      ContinuousMap
        ({x : (Fin n → ℝ) // x ≠ 0} × Set.Icc (0 : ℝ) 1)
        ({x : (Fin n → ℝ) // x ≠ 0}),
    (∀ x, H (x, ⟨0, by simp⟩) = x) ∧
    (∀ x, ‖(H (x, ⟨1, by simp⟩)).1‖ = 1) ∧
    (∀ x : {x : (Fin n → ℝ) // x ≠ 0},
        ‖x.1‖ = 1 →
        ∀ t : Set.Icc (0 : ℝ) 1, H (x, t) = x) := by
  sorry
end p268_main

namespace p271_main
theorem ham_sandwich_three_sets
  (A : Fin 3 → Set (Fin 3 → ℝ))
  (h_compact : ∀ i, IsCompact (A i)) :
  ∃ (u : Fin 3 → ℝ) (c : ℝ),
    u ≠ 0 ∧
    ∀ i,
      MeasureTheory.volume (A i ∩ {x | Matrix.dotProduct u x ≤ c})
        = MeasureTheory.volume (A i) / 2 := by
  sorry
end p271_main

namespace p273_main
theorem union_convex_simply_connected
  (m n : ℕ)
  (S : Fin n → Set (Fin m → ℝ))
  (h_convex : ∀ i, Convex ℝ (S i))
  (h_inter : ∀ i j k, (S i ∩ S j ∩ S k).Nonempty) :
  SimplyConnectedSpace (⋃ i, S i) := by
  sorry
end p273_main

namespace p274_main
def p₁ : Fin 3 → ℝ := ![-1, 0, 0]
def p₂ : Fin 3 → ℝ := ![1, 0, 0]
def bad_points : Set (Fin 3 → ℝ) := {p₁, p₂}

theorem r3_minus_two_points_simply_connected :
  SimplyConnectedSpace { x : Fin 3 → ℝ // x ∉ bad_points } :=
by
  sorry
end p274_main

namespace p289_main
structure CupProductData :=
  (H1 H2 : Type*)
  [H1_group : AddCommGroup H1]
  [H2_group : AddCommGroup H2]
  (cup : H1 → H1 → H2)

attribute [instance] CupProductData.H1_group
attribute [instance] CupProductData.H2_group

def NondegenerateCup (C : CupProductData) : Prop :=
  ∀ α : C.H1, α ≠ (0 : C.H1) → ∃ β : C.H1, C.cup α β ≠ (0 : C.H2)

def CupProductTrivial (C : CupProductData) : Prop :=
  ∀ α β : C.H1, C.cup α β = (0 : C.H2)

def NoWedgeDecomposition (C : CupProductData) : Prop :=
  NondegenerateCup C ∧ ¬ CupProductTrivial C

structure CupProductDataMod2 :=
  (H1 H2 : Type*)
  [H1_group : AddCommGroup H1]
  [H2_group : AddCommGroup H2]
  (cup : H1 → H1 → H2)

attribute [instance] CupProductDataMod2.H1_group
attribute [instance] CupProductDataMod2.H2_group

def NondegenerateCupMod2 (C : CupProductDataMod2) : Prop :=
  ∀ α : C.H1, α ≠ (0 : C.H1) → ∃ β : C.H1, C.cup α β ≠ (0 : C.H2)

def CupProductTrivialMod2 (C : CupProductDataMod2) : Prop :=
  ∀ α β : C.H1, C.cup α β = (0 : C.H2)

def NoWedgeDecompositionMod2 (C : CupProductDataMod2) : Prop :=
  NondegenerateCupMod2 C ∧ ¬ CupProductTrivialMod2 C

theorem Hatcher_24
    (g : ℕ) (hg : 1 ≤ g)
    (Cor : CupProductData)
    (Cnon : CupProductDataMod2) :
    NondegenerateCup Cor →
    NondegenerateCupMod2 Cnon →
    NoWedgeDecomposition Cor ∧
    NoWedgeDecompositionMod2 Cnon := by
  sorry
end p289_main

namespace p290_main
def IsOneDimManifoldNoHausdorff (X : Type*) [TopologicalSpace X] : Prop :=
  ∃ (U : Set (Set X)),
    (∀ s ∈ U, ∃ t : Set ℝ, IsOpen s ∧ IsOpen t ∧ ∃ h : s ≃ₜ t, True) ∧
    ⋃₀ U = (Set.univ : Set X)

def IsOrientable (X : Type*) [TopologicalSpace X] : Prop :=
  ∃ orient : X → Bool, Continuous orient

def IsNonorientable (X : Type*) [TopologicalSpace X] : Prop :=
  ¬ IsOrientable X

theorem Hatcher_25 :
  ∃ (X : Type*) (_ : TopologicalSpace X),
    IsOneDimManifoldNoHausdorff X ∧ IsNonorientable X := by
  sorry
end p290_main

end topology_4_9
end BenchmarkData49
