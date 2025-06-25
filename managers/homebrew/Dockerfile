# Dockerfile for Homebrew packages building tutorial
FROM homebrew/brew:latest

USER root

# Copy formula, test script, and source packages
COPY hello-numpy.rb /home/linuxbrew/.linuxbrew/
COPY test-formula.sh /home/linuxbrew/.linuxbrew/
COPY hello_numpy /home/linuxbrew/.linuxbrew/hello_numpy
COPY test-local.sh /home/linuxbrew/.linuxbrew/

# Switch to linuxbrew user and set working directory
USER linuxbrew
WORKDIR /home/linuxbrew/.linuxbrew

# Set environment to skip auto-updates and hints
ENV HOMEBREW_NO_AUTO_UPDATE=1 \
    HOMEBREW_NO_ENV_HINTS=1

# Demonstrate the formula structure and test locally
RUN echo "=== Homebrew Formula Structure ===" && \
    cat hello-numpy.rb && \
    echo -e "\n=== Testing Package Installation ===" && \
    ./test-local.sh

# Default command
CMD ["echo", "Homebrew formula validated. To build: brew install --build-from-source ./hello-numpy.rb"]

# Usage instructions:
# docker build -t homebrew-builder .
#
# Full installation (takes longer due to numpy compilation):
# docker run -it homebrew-builder /bin/bash
# brew install python@3.11
# brew install --build-from-source ./hello-numpy.rb
# hello-numpy --size 5 --seed 42
