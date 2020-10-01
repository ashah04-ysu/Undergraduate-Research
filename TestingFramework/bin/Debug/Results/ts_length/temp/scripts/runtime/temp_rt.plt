set terminal postscript eps enhanced color "Helvetica" 30
set output "runtime/plots/temp_rt.eps"

set xrange [1000:5000]
set xtics 1000,500
#set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "number of rows"
set ylabel "running time (microseconds)" offset 1.5 

plot\
	'runtime/values/spirit_runtime.txt' index 0 using 1:2 title 'spirit' with linespoints lt 8 dt 6 lw 3 pt 6 lc rgbcolor "dark-green" pointsize 2, \


set output "runtime/plots/temp_rt_log.eps"
set log y

plot\
	'runtime/values/spirit_runtime.txt' index 0 using 1:2 title 'spirit' with linespoints lt 8 dt 6 lw 3 pt 6 lc rgbcolor "dark-green" pointsize 2, \


