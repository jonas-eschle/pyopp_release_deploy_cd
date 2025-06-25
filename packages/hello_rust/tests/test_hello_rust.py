"""Tests for hello_rust packages."""

from hello_rust import hello_from_rust, sum_list


def test_hello_from_rust():
    """Test the hello_from_rust function."""
    assert hello_from_rust("World") == "Hello World from Rust!"
    assert hello_from_rust("Python") == "Hello Python from Rust!"


def test_sum_list():
    """Test the sum_list function."""
    assert sum_list([1, 2, 3, 4, 5]) == 15
    assert sum_list([]) == 0
    assert sum_list([42]) == 42