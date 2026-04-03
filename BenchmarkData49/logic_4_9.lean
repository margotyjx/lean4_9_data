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
namespace logic_4_9

namespace p191_main
inductive NiceTerm
  | a | b | c | d
  | comp : NiceTerm → NiceTerm → NiceTerm
  deriving Repr
def render : NiceTerm → String
  | .a => "a"
  | .b => "b"
  | .c => "c"
  | .d => "d"
  | .comp s₁ s₂ => "[" ++ render s₁ ++ "∘" ++ render s₂ ++ "]"
def countChar (c : Char) (s : String) : Nat :=
  s.toList.count c
def IsProperInitialSegment (s t : String) : Prop :=
  s ≠ "" ∧ s.length < t.length ∧ s.isPrefixOf t = true
theorem open_logic_1
    (t : NiceTerm) {s : String}
    (h : IsProperInitialSegment s (render t)) :
    countChar '[' s > countChar ']' s := by
  sorry
end p191_main

namespace p192_main
theorem open_logic_2a :
    ¬ ∃ f : ℕ → Set ℕ, Function.Surjective f := by
  sorry
end p192_main

namespace p192_transformed
theorem open_logic_2b :
    ¬ Countable (Set ℕ) := by
  sorry
end p192_transformed

namespace p193_main
def sClosed {N : Type} (s : N → N) (o : N) (X : Set N) : Prop :=
  o ∈ X ∧ ∀ x ∈ X, s x ∈ X
def sClosure {N : Type} (s : N → N) (o : N) : Set N :=
  ⋂₀ {X : Set N | sClosed s o X}
structure DedekindAlgebra (N : Type) where
  s : N → N
  o : N
  o_not_in_range : o ∉ Set.range s
  s_inj : Function.Injective s
  carrier_is_closure : ∀ x : N, x ∈ sClosure s o
variable {N : Type} (A : DedekindAlgebra N)
theorem open_logic_3 (phi : N → Prop)
    (h0 : phi A.o)
    (hstep : ∀ n, phi n → phi (A.s n)) :
    ∀ n, phi n := by
  sorry
end p193_main

namespace p194_main
inductive M
  | one | two | three
  deriving DecidableEq, Repr
def cM : M := .three
def fM : M → M
  | .one   => .two
  | .two   => .three
  | .three => .three
def AM : M → M → Prop
  | .one,   .two   => True
  | .two,   .three => True
  | .three, .three => True
  | _,      _      => False
def s : ℕ → M := fun _ => M.one
def zVar : ℕ := 0
theorem open_logic_4 :
  ∃ x : M, (AM (fM (s zVar)) cM → ∀ y : M, AM y x ∨ AM (fM y) x) := by
  sorry
end p194_main

namespace p195_main
abbrev PartFun := ℕ →. ℕ
def enumeratesAllPartrec (phi : ℕ → PartFun) : Prop :=
  (∀ i, Nat.Partrec (phi i)) ∧ (∀ f : PartFun, Nat.Partrec f → ∃ i, phi i = f)
theorem open_logic_5
    (phi : ℕ → PartFun)
    (hEnum : enumeratesAllPartrec phi) :
    ¬ ∃ U : ℕ → ℕ → ℕ,
        (Computable (fun p : ℕ × ℕ => U p.1 p.2)) ∧
        (∀ k x, phi k x = Part.some (U k x)) := by
  sorry
end p195_main

namespace p196_main
inductive LFn : ℕ → Type
  | add : LFn 2
  | mul : LFn 2
  | z   : LFn 0
  | o   : LFn 0

def LRel : ℕ → Type := fun _ => Empty

def L : FirstOrder.Language where
  Functions := LFn
  Relations := LRel

inductive LcFn : ℕ → Type
  | ofL : ∀ n, L.Functions n → LcFn n
  | c   : LcFn 0

def LcRel : ℕ → Type := fun _ => Empty

