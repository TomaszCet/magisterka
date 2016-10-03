reset

set style line 1 lt 1 lw 5 lc rgb "navy" pt 7 ps 1.5
set style line 2 lt 1 lw 5 lc rgb "red" pt 7 ps 1.5
set style line 3 lt 1 lw 5 lc rgb "violet" pt 13 ps 2
set style line 4 lt 1 lw 5 lc rgb "green" pt 13 ps 2
set style line 5 lt 1 lc rgb 'black' lw 2
set style arrow 1 nohead ls 5

set xrange [0:8]

a_up            = 571.864
k_up            = 4.43672
n_up            = 1.45442
a_down          = 676.546
k_down          = 5.7245
n_down          = 1.18866
A_up            = 3.64355
B_up            = -324.068
K_up            = 4.78175
N_up            = 1.87325
A_down          = 15.5929
B_down          = -410.461
K_down          = 6.22713
N_down          = 1.39108

hill_up(x) = (x>0 && x <7.5) ? a_up*(x**n_up)/(k_up**n_up+x**n_up) : 1/0
hill1_up(x)= (x>0 && x <7.5) ? A_up+(B_up-A_up)*(x**N_up)/(K_up**N_up+x**N_up) : 1/0
dhill_up(x) = (x>0 && x <7.5) ? a_up*n_up*(k_up**n_up)*(x**(n_up-1))/((k_up**n_up+x**n_up)**2) : 1/0
#dhill_down(x) = a_down*(x**n_down)/(k_down**n_down+x**n_down)
dhill1_up(x)=(x>0 && x <7.5) ? (B_up-A_up)*N_up*(K_up**N_up)*(x**(N_up-1))/(K_up**N_up+x**N_up)**2 : 1/0
#dhill1_down(x)=A_down+(B_down-A_down)*(x**N_down)/(K_down**N_down+x**N_down)


################### PIERWSZY MP ###################

set sample 1000
set table "./p1.dat"
plot dhill_up(x)
reset

################### DRUGI MP ###################

set sample 1000
set table "./p2.dat"
plot dhill1_up(x)
reset

################### TRZECI MP ###################

set sample 1000
set table "./p3.dat"
plot dhill_up(x)-dhill1_up(x)
reset

################### CZWARTY MP ###################

set sample 1000
set table "./p4.dat"
plot dhill_up(x)+2*dhill1_up(x)
reset
