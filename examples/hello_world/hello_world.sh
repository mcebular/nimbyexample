# Compiling a nim program produces an executable file with
# the same name (i.e. `hello.exe` on Windows).
$ nim compile hello.nim
*some compiling output*

# You can run the program immediately after compilation,
# by supplying the `--run` flag.
$ nim compile --run hello.nim
Hello, world.

# A shorthand command that does the same thing.
$ nim c -r hello-world.nim
Hello, world.
