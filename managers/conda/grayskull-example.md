# Using Grayskull to Auto-Generate Conda Recipes

Grayskull automatically creates conda recipes from PyPI packages.

## Quick Start



Since conda expects a package from  PyPI, it's not common to use local packages, but you can still do it

```bash
pipx run build -s hello_numpy
pipx run grayskull pypi hello_numpy/dist/*.tar.gz
```

## Generated Recipe Structure

```
hello-numpy/
└── meta.yaml     # Complete conda recipe
``` 

or generate from PyPI directly:
```bash
# Generate recipe from PyPI
pipx run grayskull pypi particle

# This creates a recipe directory with meta.yaml

## What Grayskull Does

1. **Fetches PyPI metadata**: Package info, dependencies, versions
2. **Generates meta.yaml**: Complete conda recipe
3. **Handles dependencies**: Converts PyPI deps to conda format
4. **Sets up testing**: Basic import tests




## After Generation

1. **Review the recipe**: Check dependencies and metadata
2. **Test build**: `conda build hello-numpy/`
3. **Publish on Anaconda/conda-forge**
