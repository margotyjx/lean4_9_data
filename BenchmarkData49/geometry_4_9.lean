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
namespace geometry_4_9

namespace p146_main
theorem Pressley_1_1_1 :
  let γ (t : ℝ) : ℝ × ℝ := (t^2, t^4)
  Set.range γ = { p : ℝ × ℝ | p.snd = p.fst ^ 2 } := by
  sorry
end p146_main

namespace p147_main
theorem Pressley_1_2_1 (a : ℝ) (ha : 0 < a) :
  let γ (t : ℝ) : ℝ × ℝ := (t, cosh t)
  ∫ t in (0 : ℝ)..a, sqrt ((deriv (fun x => (γ x).1) t) ^ 2 + (deriv (fun x => (γ x).2) t) ^ 2) = sinh a :=
sorry
end p147_main

namespace p148_main
theorem Pressley_2_1_1 (a : ℝ) (ha : 0 < a) :
  let γ (t : ℝ) : ℝ × ℝ := (t, cosh t)
  ∫ t in (0 : ℝ)..a, sqrt ((deriv (fun x => (γ x).1) t) ^ 2 + (deriv (fun x => (γ x).2) t) ^ 2) = sinh a :=
sorry
end p148_main

namespace p149_main
abbrev R3 := EuclideanSpace ℝ (Fin 3)
def UnitSpeed (γ : ℝ → R3) : Prop :=
  ∀ t, ‖deriv γ t‖ = 1
noncomputable def curvature (γ : ℝ → R3) (t : ℝ) : ℝ :=
  ‖deriv (deriv γ) t‖
noncomputable def torsion (γ : ℝ → R3) (t : ℝ) : ℝ :=
  let γ₁ : R3 := deriv γ t
  let γ₂ : R3 := deriv (deriv γ) t
  let γ₃ : R3 := deriv (deriv (deriv γ)) t
  let c : R3 := crossProduct γ₁ γ₂
  ⟪c, γ₃⟫_ℝ / (‖c‖ ^ 2)
noncomputable def circularHelix (κ τ : ℝ) : ℝ → R3 :=
  fun t =>
    let ω := Real.sqrt (κ^2 + τ^2)
    let r := κ / (κ^2 + τ^2)
    let c := τ / (κ^2 + τ^2)
    ![
      r * Real.cos (ω * t),
      r * Real.sin (ω * t),
      c * t
    ]
theorem Pressley_2_3_2
  (γ : ℝ → R3)
  (κ τ : ℝ)
  (hC3 : ContDiff ℝ 3 γ)
  (h_unit : UnitSpeed γ)
  (hκ : ∀ t, curvature γ t = κ)
  (hτ : ∀ t, torsion γ t = τ)
  (hκ_pos : 0 < κ) :
  ∃ (A : R3 ≃ₗᵢ[ℝ] R3) (v : R3),
    (∀ t, A (γ t) + v = circularHelix κ τ t) := by
  sorry
end p149_main

namespace p150_main
theorem Pressley_3_2_2 {p q : ℝ} (hp : 0 < p) (hq : 0 < q) :
  (∫ t in (0 : ℝ)..(2 * Real.pi),
      Real.sqrt (p ^ 2 * (Real.sin t) ^ 2 + q ^ 2 * (Real.cos t) ^ 2))
    ≥ 2 * Real.pi * Real.sqrt (p * q)
  ∧
  ((∫ t in (0 : ℝ)..(2 * Real.pi),
      Real.sqrt (p ^ 2 * (Real.sin t) ^ 2 + q ^ 2 * (Real.cos t) ^ 2))
      = 2 * Real.pi * Real.sqrt (p * q))
    ↔ p = q := by
  sorry
end p150_main

namespace p151_main
def unitCylinder : Set (ℝ × ℝ × ℝ) :=
  { p | p.1 ^ 2 + p.2.1 ^ 2 = (1 : ℝ) }
def unitSphere : Set (ℝ × ℝ × ℝ) :=
  Metric.sphere (0 : ℝ × ℝ × ℝ) 1
