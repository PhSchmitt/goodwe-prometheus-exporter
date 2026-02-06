FROM python:3.12-alpine
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY /src/exporter.py .
RUN apk add --no-cache \
    gcc \
    musl-dev \
    linux-headers \
    python3-dev
RUN python -m pip install --upgrade pip
RUN pip install --root-user-action=ignore --upgrade goodwe asyncio aiohttp prometheus_client
RUN apk del \
    gcc \
    musl-dev \
    linux-headers \
    python3-dev 
ENTRYPOINT ["python", "exporter.py"]
