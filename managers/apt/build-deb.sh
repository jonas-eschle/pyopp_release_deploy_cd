#!/bin/bash
set -e

echo "🔧 Modern Debian Package Builder (pyproject.toml native)"
echo "========================================================"

# Clean up any previous managers
echo "📋 Cleaning previous builds..."
rm -rf ./*.deb ./*.buildinfo ./*.changes ./*.dsc

mkdir -p build

# Copy source packages
echo "📦 Copying source files..."
cp -r hello_numpy build/

# Copy debian managers files
echo "📄 Adding debian packaging files..."
cp -r debian build/hello_numpy/

# Build the packages
echo "🏗️ Building .deb package..."
cd build/hello_numpy
dpkg-buildpackage -us -uc -b

# Move back and show results
cd ..
echo ""
echo "🎉 Build complete! Package created:"
ls -la ./*.deb

echo ""
echo "📥 To install:"
echo "  sudo dpkg -i ./python3-hello-numpy_0.1.0-1_all.deb"
echo ""
echo "🧪 To test after install:"
echo "  hello-numpy --help"
echo "  python3 -c 'import hello_numpy; print(hello_numpy.hello_numpy())'"
echo ""