theorem Pressley_4_1_4_param :
  (∃ (U : Set (ℝ × ℝ)), IsOpen U ∧ ∃ X : (U → (ℝ × ℝ × ℝ)),
      Set.range X = unitCylinder) ∧
  ¬ (∃ (U : Set (ℝ × ℝ)), IsOpen U ∧ ∃ X : (U → (ℝ × ℝ × ℝ)),
      Set.range X = unitSphere) := by
  sorry
end p151_main

namespace p152_main
theorem Pressley_5_4_1:
  let S1 : Set (ℝ × (ℝ × ℝ)) := { p | p.1 ^ 2 - p.2.1 ^ 2 + p.2.2 ^ 4 = 1 }
  let S2 : Set (ℝ × (ℝ × ℝ)) := { p | p.1 ^ 2 + p.2.1 ^ 2 + p.2.2 ^ 4 = 1 }
  ¬ IsCompact S1 ∧ IsCompact S2 :=
sorry
end p152_main

namespace p153_main
theorem Pressley_6_1_1 (u v α β : ℝ) :
  let dot (p q : ℝ × (ℝ × ℝ)) : ℝ := p.1 * q.1 + p.2.1 * q.2.1 + p.2.2 * q.2.2
  let smul (a : ℝ) (p : ℝ × (ℝ × ℝ)) : ℝ × (ℝ × ℝ) := (a * p.1, a * p.2.1, a * p.2.2)
  let σ (u v : ℝ) : ℝ × (ℝ × ℝ) := (u - v, u + v, u^2 + v^2)
  let σ_u (u v : ℝ) : ℝ × (ℝ × ℝ) := (1, 1, 2 * u)
  let σ_v (u v : ℝ) : ℝ × (ℝ × ℝ) := (-1, 1, 2 * v)
  let E (u v : ℝ) : ℝ := dot (σ_u u v) (σ_u u v)
  let F (u v : ℝ) : ℝ := dot (σ_u u v) (σ_v u v)
  let G (u v : ℝ) : ℝ := dot (σ_v u v) (σ_v u v)
  E u v = 2 + 4 * u ^ 2 ∧
  F u v = 4 * u * v ∧
  G u v = 2 + 4 * v ^ 2 ∧
  dot (smul α (σ_u u v)) (smul α (σ_u u v))
    + 2 * dot (σ_u u v) (σ_v u v) * α * β
    + dot (smul β (σ_v u v)) (smul β (σ_v u v))
    = (E u v) * α ^ 2 + 2 * (F u v) * α * β + (G u v) * β ^ 2 :=
sorry
end p153_main

namespace p154_main
theorem Pressley_6_4_1 :
  let paraboloid_area_integral : ℝ :=
    ∫ θ in (0 : ℝ)..(2 * Real.pi), ∫ r in (0 : ℝ)..1, r * Real.sqrt (1 + 4 * r ^ 2)
  let hemisphere_area : ℝ :=
    ∫ θ in (0 : ℝ)..(2 * Real.pi), ∫ (phi : ℝ) in (Real.pi / 2)..Real.pi, Real.sin phi
  paraboloid_area_integral = (Real.pi / 6) * (5 * Real.sqrt 5 - 1) ∧ hemisphere_area = 2 * Real.pi := by
  sorry
end p154_main

namespace p155_main
theorem Pressley_8_1_2
  (u v : ℝ)
  (GaussCurvatureAt : (ℝ × ℝ) → ℝ):
  GaussCurvatureAt (u, v) = - 1 / (cosh u ^ 4) :=
sorry
end p155_main

namespace p156_main
theorem Tu_4_3
  (OneForm : Type*)
  (wedge : OneForm → OneForm → OneForm)
  (pullback : (ℝ × ℝ → ℝ × ℝ) → OneForm → OneForm)
  (smul : (ℝ × ℝ → ℝ) → OneForm → OneForm)
  (dx dy dr dθ : OneForm) :
  let phi : ℝ × ℝ → ℝ × ℝ :=
    fun p => (p.1 * Real.cos p.2, p.1 * Real.sin p.2)
  pullback phi (wedge dx dy) = smul (fun p : ℝ × ℝ => p.1) (wedge dr dθ) := by
  sorry
