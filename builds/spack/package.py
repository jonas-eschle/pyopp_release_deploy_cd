from spack.package import *


class PyHelloNumpy(PythonPackage):
    """Educational Python packaging example."""

    homepage = "https://github.com/example/hello-numpy"
    pypi = "hello-numpy/hello-numpy-0.1.0.tar.gz"

    version("0.1.0", sha256="actual-sha256-here")

    depends_on("python@3.9:", type=("build", "run"))
    depends_on("py-hatchling", type="build")
    depends_on("py-numpy", type=("build", "run"))