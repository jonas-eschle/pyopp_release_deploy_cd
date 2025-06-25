# Hello Numpy

A simple example package for teaching releases, deployment, and continuous integration.

## Features

- Simple hello world functionality
- Generates random numpy arrays
- Command line interface
- Configurable array size and random seed

## Installation

```bash
pip install hello-numpy
```

## Usage

### As a Python module

```python
from hello_numpy import hello_numpy

# Generate a random array of size 5
array = hello_numpy()

# Generate a random array of size 10 with a fixed seed
array = hello_numpy(size=10, seed=42)
```

### From the command line

```bash
# Default usage
hello-numpy

# Specify array size
hello-numpy --size 10

# Specify random seed for reproducibility
hello-numpy --size 10 --seed 42
```

## Development

To install in development mode:

```bash
pip install -e .
```

## License

MIT License