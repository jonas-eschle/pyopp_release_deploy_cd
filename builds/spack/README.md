# Spack

Package manager for high-performance computing and scientific software.

## Setup

```bash
# Install Spack
git clone https://github.com/spack/spack.git
. spack/share/spack/setup-env.sh
```

## Local Testing

```bash
# Install your package
spack install py-hello-numpy

# Load and test
spack load py-hello-numpy
hello-numpy --help
```

## Why Spack?

- Built for scientific computing
- Multiple versions simultaneously
- Optimized builds (different compilers/flags)
- No root access needed
- Integrates with module systems

## Package Definition

Spack uses Python class definitions in `package.py`:
- Downloads from PyPI
- Defines dependencies
- Supports build variants
    """Educational Python packaging example."""

    homepage = "https://github.com/example/hello-numpy"
    pypi = "hello-numpy/hello-numpy-0.1.0.tar.gz"

    version("0.1.0", sha256="actual-sha256")

    depends_on("python@3.8:", type=("build", "run"))
    depends_on("py-numpy", type=("build", "run"))
```

## Testing Locally

```bash
# Create local repo
mkdir -p ~/my-repo/packages/py-hello-numpy
cp package.py ~/my-repo/packages/py-hello-numpy/

# Add repo and install
spack repo add ~/my-repo
spack install py-hello-numpy
```

## Key Features

- **Variants**: Different build options
- **Compilers**: GCC, Clang, Intel, etc.
- **Architectures**: CPU-specific optimizations
- **Environments**: Reproducible software stacks

## Example Usage

```bash
# Different Python versions
spack install py-hello-numpy ^python@3.9
spack install py-hello-numpy ^python@3.11

# Different compilers
spack install py-hello-numpy %gcc@11
spack install py-hello-numpy %clang@14
```

## Contributing

Submit packages to the main Spack repository via GitHub PR.

## Resources

- [Spack Documentation](https://spack.readthedocs.io/)
- [Package Creation Guide](https://spack.readthedocs.io/en/latest/packaging_guide.html)