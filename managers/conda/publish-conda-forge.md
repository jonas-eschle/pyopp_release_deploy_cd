# Publishing to Conda-forge

Step-by-step guide to publish your Python package to conda-forge following the official instructions.

## Prerequisites

1. **Package must be published to PyPI first**
2. **GitHub account** for submitting the recipe
3. **Source code available as downloadable archive** (.tar.gz, .zip, etc.)

## Step-by-Step Instructions

### 1. Fork staged-recipes Repository

Fork the [staged-recipes](https://github.com/conda-forge/staged-recipes) repository on GitHub:

```bash
# Fork conda-forge/staged-recipes on GitHub
# Clone your forked repository
git clone https://github.com/YOUR-USERNAME/staged-recipes.git
cd staged-recipes

# Checkout a new branch from main
git checkout -b add-hello-numpy
```

### 2. Create Recipe Directory

Navigate to the recipes directory and create a folder for your package:

```bash
# Navigate to recipes directory
cd recipes

# Create directory for your package
mkdir hello-numpy
cd hello-numpy
```

### 3. Generate Recipe with Grayskull

Since you're using grayskull to create the meta.yaml, copy the generated file:

```bash
# Copy the grayskull-generated meta.yaml to your recipe directory
cp ../../meta.yaml ./meta.yaml
```

### 4. Verify and Modify Recipe

Review the generated `meta.yaml` and make necessary adjustments:

**Essential modifications:**

1. **Generate SHA256 hash** for your PyPI package:
   ```bash
   # Download source distribution from PyPI
   pip download --no-deps --no-binary :all: hello-numpy
   
   # Calculate SHA256
   sha256sum hello-numpy-*.tar.gz
   ```

2. **Update the SHA256** in meta.yaml with the calculated value

3. **Complete the test section** with some tests, for example:

```yaml
test:
  imports:
    - hello_numpy
  commands:
    - python -c "import hello_numpy; print(hello_numpy.__version__)"
```

4. **Remove irrelevant comments** from the template

5. **Verify license details** and include license file if required

### 5. Validate Recipe Locally

Before submitting, test your recipe locally:

```bash
# Navigate back to staged-recipes root
cd ../..

# Build the recipe locally
conda build recipes/hello-numpy
```

### 6. Pre-submission Checklist

Ensure the following before submitting:

- [ ] Source code is downloadable as a single archive
- [ ] License details are accurate
- [ ] License file is included if required  
- [ ] Tests pass locally
- [ ] Recipe follows conda-forge conventions
- [ ] No interference with existing recipes

### 7. Submit Pull Request

Commit your changes and create a pull request:

```bash
# Add and commit your recipe
git add recipes/hello-numpy/
git commit -m "Add hello-numpy recipe"

# Push to your fork
git push origin add-hello-numpy
```

Create a pull request on GitHub:
1. Go to https://github.com/conda-forge/staged-recipes
2. Click "New pull request"
3. Select your fork and branch
4. Provide a clear description of your package

### 8. Review Process

**During review:**
- Conda-forge team members will review your recipe
- Address feedback promptly by updating your recipe
- Push changes to your PR branch

### 9. Approval and Feedstock Creation

**After approval:**
- Conda-forge bot automatically creates a feedstock repository
- Automated builds start for Linux, macOS, and Windows
- Package becomes available via `conda install -c conda-forge hello-numpy`

## After Acceptance

**Your package gets:**
- **Feedstock repository** at `conda-forge/hello-numpy-feedstock`
- **Automatic updates** via conda-forge bots for new PyPI releases
