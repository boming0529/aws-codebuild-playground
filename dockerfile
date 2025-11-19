FROM python:3.13-alpine

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml .
# 建立虛擬環境並安裝依賴 (如果有 lock file 則用 sync, 這裡用 sync 即可)
# --frozen 代表嚴格依照 lock file (如果有的話)，這裡我們只有 toml，uv 會自動處理
RUN uv venv && uv pip install -r pyproject.toml --system

COPY . .

CMD ["python", "main.py"]