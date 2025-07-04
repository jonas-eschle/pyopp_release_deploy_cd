# Makefile for Python Packaging Tutorial
# Educational repository for teaching releases, deployment, and CI with Python packages

.PHONY: help setup clean reset build-all test-all docker-build docker-test

# Default target
help:
	@echo "🐍 Python Packaging Tutorial Makefile"
	@echo "====================================="
	@echo ""
	@echo "Available targets:"
	@echo "  setup      - Prepare all package directories and copy source files"
	@echo "  clean      - Clean build artifacts and temporary files"
	@echo "  reset      - Complete reset: clean + remove copied packages"
	@echo "  build-all  - Build packages for all package managers"
	@echo "  test-all   - Run tests for all packages"
	@echo "  docker-build - Build all Docker images"
	@echo "  docker-test  - Test all Docker containers"
	@echo ""
	@echo "Package-specific targets:"
	@echo "  apt-build    - Build APT/Debian package"
	@echo "  pypi-build   - Build PyPI packages"
	@echo "  conda-build  - Build Conda package"
	@echo "  homebrew-test - Test Homebrew formula"
	@echo ""

# Setup target - prepare packages directories
setup:
	@echo "🔧 Preparing package directories..."
	@echo "📦 Copying hello_numpy..."
	@cp -r packages/hello_numpy managers/apt/
	@cp -r packages/hello_numpy managers/homebrew/
	@cp -r packages/hello_numpy managers/pypi/
	@cp -r packages/hello_numpy managers/docker/
	@cp -r packages/hello_numpy managers/conda/
	@echo "🦀 Copying hello_rust..."
	@cp -r packages/hello_rust managers/apt/
	@cp -r packages/hello_rust managers/homebrew/
	@cp -r packages/hello_rust managers/pypi/
	@cp -r packages/hello_rust managers/docker/
	@cp -r packages/hello_rust managers/conda/
	@echo "✅ Setup complete!"

# Clean target - remove build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	@rm -rf managers/apt/hello_numpy
	@rm -rf managers/apt/hello_rust

	@rm -rf managers/homebrew/hello_numpy
	@rm -rf managers/homebrew/hello_rust

	@rm -rf managers/pypi/hello_numpy
	@rm -rf managers/pypi/hello_rust

	@rm -rf managers/docker/hello_numpy
	@rm -rf managers/docker/hello_rust

	@rm -rf managers/conda/hello_numpy
	@rm -rf managers/conda/hello_rust

	@rm -rf managers/apt/build
	@rm -rf managers/homebrew/build
	@rm -rf managers/pypi/*/dist
	@rm -rf packages/hello_*/dist
	@rm -rf packages/hello_*/target
	@rm -rf managers/*/*.deb
	@rm -rf managers/*/*.buildinfo
	@rm -rf managers/*/*.changes
	@rm -rf managers/*/*.dsc
	@rm -rf managers/*/*.tar.gz
	@rm -rf managers/*/*.whl
	@rm -rf managers/conda/meta.yaml  # Automatically generated by greyskull
	@find managers/ -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true
	@find managers/ -name "*.pyc" -delete 2>/dev/null || true
	@find managers/ -name "*.egg-info" -type d -exec rm -rf {} + 2>/dev/null || true
	@echo "✅ Build artifacts cleaned!"



# Reset target - clean and then setup
reset:
	@echo "🔄 Resetting environment..."
	@$(MAKE) clean
	@$(MAKE) setup
	@echo "✅ Environment reset complete!"