end p156_main

namespace p157_main
def RegularCodim1Submanifold (S : Set (ℝ × ℝ × ℝ)) : Prop :=
  ∃ g : (ℝ × ℝ × ℝ) → ℝ,
    ContDiff ℝ ⊤ g ∧
    S = {p | g p = 0} ∧
    ∀ p, p ∈ S → fderiv ℝ g p ≠ 0
theorem Tu_9_5
  (f : (ℝ × ℝ) → ℝ)
  (hf : ContDiff ℝ ⊤ f) :
  let graph : Set (ℝ × ℝ × ℝ) := {p | p.2.2 = f (p.1, p.2.1)}
  RegularCodim1Submanifold graph :=
by
  sorry
end p157_main

namespace p158_main
abbrev R2 := EuclideanSpace ℝ (Fin 2)
abbrev OneForm := R2 → (R2 →ₗ[ℝ] ℝ)
noncomputable def d (f : R2 → ℝ) : OneForm :=
  fun p => (fderiv ℝ f p).toLinearMap
noncomputable def pullback (F : R2 → R2) (ω : OneForm) : OneForm :=
  fun p => (ω (F p)).comp ((fderiv ℝ F p).toLinearMap)
noncomputable def dx : OneForm :=
  fun _ => LinearMap.proj 0
noncomputable def dy : OneForm :=
  fun _ => LinearMap.proj 1
noncomputable def smulForm (phi : R2 → ℝ) (ω : OneForm) : OneForm :=
  fun p => (phi p) • (ω p)
noncomputable def addForm (α β : OneForm) : OneForm :=
  fun p => α p + β p
def F (p : R2) : R2 :=
  ![p 0 ^ 2 + p 1 ^ 2, p 0 * p 1]
def u_coord (q : R2) : ℝ := q 0
def v_coord (q : R2) : ℝ := q 1
theorem Tu_19_2 :
  pullback F (addForm (smulForm u_coord (d u_coord)) (smulForm v_coord (d v_coord))) =
    addForm
      (smulForm (fun p : R2 => 2 * p 0 ^ 3 + 3 * p 0 * p 1 ^ 2) dx)
      (smulForm (fun p : R2 => 3 * p 0 ^ 2 * p 1 + 2 * p 1 ^ 3) dy) := by
  sorry
end p158_main

namespace p159_main
theorem Tu_20_7
  {k : ℕ}
  (F : Type*) (VF : Type*) (Ω : ℕ → Type*)
  [CommSemiring F]
  [AddCommMonoid VF] [Module F VF]
  [∀ n, AddCommMonoid (Ω n)] [∀ n, Module F (Ω n)]
  (lieDeriv : VF → Ω k → Ω k)
  (d : F → Ω 1)
  (iota : VF → Ω k → Ω (k - 1))
  (wedge : Ω 1 → Ω (k - 1) → Ω k)
  (f : F) (X : VF) (ω : Ω k) :
  lieDeriv (f • X) ω = f • (lieDeriv X ω) + wedge (d f) (iota X ω) :=
by
  sorry
end p159_main

namespace p160_main
theorem Tu_23_3_changeOfVariables
  (n : ℕ)
  (F : (Fin n → ℝ) → (Fin n → ℝ))
  (s : Set (Fin n → ℝ))
  (hs : MeasurableSet s)
  (hF : ContDiff ℝ 1 F)
  (h_inj : Set.InjOn F s)
  (g : (Fin n → ℝ) → ℝ) :
  (∫ x in F '' s, g x ∂(MeasureTheory.volume))
    =
  (∫ x in s, (abs ((fderiv ℝ F x).det)) * g (F x) ∂(MeasureTheory.volume)) :=
by
  sorry
end p160_main

