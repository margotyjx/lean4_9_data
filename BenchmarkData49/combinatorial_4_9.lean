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
namespace combinatorial_4_9

namespace p52_main
theorem bona_1(n : ℕ) :
    Fintype.card { f : Fin n → Fin n // Function.Bijective f } = Nat.factorial n := by
  sorry
end p52_main

namespace p53_main
theorem bona_2 :
    Fintype.card { s : Finset (Fin 49) // s.card = 6 } = Nat.choose 49 6 := by
  sorry
end p53_main

namespace p54_main
def IsCube (n : ℕ) : Prop := ∃ m : ℕ, m ^ 3 = n
def TenSmooth (n : ℕ) : Prop :=
  ∀ ⦃p : ℕ⦄, Nat.Prime p → p ∣ n → p ≤ 10
theorem bona_3
    (a : Fin 175 → ℕ)
    (hpos : ∀ i, 0 < a i)
    (hsmooth : ∀ i, TenSmooth (a i)) :
    ∃ i j k : Fin 175,
      i ≠ j ∧ i ≠ k ∧ j ≠ k ∧ IsCube (a i * a j * a k) := by
  sorry
end p54_main

namespace p55_main
def Assign := Fin 12 → Fin 4
def SiblingsTogether (s₁ s₂ t₁ t₂ : Fin 12) (f : Assign) : Prop :=
  f s₁ = f s₂ ∧ f t₁ = f t₂
def AllGroupsUsed (f : Assign) : Prop := Function.Surjective f
def ValidLabeled (s₁ s₂ t₁ t₂ : Fin 12) : Type :=
  { f : Assign // AllGroupsUsed f ∧ SiblingsTogether s₁ s₂ t₁ t₂ f }
def ValidUnlabeledReps (s₁ s₂ t₁ t₂ : Fin 12) : Type := by
  classical
  exact Quot
    (fun f g : ValidLabeled s₁ s₂ t₁ t₂ =>
      ∃ σ : Equiv.Perm (Fin 4), (fun c => σ (f.1 c)) = g.1)
theorem bona_4
    (s₁ s₂ t₁ t₂ : Fin 12)
    (h_dist :
      s₁ ≠ s₂ ∧ t₁ ≠ t₂ ∧
      s₁ ≠ t₁ ∧ s₁ ≠ t₂ ∧ s₂ ≠ t₁ ∧ s₂ ≠ t₂) :
    Nat.card (ValidUnlabeledReps s₁ s₂ t₁ t₂) = 34105 := by
  sorry
end p55_main

namespace p56_main
theorem bona_5 :
  Nonempty
    ({ n : ℕ // 1 ≤ n ∧ n ≤ 1000 ∧ Nat.gcd n 7 = 1 ∧ Nat.gcd n 8 = 1 } ≃ Fin 429) := by
  sorry
end p56_main

namespace p57_main
theorem bona_6
    (k : ℕ) (hk : 0 < k) (x : ℝ) (hx : |x| < 1) :
    1 / (1 - x) ^ k
      = ∑' n : ℕ, (Nat.choose (n + k - 1) (k - 1) : ℝ) * x ^ n := by
  sorry
end p57_main

namespace p58_main
def HotelAssign (n : ℕ) := Fin n → Fin n
def AdmissibleChoice {n : ℕ} (f : HotelAssign n) : Prop :=
  ∀ i : Fin n, f i ≤ i
def usedHotels {n : ℕ} (f : HotelAssign n) : ℕ :=
  (Finset.univ.image f).card
def ValidHotelAssignments (n k : ℕ) : Type :=
  { f : HotelAssign n // AdmissibleChoice f ∧ usedHotels f = k }
theorem bona_7 :
  Nonempty (ValidHotelAssignments 7 3 ≃ Fin 2416) := by
  sorry
end p58_main

namespace p59_main
def Seating (n : ℕ) := Equiv.Perm (Fin n)
def numTables {n : ℕ} (σ : Seating n) : ℕ :=
  Multiset.card (σ.cycleType)
def ValidSeatings (n k : ℕ) : Type :=
  { σ : Seating n // numTables σ = k }
theorem bona_8 :
  Nonempty (ValidSeatings 8 6 ≃ Fin 322) := by
  sorry
end p59_main

namespace p60_main
def ParkingPref (n : ℕ) := Fin n → Fin n
def ParkingSuccess {n : ℕ} (f : ParkingPref n) : Prop :=
  ∀ m : Fin n,
    Fintype.card { c : Fin n // (f c).val ≤ m.val } ≥ m.val.succ
def SuccessfulPrefs (n : ℕ) : Type :=
  { f : ParkingPref n // ParkingSuccess f }
theorem bona_9 :
  Nonempty (SuccessfulPrefs 5 ≃ Fin 1296) := by
  sorry
end p60_main

namespace p61_main
inductive BTree : Nat → Type
| empty : BTree 0
| node  {nL nR : Nat} (L : BTree nL) (R : BTree nR) : BTree (nL + nR + 1)
theorem bona_10 :
  Nonempty (BTree 8 ≃ Fin 1430) := by
sorry
end p61_main

namespace p62_main
theorem bona_11
    (α : Type*) [Fintype α] [DecidableEq α]
    (G : SimpleGraph α) [DecidableRel G.Adj]
    (h₂ : 2 ≤ Fintype.card α) :
    ∃ u v : α, u ≠ v ∧ G.degree u = G.degree v := by
  sorry
end p62_main

namespace p63_main
structure IntPartition (n : ℕ) where
  parts   : List ℕ
  pos     : ∀ a ∈ parts, 0 < a
  sum_eq  : parts.sum = n
  noninc  : parts.Chain' (· ≥ ·)
def PartitionsLenLe (n r : ℕ) : Type :=
  { p : IntPartition n // p.parts.length ≤ r }
def PartitionsPartsLe (n r : ℕ) : Type :=
  { p : IntPartition n // ∀ a ∈ p.parts, a ≤ r }
theorem Lovasz_12 (n r : ℕ) :
  Nonempty (PartitionsLenLe n r ≃ PartitionsPartsLe n r) := by
  sorry
end p63_main

namespace p64_main
theorem Lovasz_13 :
  Nonempty ({ s : List ℕ // (∀ a ∈ s, a = 1 ∨ a = 2) ∧ s.sum = 15 } ≃ Fin 987) := by
  sorry
end p64_main

namespace p65_main
theorem Lovasz_14
    (s : ℕ) (p a : Fin s → ℕ)
    (hprime : ∀ i, Nat.Prime (p i))
    (hcop   : ∀ {i j : Fin s}, i ≠ j → Nat.Coprime (p i) (p j)) :
    (Nat.totient (∏ i : Fin s, (p i) ^ (a i)) : ℚ)
      = (∏ i : Fin s, (p i) ^ (a i) : ℚ)
        * ∏ i : Fin s, (1 - 1 / (p i : ℚ)) := by
  sorry
end p65_main

namespace p66_main
theorem Lovasz_15
    (V : Type*)
    [CompleteLattice V] [Fintype V] [DecidableEq V]
    [DecidableRel ((· ≤ ·) : V → V → Prop)]
    (μ : V → V → ℤ)
    (μ_self : ∀ a : V, μ a a = 1)
    (μ_rec :
      ∀ a b : V, a ≠ b →
        μ a b
          = - ∑ x in (Finset.univ.filter (fun x : V => a ≤ x ∧ x ≤ b ∧ x ≠ b)),
              μ a x)
    (n : ℕ) (AtomsV : Type*)
    (incl : AtomsV → V) (isAtom : ∀ a : AtomsV, IsAtom (incl a))
    (eAtoms : AtomsV ≃ Fin n)
    (q : ℕ → ℕ)
    (hq : ∀ k,
      Nonempty
        ({ x : (Fin k → AtomsV) // (⨆ i, incl (x i)) = (⊤ : V) } ≃ Fin (q k)))
    (hq0 : Fintype.card V ≠ 1 → q 0 = 0) :
    μ (⊥ : V) (⊤ : V)
      = ∑ l in Finset.range (n + 1), ((-1 : ℤ) ^ l) * (q l : ℤ) := by
  sorry
end p66_main

namespace p67_main
theorem Lovasz_16 (n k : ℕ) (hn : 0 < n) :
  Nonempty
    ({ f : Fin n → ℕ // (∑ i : Fin n, f i) = k } ≃
     Fin (Nat.choose (n + k - 1) (n - 1))) := by
  sorry
end p67_main

namespace p68_main
def EdgeType {V : Type*} (G : SimpleGraph V) : Type _ :=
  { e : Sym2 V // e ∈ G.edgeSet }

theorem Lovasz_17
    {V : Type u} (G : SimpleGraph V)
    (Connected : SimpleGraph V → Prop)
    (Planar : SimpleGraph V → Prop)
    (hconn : Connected G)
    (IsSpanningTreeOn :
      ∀ {W : Type _} (H : SimpleGraph W), Set (EdgeType H) → Prop) :
    Planar G ↔
      ∃ (Vstar : Type u) (Gstar : SimpleGraph Vstar)
        (phi : EdgeType G ≃ EdgeType Gstar),
          (∀ (T : Set (EdgeType G)),
              IsSpanningTreeOn G T →
              IsSpanningTreeOn Gstar (Set.image phi (Set.univ \ T))) ∧
          (∀ (Tstar : Set (EdgeType Gstar)),
              IsSpanningTreeOn Gstar Tstar →
              IsSpanningTreeOn G (Set.image phi.symm (Set.univ \ Tstar))) := by
  sorry
end p68_main

namespace p69_main
theorem Lovasz_18
    {V : Type*} (G : SimpleGraph V) (A B : Set V) (hAB : A ∩ B = (∅ : Set V)) (k : ℕ)
    (Path : Type*) (verts : Path → Set V) (isAB : Path → Prop)
    (h : ∀ X : Set V,
          (∀ P : Path, isAB P → (X ∩ verts P).Nonempty) →
          ∃ f : Fin k → V, (∀ i, f i ∈ X) ∧ Function.Injective f) :
    ∃ P : Fin k → Path,
      (∀ i, isAB (P i)) ∧
      (∀ i j, i ≠ j → ((verts (P i)) ∩ (verts (P j)) = (∅ : Set V))) := by
  sorry
end p69_main

namespace p70_main
variable {V : Type u} [Fintype V] [DecidableEq V]

def neighFinset (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  Finset.univ.filter (fun w => G.Adj v w)

def deg (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : ℕ :=
  (neighFinset G v).card

def IsKRegular (G : SimpleGraph V) [DecidableRel G.Adj] (k : ℕ) : Prop :=
  ∀ v : V, deg G v = k

def IsObtainedByRemovingExactlyMEdges (G G' : SimpleGraph V) (m : ℕ) : Prop :=
  ∃ R : Finset (V × V),
    (∀ p ∈ R, p.1 ≠ p.2 ∧ G.Adj p.1 p.2) ∧
    (∀ p, p ∈ R → (p.2, p.1) ∈ R) ∧
    R.card / 2 = m ∧
    (∀ a b : V,
      G'.Adj a b ↔ G.Adj a b ∧ (a,b) ∉ R)

def HasOneFactor (G : SimpleGraph V) : Prop :=
  ∃ mate : V → V,
    Function.Involutive mate ∧
    (∀ v, mate v ≠ v) ∧
    (∀ v, G.Adj v (mate v))

def cutEdges (G : SimpleGraph V) [DecidableRel G.Adj] (S : Finset V) : Finset (V × V) :=
  Finset.univ.filter (fun p =>
    G.Adj p.1 p.2 ∧ (p.1 ∈ S) ∧ (p.2 ∉ S))

def EdgeConnectivityAtLeast (G : SimpleGraph V) [DecidableRel G.Adj] (c : ℕ) : Prop :=
  ∀ S : Finset V,
    S.Nonempty → S.card < Fintype.card V →
      c ≤ (cutEdges (V := V) G S).card
theorem Lovasz_19
    (G : SimpleGraph V) [DecidableRel G.Adj]
    (k : ℕ)
    (h_even : Even (Fintype.card V))
    (h_reg  : IsKRegular (V := V) G k)
    (h_edge : EdgeConnectivityAtLeast (V := V) G (k - 1))
    (G' : SimpleGraph V)
    (h_rem : IsObtainedByRemovingExactlyMEdges (V := V) G G' (k - 1)) :
    HasOneFactor (V := V) G' := by
  sorry
end p70_main

namespace p71_main
def IsIndependentSet {V : Type*} (G : SimpleGraph V) (S : Finset V) : Prop :=
  ∀ ⦃u v⦄, u ∈ S → v ∈ S → u ≠ v → ¬ G.Adj u v
noncomputable def IndependenceNumber {V : Type*} (G : SimpleGraph V)
    [Fintype V] [DecidableEq V] [DecidableRel G.Adj] : ℕ :=
  sSup {k : ℕ | ∃ S : Finset V, IsIndependentSet G S ∧ S.card = k}
structure VPath (V : Type*) where
  seq : List V
def VPath.verts {V : Type*} (P : VPath V) : Set V :=
  {v | v ∈ P.seq}
def IsPath {V : Type*} (G : SimpleGraph V) (P : VPath V) : Prop :=
  P.seq.Nodup ∧ P.seq.Chain' G.Adj
theorem Lovasz_20
    {V : Type*} (G : SimpleGraph V)
    [Fintype V] [DecidableEq V] [DecidableRel G.Adj] :
    ∃ m : ℕ, m ≤ IndependenceNumber G ∧
      ∃ P : Fin m → VPath V,
        (∀ i, IsPath G (P i)) ∧
        (∀ i j, i ≠ j → ((P i).verts ∩ (P j).verts = (∅ : Set V))) ∧
        (∀ v : V, ∃ i : Fin m, v ∈ (P i).verts) := by
  sorry
end p71_main

namespace p72_main
structure SimplePlanarMap {V : Type*} (G : SimpleGraph V)
    (Faces : Type*) (vertsOnFace : Faces → Set V) : Prop :=
  (face_nontrivial : ∀ f : Faces, ∃ v w : V,
    v ∈ vertsOnFace f ∧ w ∈ vertsOnFace f ∧ v ≠ w)
theorem Lovasz_21
    {V : Type*} (G : SimpleGraph V) [DecidableEq V] [DecidableRel G.Adj]
    (Faces : Type*) (vertsOnFace : Faces → Set V)
    (hmap : SimplePlanarMap G Faces vertsOnFace) :
    ∃ c : V → Bool,
      ∀ f : Faces, ∃ v w : V,
        v ∈ vertsOnFace f ∧ w ∈ vertsOnFace f ∧ c v ≠ c w := by
  sorry
end p72_main

namespace p73_main
namespace Lovasz22
def neighFinset {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : Finset V :=
  Finset.univ.filter (fun w => G.Adj v w)
def gdeg {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (v : V) : ℕ :=
  (neighFinset G v).card
def IsRegularR {V : Type*} [Fintype V] (G : SimpleGraph V) [DecidableRel G.Adj] (r : ℕ) : Prop :=
  ∀ v : V, gdeg G v = r
def HasHamiltonianCycle {V : Type*} [Fintype V] [DecidableEq V]
    (G : SimpleGraph V) [DecidableRel G.Adj] : Prop :=
  ∃ cyc : List V,
    cyc.Nodup ∧
    cyc.length = Fintype.card V ∧
    (∀ v : V, v ∈ cyc) ∧
    cyc.Chain' G.Adj ∧
    match cyc with
    | [] => False
    | a :: _ =>
        match cyc.getLast? with
        | none => False
        | some l => G.Adj l a
theorem Lovasz_22
    {V : Type*} (G : SimpleGraph V)
    [Fintype V] [DecidableEq V] [DecidableRel G.Adj]
    (n r : ℕ)
    (hcard : Fintype.card V = 2 * n + 1)
    (hreg  : IsRegularR G r)
    (hdeg  : r ≥ n + 1) :
    HasHamiltonianCycle G := by
  sorry
end Lovasz22
end p73_main

namespace p74_main
def CrossCutting {V E : Type*} [Fintype V] [DecidableEq V]
    (vertsOf : E → Finset V) : Prop :=
  ∀ S : Finset V,
    S.Nonempty → S ≠ Finset.univ →
    ∃ e : E,
      (vertsOf e ∩ S).Nonempty ∧ (vertsOf e ∩ (Finset.univ \ S)).Nonempty

def CrossCuttingExcept {V E : Type*} [Fintype V] [DecidableEq V]
    (vertsOf : E → Finset V) (e0 : E) : Prop :=
  ∀ S : Finset V,
    S.Nonempty → S ≠ Finset.univ →
    ∃ e : E,
      e ≠ e0 ∧
      (vertsOf e ∩ S).Nonempty ∧ (vertsOf e ∩ (Finset.univ \ S)).Nonempty

theorem Lovasz_23
    (V E : Type*) [Fintype V] [DecidableEq V] [Fintype E]
    (vertsOf : E → Finset V)
    (n : ℕ) (hV : Fintype.card V = n)
    (hCross : CrossCutting (V := V) (E := E) vertsOf)
    (hMinimal : ∀ e0 : E, ¬ CrossCuttingExcept (V := V) (E := E) vertsOf e0) :
    Fintype.card E ≤ Nat.choose n (n / 2) := by
  sorry
end p74_main

end combinatorial_4_9
end BenchmarkData49
