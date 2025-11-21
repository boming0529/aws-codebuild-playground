FROM public.ecr.aws/lambda/python:3.13-arm64

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml .

RUN uv pip install -r pyproject.toml --system

COPY src/ ${LAMBDA_TASK_ROOT}

CMD ["main.lambda_handler"]