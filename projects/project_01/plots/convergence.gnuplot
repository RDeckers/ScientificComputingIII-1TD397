set term term_type
set output output_file
set key outside;
set key center top;
set ylabel "relative error"
set xlabel "iteration"
plot\
 'data/convergence.dat' using 0:1 w lp title 'power iteration',\
 'data/convergence.dat' using 0:2 w lp title 'inverse iteration'
set output
