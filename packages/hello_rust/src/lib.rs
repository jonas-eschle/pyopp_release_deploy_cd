use pyo3::prelude::*;

/// A simple hello function implemented in Rust
#[pyfunction]
fn hello_from_rust(name: &str) -> String {
    format!("Hello {} from Rust!", name)
}

/// A function that computes the sum of a list of integers
#[pyfunction]
fn sum_list(numbers: Vec<i64>) -> i64 {
    numbers.iter().sum()
}

/// A Python module implemented in Rust
#[pymodule]
fn _hello_rust(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(hello_from_rust, m)?)?;
    m.add_function(wrap_pyfunction!(sum_list, m)?)?;
    Ok(())
}
