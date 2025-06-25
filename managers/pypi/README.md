# PyPI (Python Package Index)

The standard repository for Python packages.

## Quick Start

```bash
# Easy way - use the automated script
./build-and-upload.sh
```

## Local Workflow

```bash
cd hello_numpy

# Build with pipx (modern, isolated)
pipx run build

# Check what was built
ls dist/  # Should see .whl and .tar.gz files
```

## Package Verification

```bash
# Check packages integrity (modern method)
pipx run twine check dist/*


## Publishing

### 📋 Prerequisites
1. **Create account** at https://pypi.org
2. **Enable 2FA** (required for new accounts)
3. **Choose authentication method** below

### 🧪 Test Publishing (Recommended First)

```bash
# Upload to TestPyPI first
pipx run twine upload --repository testpypi dist/*

# Test installation from TestPyPI
pip install --index-url https://test.pypi.org/simple/ hello_numpy

# Verify it works
hello_numpy --version
```

### Production Publishing

```bash
# Upload to real PyPI
pipx run twine upload dist/*

# Users can now install with:
# pip install hello_numpy
```

## Authentication Methods

### Option 1: API Token (Simple)

**Setup:**
1. Go to https://pypi.org/manage/account/token/
2. Create token with "Entire account" scope
3. Configure locally:

```bash
# Create/edit ~/.pypirc
cat > ~/.pypirc << 'EOF'
[pypi]
username = __token__
password = pypi-<your-actual-token-here>

[testpypi]
repository = https://test.pypi.org/legacy/
username = __token__
password = pypi-<your-testpypi-token-here>
EOF

# Secure the file
chmod 600 ~/.pypirc
```

**Usage:**
```bash
# Upload with stored credentials
pipx run twine upload dist/*
```

### Option 2: Trusted Publisher (Modern, Secure)

**Benefits:**
- ✅ No secrets to manage
- ✅ More secure (OIDC-based)
- ✅ Per-project permissions

**Setup:**
1. Create PyPI project first (upload once with token)
2. Go to project settings → Publishing
3. Add GitHub repository as trusted publisher
4. Use workflow: `.github/workflows/pypi-publish-trusted.yml`


### Troubleshooting

**Common Issues:**

```bash
# Error: File already exists
# Solution: Increment version in pyproject.toml

# Error: Invalid credentials
# Solution: Regenerate API token

# Error: Package name taken
# Solution: Choose different name or add prefix

# Check upload status
pipx run twine check dist/*

# Verbose upload for debugging
pipx run twine upload --verbose dist/*
```
