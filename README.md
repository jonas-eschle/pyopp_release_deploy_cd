# Python Packaging and Deployment Tutorial

This repository teaches how to do releases, deploy, and set up continuous integration for Python packages across multiple package managers and platforms.

## Repository Structure

```
.
├── builds/                      # Example packages and build configurations
│   ├── hello_numpy/            # Pure Python package example
│   │   ├── hello_numpy/        # Package source code
│   │   ├── tests/              # Unit tests
│   │   └── pyproject.toml      # Modern Python packaging
│   │
│   ├── hello_rust/             # Python package with Rust extension
│   │   ├── src/                # Rust source code
│   │   ├── python/             # Python wrapper code
│   │   ├── Cargo.toml          # Rust configuration
│   │   ├── pyproject.toml      # Python packaging with maturin
│   │   └── Dockerfile          # Container configuration
│   │
│   ├── hello_cython/           # Python package with Cython extension
│   │   ├── hello_cython/       # Python and Cython source
│   │   ├── tests/              # Unit tests
│   │   └── pyproject.toml      # Python packaging with setuptools
│   │
│   └── Package Manager Configurations:
│       ├── pypi/               # PyPI packaging and deployment
│       ├── conda/              # Conda packaging
│       ├── conda-forge/        # Conda-forge community packaging
│       ├── apt/                # Debian/Ubuntu packaging
│       ├── homebrew/           # macOS/Linux Homebrew formulas
│       ├── spack/              # HPC-focused package manager
│       └── docker/             # Docker containerization
│
└── .github/workflows/          # CI/CD automation examples
    ├── build-python-package.yml     # Modern Python package building and testing
    ├── pypi-publish-trusted.yml     # PyPI with trusted publishing (OIDC)
    ├── pypi-publish-combined.yml    # Educational: both auth methods
    ├── conda-publish.yml            # Conda package building and publishing
    ├── build-wheels-rust.yml        # Multi-platform wheels for compiled extensions
    └── docker-build.yml             # Container image building
```

## Quick Start

### Pure Python Package

```bash
cd builds/hello_numpy
pip install -e .
hello-numpy --size 10 --seed 42
```

### Rust Extension Package

```bash
cd builds/hello_rust
pip install maturin
maturin develop
python -c "from hello_rust import hello_from_rust; print(hello_from_rust('World'))"
```

### Cython Extension Package (Alternative to Rust)

```bash
cd builds/hello_cython
pip install -e .
hello-cython --name Python --numbers 1 2 3
```

## Package Manager Guides

Each package manager directory contains:
- README with detailed instructions
- Configuration files/templates
- Build and upload scripts

### PyPI (Python Package Index)

The standard Python package repository.

```bash
cd builds/pypi
./build_and_upload.sh
```

**Key Features:**
- TestPyPI for testing
- Trusted publishing (OIDC)
- API token authentication

### Conda

Cross-platform package manager popular in data science.

```bash
cd builds/conda
conda build .

# Auto-generate recipes with grayskull
conda install grayskull
grayskull pypi package-name
```

**Key Features:**
- Binary package distribution
- Environment management
- Auto-recipe generation

### Conda-forge

Community-driven conda channel.

**Process:**
1. Submit recipe to staged-recipes
2. Automated feedstock creation
3. Bot-managed updates

### APT (Debian/Ubuntu)

System package manager for Debian-based Linux.

```bash
cd builds/apt
./build_deb.sh
```

**Key Features:**
- System-wide installation
- Dependency resolution
- PPA distribution

### Homebrew

Package manager for macOS and Linux.

```bash
brew install --build-from-source builds/homebrew/hello-numpy.rb
```

**Key Features:**
- Simple Ruby-based formulas
- Tap support for custom repos
- Bottle (binary) distribution

### Spack

Package manager for HPC environments.

```bash
spack install py-hello-numpy
```

**Key Features:**
- Multiple versions/configurations
- Module system integration
- Compiler/architecture variants

### Docker

Containerize applications for consistent deployment.

