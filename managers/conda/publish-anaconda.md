# Setting Up Conda Publishing with GitHub Actions

## Prerequisites

1. **Create anaconda.org account** at https://anaconda.org
2. **Generate API token** in your account settings

## GitHub Secrets Setup

For the CI, add these secrets to your GitHub repository (Settings → Secrets and variables → Actions):

### Required Secrets:
- `ANACONDA_API_TOKEN` - Your anaconda.org API token
- `ANACONDA_USERNAME` - Your anaconda.org username
- `ANACONDA_PASSWORD` - Your anaconda.org password

### Getting Your API Token:

1. Login to https://anaconda.org
2. Go to Settings → Access
3. Create new token with upload permissions
4. Copy the token to GitHub secrets

## Manual Testing

Before using the automated workflow, test locally:

```bash
# Install conda-build
mamba install conda-build anaconda-client boa conda-verify

conda mambabuild hello-numpy/ --output-folder dist/conda  # needs boa, otherwise replace mambabuild -> build

# Test local installation
mamba install --use-local hello-numpy

# Test the packages
python -c "import hello_numpy; print('Works')"
hello-numpy --help

# Login to anaconda.org (interactive)
anaconda login

# Upload (replace with actual packages path)
anaconda upload dist/conda/noarch/hello-numpy-0.1.0-REPLACE.conda

# Check it's available
mamba search -c your-username hello-numpy
```


## After Publishing

Users can install your package with:

```bash
mamba install -c your-username hello-numpy
```

## Troubleshooting

### Debug Steps:

```bash
# Check build output
conda build hello-numpy --debug

# Validate meta.yaml
conda render hello-numpy/meta.yaml
```
