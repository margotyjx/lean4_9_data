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
namespace linear_algebra_4_9

namespace p171_main
abbrev R3 := EuclideanSpace ℝ (Fin 3)
noncomputable def w : Fin 3 → R3 :=
  ![
    (![1, 2, 3] : R3),
    (![(5 : ℝ) / 7, -(4 : ℝ) / 7, (1 : ℝ) / 7] : R3),
    (![(1 : ℝ) / 3, (1 : ℝ) / 3, -(1 : ℝ) / 3] : R3)
  ]
def v : Fin 3 → R3 :=
  ![
    (![1, 2, 3] : R3),
    (![1, 0, 1] : R3),
    (![1, 1, 1] : R3)
  ]
def OrthogonalFam (u : Fin 3 → R3) : Prop :=
  (∀ i, u i ≠ 0) ∧ ∀ i j, i ≠ j → ⟪u i, u j⟫_ℝ = 0
theorem question_1 :
  OrthogonalFam w ∧
  Submodule.span ℝ (Set.range w) = ⊤ ∧
  Submodule.span ℝ (Set.range w) = Submodule.span ℝ (Set.range v) := by
  sorry
end p171_main

namespace p172_main
abbrev R2 := EuclideanSpace ℝ (Fin 2)
def B (x y : R2) : ℝ :=
  x 0 * y 0 + x 0 * y 1 + x 1 * y 0 + 5 * x 1 * y 1

theorem question_2 :
  (B (![1, 0] : R2) (![-1, 1] : R2) = 0
   ∧ B (![1, 0] : R2) (![1, 0] : R2) ≠ 0
   ∧ B (![-1, 1] : R2) (![-1, 1] : R2) ≠ 0)
  ∧
    Submodule.span ℝ
      (Set.range ( ![ (![1, 0] : R2), (![0, 1] : R2) ] : Fin 2 → R2 ))
    =
    Submodule.span ℝ
      (Set.range ( ![ (![1, 0] : R2), (![-1, 1] : R2) ] : Fin 2 → R2 )) := by
  sorry
end p172_main

namespace p173_main
abbrev R3 := EuclideanSpace ℝ (Fin 3)
theorem question_3 :
  Submodule.span ℝ { (![1, -2, 3] : R3) }
    =
  (Submodule.span ℝ { x : R3 | x 0 - 2 * x 1 + 3 * x 2 = 0 })ᗮ := by
  sorry
end p173_main

namespace p174_main
theorem question_4 :
  let P : Set (ℝ × ℝ × ℝ) :=
    { p | p.1 - 2 * p.2.1 + 3 * p.2.2 = 0 }
  let XY : Set (ℝ × ℝ × ℝ) :=
    { p | p.2.2 = 0 }
  let v₁ : ℝ × ℝ × ℝ := (2, (1, 0))
  let v₂ : ℝ × ℝ × ℝ := (-3, (0, 1))
  ((v₁ ∈ P ∧ v₁ ∈ XY) ∧
   (v₂ ∈ P ∧ v₂ ∈ XY) ∧
   LinearIndependent ℝ ![v₁, v₂] ∧
   (↑(Submodule.span ℝ ({v₁, v₂} : Set (ℝ × ℝ × ℝ))) =
      { p : ℝ × ℝ × ℝ | p ∈ P ∧ p ∈ XY })) := by
  sorry
end p174_main

namespace p175_main
theorem question_5 :
  ∀ m : ℝ,
    let u : ℝ × ℝ × ℝ := (m + 1, (-m + 2, -3))
    let v : ℝ × ℝ × ℝ := (-3, (m + 1, -m + 2))
    (Real.arccos
        ((u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2) /
         (Real.sqrt (u.1^2 + u.2.1^2 + u.2.2^2) *
          Real.sqrt (v.1^2 + v.2.1^2 + v.2.2^2))))
      = (2 * Real.pi / 3) := by
  sorry
end p175_main

namespace p176_main
def dot (u v : ℝ × ℝ × ℝ) : ℝ :=
  u.1 * v.1 + u.2.1 * v.2.1 + u.2.2 * v.2.2

theorem question_6 :
  (let u : ℝ × ℝ × ℝ := (2, (-1, 7))
   let v : ℝ × ℝ × ℝ := (1, (2, 0))
   dot u v = 0) := by
  sorry
end p176_main

namespace p177_main
variable {K : Type*} [Field K]

def A (a b c : K) : Matrix (Fin 4) (Fin 4) K :=
  !![ 1, -a,  0,  0;
      0,  1, -b,  0;
      0,  0,  1, -c;
      0,  0,  0,  1]

def Ainv (a b c : K) : Matrix (Fin 4) (Fin 4) K :=
  !![ 1,  a,  a*b,  a*b*c;
      0,  1,    b,    b*c;
      0,  0,    1,      c;
      0,  0,    0,      1]

theorem question_7 (a b c : K) :
    (A a b c)⁻¹ = Ainv a b c := by
  sorry
end p177_main

