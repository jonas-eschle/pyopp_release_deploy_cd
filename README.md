# Python Packaging Tutorial

Educational repository demonstrating Python package deployment across multiple package managers and platforms.

## Quick Start

```bash
# Setup environment
make setup

# Pure Python Package
cd managers/pypi/hello_numpy
pip install -e .
hello-numpy --size 10 --seed 42

# Rust Extension Package  
cd managers/pypi/hello_rust
pip install maturin
maturin develop
python -c "from hello_rust import hello_from_rust; print(hello_from_rust('World'))"
```

## Makefile Usage

The Makefile provides automation for common tasks:

```bash
make help          # Show all available targets
make setup         # Copy packages to manager directories
make clean         # Remove build artifacts
make reset         # Clean + setup
make build-all     # Build packages for all managers
make test-all      # Run tests for all packages
make docker-build  # Build Docker images
make docker-test   # Test Docker containers
```

Package-specific targets:
```bash
make apt-build     # Build Debian package
make pypi-build    # Build PyPI packages  
make conda-build   # Build Conda package
make homebrew-test # Test Homebrew formula
```

## Package Managers

Each `managers/` directory contains examples for:
- **PyPI**: Standard Python packages
- **Conda**: Cross-platform binary packages
- **APT**: Debian/Ubuntu system packages
- **Homebrew**: macOS/Linux packages
- **Docker**: Containerized deployment
- **Spack**: HPC environment packages

See individual README files in each manager directory for detailed instructions.
