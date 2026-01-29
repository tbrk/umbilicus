(lang dune 3.21)
(using directory-targets 0.1)

(name umbilicus)

(generate_opam_files true)

(authors "Author")
(maintainers "Maintainer")

(license "WTFPL")

(package
 (name umbilicus)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
   (ocaml (>= 4.14.2))
   (conf-cmake (and (>= 3.4) :build))
   (sexplib0 :build)
   (csexp :build)
 )
)

