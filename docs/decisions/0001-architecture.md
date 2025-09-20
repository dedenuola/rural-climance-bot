# 0001 — Architecture & Conventions


## Status
Accepted


## Context
We need consistent conventions to ship quickly and avoid RAG pitfalls.


## Decision
- Pre-commit hooks enforce style (black, ruff).
- Typed config via pydantic-settings.
- Data contracts validated with Pandera; CI fails fast.
- Structured logging with run_id for traceability.


## Consequences
- Slight upfront overhead, large downstream speed and reliability gains.
