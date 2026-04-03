import Mathlib
import Aesop

set_option maxHeartbeats 0

universe u v w

open BigOperators Real Nat Topology Rat
open Filter
open MeasureTheory

/-- Dataset placeholder: some rows reference this name without a full definition in the source JSONL. -/
noncomputable def integralOverSquareBoundary : ℂ := 0

namespace p228_main
theorem problem_1a
  (μx μy : MeasureTheory.Measure ℝ)
  [MeasureTheory.IsProbabilityMeasure μx]
  [MeasureTheory.IsProbabilityMeasure μy] :
  let μ : MeasureTheory.Measure (ℝ × ℝ) := MeasureTheory.Measure.prod μx μy
  μ ({ω : ℝ × ℝ | ω.1 > (1 : ℝ) / 3} ∩ {ω : ℝ × ℝ | ω.2 > (2 : ℝ) / 3})
    = μ {ω : ℝ × ℝ | ω.1 > (1 : ℝ) / 3}
      * μ {ω : ℝ × ℝ | ω.2 > (2 : ℝ) / 3} := by
  sorry
end p228_main

namespace p228_transformed
theorem problem_1b
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (dir : ℝ → Ω → ℝ) :
  ∀ (S T : Set ℝ), MeasurableSet S → MeasurableSet T →
    μ {ω : Ω | dir 5 ω ∈ S ∧ dir 10 ω ∈ T}
      = μ {ω : Ω | dir 5 ω ∈ S} * μ {ω : Ω | dir 10 ω ∈ T} := by
  sorry
end p228_transformed

namespace p229_main
noncomputable def uniformFin (N : ℕ) : MeasureTheory.Measure (Fin N) :=
  ((1 : ENNReal) / N) •
    (MeasureTheory.Measure.count : MeasureTheory.Measure (Fin N))

def IsUniformDraw
    {Ω : Type*} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    (N : ℕ) (coupon : Ω → Fin N) : Prop :=
  MeasureTheory.Measure.map coupon μ = uniformFin N

def IsIndependentDraws
    {Ω : Type*} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    (N : ℕ) (coupon : ℕ → Ω → Fin N) : Prop :=
  ProbabilityTheory.iIndepFun
    (β := fun _ : ℕ => Fin N)
    (m := fun _ : ℕ => inferInstance)
    coupon μ

def seenUpToCC
    {Ω : Type*}
    (N : ℕ) (coupon : ℕ → Ω → Fin N) (t : ℕ) (ω : Ω) :
    Finset (Fin N) :=
  (Finset.range (t + 1)).image (fun i => coupon i ω)

def IsCouponCollectorTime
    {Ω : Type*}
    (N : ℕ) (coupon : ℕ → Ω → Fin N) (X : Ω → ℕ) : Prop :=
  ∀ ω,
    (seenUpToCC N coupon (X ω) ω = Finset.univ) ∧
    (∀ t, t < X ω → seenUpToCC N coupon t ω ≠ Finset.univ)

theorem coupon_collector_expected_value
    (N : ℕ) (hN : 0 < N)
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (coupon : ℕ → Ω → Fin N)
    (X : Ω → ℕ)
    (h_uniform : ∀ t, IsUniformDraw μ N (coupon t))
    (h_indep : IsIndependentDraws μ N coupon)
    (hX : IsCouponCollectorTime N coupon X) :
    (∫ ω, (X ω : ℝ) ∂μ)
      = (N : ℝ) * (∑ k in Finset.range N, (1 : ℝ) / (k + 1)) := by
  sorry
end p229_main

namespace p229_transformed
def seenUpTo {Ω : Type*} {N : ℕ} (c : ℕ → Ω → Fin N) (n : ℕ) (ω : Ω) : Finset (Fin N) :=
  (Finset.range (n + 1)).image (fun i => c i ω)

def timeToSeeAll {Ω : Type*} {N : ℕ} (c : ℕ → Ω → Fin N)
    (hCover : ∀ ω : Ω, ∃ n : ℕ, seenUpTo c n ω = (Finset.univ : Finset (Fin N))) :
    Ω → ℕ :=
  fun ω => Nat.find (hCover ω)

