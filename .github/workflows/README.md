# GitHub Actions Workflows

Automated CI/CD examples for Python packaging.

## Available Workflows

1. **`pypi-publish.yml`** - PyPI package publishing with trusted publishers (OIDC)
2. **`conda-publish.yml`** - Conda package building and publishing to anaconda.org
3. **`build-wheels-rust.yml`** - Multi-platform wheels for Rust extensions
4. **`docker-build.yml`** - Container image building and publishing

## Local Testing

Test workflows locally using `act`:

```bash
# Install act (GitHub Actions local runner)
gh extension install https://github.com/nektos/gh-act
```

```bash
# Test PyPI workflow
gh act workflow_dispatch -W .github/workflows/pypi-publish.yml 

# Test Conda workflow  
gh act workflow_dispatch -W .github/workflows/conda-publish.yml 

# Test Docker workflow
gh act workflow_dispatch -W .github/workflows/docker-build.yml 

# Test Rust wheels workflow
gh act workflow_dispatch -W .github/workflows/build-wheels-rust.yml 
```

## Production Setup

To use these workflows in production:

### 1. Remove Tutorial Safety Blocks
Remove `if: false &&` conditions from publishing steps in all workflows.

### 2. Configure Secrets
Set up required secrets in your repository settings:

**PyPI (`pypi-publish.yml`):**
- Use Trusted Publisher (recommended) - no secrets needed
- OR add `PYPI_API_TOKEN` for token authentication

**Conda (`conda-publish.yml`):**
- `ANACONDA_API_TOKEN` - Your anaconda.org API token
- `ANACONDA_USERNAME` - Your anaconda.org username

**Docker (`docker-build.yml`):**
- `DOCKER_USERNAME` - Docker Hub username
- `DOCKER_PASSWORD` - Docker Hub password or access token

### 3. Update Package Names
Replace example package names with your actual package names in workflow files.
