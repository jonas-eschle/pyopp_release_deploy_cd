#!/bin/bash
set -e


mkdir -p build

# Copy source packages
echo "Copying source files..."
cp -r hello_numpy build/

# Copy debian managers files
echo "Adding debian packaging files..."
cp -r debian build/hello_numpy/

# Build the packages
echo "Building .deb package..."
cd build/hello_numpy
dpkg-buildpackage -us -uc -b

cd ..
echo "Build complete! Package created:"
ls -la ./*.deb
