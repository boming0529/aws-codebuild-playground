FROM public.ecr.aws/lambda/python:3.12

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

COPY pyproject.toml .

RUN uv pip install -r pyproject.toml --system

COPY main.py ${LAMBDA_TASK_ROOT}

CMD ["python", "main.py"]