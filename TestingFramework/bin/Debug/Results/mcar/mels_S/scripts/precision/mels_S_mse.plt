set terminal postscript eps enhanced color "Helvetica" 30
set output "error/plots/mels_S_mse.eps"

set xrange [10-1:100+1]
set xtics 10,10
set yrange [0:1]
#set log y

set key above width -2 vertical maxrows 3
set tmargin 4.0

set xlabel "percentage of missing values"
set ylabel "mean squared error" offset 1.5 

plot\
	'error/mse/MSE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'error/mse/MSE_softimp.dat' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \
	'error/mse/MSE_cdrec_k3.dat' index 0 using 1:2 title 'cdrec\_k3' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "cyan" pointsize 1.2, \
	'error/mse/MSE_cdrec_k2.dat' index 0 using 1:2 title 'cdrec\_k2' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "blue" pointsize 1.2, \
	'error/mse/MSE_dynammo.dat' index 0 using 1:2 title 'dynammo' with linespoints lt 8 dt 2 lw 3 pt 4 lc rgbcolor "red" pointsize 1.2, \
	'error/mse/MSE_grouse.dat' index 0 using 1:2 title 'grouse' with linespoints lt 8 dt 3 lw 3 pt 5 lc rgbcolor "cyan" pointsize 2, \
	'error/mse/MSE_stmvl.dat' index 0 using 1:2 title 'stmvl' with linespoints lt 8 dt 2 lw 3 pt 8 lc rgbcolor "green" pointsize 1.2, \


set output "error/plots/mels_S_rmse.eps"
set ylabel "root mean squared error" offset 1.5 

plot\
	'error/rmse/RMSE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'error/rmse/RMSE_softimp.dat' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \
	'error/rmse/RMSE_cdrec_k3.dat' index 0 using 1:2 title 'cdrec\_k3' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "cyan" pointsize 1.2, \
	'error/rmse/RMSE_cdrec_k2.dat' index 0 using 1:2 title 'cdrec\_k2' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "blue" pointsize 1.2, \
	'error/rmse/RMSE_dynammo.dat' index 0 using 1:2 title 'dynammo' with linespoints lt 8 dt 2 lw 3 pt 4 lc rgbcolor "red" pointsize 1.2, \
	'error/rmse/RMSE_grouse.dat' index 0 using 1:2 title 'grouse' with linespoints lt 8 dt 3 lw 3 pt 5 lc rgbcolor "cyan" pointsize 2, \
	'error/rmse/RMSE_stmvl.dat' index 0 using 1:2 title 'stmvl' with linespoints lt 8 dt 2 lw 3 pt 8 lc rgbcolor "green" pointsize 1.2, \

set output "error/plots/mels_S_mae.eps"
set ylabel "mean absolute error" offset 1.5 

plot\
	'error/mae/MAE_trmf.dat' index 0 using 1:2 title 'trmf' with linespoints lt 8 dt 2 lw 3 pt 9 lc rgbcolor "orange" pointsize 1.2, \
	'error/mae/MAE_softimp.dat' index 0 using 1:2 title 'softimp' with linespoints lt 8 dt 2 lw 3 pt 5 lc rgbcolor "dark-violet" pointsize 1.2, \
	'error/mae/MAE_cdrec_k3.dat' index 0 using 1:2 title 'cdrec\_k3' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "cyan" pointsize 1.2, \
	'error/mae/MAE_cdrec_k2.dat' index 0 using 1:2 title 'cdrec\_k2' with linespoints lt 8 lw 3 pt 7 lc rgbcolor "blue" pointsize 1.2, \
	'error/mae/MAE_dynammo.dat' index 0 using 1:2 title 'dynammo' with linespoints lt 8 dt 2 lw 3 pt 4 lc rgbcolor "red" pointsize 1.2, \
	'error/mae/MAE_grouse.dat' index 0 using 1:2 title 'grouse' with linespoints lt 8 dt 3 lw 3 pt 5 lc rgbcolor "cyan" pointsize 2, \
	'error/mae/MAE_stmvl.dat' index 0 using 1:2 title 'stmvl' with linespoints lt 8 dt 2 lw 3 pt 8 lc rgbcolor "green" pointsize 1.2, \
