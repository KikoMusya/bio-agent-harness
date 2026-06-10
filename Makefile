.PHONY: demo figures test clean

demo:
	python scripts/run_demo_pipeline.py

figures:
	python scripts/create_scientific_figures.py

test:
	python -m pytest tests

clean:
	rm -f results/*.json results/*.csv results/*.md results/*.html docs/assets/*.svg
