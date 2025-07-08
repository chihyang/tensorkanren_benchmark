(lang dune 3.19)

(name tkbenchmark)

(generate_opam_files true)

(source
 (github chihyang/tensorkanren_benchmark.git))

(package
 (name tkbenchmark)
 (synopsis "TensorKanren's benchmark")
 (description "This project is the benchmark for tensorKanren, a different way of running miniKanren.")
 (depends ocaml owl-top msat)
 (tags
  ("miniKanren" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
