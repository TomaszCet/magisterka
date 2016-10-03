reset

set encoding iso_8859_2

set term post eps enhanced size 12cm,16cm
set out '../../../img/magneto/x02_prime.eps'
set fit errorvariables

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 3
set style arrow 1 nohead ls 5

set border lw 1.5

set xrange [-0.5:8]

a_up            = 650.219
k_up            = 3.19985
n_up            = 1.61335
a_down          = 672.451
k_down          = 3.17378
n_down          = 1.45738
A_up            = 5.06496
B_up            = -402.841
K_up            = 3.37493
N_up            = 1.7995
A_down          = 6.88604
B_down          = -382.247
K_down          = 2.96406
N_down          = 1.87834

hill_up(x) = (x>0 && x <7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
dhill_up(x) = (x>0 && x <7.5) ? a_up*n_up*(k_up**n_up)*(x**(n_up-1))/((k_up**n_up+x**n_up)**2) : 1/0
dhill1_up(x)=(x>0 && x <7.5) ? (B_up-A_up)*N_up*(K_up**N_up)*(x**(N_up-1))/(K_up**N_up+x**N_up)**2 : 1/0

set multiplot layout 4,1

################### PIERWSZY MP ###################

set ylabel "{/=28 d{/Symbol \l}_{||}/dH [ppm]}" offset -4,0 
set yrange [0:140]
set ytics (''0, '' 20, '40' 40, '' 60, '80' 80, '' 100, '120' 120, '' 140)  font ",28"
set xtics (''0,''1,''2,''3,''4,''5,''6,''7,''8)  font ",28"

set bmargin at screen 0.95
set tmargin at screen 0.7
set lmargin at screen 0.15

plot dhill_up(x) w l ls 1 t''

################### DRUGI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol \136}/dH [ppm]}' offset -3.9,0
set yrange [-80:0]
set ytics ('' -80, '-60' -60, '-40' -40, '-20' -20, '0' 0)  font ",28"

set bmargin at screen 0.7
set tmargin at screen 0.5
set lmargin at screen 0.15

plot dhill1_up(x) w l ls 1 t''


################### TRZECI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol t}/dH [ppm]}' offset -4,0
set yrange [0:220]
set ytics (''0, '50' 50, '100' 100, '150' 150, '200' 200)  font ",28"

set bmargin at screen 0.5
set tmargin at screen 0.3
set lmargin at screen 0.15

plot dhill_up(x)-dhill1_up(x) w l ls 1 t''


################### CZWARTY MP ###################

set ylabel '{/=28d{/Symbol l}_{V}/dH [ppm]}' offset -3.9,-0.3
set xlabel "{/=28{H [kOe]}" offset 0,-2
set yrange [-40:20]
set xtics ('0'0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,'8'8)  font ",28"
set ytics (''-40, '-30' -30, '-20' -20, '-10' -10, '0' 0, '10' 10, '' 20)   font ",28"
set arrow 1 from -0.5,0 to 8,0 as 1

set bmargin at screen 0.3
set tmargin at screen 0.1
set lmargin at screen 0.15

plot dhill_up(x)+2*dhill1_up(x) w l ls 1 t''

unset multiplot
