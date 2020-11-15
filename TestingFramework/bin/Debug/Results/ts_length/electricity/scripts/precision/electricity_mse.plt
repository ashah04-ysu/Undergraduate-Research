set terminal postscript eps enhanced color "Helvetica" 30
set output "error/plots/electricity_mse.eps"

set xrange [1000-1:5000+1]
set xtics 1000,500
set yrange [0:1]
#set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "number of rows"
set ylabel "mean squared error" offset 1.5 

plot\
	'error/mse/MSE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \


set output "error/plots/electricity_rmse.eps"
set ylabel "root mean squared error" offset 1.5 

plot\
	'error/rmse/RMSE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \

set output "error/plots/electricity_mae.eps"
set ylabel "mean absolute error" offset 1.5 

plot\
	'error/mae/MAE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
