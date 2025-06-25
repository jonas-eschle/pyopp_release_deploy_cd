#!/bin/bash
set -e  # Exit on any error

echo "PyPI Build and Upload Script"
echo "======================================"

# Check if we're in the right directory
if [[ ! -f "hello_numpy/pyproject.toml" ]]; then
    echo "❌ Error: Please run this script from managers/pypi/ directory"
    echo "   Expected structure: managers/pypi/hello_numpy/pyproject.toml"
    exit 1
fi

# Navigate to package directory
cd hello_numpy

echo ""
echo "Build package with pipx or uv"
#pipx run build  # uncomment to change
uv tool run --from build pyproject-build
echo "Package built successfully"


echo "Check package integrity"
#pipx run twine check dist/*
uv tool run twine check dist/*

echo "Test local installation"
# Create temporary virtual environment for testing
uv venv test-env
source test-env/bin/activate

echo "Installing from wheel..."
uv pip install dist/*.whl

echo "Testing Python import..."
python -c "import hello_numpy; print('Import successful')"
python -c "import hello_numpy; hello_numpy.hello_numpy(3, 42); print('✅ Function works')"

# Test CLI if available
if command -v hello-numpy >/dev/null 2>&1; then
    echo "   Testing CLI command..."
    hello-numpy --help >/dev/null && echo "✅ CLI works"
fi

# Clean up test environment
deactivate
rm -rf test-env
echo "✅ Local testing complete"

echo ""
echo "🚀 Step 5: Upload options"
echo ""
echo "Choose upload destination:"
echo "1) TestPyPI (recommended for testing)"
echo "2) PyPI (production) - DISABLED for tutorial safety"
echo "3) Show  commands only"
echo ""
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        echo ""
        echo "Uploading to TestPyPI..."
        pipx run twine upload --repository testpypi dist/*
#        uv publish --publish-url "https://test.pypi.org/legacy/" dist/*  # uncomment to use uv
        echo ""
        echo "Uploaded to TestPyPI!"
        echo "Test installation with:"
        echo "uv pip install --index-url https://test.pypi.org/simple/ hello_numpy"
        ;;
    2)
        echo ""
        echo "Uploading to PyPI... (NOT DONE, for safety)"
#        pipx run twine upload dist/*
        echo ""
        echo "Uploaded to PyPI!"
        echo "Users can now install with:"
        echo "uv pip install hello-numpy"
        ;;
    3)
        echo ""
        echo "⏭️ Skipping upload"
        echo "You can upload later with:"
        echo "  TestPyPI: pipx run twine upload --repository testpypi dist/*"
        echo "  PyPI:     pipx run twine upload dist/*"
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac
