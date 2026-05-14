# syntax=docker/dockerfile:1.7

# ----------------------------------------------------------------------------
# Stage 1: Build the static site with Zensical
# ----------------------------------------------------------------------------
FROM python:3.12-slim AS builder

WORKDIR /build

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY zensical.toml ./
COPY src ./src

RUN zensical build

# ----------------------------------------------------------------------------
# Stage 2: Serve the static site (stdlib only, no nginx)
# ----------------------------------------------------------------------------
FROM python:3.12-slim AS runtime

WORKDIR /srv
COPY --from=builder /build/site .

EXPOSE 80

# Port 80 requires root in this image; acceptable for a static docs container.
CMD ["python", "-m", "http.server", "80", "--bind", "0.0.0.0"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://127.0.0.1:80/')" || exit 1
