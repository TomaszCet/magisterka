reset

set encoding iso_8859_2

set term post eps enhanced size 12cm,16cm
set out '../../../img/magneto/x08.eps'
set fit errorvariables

data_1up = '../../../dane/magneto/x08/wzdluzna_up.dat'
data_2up = '../../../dane/magneto/x08/poprzeczna_up.dat'
data_1down = '../../../dane/magneto/x08/wzdluzna_down.dat'
data_2down = '../../../dane/magneto/x08/poprzeczna_down.dat'

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 3

set style arrow 1 nohead ls 5

set border lw 1.5

set xrange [-0.5:8]

a_up = 700
k_up = 5
n_up = 1

a_down = 700
k_down = 5
n_down = 1

#A_down = 10
#B_down = -100
#K_down = 5
#N_down = 1

hill_up(x) = a_up*(x**n_up)/(k_up**n_up+x**n_up)
hill_down(x) = a_down*(x**n_down)/(k_down**n_down+x**n_down)
hill1_up(x)=A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up)
hill1_down(x)=A_down+(B_down-A_down)*(x**N_down)/(K_down**N_down+x**N_down)

fit hill_up(x) data_1up via a_up,k_up,n_up
fit hill_down(x) data_1down via a_down,k_down,n_down
fit hill1_up(x) data_2up every ::1 via A_up,B_up,K_up,N_up
fit hill1_down(x) data_2down every ::1 via A_down,B_down,K_down,N_down

hill_up(x) = (x>0 && x <7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill_down(x) = (x>0 && x <7.5) ? a_down*(x**n_down)/(k_down**n_down+x**n_down) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
hill1_down(x)= (x>0 && x <7.5) ?  A_down+(B_down-A_down)*(x**N_down)/(K_down**N_down+x**N_down) : 1/0

set multiplot layout 3,1

################### PIERWSZY MP ###################

set arrow from -0.5,0 to 8,0 as 1
set yrange[-100:150]
set ylabel "{/=28 {/Symbol \l}_{||} [ppm]}" offset -3.8,5
set xtics ('' 0, '' 1, '' 2, '' 3, '' 4, '' 5, '' 6, '' 7, '' 8)
set ytics ('' -100, '-75' -75,'-50' -50, '-25' -25, '0' 0, '25' 25, '50' 50, '75' 75, '100' 100, '125' 125, '' 150)  font ",28"
set label 1 at -1.75,-75  '{/=28 {/Symbol l}_{/Symbol \136} [ppm]' rotate left 

set bmargin at screen 0.95
set tmargin at screen 0.5
set lmargin at screen 0.15

plot data_1up w p ls 1 t'', data_1down w p ls 2 t'', hill_up(x) w l ls 1 t'', hill_down(x) w l ls 2 t'',  data_2up w p ls 3 t'', data_2down w p ls 4 t'', hill1_up(x) w l ls 3 t'', hill1_down(x) w l ls 4 t''

################### DRUGI MP ###################

unset label 1
set yrange [-50:200]
set xtics ('' 0, '' 1, '' 2, '' 3, '' 4, '' 5, '' 6, '' 7, '' 8)
set ytics ('' -100,'-50' 50, '0' 0, '50' 50, '100' 100, '150' 150, '' 200)  font ",28"
set ylabel '{/=28{/Symbol l}_{/Symbol t} [ppm]}' offset -4,-0.4

set bmargin at screen 0.5
set tmargin at screen 0.3
set lmargin at screen 0.15

plot hill_up(x)-hill1_up(x) w l ls 1 t''

################### TRZECI MP ###################

unset xtics
set xtics ('0' 0, '1' 1, '2' 2, '3' 3, '4' 4, '5' 5, '6' 6, '7' 7, '' 8)  font ",28"
set yrange [-20:20]
set ytics ('' -20,'' -15, '-10' -10, '' -5, '0' 0,'' 5, '10' 10, '' 15, '' 20)  font ",28"
set ylabel '{/=28{/Symbol l}_{V} [ppm]}' offset -4,0.2
set xlabel "{/=28{H [kOe]}" offset 0,-2

set bmargin at screen 0.3
set tmargin at screen 0.1
set lmargin at screen 0.15

plot hill_up(x)+2*hill1_up(x) w l ls 1 t''

unset multiplot

set sample 1000
set table "./max.dat"
set xrange [0:8]
plot hill_up(x)+2*hill1_up(x) w l ls 1 t''