def Lc : FirstOrder.Language where
  Functions := LcFn
  Relations := LcRel

instance NatLStructure : L.Structure ℕ where
  funMap := by
    intro n f
    cases f with
    | add =>
        intro v
        exact v 0 + v 1
    | mul =>
        intro v
        exact v 0 * v 1
    | z =>
        intro v
        exact 0
    | o =>
        intro v
        exact 1
  RelMap := by
    intro n r
    cases r

instance NatLcStructure (cVal : ℕ) : Lc.Structure ℕ where
  funMap := by
    intro n f
    cases f with
    | ofL n f' =>
        cases f' with
        | add =>
            intro v
            exact v 0 + v 1
        | mul =>
            intro v
            exact v 0 * v 1
        | z =>
            intro v
            exact 0
        | o =>
            intro v
            exact 1
    | c =>
        intro v
        exact cVal
  RelMap := by
    intro n r
    cases r

def ThNat : L.Theory := L.completeTheory ℕ

private def app0 {Λ : FirstOrder.Language} {M : Type} [Λ.Structure M]
    (f0 : Λ.Functions 0) : M :=
  let v0 : Fin 0 → M := fun i => nomatch i
  (inferInstance : Λ.Structure M).funMap f0 v0

def cValOf {M : Type} [Lc.Structure M] : M :=
  app0 (Λ := Lc) LcFn.c

def zeroOf {M : Type} [Lc.Structure M] : M :=
  app0 (Λ := Lc) (LcFn.ofL 0 LFn.z)

def oneOf {M : Type} [Lc.Structure M] : M :=
  app0 (Λ := Lc) (LcFn.ofL 0 LFn.o)

def addOf {M : Type} [Lc.Structure M] (x y : M) : M :=
  (inferInstance : Lc.Structure M).funMap
    (LcFn.ofL 2 LFn.add)
    (fun i : Fin 2 => Fin.cases x (fun _ => y) i)

def mulOf {M : Type} [Lc.Structure M] (x y : M) : M :=
  (inferInstance : Lc.Structure M).funMap
    (LcFn.ofL 2 LFn.mul)
    (fun i : Fin 2 => Fin.cases x (fun _ => y) i)

def nbarVal {M : Type} [Lc.Structure M] : Nat → M
  | 0     => zeroOf
  | n + 1 => addOf (nbarVal n) oneOf
theorem Manin_Zilber_6 :
  ∃ (M : Type) (I : Lc.Structure M) (J : L.Structure M),
    (∀ (n : Nat) (f : L.Functions n) (v : Fin n → M),
       J.funMap f v = I.funMap (LcFn.ofL n f) v) ∧
    (∀ (phi : L.Sentence), ThNat phi →
       @FirstOrder.Language.Sentence.Realize L M J phi) ∧
    (∀ n : Nat, @cValOf M I ≠ @nbarVal M I n) := by
  sorry
end p196_main

namespace p197_main
theorem Klement_7
    {n : Nat}
    (f  : (Fin n → ℕ) → ℕ)
    (χ  : ((Fin n → ℕ) × ℕ) → Bool)
    (hχ : Computable χ)
    (spec : ∀ x y, χ (x, y) = true ↔ y = f x) :
    Computable f := by
  sorry
end p197_main

namespace p198_main
theorem open_logic_8 :
  ∀ (Y : Set ℕ), (Yᶜ).Finite → ∃ k : ℕ, ∃ F : Finset ℕ, Y = {x | k ≤ x} ∪ (↑F : Set ℕ) := by
  sorry
end p198_main

namespace p199_main
theorem open_logic_9 (α β : Ordinal) :
  α < β ∨ β < α ∨ α = β := by
  sorry
end p199_main