```bash
cd builds/hello_rust
docker build -t hello-rust .
docker run hello-rust
```

**Key Features:**
- Consistent environments
- Easy deployment
- Container orchestration

## CI/CD with GitHub Actions

### Trusted Publishing (Recommended)

Modern, secure method using OpenID Connect:

1. No stored secrets needed
2. Automatic authentication
3. Better security

### Traditional Token-based Publishing

Using API tokens:

1. Generate tokens on PyPI
2. Store as GitHub secrets
3. Reference in workflows

### Educational Comparison

See `.github/workflows/pypi-publish-combined.yml` for a workflow that demonstrates both methods side-by-side for learning purposes.

### Building Compiled Extensions

Using `cibuildwheel` for multi-platform wheels:

- Linux: manylinux containers
- macOS: Universal2 binaries
- Windows: MSVC compilation

See `.github/workflows/build-wheels-rust.yml`

### Docker Images

Automated multi-platform container builds:

- Optimized multi-stage builds
- Cross-platform images (amd64/arm64)
- Automated Docker Hub publishing

See `.github/workflows/docker-build.yml`

## Best Practices

### Version Management

Use semantic versioning:
- MAJOR.MINOR.PATCH (e.g., 1.2.3)
- Pre-releases: 1.2.3-rc1, 1.2.3-beta.1

### Testing Strategy

1. **Local Testing**: Test in virtual environments
2. **CI Testing**: Multiple Python versions and OS
3. **Integration Testing**: Test package installation

### Security

1. **Trusted Publishing**: Use OIDC when possible
2. **Token Scoping**: Limit token permissions
3. **Dependency Scanning**: Regular security updates

### Documentation

1. **README**: Clear installation and usage
2. **API Docs**: Sphinx or similar
3. **Examples**: Working code samples

## Common Tasks

### Creating a New Release

1. Update version in `pyproject.toml` or `setup.py`
2. Update CHANGELOG
3. Create git tag: `git tag v0.1.0`
4. Push tag: `git push origin v0.1.0`
5. CI automatically builds and publishes

### Testing Package Installation

```bash
# From PyPI
pip install package-name

# From TestPyPI
pip install -i https://test.pypi.org/simple/ package-name

# From conda-forge
conda install -c conda-forge package-name

# From local wheel
pip install dist/package-name-0.1.0-py3-none-any.whl
```

### Building Documentation

```bash
# Install Sphinx
pip install sphinx sphinx-rtd-theme

# Generate docs
sphinx-quickstart docs
sphinx-build -b html docs/source docs/build
```

## Troubleshooting

### Common Issues

1. **Import errors**: Check package structure and `__init__.py`
2. **Missing dependencies**: Verify all deps in setup configuration
3. **Build failures**: Check compiler/tool availability
4. **Upload failures**: Verify credentials and package naming

### Debug Commands

```bash
# Check package contents
tar -tzf dist/package-0.1.0.tar.gz

# Verify wheel
unzip -l dist/package-0.1.0-py3-none-any.whl

# Test import without installing
python -c "import sys; sys.path.insert(0, '.'); import package"
```

## Resources

### Official Documentation

- [Python Packaging Guide](https://packaging.python.org/)
- [PyPI Documentation](https://pypi.org/help/)
- [Conda Documentation](https://docs.conda.io/)
- [GitHub Actions](https://docs.github.com/actions)

### Tools

- [setuptools](https://setuptools.pypa.io/)
- [build](https://pypa-build.readthedocs.io/)
- [twine](https://twine.readthedocs.io/)
- [cibuildwheel](https://cibuildwheel.readthedocs.io/)
- [maturin](https://maturin.rs/)

### Community

- [Python Packaging Discourse](https://discuss.python.org/c/packaging/)
- [conda-forge Gitter](https://gitter.im/conda-forge/conda-forge.github.io)
- [PyPA Discord](https://discord.gg/pypa)

## Contributing

This is an educational repository. Feel free to:
- Add more package manager examples
- Improve documentation
- Add more CI/CD examples
- Create additional example packages

## License

MIT - See LICENSE file for details.
