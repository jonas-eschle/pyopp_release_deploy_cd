"""Main module for hello_numpy packages."""

import numpy as np


def hello_numpy(size=5, seed=None):
    """Print a hello message with a random numpy array."""
    if seed is not None:
        np.random.seed(seed)

    random_array = np.random.rand(size)

    print("Hello from hello_numpy!")
    print(f"Here's a random array of size {size}:")
    print(random_array)

    return random_array


def main():
    """Entry point for the command line interface."""
    import argparse

    parser = argparse.ArgumentParser(description="Hello world with numpy")
    parser.add_argument("--size", type=int, default=5, help="Array size")
    parser.add_argument("--seed", type=int, help="Random seed")

    args = parser.parse_args()
    hello_numpy(size=args.size, seed=args.seed)


if __name__ == "__main__":
    main()
