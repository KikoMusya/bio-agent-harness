# Bio-agent-harness

Evidence-backed biomedical extraction workflow for turning biomedical abstracts into structured, reviewable knowledge outputs.

## Project goal

This project demonstrates a controlled biomedical literature-to-knowledge workflow.

The goal is not to make unsupported scientific claims, but to show how biomedical text can be processed into structured candidates that remain connected to evidence sentences and manual review.

## Workflow

Biomedical abstracts
→ entity and relation extraction
→ ontology-aware grounding
→ evidence sentence linking
→ manual review table
→ HTML evidence graph
→ reproducible report

## What this project demonstrates

* Biomedical text processing
* Entity and relation extraction
* Ontology-aware terminology mapping
* Evidence-backed relation review
* Manual verification workflow
* Structured CSV / JSON outputs
* HTML evidence graph generation
* Reproducible scientific reporting

## Why this matters

Biomedical AI outputs should not be treated as final scientific conclusions without review.

This project is designed around a careful workflow where machine-generated candidates are separated from verified interpretation, and every extracted relation is linked back to supporting evidence.

## Planned repository contents

```text
bio-agent-harness/
├── data/
│   └── sample_abstracts.csv
├── outputs/
│   ├── extracted_relations.csv
│   ├── manual_review_table.csv
│   └── evidence_graph.html
├── scripts/
│   └── run_demo.py
├── figures/
│   └── workflow_overview.png
└── README.md
```

## Portfolio relevance

This project is useful for tasks related to:

* biomedical literature review
* scientific paper extraction
* clinical AI evidence review
* ontology-aware data curation
* research assistant workflows
* structured scientific reporting

## Status

Repository initialized. Demo files, example outputs, and screenshots will be added next.
