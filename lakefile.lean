import Lake
open Lake DSL

package «lean4-benchmark-leandojo-data49» where
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.9.0"

@[default_target]
lean_lib «BenchmarkData49» where
  srcDir := "BenchmarkData49"
  roots := #[`abstract_algebra_4_9, `calculus_4_9, `combinatorial_4_9, `complex_analysis_4_9, `fourier_analysis_4_9, `functional_analysis_4_9, `geometry_4_9, `linear_algebra_4_9, `logic_4_9, `number_theory_4_9, `probabilities_4_9, `topology_4_9]
