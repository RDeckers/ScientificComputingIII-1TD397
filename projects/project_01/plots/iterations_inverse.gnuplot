set term term_type
set output output_file
set key outside;
set key center top;
set ylabel "iterations until convergence"
set xlabel "n"
plot\
 'data/power_iterations.dat' using 1:6 w lp title 'Inverse method'
set output