namespace p178_main
theorem question_8
  {n : ℕ} (A : Matrix (Fin n) (Fin n) ℝ) :
  Matrix.transpose A = A →
    ∃ (v : Fin n → (Fin n → ℝ)) (μ : Fin n → ℝ),
      (∀ i, v i ≠ 0 ∧ A.mulVec (v i) = μ i • v i) ∧
      (∀ i j, i ≠ j → Matrix.dotProduct (v i) (v j) = 0) := by
  sorry
end p178_main

namespace p179_main
variable {n : ℕ}
variable [InnerProductSpace ℝ (Fin n → ℝ)]

theorem question_9
    (A : Matrix (Fin n) (Fin n) ℝ)
    (v : Fin n → (Fin n → ℝ))
    (lam : Fin n → ℝ)
    (h_orthonormal : Orthonormal ℝ v)
    (h_eigen : ∀ i : Fin n, A.mulVec (v i) = (lam i) • v i) :
    A.transpose = A := by
  sorry
end p179_main

namespace p180_main
theorem question_10 :
  Matrix.charpoly
      ![
        ![-7, 8],
        ![-16, 17]
      ]
    = Polynomial.X^2 - 10 * Polynomial.X + 9 := by
  sorry
end p180_main

namespace p181_main
theorem question_11 :
  let A : Matrix (Fin 2) (Fin 2) ℝ :=
    ![
      ![-7, 8],
      ![-16, 17]
    ]
  minpoly ℝ A = (Polynomial.X ^ 2 - 10 * Polynomial.X + 9 : Polynomial ℝ) := by
  sorry
end p181_main

namespace p182_main
def IsUpperTriangular3x3 (B : Matrix (Fin 3) (Fin 3) ℝ) : Prop :=
  ∀ i j : Fin 3, (i.1 > j.1) → B i j = 0

theorem question_12 :
  (let A : Matrix (Fin 3) (Fin 3) ℝ :=
     !![ 9, 0, 0;
         0, 1, 0;
         0, 2, 8 ]
   ∃ M B : Matrix (Fin 3) (Fin 3) ℝ,
     IsUpperTriangular3x3 B ∧
     A = M * B) := by
  sorry
end p182_main

namespace p183_main
def IsUpperTriangular (B : Matrix (Fin 4) (Fin 4) ℝ) : Prop :=
  ∀ i j, i > j → B i j = 0

theorem question_13 :
  let A : Matrix (Fin 3) (Fin 4) ℝ :=
    ![
      ![9, 0, 0, 7],
      ![0, 1, 0, 0],
      ![0, 2, 8, 3]
    ]
  ∃ (C : Matrix (Fin 3) (Fin 4) ℝ) (B : Matrix (Fin 4) (Fin 4) ℝ),
    A = C * B ∧ IsUpperTriangular B := by
  sorry
end p183_main

namespace p184_main
theorem question_14 :
  let A : Matrix (Fin 3) (Fin 4) ℝ :=
    ![
      ![9, 0, 0, 7],
      ![0, 1, 0, 0],
      ![0, 2, 0, 0]
    ]
  ∃ (B : Matrix (Fin 3) (Fin 2) ℝ) (C : Matrix (Fin 2) (Fin 4) ℝ), B * C = A := by
  sorry
end p184_main

namespace p185_main
theorem question_15
  {n : ℕ} (S : Submodule ℝ (EuclideanSpace ℝ (Fin n))) :
  Sᗮ ≤ Sᗮ := by
  sorry
end p185_main

namespace p186_main
theorem question_16
    (V : Type*)
    [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]
    (S : Submodule ℝ V) :
    FiniteDimensional.finrank ℝ (↥S) +
      FiniteDimensional.finrank ℝ (↥S.orthogonal) =
      FiniteDimensional.finrank ℝ V := by
  sorry
end p186_main

namespace p187_main
abbrev Rn (n : ℕ) := EuclideanSpace ℝ (Fin n)
theorem question_17
  {n : ℕ} (S : Submodule ℝ (Rn n)) :
  S ⊓ Sᗮ = ⊥ := by
  sorry
end p187_main

namespace p188_main
theorem question_18 :
  Submodule.span ℝ
    (Set.range
      ( ![
          ![-2, -2, 1, 3],
          ![3, 3, 0, -1],
          ![-1, -1, -2, -5],
          ![2, 2, 5, 5]
        ] : Fin 4 → (Fin 4 → ℝ) ))
  ≠ ⊤ := by
  sorry
end p188_main

namespace p189_main
theorem question_19 :
  let A : Matrix (Fin 3) (Fin 3) ℝ :=
  ![
    ![1, 2, -1],
    ![2, 4, 7],
    ![-2, -4, 1]
  ]
  ¬ IsUnit A := by
  sorry
end p189_main

namespace p190_main
def rowSpaceSet {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) :
    Set (Fin n → ℝ) :=
  { v | ∃ c : Fin m → ℝ,
      v = fun j => ∑ i : Fin m, c i * A i j }

def nullSpaceSet {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) :
    Set (Fin n → ℝ) :=
  { v | A.mulVec v = 0 }

def RowspaceEqNullspace {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) : Prop :=
  rowSpaceSet A = nullSpaceSet A

theorem question_20
  {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ)
  (h : RowspaceEqNullspace A) :
  Even n := by
  sorry
end p190_main

end linear_algebra_4_9
end BenchmarkData49
