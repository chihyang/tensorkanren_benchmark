#!/usr/bin/bash

my_array=("medium" "hard" "expert")

for level in "${my_array[@]}"; do
    hyperfine --warmup 1\
              --export-json sudoku9-tk-${level}.json\
              --export-csv sudoku9-tk-${level}.csv\
              "dune exec sudoku9-${level}"
done
