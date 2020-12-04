set terminal png size 12*20,720
set output "recovery/plots/airtemp_1_m20.png"

set xrange [36:36+20]
set xtics 0,25
#set log y

set key above width -1 vertical maxrows 2 
set tmargin 2.5

set arrow from 0,0 to 730,0 nohead

set xlabel "data point"
set ylabel "value" offset 1.5 

plot\
	'recovery/values/reference.txt' index 0 using 1:2 title 'real' with linespoints lt 1 dt 3 lw 3 pt 5 lc rgbcolor "black" pointsize 1, \
	'recovery/values/20/trmf20.txt' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'recovery/values/20/softimp20.txt' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \
	'recovery/values/20/cdrec20_k2.txt' index 0 using 1:2 title 'cdrec\_k2' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "blue" pointsize 1.2, \
	'recovery/values/20/dynammo20.txt' index 0 using 1:2 title 'dynammo' with linespoints lt 8 dt 2 lw 3 pt 4 lc rgbcolor "red" pointsize 1.2, \
	'recovery/values/20/grouse20.txt' index 0 using 1:2 title 'grouse' with linespoints lt 8 dt 3 lw 3 pt 5 lc rgbcolor "cyan" pointsize 2, \
	'recovery/values/20/stmvl20.txt' index 0 using 1:2 title 'stmvl' with linespoints lt 8 dt 2 lw 3 pt 8 lc rgbcolor "green" pointsize 1.2, \

