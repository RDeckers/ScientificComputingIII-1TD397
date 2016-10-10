set term term_type
set output output_file
set key outside;
set key center top;
set ylabel "condition number"
set xlabel "n"
set logscale y
set format y "10^{%L}"
plot\
 'data/power_iterations.dat' using 1:5 w lp title 'A',\
 'data/power_iterations.dat' using 1:9 w lp title 'A-uI'
set output
