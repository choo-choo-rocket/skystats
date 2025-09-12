# Build the app
FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY go.mod go.sum /app
COPY core /app/core
RUN go mod download
RUN go build -o skystats ./core


FROM node:20-alpine AS node

COPY ./web /app

SHELL ["sh", "-o", "pipefail", "-c", "-x"]
WORKDIR /app
RUN \
    npm install && \
    npm run build

LABEL org.opencontainers.image.source="https://github.com/tomcarman/skystats"
FROM ghcr.io/sdr-enthusiasts/docker-baseimage:base
#SHELL ["/bin/bash", "-o", "pipefail", "-c", "-x"]

ENV \
    S6_KILL_GRACETIME=100 \
    API_PORT=8080 \
    DOCKER_ENV=true

COPY --from=node /app/dist /app/dist
COPY --from=builder /app/skystats /app/core/skystats
COPY migrations /app/migrations

COPY rootfs/ /
