# BioEvidenceGraph

A small ontology-grounded biomedical claim extraction harness for Codex-style
agent workflows.

The goal is to turn abstract text into structured, reviewable biomedical
knowledge:

```text
abstracts -> claims -> ontology terms -> evidence sentences -> human review -> graph
```

This project uses local toy data and the Python standard library for the default
offline demo.

## Honest LLM Status

The current extractor is **LLM-style**, not a live LLM API integration. It
imitates the shape of an LLM extraction step with deterministic toy logic so the
whole harness can be tested offline and reproduced by reviewers.

That means this project currently demonstrates the engineering layer around an
LLM workflow:

- structured extraction output;
- schema validation;
- ontology mapping;
- evidence-backed relations;
- manual review;
- final graph/report generation.

A real LLM API can be connected later behind the same schema and validation
steps.

## How to Verify This Portfolio

From the repository root:

```powershell
python scripts\portfolio_smoke.py --include-rnaseq
```

Latest smoke log:

- [../logs/portfolio-smoke-latest.md](../logs/portfolio-smoke-latest.md)
- [../logs/portfolio-smoke-latest.json](../logs/portfolio-smoke-latest.json)

## Project Structure

```text
bio-agent-harness/
|-- AGENTS.md
|-- README.md
|-- data/
|   `-- sample_abstracts.tsv
|-- ontology/
|   `-- ontology_terms.csv
|-- schemas/
|   `-- extraction_schema.json
|-- scripts/
|   |-- 01_extract.py
|   |-- 02_map_ontologies.py
|   |-- 03_validate_json.py
|   |-- 03_prepare_review.py
|   |-- 04_finalize.py
|   |-- 05_build_evidence_graph.py
|   |-- 06_make_report.py
|   |-- common.py
|   `-- run_demo_pipeline.py
|-- results/
|-- tests/
|   `-- test_pipeline.py
`-- Makefile
```

## Run

From this folder:

```bash
python scripts/run_demo_pipeline.py
```

Or, if `make` is available:

```bash
make demo
```

## Test

```bash
python -m pytest tests
```

## Outputs

The demo writes:

```text
results/extractions.json
results/mapped_entities.csv
results/mapped_relations.csv
results/manual_entity_verification.csv
results/manual_verification.csv
results/final_entities.csv
results/final_relations.csv
results/evidence_graph.html
results/report.md
```

`manual_verification.csv` reviews extracted claims. Each claim must preserve the
evidence sentence that supports it.

## Scientific Figures

After running the demo, generate paper-style SVG figures:

```bash
python scripts/create_scientific_figures.py
```

Or:

```bash
make figures
```

The figures are written to:

```text
docs/assets/figure-1-pipeline-workflow.svg
docs/assets/figure-2-ontology-grounding.svg
docs/assets/figure-3-review-funnel.svg
```

![Pipeline workflow](docs/assets/figure-1-pipeline-workflow.svg)

![Ontology grounding summary](docs/assets/figure-2-ontology-grounding.svg)

![Review funnel](docs/assets/figure-3-review-funnel.svg)

## Safety Rule

Ontology IDs are never invented. The mapper only emits IDs that exist in
`ontology/ontology_terms.csv`. Unmatched terms are marked as `unmapped` and kept
for review.

Every exported relation must include an evidence sentence copied from the source
abstract. This is a research prototype, not a medical or clinical decision tool.
