reset

set encoding iso_8859_2

set term post eps enhanced size 12cm,16cm
set out '../../../img/magneto/x00_prime.eps'
set fit errorvariables

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 2
set style arrow 1 nohead ls 5

set border lw 1.5

set xrange [-0.5:8]

a_up            = 793.18
k_up            = -1.40331
n_up            = 2.0587
a_down          = 784.686
k_down          = -1.19033
n_down          = 1.91665
A_up            = 9.48386
B_up            = -552.734
K_up            = 2.67732
N_up            = 2.38419
A_down          = 6.7288
B_down          = -554.043
K_down          = 2.73203
N_down          = 2.13316 

hill_up(x) = (x<0 && x >-7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
dhill_up(x) = (x<0 && x >-7.5) ? -a_up*n_up*(k_up**n_up)*(x**(n_up-1))/((k_up**n_up+x**n_up)**2) : 1/0
#dhill_down(x) = a_down*(x**n_down)/(k_down**n_down+x**n_down)
dhill1_up(x)=(x>0 && x <7.5) ? (B_up-A_up)*N_up*(K_up**N_up)*(x**(N_up-1))/(K_up**N_up+x**N_up)**2 : 1/0
#dhill1_down(x)=A_down+(B_down-A_down)*(x**N_down)/(K_down**N_down+x**N_down)

set multiplot layout 4,1

################### PIERWSZY MP ###################

set ylabel "{/=28 d{/Symbol \l}_{||}/dH [ppm]}" offset -4,0 
set yrange [0:400]
set ytics (''0, '' 50, '100' 100, '' 150, '200' 200, '' 250, '300' 300, '' 350, '' 400)  font ",28"
set xtics (''0,''1,''2,''3,''4,''5,''6,''7,''8)  font ",28"

set bmargin at screen 0.95
set tmargin at screen 0.7
set lmargin at screen 0.15

plot dhill_up(-x) w l ls 1 t''

################### DRUGI MP ###################

set ylabel '{/=28d{/Symbol l}_{/Symbol \136}/dH [ppm]}' offset -2.9,0
set yrange [-160:0]
set ytics ('' -160, '' -140, '-120' -120, '' -100, '-80' -80, '' -60, '-40' -40, '' -20, '' 0)  font ",28"

set bmargin at screen 0.7
set tmargin at screen 0.5
set lmargin at screen 0.15

plot dhill1_up(x) w l ls 1 t''


################### TRZECI MP ###################

unset ytics
set ylabel '{/=28d{/Symbol l}_{/Symbol t}/dH [ppm]}' offset -4,0
set yrange [0:500]
set ytics (''0, '' 50, '100' 100, '' 150, '200' 200, '' 250, '300' 300, '' 350, '400' 400, '' 450, '' 500)  font ",28"

set bmargin at screen 0.5
set tmargin at screen 0.3
set lmargin at screen 0.15

plot dhill_up(-x)-dhill1_up(x) w l ls 1 t''


################### CZWARTY MP ###################

set ylabel '{/=28d{/Symbol l}_{V}/dH [ppm]}' offset -2.9,-0.3
set xlabel "{/=28{H [kOe]}" offset 0,-2
set yrange [-200:250]
set xtics ('0'0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,'8'8)  font ",28"
set ytics (''-200, '' -150, '-100' -100, '' -50, '0' 0, '' 50, '100' 100, '' 150, '200' 200, '' 250)   font ",28"
set arrow 1 from -0.5,0 to 8,0 as 1

set bmargin at screen 0.3
set tmargin at screen 0.1
set lmargin at screen 0.15

plot dhill_up(-x)+2*dhill1_up(x) w l ls 1 t''

unset multiplot
