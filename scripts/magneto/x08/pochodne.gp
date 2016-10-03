reset

set encoding iso_8859_2

set term post eps enhanced size 12cm,16cm
set out '../../../img/magneto/x08_prime.eps'
set fit errorvariables

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 3
set style arrow 1 nohead ls 5

set border lw 1.5

set xrange [-0.5:8]
set samples 300

a_up            = 261.124
k_up            = 9.6224
n_up            = 1.10366
A_up            = -3.15382
B_up            = -133.017
K_up            = 8.66182
N_up            = 1.53623

hill_up(x) = (x>0 && x <7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
dhill_up(x) = (x>0 && x <7.5) ? a_up*n_up*(k_up**n_up)*(x**(n_up-1))/((k_up**n_up+x**n_up)**2) : 1/0
dhill1_up(x)=(x>0 && x <7.5) ? (B_up-A_up)*N_up*(K_up**N_up)*(x**(N_up-1))/(K_up**N_up+x**N_up)**2 : 1/0

set multiplot layout 4,1

################### PIERWSZY MP ###################

set ylabel "{/=28 d{/Symbol \l}_{||}/dH [ppm]}" offset -4.8,0 
set yrange [8:22]
set ytics ('' 8, '10' 10, '12' 12, '14' 14, '16' 16, '18' 18, '20' 20, '' 22)  font ",28"
set xtics (''0,''1,''2,''3,''4,''5,''6,''7,''8)  font ",28"

set bmargin at screen 0.95
set tmargin at screen 0.7
set lmargin at screen 0.15

plot dhill_up(x) w l ls 1 t''

################### DRUGI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol \136}/dH [ppm]}' offset -4.8,0
set yrange [-10:0]
set ytics ('' -10, '-8' -8, '-6' -6, '-4' -4, '-2' -2, '' 0)  font ",28"

set bmargin at screen 0.7
set tmargin at screen 0.5
set lmargin at screen 0.15

plot dhill1_up(x) w l ls 1 t''


################### TRZECI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol t}/dH [ppm]}' offset -4.8,0
set yrange [14:28]
set ytics ('' 14, '' 16, '18' 18, '' 20, '22' 22, '' 24, '26' 26, '' 28)  font ",28"

set bmargin at screen 0.5
set tmargin at screen 0.3
set lmargin at screen 0.15

plot dhill_up(x)-dhill1_up(x) w l ls 1 t''


################### CZWARTY MP ###################

set ylabel '{/=28d{/Symbol l}_{V}/dH [ppm]}' offset -4.8,-0.3
set xlabel "{/=28{H [kOe]}" offset 0,-2
set yrange [-10:20]
set xtics ('0'0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,'8'8)  font ",28"
set ytics (''-10, '-5' -5, '0' 0, '5' 5, '10' 10, '15' 15, '' 20)   font ",28"
set arrow 1 from -0.5,0 to 8,0 as 1

set bmargin at screen 0.3
set tmargin at screen 0.1
set lmargin at screen 0.15

plot dhill_up(x)+2*dhill1_up(x) w l ls 1 t''

unset multiplot
