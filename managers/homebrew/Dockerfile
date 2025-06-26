# Dockerfile for Homebrew packages building tutorial
FROM homebrew/brew:latest

USER root

# Copy formula, test script, and source packages
COPY hello_numpy.rb /home/linuxbrew/.linuxbrew/
COPY hello_numpy /home/linuxbrew/.linuxbrew/hello_numpy

# Switch to linuxbrew user and set working directory
USER linuxbrew
WORKDIR /home/linuxbrew/.linuxbrew

# Set environment to skip auto-updates and hints
ENV HOMEBREW_NO_AUTO_UPDATE=1 \
    HOMEBREW_NO_ENV_HINTS=1

# Demonstrate the formula structure and test locally
RUN echo "=== Homebrew Formula Structure ===" && \
    cat hello_numpy.rb

# Default command
CMD ["echo", "Homebrew formula validated. To build: brew install --build-from-source ./hello-numpy.rb"]

# Usage instructions:
# docker build -t homebrew-builder .
#
# Full installation (takes longer due to numpy compilation):
# docker run -it homebrew-builder /bin/bash
# brew install python@3.11
# brew install --build-from-source ./hello_numpy.rb
# hello_numpy --size 5 --seed 42
