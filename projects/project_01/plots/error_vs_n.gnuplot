set term term_type
set output output_file
set key outside;
set key center top;
set logscale y;
set ylabel "relative error"
set xlabel "n"
set format y "10^{%L}"
plot\
 'data/power_iterations.dat' using 1:(abs($4-$3)/$4) w lp title 'Dominant eigenvector',\
 'data/power_iterations.dat' using 1:(abs($8-$7)/$8) w lp title 'Least dominant eigenvector'
set output