namespace p200_main
theorem Kueker_10
  (L' : FirstOrder.Language) (T : L'.Theory) :
  ∃ (M0 M1 M2 : Type)
    (I0 : L'.Structure M0) (I1 : L'.Structure M1) (I2 : L'.Structure M2),
    (∀ (N : Type) (IN : L'.Structure N),
       Countable N →
       (∀ (sent : L'.Sentence), T sent → @FirstOrder.Language.Sentence.Realize L' N IN sent) →
       (Nonempty (L'.Equiv N M0) ∨
        Nonempty (L'.Equiv N M1) ∨
        Nonempty (L'.Equiv N M2))) ∧
    (IsEmpty (L'.Equiv M0 M1)) ∧
    (IsEmpty (L'.Equiv M0 M2)) ∧
    (IsEmpty (L'.Equiv M1 M2)) := by
  sorry
end p200_main

namespace p201_main
structure NTStructure where
  M   : Type
  zero : M
  succ : M → M
  add  : M → M → M
  mul  : M → M → M
  exp  : M → M → M
  lt   : M → M → Prop
  ax1 : ∀ x : M, succ x ≠ zero
  ax2 : ∀ ⦃x y : M⦄, succ x = succ y → x = y
  ax3 : ∀ x : M, add x zero = x
  ax4 : ∀ x y : M, add x (succ y) = succ (add x y)
  ax5 : ∀ x : M, mul x zero = zero
  ax6 : ∀ x y : M, mul x (succ y) = add (mul x y) x
  ax7 : ∀ x : M, exp x zero = succ zero
  ax8 : ∀ x y : M, exp x (succ y) = mul (exp x y) x
  ax9 : ∀ x : M, ¬ lt x zero
  ax10 : ∀ x y : M, lt x (succ y) ↔ (lt x y ∨ x = y)
  ax11 : ∀ x y : M, lt x y ∨ x = y ∨ lt y x

theorem Leary_Kristiansen_11 :
  ∃ A : NTStructure, ∃ a : A.M, A.lt a a := by
  sorry
end p201_main

namespace p202_main
theorem Leary_Kristiansen_12
  (L : FirstOrder.Language)
  (A : Type) (IA : L.Structure A)
  (hAinf : Infinite A) :
  ¬ ∃ (Sigma : L.Theory),
      ∀ (B : Type) (IB : L.Structure B),
        (Nonempty (L.Equiv B A)) ↔
        (∀ (sent : L.Sentence), Sigma sent →
           @FirstOrder.Language.Sentence.Realize L B IB sent) := by
  sorry
end p202_main

namespace p203_main
theorem Manin_Zilber_13
  {n : Nat}
  (p : MvPolynomial (Fin n) ℝ) :
  let l1 : (Fin n → ℝ) → ℝ := fun x => ∑ i, |x i|
  let pEval : (Fin n → ℝ) → ℝ := fun x => MvPolynomial.eval₂Hom (RingHom.id ℝ) x p
  let f : ℝ → ℝ := fun r => sInf ((fun x => pEval x) '' {x | l1 x = r})
  (hunbdd : ∀ R > 0, ∃ rR : ℝ, ∀ r : ℝ, r > rR → f r > R) →
  ∃ a : ℚ, 0 < (a : ℝ) ∧ ∃ c : ℝ, 0 < c ∧
    Filter.Tendsto (fun r : ℝ => r ^ (-(a : ℝ)) * f r) Filter.atTop (nhds c) := by
  sorry
end p203_main

namespace p204_main
def isTotal (phi : ℕ → (ℕ →. ℕ)) (e : ℕ) : Prop :=
  ∀ x : ℕ, (phi e x).Dom

def enumeratesAllPartrec (phi : ℕ → (ℕ →. ℕ)) : Prop :=
  (∀ i, Nat.Partrec (phi i)) ∧
  (∀ f : ℕ →. ℕ, Nat.Partrec f → ∃ i, phi i = f)

theorem Leary_Kristiansen_14
  (phi : ℕ → (ℕ →. ℕ))
  (hEnum : enumeratesAllPartrec phi) :
  ¬ ∃ χ : ℕ → Bool,
      Computable χ ∧
      ∀ e : ℕ, χ e = true ↔ isTotal phi e := by
  sorry
end p204_main

namespace p205_main
inductive BTFunc : ℕ → Type
  | zero : BTFunc 0
  | one  : BTFunc 0
  | e    : BTFunc 0
  | circ : BTFunc 2

def BTRel : ℕ → Type := fun _ => Empty

def LBT : FirstOrder.Language where
  Functions := BTFunc
  Relations := BTRel

private def app0BT {M : Type} [LBT.Structure M]
    (f0 : LBT.Functions 0) : M :=
  let v0 : Fin 0 → M := fun i => nomatch i
  (inferInstance : LBT.Structure M).funMap f0 v0

def zeroBT {M : Type} [LBT.Structure M] : M :=
  app0BT BTFunc.zero

def oneBT {M : Type} [LBT.Structure M] : M :=
  app0BT BTFunc.one

def eBT {M : Type} [LBT.Structure M] : M :=
  app0BT BTFunc.e

def circBT {M : Type} [LBT.Structure M] (x y : M) : M :=
  (inferInstance : LBT.Structure M).funMap
    BTFunc.circ
    (fun i : Fin 2 => Fin.cases x (fun _ => y) i)

theorem Leary_Kristiansen_15 :
  ∃ (M : Type) (_I : LBT.Structure M),
    (∀ x : M, x = circBT eBT x) ∧
    (∀ x : M, x = circBT x eBT) ∧
    (∀ x y z : M, circBT (circBT x y) z = circBT x (circBT y z)) ∧
    (∀ x : M, circBT zeroBT x ≠ eBT ∧ circBT oneBT x ≠ eBT) ∧
    (∀ x y : M, x ≠ y →
        circBT zeroBT x ≠ circBT zeroBT y ∧
        circBT oneBT x ≠ circBT oneBT y) ∧
    (∀ x y : M, circBT zeroBT x ≠ circBT oneBT y) ∧
    ∃ x : M,
      x ≠ eBT ∧
      (∀ y : M, circBT zeroBT y ≠ x ∧ circBT oneBT y ≠ x) := by
  sorry
end p205_main

namespace p210_main
axiom L_or : FirstOrder.Language
axiom IsOmegaSaturated : ∀ (M : Type _) (I : L_or.Structure M), Prop
theorem Henson_Ward_20
  (K : Type _) [LinearOrderedField K]
  (I : L_or.Structure K)
  (hcnt : Countable K) :
  ¬ IsOmegaSaturated K I := by
  sorry
end p210_main

namespace p211_main
inductive MulFn : ℕ → Type
| mul : MulFn 2

def Lmul : FirstOrder.Language where
  Functions := MulFn
  Relations := fun _ => Empty

instance : Lmul.Structure ℕ where
  funMap := by
    intro n f
    cases f
    intro v
    exact v 0 * v 1
  RelMap := by
    intro n r
    cases r

def AddGraph : ℕ × ℕ × ℕ → Prop
| (m, n, p) => p = m + n

def DefinableInMul (R : ℕ × ℕ × ℕ → Prop) : Prop :=
  ∃ phi : Lmul.Formula (Fin 3),
    ∀ x : Fin 3 → ℕ,
      phi.Realize x ↔ R (x 0, x 1, x 2)

theorem Enderton_Herbert_21 :
    ¬ DefinableInMul AddGraph := by
  sorry
end p211_main

namespace p212_main
class IsRingTheoryEncoding
  (Lring : FirstOrder.Language)
  (RingTh : Lring.Theory)
  (code : Lring.Sentence → ℕ)
  (ProvableRing : Lring.Sentence → Prop) : Prop :=
  (trivial : True)

theorem Dries_Lou_22
  (Lring : FirstOrder.Language)
  (RingTh : Lring.Theory)
  (code : Lring.Sentence → ℕ)                           -- Gödel coding of sentences
  (ProvableRing : Lring.Sentence → Prop)               -- “RingTh ⊢ phi”
  (h_enc : IsRingTheoryEncoding Lring RingTh code ProvableRing) :
  ¬ ∃ χ : ℕ → Bool, Computable χ ∧
      ∀ (phi : Lring.Sentence),
        χ (code phi) = true ↔ ProvableRing phi := by
  sorry
end p212_main

namespace p213_main
axiom FormulaZ : Type
axiom RealizeZ : FormulaZ → Int → Prop
def DefinableInZ (S : Set Int) : Prop :=
  ∃ phi : FormulaZ, ∀ z : Int, z ∈ S ↔ RealizeZ phi z
def EventuallyPeriodic (A : Set Nat) : Prop :=
  ∃ N p : Nat,
    0 < p ∧
    ∀ n : Nat, N ≤ n → (n ∈ A ↔ n + p ∈ A)
theorem Henson_Ward_23 (S : Set Int) :
  DefinableInZ S ↔
    ∃ (A B : Set Nat),
      EventuallyPeriodic A ∧ EventuallyPeriodic B ∧
      S = { z : Int |
             (∃ n : Nat, n ∈ A ∧ z = - (Int.ofNat n)) ∨
             (∃ n : Nat, n ∈ B ∧ z =  Int.ofNat n) } := by
  sorry
end p213_main

namespace p214_main
theorem Enderton_Herbert_24
  (α β : Type*)
  [LinearOrder α] [DenselyOrdered α] [NoMinOrder α] [NoMaxOrder α] [Countable α]
  [LinearOrder β] [DenselyOrdered β] [NoMinOrder β] [NoMaxOrder β] [Countable β] :
  Nonempty (OrderIso α β) := by
 sorry
end p214_main

namespace p215_main
inductive NSFunc : ℕ → Type
  | zero : NSFunc 0
  | succ : NSFunc 1

def NSRel : ℕ → Type := fun _ => PEmpty

def L_NS : FirstOrder.Language where
  Functions := NSFunc
  Relations := NSRel

instance NSStruct : L_NS.Structure ℕ where
  funMap := by
    intro n f
    cases f with
    | zero =>
        intro _
        exact 0
    | succ =>
        intro v
        exact v 0 + 1
  RelMap := by
    intro n r
    cases r

def Definable₂ (R : ℕ → ℕ → Prop) : Prop :=
  ∃ phi : L_NS.Formula (Fin 2),
    ∀ (m n : ℕ),
      R m n ↔
        phi.Realize (fun i : Fin 2 =>
          if (i : ℕ) = 0 then m else n)

theorem Enderton_Herbert_25 :
  ¬ Definable₂ (fun m n => m < n) := by
  sorry
end p215_main

namespace p216_main
theorem logic_prob_26
  (L : FirstOrder.Language)
  -- a property of L-structures
  (P : ∀ (M : Type u), L.Structure M → Prop)
  -- theory whose models are exactly the structures with property P
  (T : L.Theory)
  -- predicate for "model of T"
  (Models_T : ∀ {M : Type u}, L.Structure M → Prop)
  -- predicate for "model of T∀"
  (Models_Tforall : ∀ {M : Type u}, L.Structure M → Prop)
  -- substructure relation
  (IsSubstructure :
    ∀ (N M : Type u), L.Structure N → L.Structure M → Prop)
  -- P is elementary: models of T ↔ has property P
  (P_is_elementary :
    ∀ (M : Type u) (I : L.Structure M), Models_T I ↔ P M I)
  -- P is closed under substructures
  (P_closed_under_substructures :
    ∀ {M N : Type u} {IM : L.Structure M} {IN : L.Structure N},
      IsSubstructure N M IN IM → P M IM → P N IN) :
  ∀ (M : Type u) (I : L.Structure M),
    Models_Tforall I ↔ P M I := by
  sorry
end p216_main

end logic_4_9
end BenchmarkData49
