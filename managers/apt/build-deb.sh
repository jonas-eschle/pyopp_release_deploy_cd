#!/bin/bash
set -e   # Exit on any error (fail fast)


mkdir -p build

# Copy source packages
echo "Copying source files..."
cp -r hello_numpy build/

# Copy Debian packaging files (debian/ directory)
echo "Adding Debian packaging metadata..."
cp -r debian build/hello_numpy/

# Build the packages
echo "Building .deb package..."
cd build/hello_numpy
dpkg-buildpackage -us -uc -b
# dpkg-buildpackage options:
  ## -us: don't sign source package (not needed for local builds)
  ## -uc: don't sign changes file (not needed for local builds)
  ## -b: build binary package only (faster, no source package)
  ## --build-profiles=nocheck: skip tests for faster educational builds

cd ..
echo "Build complete! Package created:"
ls -la ./*.deb
