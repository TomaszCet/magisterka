reset

set encoding iso_8859_2

set term post eps enhanced size 12cm,16cm
set out '../../../img/magneto/x10_prime.eps'
set fit errorvariables

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 3
set style arrow 1 nohead ls 5

set border lw 1.5
set samples 200

set xrange [-0.5:8]

a_up            = 68.6335
k_up            = 1.90197
n_up            = 1.16983
A_up            = 0.343854
B_up            = -33.4975
K_up            = 3.67001
N_up            = 1.47062

hill_up(x) = (x>0 && x <7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
dhill_up(x) = (x>0 && x <7.5) ? a_up*n_up*(k_up**n_up)*(x**(n_up-1))/((k_up**n_up+x**n_up)**2) : 1/0
dhill1_up(x)=(x>0 && x <7.5) ? (B_up-A_up)*N_up*(K_up**N_up)*(x**(N_up-1))/(K_up**N_up+x**N_up)**2 : 1/0

set multiplot layout 4,1

################### PIERWSZY MP ###################

set ylabel "{/=28 d{/Symbol \l}_{||}/dH [ppm]}" offset -4.8,0 
set yrange [0:30]
set ytics ('' 0, '5' 5, '10' 10, '15' 15, '20' 20, '25' 25, '' 30)  font ",28"
set xtics (''0,''1,''2,''3,''4,''5,''6,''7,''8)  font ",28"

set bmargin at screen 0.95
set tmargin at screen 0.7
set lmargin at screen 0.15

plot dhill_up(x) w l ls 1 t''

################### DRUGI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol \136}/dH [ppm]}' offset -4.8,0
set yrange [-6:0]
set ytics ('' -6, '-5' -5, '-4' -4, '-3' -3, '-2' -2, '-1' -1, '' 0)  font ",28"

set bmargin at screen 0.7
set tmargin at screen 0.5
set lmargin at screen 0.15

plot dhill1_up(x) w l ls 1 t''


################### TRZECI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol t}/dH [ppm]}' offset -4.8,0
set yrange [0:30]
set ytics ('' 0, '5' 5, '10' 10, '15' 15, '20' 20, '25' 25, '' 30)  font ",28"

set bmargin at screen 0.5
set tmargin at screen 0.3
set lmargin at screen 0.15

plot dhill_up(x)-dhill1_up(x) w l ls 1 t''


################### CZWARTY MP ###################

set ylabel '{/=28d{/Symbol l}_{V}/dH [ppm]}' offset -4.8,-0.3
set xlabel "{/=28{H [kOe]}" offset 0,-2
set yrange [-5:20]
set xtics ('0'0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,'8'8)  font ",28"
set ytics ('' -5, '0' 0, '5' 5, '10' 10, '15' 15, '' 20)   font ",28"
set arrow 1 from -0.5,0 to 8,0 as 1

set bmargin at screen 0.3
set tmargin at screen 0.1
set lmargin at screen 0.15

plot dhill_up(x)+2*dhill1_up(x) w l ls 1 t''

unset multiplot
