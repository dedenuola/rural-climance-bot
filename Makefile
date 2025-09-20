.PHONY: setup ingest normalize index run eval test fmt lint precommit

PYTHON := python
PIP := pip

setup:
$(PIP) install -r requirements.txt
pre-commit install

fmt:
ruff format .
black --line-length 100 .

lint:
ruff check .

precommit:
pre-commit run --all-files

ingest:
$(PYTHON) -m data_pipeline.fetch_worldbank

normalize:
$(PYTHON) -m data_pipeline.normalize

index:
$(PYTHON) -m data_pipeline.make_vectors

run:
streamlit run app/ui_streamlit.py

eval:
$(PYTHON) -m eval.run_eval

test:
pytest -q