namespace p161_main
abbrev MyOneForm (M : Type u) (V : Type v) : Type (max u v) := M → V
def MyNowhereVanishing {M : Type u} {V : Type v} [Zero V] (ω : MyOneForm M V) : Prop :=
  ∀ x : M, ω x ≠ 0
def MyExact {M : Type u} {F : Type*} {V : Type v} (d : F → MyOneForm M V) (ω : MyOneForm M V) : Prop :=
  ∃ f : F, d f = ω
theorem Tu_24_1
  {M : Type u} [TopologicalSpace M] [CompactSpace M]
  {F : Type*} {V : Type v} [Zero V]
  (d : F → MyOneForm M V)
  (has_zero : ∀ f : F, ∃ x : M, d f x = 0)
  (ω : MyOneForm M V)
  (h_nv : MyNowhereVanishing ω) :
  ¬ MyExact d ω :=
by
  sorry
end p161_main

namespace p162_main
theorem Lee_4_6_core
  (M : Type*) [TopologicalSpace M] [CompactSpace M] [Nonempty M] :
  ∀ k : ℕ, 0 < k → ¬ ∃ F : M → (Fin k → ℝ), Continuous F ∧ IsOpenMap F :=
by
  sorry
end p162_main

namespace p163_main
abbrev R2 := EuclideanSpace ℝ (Fin 2)
def IsEmbeddedSubmanifold (S : Set R2) : Prop :=
  ∃ f : R2 → ℝ,
    ContDiff ℝ 1 f ∧
    S = {p : R2 | f p = 0} ∧
    (∀ p : R2, f p = 0 → fderiv ℝ f p ≠ 0)
theorem Lee_5_10 (a : ℝ) :
  let M : Set R2 := { p : R2 | (p 1) ^ 2 = (p 0) * ((p 0) - 1) * ((p 0) - a) }
  IsEmbeddedSubmanifold M ↔ (a ≠ 0 ∧ a ≠ 1) := by
  sorry
end p163_main

namespace p164_main
abbrev Cn (n : ℕ) := Fin n → ℂ
def sphere (n : ℕ) : Set (Cn n) := {z | ‖z‖ = 1}
def TangentAlongSphere (n : ℕ) (X : Cn n → Cn n) : Prop :=
  ∀ z, z ∈ sphere n →
    deriv (fun t : ℝ => ‖z + t • (X z)‖ ^ 2) 0 = 0
theorem Lee_9_4 (n : ℕ) (hn : 1 ≤ n) :
  let θ : ℝ → Cn n → Cn n :=
    fun t z => (Complex.exp (Complex.I * t)) • z
  let X : Cn n → Cn n :=
    fun z => (Complex.I : ℂ) • z
  (ContDiff ℝ ⊤ (fun p : ℝ × Cn n => θ p.1 p.2)) ∧
  (ContDiff ℝ ⊤ X) ∧
  (∀ z, z ∈ sphere n → deriv (fun t => θ t z) 0 = X z) ∧
  (TangentAlongSphere n X) ∧
  (∀ z, z ∈ sphere n → X z ≠ 0) :=
by
  sorry
end p164_main

namespace p165_main
opaque IsRiemannianImmersion {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
  (f : M → EuclideanSpace ℝ (Fin (n + 1))) : Prop

opaque HasAllSectionalCurvaturesNegative {n : ℕ} {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
  (f : M → EuclideanSpace ℝ (Fin (n + 1))) : Prop

theorem geometry_20 (n : ℕ) (M : Type*) [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
  [SmoothManifoldWithCorners (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) M]
  (hn : n ≥ 3) (f : M → EuclideanSpace ℝ (Fin (n + 1)))
  (h_imm : IsRiemannianImmersion f) :
  ¬ HasAllSectionalCurvaturesNegative f :=
sorry
end p165_main

namespace p166_main
theorem Petersen_4_6_core
  {α : Type*} [MeasurableSpace α] (μ : MeasureTheory.Measure α)
  (hμ_fin : μ Set.univ ≠ (⊤ : ENNReal))
  (K : α → ℝ)
  (hK_meas : MeasureTheory.AEStronglyMeasurable K μ)
  (hK_int : MeasureTheory.Integrable K μ)
  (hK_le : ∀ᵐ x ∂μ, K x ≤ 1)
  (h_total : (∫ x, K x ∂μ) = 4 * Real.pi) :
  4 * Real.pi ≤ (μ Set.univ).toReal := by
  sorry
end p166_main

namespace p167_main
opaque RealProjectiveSpace (n : ℕ) : Type*
instance (n : ℕ) : TopologicalSpace (RealProjectiveSpace n) := sorry
instance (n : ℕ) :
    ChartedSpace (EuclideanSpace ℝ (Fin n)) (RealProjectiveSpace n) := sorry
instance (n : ℕ) :
    SmoothManifoldWithCorners
      (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n)))
      (RealProjectiveSpace n) := sorry

opaque HasConstantPositiveCurvature
  (n : ℕ) (M : Type*)
  [TopologicalSpace M]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) M] : Prop

