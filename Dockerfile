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
# Stage 2: Serve the static site with nginx
# ----------------------------------------------------------------------------
FROM nginx:1.27-alpine AS runtime

COPY --from=builder /build/site /usr/share/nginx/html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD wget -q -O /dev/null http://localhost/ || exit 1
