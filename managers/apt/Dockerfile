# Dockerfile for APT packages building tutorial
FROM ubuntu:latest

# Install APT packages building dependencies
RUN apt update && apt install -y \
    build-essential \
    debhelper \
    dh-python \
    python3-all \
    pybuild-plugin-pyproject \
    python3-hatchling \
    python3-numpy \
    python3-pip \
    && pip3 install --break-system-packages hatch-vcs

# Set working directory
WORKDIR /build

# Copy the build script and debian files
COPY build-deb.sh .
COPY debian/ debian/
RUN chmod +x build-deb.sh

# Copy the Python packages from managers directory
COPY hello_numpy/ hello_numpy/

RUN ./build-deb.sh

