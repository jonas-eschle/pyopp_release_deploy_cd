class HelloNumpy < Formula
  desc "Educational Python packaging example"
  homepage "https://github.com/example/hello-numpy"
  version "0.1.0"
  license "MIT"

  depends_on "python@3.11"

  def install
    # Create virtualenv using the preferred method
    venv_dir = libexec
    system "python3.11", "-m", "venv", venv_dir

    # Activate venv by setting the PATH
    ENV.prepend_path "PATH", "#{venv_dir}/bin"

    # Install numpy from PyPI using binary wheels only (no compilation)
    system "pip", "install", "--only-binary=:all:", "numpy>=2.0.0"

    # Install our local package directly
    system "pip", "install", "/home/linuxbrew/.linuxbrew/hello_numpy/"

    # Create wrapper script
    (bin/"hello-numpy").write_env_script "#{venv_dir}/bin/hello-numpy",
      PATH: "#{venv_dir}/bin:$PATH"
  end

  test do
    system bin/"hello-numpy", "--help"
    output = shell_output("#{bin}/hello-numpy --size 3 --seed 42")
    assert_match "Hello from hello_numpy!", output
  end
end
