# Modern Debian Packaging

## Prerequisites

Run inside a Docker container ideally
```bash
sudo apt install build-essential debhelper dh-python python3-all \
                 pybuild-plugin-pyproject python3-hatchling python3-numpy
```

**Note:** If `pybuild-plugin-pyproject` is not available, see fallback section below.

## Quick Start

```bash
# Build the packages
./build-deb.sh

# Install it
sudo dpkg -i python3-hello-numpy_0.1.0-1_all.deb

# Test it works
hello-numpy --help
python3 -c "import hello_numpy; print(hello_numpy.hello_numpy())"
```

## What This Does

✅ **Pure pyproject.toml** - No setup.py generation
✅ **Modern build system** - Uses PEP 517 standards
✅ **Debian-compliant** - Proper package structure
✅ **Educational** - Shows modern Python packaging evolution

## Package Structure

```
python3-hello-numpy_0.1.0-1_all.deb
├── /usr/bin/hello-numpy                    # CLI command
└── /usr/lib/python3/dist-packages/         # Python modules
    ├── hello_numpy/
    │   ├── __init__.py
    │   └── hello.py
    └── hello_numpy-0.1.0.dist-info/        # Package metadata
```

## Debian Files

```
debian/
├── control      # Package dependencies and metadata
├── rules        # Build instructions (minimal!)
├── changelog    # Version history
└── copyright    # License information
```

## How It Works

1. **pyproject.toml** → Debian build system reads this directly
2. **pybuild-plugin-pyproject** → Handles PEP 517 build
3. **python3-hatchling** → Provides the build backend
4. **Standard Debian tools** → Package creation

## Modern vs Legacy

| Aspect | Legacy | Modern (This) |
|--------|--------|---------------|
| Config | setup.py | pyproject.toml |
| Build | setuptools | PEP 517 (hatchling) |
| Standards | Custom | Standardized |
| Maintenance | Manual | Automated |

## Fallback for Older Systems

If `pybuild-plugin-pyproject` is not available:

```bash
# Install modern tools manually
python3 -m pip install --user build hatchling

# Use custom debian/rules (see build script)
```

## Tutorial Notes

- 🎓 **Educational focus** - Tests disabled for simplicity
- 🔧 **Modern standards** - Shows current best practices
- 📦 **No legacy code** - Pure pyproject.toml approach
- 🚀 **Future-proof** - Uses standard Python packaging

## Resources

- [PEP 517](https://peps.python.org/pep-0517/) - Build system interface
- [PEP 621](https://peps.python.org/pep-0621/) - Project metadata
- [Debian Python Policy](https://www.debian.org/doc/packaging-manuals/python-policy/)
