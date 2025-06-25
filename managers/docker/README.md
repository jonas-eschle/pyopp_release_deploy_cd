# Docker Containerization

Package applications in lightweight, portable containers.

## Simple Example

Take one of the Dockerfiles from the Python package examples, like `hello-numpy`, and use it to create a Docker container.
```bash
# Build and run
docker build -t hello-numpy .
docker run hello-numpy
```

## Why Docker?

- **Portability**: Runs on any system with Docker
- **Isolation**: No dependency conflicts
- **Easy deployment**: Single container to ship


## Publishing to Docker Hub

**Step 1:** Create account at https://hub.docker.com

**Step 2:** Manual upload:
```bash
docker tag hello-numpy username/hello-numpy:latest
docker login
docker push username/hello-numpy:latest
```

**Step 3:** Users run with:
```bash
docker run username/hello-numpy:latest
```

## Automated Building

See `.github/workflows/docker-build.yml` for GitHub Actions automation.
