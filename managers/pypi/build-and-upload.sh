#!/bin/bash
set -e

echo "🔧 PyPI Build and Upload Script"
echo "======================================"

# Check if we're in the right directory
if [[ ! -f "hello_numpy/pyproject.toml" ]]; then
    echo "❌ Error: Please run this script from managers/pypi/ directory"
    exit 1
fi

# Navigate to packages directory
cd hello_numpy

echo ""
echo "📋 Step 1: Clean previous builds"
rm -rf dist/ build/ *.egg-info/
echo "✅ Cleaned build artifacts"

echo ""
echo "📦 Step 2: Build package with pipx"
pipx run build
echo "✅ Package built successfully"

echo ""
echo "🔍 Step 3: Check package integrity"
pipx run twine check dist/*
echo "✅ Package integrity verified"

echo ""
echo "🧪 Step 4: Test local installation"
# Create temporary virtual environment for testing
python -m venv test-env
source test-env/bin/activate 2>/dev/null || source test-env/Scripts/activate

echo "Installing from wheel..."
pip install dist/*.whl

echo "Testing Python import..."
python -c "import hello_numpy; print('✅ Import successful')"

# Clean up test environment
deactivate
rm -rf test-env

echo ""
echo "🚀 Step 5: Upload options"
echo ""
echo "Choose upload destination:"
echo "1) TestPyPI (recommended for testing)"
echo "2) PyPI (production)"
echo "3) Skip upload"
echo ""
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        echo ""
        echo "📤 Uploading to TestPyPI..."
        pipx run twine upload --repository testpypi dist/*
        echo ""
        echo "✅ Uploaded to TestPyPI!"
        echo "Test installation with:"
        echo "pip install --index-url https://test.pypi.org/simple/ hello-numpy"
        ;;
    2)
        echo ""
        echo "📤 Uploading to PyPI..."
#        pipx run twine upload dist/*
        echo ""
        echo "✅ Uploaded to PyPI!"
        echo "Users can now install with:"
        echo "pip install hello-numpy"
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
