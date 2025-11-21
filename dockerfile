FROM public.ecr.aws/lambda/python:3.13-arm64

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

COPY pyproject.toml .

# COPY pyproject.toml uv.lock* ./
# RUN uv pip install --target "${LAMBDA_TASK_ROOT}" --no-dev .
# RUN uv pip install -r pyproject.toml --system --no-cache

COPY src/ ${LAMBDA_TASK_ROOT}

CMD ["main.handler"]