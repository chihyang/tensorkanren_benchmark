(lang dune 3.19)

(name tkbenchmark)

(generate_opam_files true)

(source
 (github chihyang/tensorkanren_benchmark.git))

(package
 (name tkbenchmark)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml owl-top msat)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
