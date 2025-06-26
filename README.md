# Python Packaging Tutorial

Educational repository demonstrating Python package deployment across multiple package managers and platforms.

## Quick Start

```bash
# Setup environment
make setup

# Pure Python Package
cd managers/pypi/hello_numpy
pip install -e .
hello_numpy --size 10 --seed 42

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
```

## Package Managers


| Package Manager | Channel | Best For | Setup Difficulty | User Installation | Authentication |
|---|---|---|---|---|---|
| **PyPI** | pypi.org | General Python packages | Easy | `pip install package-name` | API Token or Trusted Publisher (OIDC) |
| **PyPI** | test.pypi.org | Testing packages | Easy | `pip install -i https://test.pypi.org/simple/ package-name` | API Token or Trusted Publisher (OIDC) |
| **Conda** | anaconda.org | Data science, scientific computing | Medium | `conda install -c your-channel package-name` | anaconda.org login + upload |
| **Conda** | conda-forge | Community-maintained conda packages | Easy (automated) | `conda install -c conda-forge package-name` | GitHub PR submission only |
| **Docker** | Docker Hub | Containerized applications | Medium | `docker run username/package-name` | hub.docker.com username + access token |
| **Docker** | GitHub Container Registry | GitHub-integrated containers | Medium | `docker run ghcr.io/username/package-name` | GitHub Personal Access Token |
| **APT** | Ubuntu Main | Core Ubuntu packages | Hard | `sudo apt install package-name` | Ubuntu developer membership |
| **APT** | Personal PPA | User-maintained packages | Hard | `sudo add-apt-repository ppa:user/repo && sudo apt install package-name` | launchpad.net GPG key + SSH |
| **Homebrew** | homebrew-core | Core formulas | Medium | `brew install package-name` | GitHub fork + PR |
| **Homebrew** | Custom Tap | User-maintained formulas | Medium | `brew tap user/repo && brew install package-name` | GitHub repository |
| **Spack** | builtin | Built-in packages | Hard | `spack install package-name` | GitHub fork + PR |
| **Spack** | Custom Repository | Organization packages | Hard | `spack repo add /path/to/repo && spack install package-name` | Custom repository setup |

