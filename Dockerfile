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
# Stage 2: Serve the static site
# ----------------------------------------------------------------------------
FROM python:3.12-slim AS runtime

# Coolify warns Dockerfile healthchecks should use curl or wget; slim has neither by default.
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /srv
COPY --from=builder /build/site .

# Coolify often sets PORT; Traefik upstream must match whatever port we bind.
ENV PORT=3000
EXPOSE 3000

# Use $$ so Docker does not bake in build-time PORT; Coolify can set PORT at runtime.
CMD ["sh", "-c", "exec python -m http.server $${PORT:-3000} --bind 0.0.0.0 --directory /srv"]

HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
    CMD curl -fsS "http://127.0.0.1:$${PORT:-3000}/" >/dev/null || exit 1
