# install stanza within dynamic_include

1. `libjerry` is the source code for a “vendor” shared library.
2. `dune` contains rules for building the shared library as 
   `jerry-build/build/libjerry.so` and generating a 
   `jerry-build/libjerry.sexp` file.
3. `umbilicus/dune` contains a `(dynamic_include 
   ../jerry-build/libjerry.sexp)` to
    1. copy `jerry-build/build/libjerry.so` into `umbilicus`
    2. install `umbilicus/libjerry.so` in the `lib` section

## Problem 1

`opam install` does not install `libjerry.so`, although it does if one 
instead uses `(include ../jerry-build/libjerry.sexp)`.

The [documentation](https://dune.readthedocs.io/en/latest/reference/dune/dynamic_include.html) 
states that _The following stanzas cannot be dynamically generated:
... * Public executables or install section with the `bin` section_. Does 
this infer that “install section with the `lib` section” should work?

## Problem 2

A dummy flag is needed in `umbilicus/dune` to trigger the copy of 
`libjerry.so`: `-DDUNE_DEP=%{dep:libjerry.so}`.

Wouldn't it be better to allow fields like `(deps libjerry.so)` in `library` 
stanzas?

## Problem 3

`dune exec -- ./stimpy.exe` fails with `error while loading shared 
libraries: libjerry.so: cannot open shared object file: No such file or 
directory`. This is because it is built with a relative path to 
`umbilicus/umbilicus.cmxa`, thus replacing `$CAMLORIGIN` with `umbilicus/` 
in the executable's `RUNPATH`: `readelf -d _build/default/stimpy.exe | grep 
RUNPATH`. Setting the working directory to `_build/default`, or any other 
directory with a relative path `./umbilicus/libjerry.so` (!), and then 
running `./stimpy.exe` works.

Is there an option to `exec` using full paths to `.cmxa` files?

(The library works correctly when installed, since `ocamlfind` implements 
`-package umbilicus` with absolute paths.)

