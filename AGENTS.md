# AGENTS.md

## Project Goal

This project is a biomedical knowledge extraction harness.

The pipeline takes scientific abstract text, extracts structured biological
entities and relations, maps them to local ontology terms, prepares a manual
verification table, and exports reviewed results.

## Pipeline

Input:

- `data/sample_abstracts.tsv`

Ontology dictionary:

- `ontology/ontology_terms.csv`

Main steps:

1. Extract entities and relations from abstracts.
2. Save extraction as JSON.
3. Map extracted terms to GO, HPO, DO, SO, and ChEBI terms when possible.
4. Prepare manual verification CSVs for entities and evidence-backed claims.
5. Finalize only approved rows.
6. Build a small evidence graph from approved relations.

## Commands

Run the demo pipeline:

```bash
python scripts/run_demo_pipeline.py
```

Run tests:

```bash
python -m pytest tests
```

Use Make targets when `make` is available:

```bash
make demo
make test
make clean
```

## Rules

- Do not invent ontology IDs.
- If a term cannot be mapped confidently, mark it as `unmapped`.
- Keep all outputs reproducible.
- Do not add heavy dependencies unless necessary.
- Prefer simple Python standard library code when possible.
- Every script should be understandable for a beginner.
- Every output file should have clear column names.
- Keep raw input files unchanged.
- Every exported relation must have an evidence sentence copied from the abstract.
- This is a research prototype, not a medical or clinical decision tool.

## Definition of Done

A task is complete only when:

- the demo pipeline runs successfully;
- tests pass;
- the README explains how to reproduce the result;
- output files are created in `results/`;
- `results/evidence_graph.html` is created;
- uncertain mappings remain flagged for review instead of being forced.
