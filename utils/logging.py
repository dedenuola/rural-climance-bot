import uuid

import structlog


def get_logger(source: str, country: str | None = None, job: str | None = None):
    run_id = str(uuid.uuid4())
    processors = [
        structlog.processors.TimeStamper(fmt="iso"),
        structlog.contextvars.merge_contextvars,
        structlog.processors.add_log_level,
        structlog.processors.JSONRenderer(),
    ]
    structlog.configure(processors=processors)
    logger = structlog.get_logger().bind(source=source, country=country, job=job, run_id=run_id)
    return logger