opaque IsDiffeomorphic
  (n : ℕ) (M N : Type*)
  [TopologicalSpace M] [TopologicalSpace N]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) N]
  [SmoothManifoldWithCorners
    (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) M]
  [SmoothManifoldWithCorners
    (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) N] : Prop

theorem geometry_22
  (n : ℕ) (M : Type*)
  [TopologicalSpace M]
  [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
  [SmoothManifoldWithCorners
    (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) M]
  [CompactSpace M]
  [Fact (FiniteDimensional.finrank ℝ (EuclideanSpace ℝ (Fin (n + 1))) = n + 1)]
  (h_even : Even n)
  (h_curv : HasConstantPositiveCurvature n M) :
  IsDiffeomorphic n M (Metric.sphere (0 : EuclideanSpace ℝ (Fin (n + 1))) 1) ∨
  IsDiffeomorphic n M (RealProjectiveSpace n) := by
  sorry
end p167_main

namespace p168_main
theorem Petersen_6_12
  {M N : Type*} [MeasurableSpace M] [MeasurableSpace N]
  (μM : MeasureTheory.Measure M) (μN : MeasureTheory.Measure N)
  [MeasureTheory.IsFiniteMeasure μM] [MeasureTheory.IsFiniteMeasure μN]
  (f : M → N) (hf : Measurable f)
  (k : ℕ) (hk : 1 ≤ k)
  (hcover : MeasureTheory.Measure.map f μM = (k : ENNReal) • μN) :
  (μM Set.univ).toReal = (k : ℝ) * (μN Set.univ).toReal := by
  sorry
end p168_main

namespace p170_main
structure GeomData (M : Type*) [MeasurableSpace M] where
  dist : M → M → ℝ
  μ    : MeasureTheory.Measure M
  Ric  : M → ℝ
  sec  : M → ℝ
def ball {M : Type*} [MeasurableSpace M] (G : GeomData M) (p : M) (R : ℝ) : Set M :=
  {x : M | G.dist x p < R}
def vol {M : Type*} [MeasurableSpace M] (G : GeomData M) (s : Set M) : ℝ :=
  (G.μ s).toReal
def RicciLowerBound {M : Type*} [MeasurableSpace M] (G : GeomData M) (n : ℕ) (k : ℝ) : Prop :=
  ∀ x : M, (n - 1 : ℝ) * k ≤ G.Ric x
def SecConstOn {M : Type*} [MeasurableSpace M] (G : GeomData M) (s : Set M) (k : ℝ) : Prop :=
  ∀ x : M, x ∈ s → G.sec x = k
theorem Petersen_9_3
  {M : Type*} [MeasurableSpace M]
  (G : GeomData M)
  (n : ℕ) (k R : ℝ) (p : M)
  (v : ℕ → ℝ → ℝ → ℝ)
  (hR : 0 < R)
  (hRic : RicciLowerBound G n k)
  (hVolEq : vol G (ball G p R) = v n k R) :
  SecConstOn G (ball G p R) k := by
  sorry
end p170_main

end geometry_4_9
end BenchmarkData49
