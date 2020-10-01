set terminal postscript eps enhanced color "Helvetica" 30
set output "error/plots/temp_mse.eps"

set xrange [5-1:50+1]
set xtics 5,5
set yrange [0:1]
#set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "number of columns"
set ylabel "mean squared error" offset 1.5 

plot\
	'error/mse/MSE_spirit.dat' index 0 using 1:2 title 'spirit' with linespoints lt 8 dt 6 lw 3 pt 6 lc rgbcolor "dark-green" pointsize 2, \


set output "error/plots/temp_rmse.eps"
set ylabel "root mean squared error" offset 1.5 

plot\
	'error/rmse/RMSE_spirit.dat' index 0 using 1:2 title 'spirit' with linespoints lt 8 dt 6 lw 3 pt 6 lc rgbcolor "dark-green" pointsize 2, \

set output "error/plots/temp_mae.eps"
set ylabel "mean absolute error" offset 1.5 

plot\
	'error/mae/MAE_spirit.dat' index 0 using 1:2 title 'spirit' with linespoints lt 8 dt 6 lw 3 pt 6 lc rgbcolor "dark-green" pointsize 2, \
