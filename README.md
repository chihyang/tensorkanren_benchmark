Benchmark for tensorKanren
===

# Command

## Dependency

[hyperfine](https://github.com/sharkdp/hyperfine)

## faster-miniKanren

Put [mk/sudoku4-untyped.rkt](mk/sudoku4-untyped.rkt) and
[mk/sudoku9-untyped.rkt](mk/sudoku9-untyped.rkt) into the root folder downloaded
from https://github.com/michaelballantyne/faster-minikanren and then run the
following command.


``` shell
hyperfine -i --export-json sudoku4-mk.json --export-csv  sudoku4-mk.csv 'timeout 120 racket sudoku4-untyped.rkt'
hyperfine -i --export-json sudoku9-mk.json --export-csv  sudoku9-mk.csv 'timeout 120 racket sudoku9-untyped.rkt'
```

## tensorKanren

Run the following command in current directory.

``` shell
hyperfine --warmup 1 --export-json sudoku4-tk.json --export-csv  sudoku4-tk.csv 'dune exec sudoku4'
hyperfine --warmup 1 --export-json sudoku9-tk.json --export-csv  sudoku9-tk.csv 'dune exec sudoku9'
```