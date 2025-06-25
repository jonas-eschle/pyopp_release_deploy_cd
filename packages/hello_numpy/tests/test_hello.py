"""Tests for hello_numpy packages."""

import numpy as np
from hello_numpy import hello_numpy


def test_hello_numpy_default():
    """Test with default parameters."""
    result = hello_numpy()
    assert isinstance(result, np.ndarray)
    assert result.shape == (5,)


def test_hello_numpy_custom_size():
    """Test with custom size."""
    result = hello_numpy(size=10)
    assert result.shape == (10,)


def test_hello_numpy_with_seed():
    """Test reproducibility with seed."""
    result1 = hello_numpy(size=5, seed=42)
    result2 = hello_numpy(size=5, seed=42)
    np.testing.assert_array_equal(result1, result2)
