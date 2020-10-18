set terminal postscript eps enhanced color "Helvetica" 30
set output "runtime/plots/drift10_red_rt.eps"

set xrange [4:10]
set xtics 4,1
#set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "number of columns"
set ylabel "running time (microseconds)" offset 1.5 

plot\
	'runtime/values/softimp_runtime.txt' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \


set output "runtime/plots/drift10_red_rt_log.eps"
set log y

plot\
	'runtime/values/softimp_runtime.txt' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \


