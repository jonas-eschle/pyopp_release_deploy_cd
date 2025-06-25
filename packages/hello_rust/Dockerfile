# Multi-stage build for Python packages with Rust extensions
FROM rust:1.75.0 AS rust-builder

WORKDIR /app

COPY Cargo.toml .
COPY src ./src/
COPY pyproject.toml .
COPY README.md .

# install pipx
RUN apt update && apt install pipx -y
RUN pipx run build

