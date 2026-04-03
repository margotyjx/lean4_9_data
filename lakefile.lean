import Lake
open Lake DSL

package «lean4-benchmark-leandojo-data49» where
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.9.0"

@[default_target]
lean_lib «BenchmarkData49» where
  srcDir := "."
  roots := #[`BenchmarkData49]
  globs := #[`BenchmarkData49.+]
