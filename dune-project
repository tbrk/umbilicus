(lang dune 3.21)
(using directory-targets 0.1)

(name umbilicus)

(generate_opam_files true)

(authors "Author")
(maintainers "Maintainer")
(bug_reports "Goodluck")
(homepage "https://ocaml.org")

(license "WTFPL")

(package
 (name umbilicus)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
   (ocaml (>= 4.14.2))
   (conf-cmake :build)
   (sexplib0 :build)
   (csexp :build)
 )
)