theorem problem_2b
    (N : ℕ) (hN : 0 < N)
    (Ω : Type*)
    [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (c : ℕ → Ω → Fin N)
    (hCover : ∀ ω : Ω, ∃ n : ℕ,
      seenUpTo c n ω = (Finset.univ : Finset (Fin N))) :
    (∫ ω, (timeToSeeAll c hCover ω : ℝ) ∂μ)
      = (N : ℝ) * ∑ k in Finset.range N, (1 / ((k + 1 : ℕ) : ℝ)) := by
  sorry
end p229_transformed

namespace p230_main
theorem problem_3a (n : ℕ) :
  ((Finset.range (n + 1)).image
      (fun k : ℕ => (fun i : Fin n => if i.val < k then false else true))).card
    = n + 1 := by
  sorry
end p230_main

namespace p230_transformed
theorem problem_3b (n : ℕ) :
  (↑{ω : Fin n → Bool |
      ∃ k ≤ n, (∀ i, i.val < k → ω i = true) ∧ (∀ j, k ≤ j.val → ω j = false)}.ncard : ℝ)
    / (2^n : ℝ)
    = (n+1 : ℝ) / (2^n : ℝ) := by
  sorry
end p230_transformed

namespace p231_main
theorem problem_4_combined :
  let total := Nat.choose 52 13
  let noAce := Nat.choose 48 13
  let exactlyOneAce := (Nat.choose 4 1) * (Nat.choose 48 12)
  let atLeastOne := total - noAce
  let atLeastTwo := atLeastOne - exactlyOneAce
  let hands_with_spades := Nat.choose 51 12
  let hands_with_spades_only := Nat.choose 48 12
  ((atLeastTwo : ℚ) / atLeastOne = 1 - (exactlyOneAce : ℚ) / atLeastOne) ∧
  ((1 - (hands_with_spades_only : ℚ) / hands_with_spades)
      = 1 - (Nat.choose 48 12 : ℚ) / (Nat.choose 51 12 : ℚ)) := by
  sorry
end p231_main

namespace p232_main
theorem problem_5
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (c : ℝ)
  (hc : c = ∑' k : ℕ+, (1 : ℝ) / ((k : ℝ) ^ 3))
  (R : Ω → ℕ)
  (hR_pos : ∀ᵐ ω ∂P, 1 ≤ R ω)
  (hR_dist : ∀ n : ℕ, 1 ≤ n →
    P {ω | R ω = n} = ENNReal.ofReal (1 / (c * (n : ℝ) ^ 3))) :
  MeasureTheory.Integrable (fun ω ↦ (R ω : ℝ)) P ∧
  ¬ MeasureTheory.Integrable (fun ω ↦ (R ω : ℝ) ^ 2) P := by
  sorry
end p232_main

namespace p232_transformed
theorem transformed_problem_5
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (X : Ω → ℕ)
  (c : ℝ)
  (hc : c = ∑' n : ℕ+, (1 : ℝ) / ((n : ℝ) ^ 3))
  (h_pdf : ∀ n : ℕ, 1 ≤ n →
    P {ω | X ω = n} = ENNReal.ofReal (1 / (c * (n : ℝ) ^ 3))) :
  MeasureTheory.Integrable (fun ω => (X ω : ℝ)) P ∧
  ¬ MeasureTheory.Integrable (fun ω => (X ω : ℝ) ^ 2) P := by
  sorry
end p232_transformed

namespace p233_main
theorem problem_6
  (p q : ℝ) (hp : 0 < p ∧ p < 1) (hq : q = 1 - p)
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (X : ℕ → Ω → ℤ)
  (h_meas : ∀ n, Measurable (X n))
  (h_indep : Pairwise (fun i j : ℕ => ProbabilityTheory.IndepFun (X i) (X j) μ))
  (h_dist : ∀ n, μ {ω | X n ω = 1} = ENNReal.ofReal p ∧
                 μ {ω | X n ω = -1} = ENNReal.ofReal q) :
  let S : ℕ → Ω → ℤ := fun n ω => ∑ i in Finset.range n, X i ω
  True := by
  sorry
end p233_main

namespace p233_transformed
theorem transformed_problem_6
  (h : ℝ) (hh : 0 < h ∧ h < 1)
  (q : ℝ) (hq : q = 1 - h)
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (Y : ℕ → Ω → ℤ)
  (h_meas : ∀ n, Measurable (Y n))
  (h_indep : Pairwise (fun i j : ℕ => ProbabilityTheory.IndepFun (Y i) (Y j) μ))
  (h_dist : ∀ n,
      μ {ω | Y n ω = 1} = ENNReal.ofReal h ∧
      μ {ω | Y n ω = -1} = ENNReal.ofReal q) :
  let W : ℕ → Ω → ℤ := fun n ω => (1 : ℤ) + ∑ i in Finset.range n, Y i ω
  let τ : Ω → ℕ := fun ω => sInf {n : ℕ | W n ω = 0}
  let K : ℝ := ∫ ω, (τ ω : ℝ) ∂μ
  K = 1 + 2 * K * h := by
  sorry
end p233_transformed

namespace p234_main
theorem problem_7:
  let Ω : Finset (Bool × Bool) := Finset.univ
  let prob : Finset (Bool × Bool) → ℝ := fun E => (E.card : ℝ) / Ω.card
  let A : Finset (Bool × Bool) := Ω.filter (fun ω => ω.1 = true)
  let B : Finset (Bool × Bool) := Ω.filter (fun ω => ω.2 = false)
  prob (A ∩ B) = prob A * prob B := by
  sorry
end p234_main

namespace p234_transformed
theorem transformed_problem_7
  (Outcomes : Finset ℕ)
  (Even Odd : Finset ℕ)
  (h_subset_E : Even ⊆ Outcomes)
  (h_subset_O : Odd ⊆ Outcomes)
  (h_nonempty : Outcomes.Nonempty) :
  let Ω := Outcomes ×ˢ Outcomes
  let prob := fun (E : Finset (ℕ × ℕ)) => (E.card : ℝ) / Ω.card
  let EventA := Ω.filter (fun ω => ω.1 ∈ Even)
  let EventB := Ω.filter (fun ω => ω.2 ∈ Odd)
  prob (EventA ∩ EventB) = prob EventA * prob EventB := by
  sorry
end p234_transformed

namespace p235_main
theorem problem_8
  (n : ℕ) (hn : 0 < n) :
  let Ω := Fin n × Fin n
  let same_birthday := {p : Ω | p.1 = p.2}
  (Finset.univ.filter (fun p : Ω => p.1 = p.2)).card / (n : ℝ)^2 = 1 / (n : ℝ) := by
  sorry
end p235_main

namespace p235_transformed
theorem transformed_problem_8
  (n : ℕ) (h_n : n = 1000)
  (marked_needle : Fin n) :
  let Ω : Finset (Fin n) := Finset.univ
  let event : Finset (Fin n) := {marked_needle}
  (event.card : ℝ) / Ω.card = 1 / 1000 := by
  sorry
end p235_transformed

namespace p236_main
theorem problem_9
  (k : ℕ) :
    let all_seqs : Finset (Fin k → Fin 10) := Finset.univ
    let no_zero_seqs := all_seqs.filter (fun s => ∀ i, s i ≠ 0)
    (no_zero_seqs.card : ℝ) / all_seqs.card = (9 / 10 : ℝ) ^ k := by
  sorry
end p236_main

namespace p236_transformed
theorem transformed_problem_9
  (m : ℕ) :
    let alphabet : Finset (Fin 26) := Finset.univ
    let excluded : Finset (Fin 26) := {0, 1, 2}
    let all_poems : Finset (Fin m → Fin 26) := Finset.univ
    let restricted_poems := all_poems.filter (fun s => ∀ i, s i ∉ excluded)
    (restricted_poems.card : ℝ) / all_poems.card = (23 / 26 : ℝ) ^ m := by
  sorry
end p236_transformed

namespace p237_main
theorem problem_10
  (prob_choose_deck : ℝ) (h_choose : prob_choose_deck = 1 / 2)
  (size_complete : ℕ) (h_complete : size_complete = 52)
  (size_incomplete : ℕ) (h_incomplete : size_incomplete = 51) :
  let p_card_given_complete : ℝ := 1 / size_complete
  let p_card_given_incomplete : ℝ := 1 / size_incomplete
  let p_card_total : ℝ := p_card_given_complete * prob_choose_deck + p_card_given_incomplete * prob_choose_deck
  (p_card_given_complete * prob_choose_deck) / p_card_total = 51 / 103 := by
  sorry
end p237_main

namespace p237_transformed
theorem transformed_problem_10
  (prob_choose_set : ℝ) (h_prob : prob_choose_set = 1 / 2)
  (n_full : ℕ) (h_full : n_full = 34)
  (n_missing : ℕ) (h_missing : n_missing = 33)
  (k_queens : ℕ) (h_queens : k_queens = 2) :
  let p_queen_given_full : ℝ := k_queens / n_full
  let p_queen_given_missing : ℝ := k_queens / n_missing
  let p_queen_total : ℝ := p_queen_given_full * prob_choose_set + p_queen_given_missing * prob_choose_set
  (p_queen_given_full * prob_choose_set) / p_queen_total = 32 / 65 := by
  sorry
end p237_transformed

namespace p238_main
theorem problem_11
  (n : ℕ) :
    {p : ℕ × ℕ | p.1 + p.2 = n}.ncard = n + 1 := by
  sorry
end p238_main

namespace p238_transformed
theorem transformed_problem_11
  (k : ℕ)
  (n : ℕ)
  (h_reachable : n ≤ k) :
  let Ω := Fin k → Bool
  let success_event : Finset Ω := Finset.univ.filter (fun ω => (Finset.univ.filter (fun i => ω i = true)).card = n)
  (success_event.card : ℝ) / (Finset.univ : Finset Ω).card = (Nat.choose k n : ℝ) / (2 ^ k : ℝ) := by
  sorry
end p238_transformed

namespace p239_main
theorem problem_12
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (A B : Set Ω) (hA : MeasurableSet A) (hB : MeasurableSet B) :
  ProbabilityTheory.IndepFun
      (A.indicator (fun _ ↦ (1 : ℝ)))
      (B.indicator (fun _ ↦ (1 : ℝ)))
      μ
    ↔ ProbabilityTheory.IndepSet A B μ := by
  sorry
end p239_main

namespace p240_main
theorem problem_13 :
  let n := 215
  let k := 200
  let p_show : ℝ := 1 - 0.1
  let prob_m_show (m : ℕ) : ℝ :=
    (Nat.choose n m : ℝ) * (p_show ^ m) * ((1 - p_show) ^ (n - m))
  let prob_all_get_rooms : ℝ :=
    ∑ m in Finset.range (k + 1), prob_m_show m
  dist prob_all_get_rooms 0.95 < 0.01 := by
  sorry
end p240_main

namespace p240_transformed
theorem transformed_problem_13
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (Y : Fin 215 → Ω → ℕ)
    (h_indep :
      ProbabilityTheory.iIndepFun
        (β := fun _ : Fin 215 => ℕ)
        (m := fun _ : Fin 215 => inferInstance)
        Y μ)
    (h_dist : ∀ i,
      μ {ω | Y i ω = 1} = ENNReal.ofReal ((9 : ℝ) / 10) ∧
      μ {ω | Y i ω = 0} = ENNReal.ofReal ((1 : ℝ) / 10)) :
    let X : Ω → ℕ := fun ω => ∑ i, Y i ω
    μ {ω | X ω ≤ 200} = ENNReal.ofReal (∑ k in Finset.range 201,
      (Nat.choose 215 k : ℝ) *
      (((9 : ℝ) / 10) ^ k) *
      (((1 : ℝ) / 10) ^ (215 - k))) := by
  sorry
end p240_transformed

namespace p241_main
theorem problem_14
  (p : ℝ) (hp : 0 < p ∧ p < 1)
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (X : ℕ → Ω → Bool)
  (h_meas : ∀ n, Measurable (X n))
  (h_indep : Pairwise (fun i j : ℕ => ProbabilityTheory.IndepFun (X i) (X j) μ))
  (h_dist : ∀ n, μ {ω | X n ω = true} = ENNReal.ofReal p) :
  ∀ p' : ℝ, 0 < p' ∧ p' < 1 →
    (1 : ℝ) / ((1 / 3 : ℝ) * (1 - 1 / 3 : ℝ)^2) ≤
      (1 : ℝ) / (p' * (1 - p')^2) := by
  sorry
end p241_main

namespace p241_transformed
theorem transformed_problem_14
  (p : ℝ) (hp : 0 < p ∧ p < 1)
  (E : ℕ → ℝ)
  (h0 : E 0 = 1 + p * E 0 + (1 - p) * E 1)
  (h1 : E 1 = 1 + p * E 0 + (1 - p) * E 2)
  (h2 : E 2 = p * 1 + (1 - p) * (1 + E 0)) :
  ∀ (q : ℝ) (hq : 0 < q ∧ q < 1) (F : ℕ → ℝ),
    (F 0 = 1 + q * F 0 + (1 - q) * F 1) →
    (F 1 = 1 + q * F 0 + (1 - q) * F 2) →
    (F 2 = q * 1 + (1 - q) * (1 + F 0)) →
    E 0 ≤ F 0 := by
  sorry
end p241_transformed

namespace p242_main
theorem problem_15 :
  let ranks : Finset (Fin 6) := Finset.univ
  let deck  : List (Fin 6) := ranks.toList ++ ranks.toList
  let Ω : Finset (List (Fin 6)) := deck.permutations.toFinset
  let X (l : List (Fin 6)) : ℚ :=
    (Finset.range 11).sum (fun i =>
      if l[i]! = l[i+1]! then (1 : ℚ) else 0)
  ((∑ l in Ω, X l) : ℚ) / (Ω.card : ℚ) = 1 := by
  sorry
end p242_main

namespace p242_transformed
theorem transformed_problem_15 :
  let couples : Finset (Fin 6) := Finset.univ
  let people : List (Fin 6 × Bool) :=
    List.bind couples.toList (fun c => [(c, false), (c, true)])
  let Ω : Finset (List (Fin 6 × Bool)) := people.permutations.toFinset
  let X (l : List (Fin 6 × Bool)) : ℚ :=
    (Finset.range 11).sum (fun i =>
      if (l[i]!).1 = (l[i + 1]!).1 then (1 : ℚ) else 0)
  ((∑ l in Ω, X l) : ℚ) / (Ω.card : ℚ) = 1 := by
  sorry
end p242_transformed

namespace p243_main
theorem problem_16
  (scores : Fin 120 → ℝ)
  (h_nonneg : ∀ i, 0 ≤ scores i)
  (h_mean : (∑ i, scores i) / 120 = 90) :
  (Finset.univ.filter (fun i => 180 ≤ scores i)).card ≤ 60 := by
  sorry
end p243_main

namespace p243_transformed
theorem transformed_problem_16
  (consumption : Fin 1200 → ℝ)
  (h_nonneg : ∀ i, 0 ≤ consumption i)
  (h_mean : (∑ i, consumption i) / 1200 = 9) :
  (Finset.univ.filter (fun i => 18 ≤ consumption i)).card ≤ 600 := by
  sorry
end p243_transformed

namespace p244_main
theorem problem_17 :
  let μ : MeasureTheory.Measure ℝ :=
    MeasureTheory.Measure.restrict MeasureTheory.volume (Set.Icc 0 1)
  let A : Set ℝ := Set.Ioi (1 / 2 : ℝ)
  let B : Set ℝ := Set.Iio (3 / 4 : ℝ)
  (μ (A ∩ B)).toReal / (μ B).toReal = 1 / 3 := by
  sorry
end p244_main

namespace p244_transformed
theorem transformed_problem_17 :
  let μ : MeasureTheory.Measure ℝ :=
    MeasureTheory.Measure.restrict MeasureTheory.volume (Set.Icc 0 10000)
  let declined_7500 : Set ℝ := {x | x < 7500}
  let accept_5000 : Set ℝ := {x | x ≥ 5000}
  (μ (accept_5000 ∩ declined_7500)).toReal / (μ declined_7500).toReal = 1 / 3 := by
  sorry
end p244_transformed

namespace p245_main
theorem problem_18
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (B : ℝ → Ω → ℝ) :
  μ { ω | ∀ M : ℝ, ∃ t : ℝ, 0 ≤ t ∧ B t ω > M } = 1 := by
  sorry
end p245_main

namespace p246_main
theorem problem_19
    {Ω : Type*} [m : MeasurableSpace Ω]
    {μ : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure μ]
    {ℱ : MeasureTheory.Filtration ℕ m}
    (X : ℕ → Ω → ℝ)
    (h_mart : MeasureTheory.Martingale X ℱ μ)
    (h_ident : ∀ n, ProbabilityTheory.IdentDistrib (X n) (X 0) μ μ)
    (h_finite_mom : ∀ n, MeasureTheory.Memℒp (X n) (2 : ENNReal) μ) :
    ∀ n, X n =ᵐ[μ] X 0 := by
  sorry
end p246_main

namespace p247_main
theorem problem_20
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (X : Ω → ℝ)
  (h_bounded : P {ω | X ω > 1} = 0)
  (h_support : ∀ ε > 0, P {ω | X ω > 1 - ε} > 0) :
  let M := fun (θ : ℝ) => ∫ ω, Real.exp (θ * X ω) ∂P
  let I := fun (x : ℝ) => ⨆ θ : ℝ, ((θ * x - Real.log (M θ)) : EReal)
  ∀ x > 1, I x = ⊤ := by
  sorry
end p247_main

namespace p248_main
theorem problem_21
  (n : ℕ) :
  let Ω : Finset (Fin (2 * n) → Bool) :=
    Finset.univ.filter (fun f => (Finset.univ.filter (fun i => f i = true)).card = n)
  let expected_score : ℝ := (∑ f in Ω, ∑ i : Fin (2 * n),
    let past := Finset.filter (fun j : Fin (2 * n) => j < i) Finset.univ
    let rem_red := n - (past.filter (fun j => f j = true)).card
    let rem_black := n - (past.filter (fun j => f j = false)).card
    if rem_red > rem_black then (if f i = true then (1 : ℝ) else 0)
    else if rem_black > rem_red then (if f i = false then (1 : ℝ) else 0)
    else 0.5) / Ω.card
  expected_score = n + 0.5 * ((4^n : ℝ) / (Nat.choose (2 * n) n : ℝ) - 1) := by
  sorry
end p248_main

namespace p249_main
theorem problem_22
  (T : ℝ) (hT : T = 20)
  (stop_X : ℝ) (hX : stop_X = 4)
  (stop_Y : ℝ) (hY : stop_Y = 5) :
  let Ω : Set (ℝ × ℝ) := Set.Icc 0 T ×ˢ Set.Icc 0 T
  let measure : MeasureTheory.Measure (ℝ × ℝ) :=
    MeasureTheory.Measure.restrict MeasureTheory.volume Ω
  let Event : Set (ℝ × ℝ) := {p | p ∈ Ω ∧ p.1 ≤ p.2 ∧ p.2 ≤ p.1 + stop_X}
  (measure Event).toReal / (measure Ω).toReal = 72 / 400 := by
  sorry
end p249_main

namespace p249_transformed
theorem transformed_problem_22
  (T : ℝ) (hT : T = 100)
  (stay_Jake : ℝ) (h_Jake : stay_Jake = 20)
  (stay_John : ℝ) (h_John : stay_John = 25) :
  let Ω : Set (ℝ × ℝ) := Set.Icc 0 T ×ˢ Set.Icc 0 T
  let measure : MeasureTheory.Measure (ℝ × ℝ) :=
    MeasureTheory.Measure.restrict MeasureTheory.volume Ω
  let Event : Set (ℝ × ℝ) := {p | p ∈ Ω ∧ p.1 ≤ p.2 ∧ p.2 ≤ p.1 + stay_Jake}
  (measure Event).toReal / (measure Ω).toReal = 9 / 50 := by
  sorry
end p249_transformed

namespace p250_main
theorem problem_23
  (p : ℝ) (hp : 0 < p ∧ p < 1) (hp_ne : p ≠ 1/2)
  (a b : ℤ) (ha : a ≤ -1) (hb : 1 ≤ b)
  (E_tau : ℝ) :
  let q := 1 - p
  let ρ := q / p
  let P_b := (1 - ρ ^ (a : ℝ)) / (ρ ^ (b : ℝ) - ρ ^ (a : ℝ))
  E_tau = (b * P_b + a * (1 - P_b)) / (2 * p - 1) := by
  sorry
end p250_main

namespace p251_main
theorem problem_24
  (f : ℝ → ℝ)
  (h_cont : Continuous f)
  (h_zero : f 0 = 1)
  (h_even : ∀ t, f t = f (-t))
  (h_convex : ConvexOn ℝ (Set.Ici 0) f)
  (h_lim : Filter.Tendsto f Filter.atTop (nhds 0)) :
  ∃ (μ : MeasureTheory.Measure ℝ),
    MeasureTheory.IsProbabilityMeasure μ ∧
    ∀ t, f t = (∫ x, Real.cos (t * x) ∂μ) := by
  sorry
end p251_main

namespace p252_main
noncomputable def tauFrom
    {Ω : Type*} (S : ℕ → Ω → ℝ) (a : ℝ) : Ω → ℕ := by
  classical
  intro ω
  exact if h : ∃ k : ℕ, 1 ≤ k ∧ S k ω > a then
    Nat.find h
  else
    0

theorem problem_25
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (X : ℕ → Ω → ℝ)
  (h_meas : ∀ n, Measurable (X n))
  (h_indep : Pairwise (fun i j : ℕ => ProbabilityTheory.IndepFun (X i) (X j) μ))
  (h_ident : ∀ n, MeasureTheory.Measure.map (X n) μ = MeasureTheory.Measure.map (X 0) μ)
  (h_pos : (∫ ω, X 0 ω ∂μ) > 0)
  (a : ℝ) (ha : 0 < a) :
  let S : ℕ → Ω → ℝ := fun k ω => ∑ i in Finset.range k, X i ω
  (∫⁻ ω, (tauFrom S a ω : ENNReal) ∂μ) < ⊤ := by
  sorry
end p252_main

namespace p253_main
theorem problem_26
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (X : Ω → ℝ)
  (hX : ∀ a b, 0 ≤ a → a ≤ b → b ≤ 1 →
    P {ω | a ≤ X ω ∧ X ω ≤ b} = ENNReal.ofReal (b - a)) :
  let A : ℕ → Set Ω := fun n => {ω | ⌊(10 : ℝ) ^ n * X ω⌋ % 10 = 7}
  let B : Set Ω := {ω | Set.Infinite {n | ω ∈ A n}}
  P B = 1 := by
  sorry
end p253_main

namespace p254_main
theorem problem_27
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (X : ℕ → Ω → ℕ)
  (h_meas : ∀ n, Measurable (X n))
  (h01 : ∀ n, μ {ω | X n ω = 0 ∨ X n ω = 1} = 1)
  (F : ℕ → MeasurableSpace Ω)
  (hF_mono : Monotone F)
  (hF0 : F 0 = ⊥)
  (hF_succ :
    ∀ n, F (n + 1) = MeasurableSpace.comap (fun ω => fun k : Fin (n + 1) => X k.1 ω) ⊤)
  (h_adapt : ∀ n, @Measurable Ω ℕ (F (n + 1)) _ (X n))
  (condExp : (Ω → ℝ) → MeasurableSpace Ω → Ω → ℝ)
  (h_cond :
    ∀ n,
      condExp (fun ω => if X (n + 1) ω = 1 then (1 : ℝ) else 0) (F (n + 1))
        =ᵐ[μ] (fun _ω => (1 : ℝ) / (n + 1))) :
  let S : Ω → ENNReal := fun ω => ∑' n : ℕ, (X n ω : ENNReal)
  (∫⁻ ω, S ω ∂μ) = ⊤ ∧
  (μ {ω | S ω < ⊤} = 1) := by
  sorry
end p254_main

namespace p255_main
theorem problem_28
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (X Y : Ω → ℝ)
  (h_dist :
    MeasureTheory.Measure.map (fun ω => (X ω, Y ω)) P =
      (MeasureTheory.volume.prod MeasureTheory.volume).withDensity
        (fun p : ℝ × ℝ =>
          ENNReal.ofReal
            ((1 / (2 * Real.pi)) * Real.exp (-(p.1 ^ 2 + p.2 ^ 2) / 2))))
  (R : Ω → ℝ) (hR : ∀ ω, R ω = Real.sqrt (X ω ^ 2 + Y ω ^ 2))
  (Θ : Ω → ℝ) (hΘ : ∀ ω, Θ ω =
    let t := Complex.arg (X ω + Y ω * Complex.I)
    if t < 0 then t + 2 * Real.pi else t) :
  ProbabilityTheory.IndepFun R Θ P ∧
  ∀ a b, 0 ≤ a → a ≤ b → b ≤ 2 * Real.pi →
    P {ω | a ≤ Θ ω ∧ Θ ω ≤ b} =
      ENNReal.ofReal ((b - a) / (2 * Real.pi)) := by
  sorry
end p255_main

namespace p256_main
theorem problem_29
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (X : Ω → ℝ)
  (hX_meas : Measurable X)
  (hX_nonneg : ∀ᵐ ω ∂P, 0 ≤ X ω)
  (h_cdf : ∀ x : ℝ, P {ω | X ω ≤ x} = ENNReal.ofReal (if x < 1 then 0 else 1 - 1 / x^2)) :
  MeasureTheory.Integrable X P ∧ ∫ ω, X ω ∂P = 2 := by
  sorry
end p256_main

namespace p257_main
theorem problem_30
  {Ω : Type*} [MeasurableSpace Ω]
  (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
  (X : Ω → ℝ)
  (hX_meas : Measurable X)
  (hX_cdf : ∀ t : ℝ, t ∈ Set.Ioo (0 : ℝ) 1 → μ {ω | X ω ≤ t} = ENNReal.ofReal t)
  (hX_support : μ {ω | X ω ∈ Set.Icc (0 : ℝ) 1} = 1) :
  let Y : Ω → ℝ := fun ω => (X ω) ^ 2
  (∃ t : ℝ, t ∈ Set.Ioo (0 : ℝ) 1 ∧ μ {ω | X ω ≤ t} = μ {ω | Y ω ≤ t})
    ∧
  (MeasureTheory.Measure.map X μ ≠ MeasureTheory.Measure.map Y μ) := by
  sorry
end p257_main

namespace p258_main
theorem problem_31_faithful
    (n : ℕ) (hn : 0 < n)
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ)
    (h_meas : ∀ k, Measurable (X k))
    (h_unif : ∀ (k : ℕ) (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 →
      μ {ω | X k ω ≤ t} = ENNReal.ofReal t)
    (h_indep :
      ProbabilityTheory.iIndepFun
        (β := fun _ : ℕ => ℝ)
        (m := fun _ : ℕ => borel ℝ)
        X μ)
    (h_ident : ∀ k, MeasureTheory.Measure.map (X k) μ = MeasureTheory.Measure.map (X 0) μ) :
    let M : Ω → ℝ := fun ω =>
      Finset.sup' (Finset.range n)
        (by
          refine ⟨0, ?_⟩
          simpa [Finset.mem_range] using hn)
        (fun i => X i ω)
    ∫ ω, (M ω) ∂μ = (n : ℝ) / (n + 1 : ℝ) := by
  sorry
end p258_main

namespace p259_main
noncomputable def tau32
    {Ω : Type*} (X : ℕ → Ω → ℕ) : Ω → ℕ := by
  classical
  intro ω
  exact if h : ∃ n : ℕ, 1 ≤ n ∧ X n ω = 0 then
    Nat.find h
  else
    0
theorem problem_32
  {Ω : Type*} [MeasurableSpace Ω]
  (P : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure P]
  (condProb : Set Ω → Set Ω → ENNReal)
  (X : ℕ → Ω → ℕ)
  (p : ℝ) (hp : 0 < p ∧ p < 1)
  (h_start : ∀ᵐ ω ∂P, X 0 ω = 1)
  (h_up : ∀ n i, 1 ≤ i →
    condProb {ω | X (n + 1) ω = i + 1} (X n ⁻¹' {i}) = ENNReal.ofReal p)
  (h_down : ∀ n i, 1 ≤ i →
    condProb {ω | X (n + 1) ω = 0} (X n ⁻¹' {i}) = ENNReal.ofReal (1 - p))
  (h_absorb : ∀ n,
    condProb {ω | X (n + 1) ω = 0} (X n ⁻¹' {0}) = 1) :
  (∫⁻ ω, (tau32 X ω : ENNReal) ∂P) < ⊤ := by
  sorry
end p259_main

namespace p260_main
theorem problem_33_faithful
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (X : ℕ → Ω → Bool)
    (h_meas : ∀ n, Measurable (X n))
    (h_fair : ∀ n, μ {ω | X n ω = true} = (1 : ENNReal) / 2)
    (h_indep : Pairwise (fun i j : ℕ => ProbabilityTheory.IndepFun (X i) (X j) μ))
    (L : ℕ → Ω → ℕ) :
    ∀ ε : ℝ, 0 < ε →
      Filter.Tendsto
        (fun n : ℕ =>
          μ {ω : Ω |
            ε < |((L n ω : ℝ) / Real.logb 2 (n : ℝ)) - 1| })
        Filter.atTop
        (𝓝 (0 : ENNReal)) := by
  sorry
end p260_main

namespace p261_main
theorem problem_34
  (deck_size : ℕ) (h_deck : deck_size = 52)
  (ace_count : ℕ) (h_aces : ace_count = 4)
  (draw_size : ℕ) (h_draw : draw_size = 2) :
  let total_combinations : ℕ := Nat.choose deck_size draw_size
  let no_ace_combinations : ℕ := Nat.choose (deck_size - ace_count) draw_size
  let at_least_one_ace_combinations : ℕ := total_combinations - no_ace_combinations
  let two_ace_combinations : ℕ := Nat.choose ace_count draw_size
  (two_ace_combinations : ℚ) / at_least_one_ace_combinations ≠ 3 / 51 := by
  sorry
end p261_main

namespace p262_main
theorem problem_35
  (P : MeasureTheory.Measure ℕ) [MeasureTheory.IsProbabilityMeasure P] :
  ¬ (∀ n m : ℕ, P {n} = P {m}) := by
  sorry
end p262_main

namespace p263_main
theorem problem_36
  {Ω : Type*} [MeasurableSpace Ω]
  {P : MeasureTheory.Measure Ω} [MeasureTheory.IsProbabilityMeasure P]
  (N M : PNat → Ω → ℕ)
  (hN1 : ∀ k : ℕ, k ≥ 1 →
    P {ω | N (1 : PNat) ω = k} = (((2 : ENNReal)⁻¹) ^ k))
  (hM : ∀ i n, P {ω | N i ω = n} ≠ 0 → ∀ m, 1 ≤ m ∧ m ≤ n →
    P ({ω | M i ω = m} ∩ {ω | N i ω = n}) / P {ω | N i ω = n} = ((n : ENNReal)⁻¹))
  (hN_next : ∀ i m, m ≥ 1 → P {ω | M i ω = m} ≠ 0 →
    (∀ k, 1 ≤ k ∧ k < m →
      P ({ω | N (i + 1) ω = k} ∩ {ω | M i ω = m}) / P {ω | M i ω = m}
        = (((2 : ENNReal)⁻¹) ^ k)) ∧
    (P ({ω | N (i + 1) ω = m} ∩ {ω | M i ω = m}) / P {ω | M i ω = m}
        = (((2 : ENNReal)⁻¹) ^ m) + (((2 : ENNReal)⁻¹) ^ m))) :
  let T : Ω → ENNReal :=
    fun ω => ∑' i : PNat, ((N i ω + M i ω : ℕ) : ENNReal)
  (∫⁻ ω, T ω ∂P) < ⊤ := by
  sorry
end p263_main

namespace p264_main
inductive Role | Sith | Hermit | Jedi deriving DecidableEq, Fintype

def IsFairBool {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) (X : Ω → Bool) : Prop :=
  μ {ω | X ω = true} = (1 : ENNReal) / 2

theorem problem_37
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (A B C : Ω → Role)
    (h_perm : ∀ ω,
      ({A ω, B ω, C ω} : Finset Role) =
      ({Role.Sith, Role.Hermit, Role.Jedi} : Finset Role))
    (ans1 ans2 ans3 ans4 : Ω → Bool) :
    let Evidence : Set Ω :=
      {ω | ans1 ω = false ∧ ans2 ω = true ∧ ans3 ω = false ∧ ans4 ω = false}
    μ ({ω | A ω = Role.Sith} ∩ Evidence) / μ Evidence = ((2 : ENNReal) / 5) := by
  sorry
end p264_main

namespace p265_main
inductive Color | White | Black deriving DecidableEq, Fintype
inductive PropAB | A | B deriving DecidableEq, Fintype

structure CoinState where
  upColor  : Color
  upProp   : PropAB
  downProp : PropAB
deriving DecidableEq

instance : MeasurableSpace Color := ⊤
instance : MeasurableSpace PropAB := ⊤
instance : MeasurableSpace CoinState := ⊤

def isAA (s : CoinState) : Bool :=
  (s.upProp = PropAB.A) && (s.downProp = PropAB.A)

def countAA {Ω : Type*} (state : ℕ → Ω → CoinState) (N : ℕ) (ω : Ω) : ℕ :=
  ∑ t in Finset.range N, (if isAA (state t ω) then 1 else 0)

theorem problem_38
    {Ω : Type*} [MeasurableSpace Ω]
    (μ : MeasureTheory.Measure Ω) [MeasureTheory.IsProbabilityMeasure μ]
    (state : ℕ → Ω → CoinState)

    (h_init :
      ∀ ω,
        (state 0 ω).upColor = Color.White ∨
        (state 0 ω).upColor = Color.Black)

    (h_white_A :
      ∀ t s,
        μ {ω | state t ω = s} ≠ 0 →
        s.upColor = Color.White →
        s.upProp = PropAB.A →
        μ ({ω | state (t + 1) ω =
              { upColor := s.upColor, upProp := PropAB.B, downProp := s.downProp }} ∩
            {ω | state t ω = s})
          / μ {ω | state t ω = s} = ((1 : ENNReal) / 2))

    (h_white_B :
      ∀ t s,
        μ {ω | state t ω = s} ≠ 0 →
        s.upColor = Color.White →
        s.upProp = PropAB.B →
        μ ({ω | state (t + 1) ω =
              { upColor := s.upColor, upProp := s.upProp, downProp := PropAB.A }} ∩
            {ω | state t ω = s})
          / μ {ω | state t ω = s} = ((1 : ENNReal) / 2))

    (h_black_A :
      ∀ t s,
        μ ({ω | state (t + 1) ω =
              { upColor := Color.White,
                upProp := s.downProp,
                downProp := s.upProp }} ∩
            {ω | state t ω = s})
        =
        μ {ω | state t ω = s})

    (h_black_B :
      ∀ t s,
        μ ({ω | state (t + 1) ω =
              { upColor := s.upColor,
                upProp := if s.upProp = PropAB.A then PropAB.B else PropAB.A,
                downProp := if s.downProp = PropAB.A then PropAB.B else PropAB.A }} ∩
            {ω | state t ω = s})
        =
        μ {ω | state t ω = s})

    :
    Filter.Tendsto
      (fun N : ℕ =>
        (∫ ω, (countAA state N ω : ℝ) ∂μ) / (N : ℝ))
      Filter.atTop
      (𝓝 (1 / 3 : ℝ)) := by
  sorry
end p265_main

