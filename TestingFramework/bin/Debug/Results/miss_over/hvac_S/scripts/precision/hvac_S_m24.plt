set terminal png size 12*30,720
set output "recovery/plots/hvac_S_m24.png"

set xrange [0:0+30]
set xtics 0,25
#set log y

set key above width -1 vertical maxrows 2 
set tmargin 2.5

set arrow from 0,0 to 731,0 nohead

set xlabel "data point"
set ylabel "value" offset 1.5 

plot\
	'recovery/values/reference.txt' index 0 using 1:2 title 'real' with linespoints lt 1 dt 3 lw 3 pt 5 lc rgbcolor "black" pointsize 1, \
	'recovery/values/24/trmf24.txt' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'recovery/values/24/softimp24.txt' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \

