set terminal png size 12*73,720
set output "recovery/plots/mels_S_m657.png"

set xrange [36:36+73]
set xtics 0,25
#set log y

set key above width -1 vertical maxrows 2 
set tmargin 2.5

set arrow from 0,0 to 730,0 nohead

set xlabel "data point"
set ylabel "value" offset 1.5 

plot\
	'recovery/values/reference.txt' index 0 using 1:2 title 'real' with linespoints lt 1 dt 3 lw 3 pt 5 lc rgbcolor "black" pointsize 1, \
	'recovery/values/657/trmf657.txt' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'recovery/values/657/softimp657.txt' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \
	'recovery/values/657/cdrec657_k3.txt' index 0 using 1:2 title 'cdrec\_k3' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "cyan" pointsize 1.2, \
	'recovery/values/657/dynammo657.txt' index 0 using 1:2 title 'dynammo' with linespoints lt 8 dt 2 lw 3 pt 4 lc rgbcolor "red" pointsize 1.2, \
	'recovery/values/657/grouse657.txt' index 0 using 1:2 title 'grouse' with linespoints lt 8 dt 3 lw 3 pt 5 lc rgbcolor "cyan" pointsize 2, \
	'recovery/values/657/stmvl657.txt' index 0 using 1:2 title 'stmvl' with linespoints lt 8 dt 2 lw 3 pt 8 lc rgbcolor "green" pointsize 1.2, \
