# Conda Packaging

Cross-platform package manager popular in data science.

## Why Conda?

- Binary packages (no compilation needed)
- Handles non-Python dependencies (C libraries, etc.)


## Create a package

See the example in `grayskull-example.md` for creating a conda package from a PyPI package.


## Publishing

See `.github/workflows/conda-publish.yml` for automated conda publishing with GitHub Actions.

Publish to anaconda: `publish-anaconda.md`
Publish to conda-forge: `publish-conda-forge.md`
