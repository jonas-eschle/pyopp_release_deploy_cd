# Hello Rust

A simple Python package with Rust extensions demonstrating modern packaging and deployment.

## Building

Build the package with `build`:

```bash
pipx run build
```

## Installation

```bash
pip install hello-rust
```

## Usage

```python
from hello_rust import hello_from_rust, sum_list

# Simple greeting
print(hello_from_rust("World"))  # "Hello World from Rust!"

# Sum a list of integers
print(sum_list([1, 2, 3, 4, 5]))  # 15
```

## Development

### Local Development

```bash
# Install Rust and maturin
pip install maturin

# Install in development mode
maturin develop

# Run tests
pytest tests/
```

### Docker

```bash
# Build Docker image
docker build -t hello-rust .

# Run container
docker run hello-rust
```
