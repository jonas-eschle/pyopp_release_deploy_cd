# Docker Containerization

Package applications in lightweight, portable containers.

## Simple Example

Take one of the Dockerfiles from the Python package examples, like `hello-numpy`, and use it to create a Docker container.
```bash
# Build and run
docker build -t hello_numpy .
docker run hello_numpy
```

## Why Docker?

- **Portability**: Runs on any system with Docker
- **Isolation**: No dependency conflicts
- **Easy deployment**: Single container to ship


## Publishing to Docker Hub

**Step 1:** Create account at https://hub.docker.com

**Step 2:** Manual upload:
```bash
docker tag hello_numpy username/hello_numpy:latest
docker login
docker push username/hello_numpy:latest
```

**Step 3:** Users run with:
```bash
docker run username/hello_numpy:latest
```

## Automated Building

See `.github/workflows/docker-build.yml` for GitHub Actions automation.
