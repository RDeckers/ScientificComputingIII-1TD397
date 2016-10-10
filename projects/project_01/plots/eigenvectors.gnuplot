set term term_type
set output output_file
set key outside;
set key center top;
set ylabel ""
set xlabel "index"
plot\
 'data/eigenvector.dat' using 0:1 w lp title 'Dominant eigenvector',\
 'data/eigenvector.dat' using 0:2 w lp title 'Least-dominant eigenvector'
set output
