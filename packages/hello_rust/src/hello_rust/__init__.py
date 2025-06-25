"""Hello Rust: A Python packages with Rust extensions."""

from ._hello_rust import hello_from_rust, sum_list

__all__ = ["hello_from_rust", "sum_list"]

def main():
    """CLI entry point for hello-rust."""
    import argparse
    
    parser = argparse.ArgumentParser(description="Hello Rust with Python extensions")
    parser.add_argument("--name", default="World", help="Name to greet")
    parser.add_argument("--numbers", nargs="*", type=int, default=[1, 2, 3, 4, 5], 
                       help="Numbers to sum")
    
    args = parser.parse_args()
    
    print(hello_from_rust(args.name))
    print(f"Sum of {args.numbers}: {sum_list(args.numbers)}")

if __name__ == "__main__":
    main()