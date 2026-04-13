LeanDojo package generated from data_4_9 (310 theorems).

Export: full dataset (all categories, every row in prover_problems.jsonl)

1) Build:
   cd /export/jyuan98/benchmarkdata_lean4/lean4_benchmark/leandojo_data49_package
   export MATHLIB_NO_CACHE_ON_UPDATE=1   # optional: if binary cache download fails
   lake update
   lake build

2) Git + remote (LeanDojo clones by URL):
   git init
   git add -A
   git commit -m "data_4_9 LeanDojo export"
   gh repo create ...   # or add origin
   git remote add origin <URL>
   git push -u origin main

3) Re-run this exporter with real --repo-url and --repo-commit after push (same filters), or edit:
   /export/jyuan98/benchmarkdata_lean4/lean4_benchmark/leandojo_data49_package/data49_leandojo.jsonl

4) Environment:
   export GITHUB_ACCESS_TOKEN=...   # for LeanDojo GitHub API (private repos need repo scope)

5) Private GitHub repos:
   LeanDojo reads lean-toolchain via https://raw.githubusercontent.com/... without sending your token.
   Private repos return 404 there, so Dojo init fails even when the API works. Fix: make this dataset
   repo public, or host a public mirror used only for the benchmark.

JSONL path: /export/jyuan98/benchmarkdata_lean4/lean4_benchmark/leandojo_data49_package/data49_leandojo.jsonl
