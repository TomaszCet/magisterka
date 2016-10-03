reset

set encoding iso_8859_2


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


################### PIERWSZY MP ###################

set sample 1000
set table "./p1.dat"
plot dhill_up(-x) w l ls 1 t''
reset

################### DRUGI MP ###################

set sample 1000
set table "./p2.dat"
plot dhill1_up(x) w l ls 1 t''
reset

################### TRZECI MP ###################

set sample 1000
set table "./p3.dat"
plot dhill_up(-x)-dhill1_up(x) w l ls 1 t''
reset

################### CZWARTY MP ###################

set sample 1000
set table "./p4.dat"
plot dhill_up(-x)+2*dhill1_up(x) w l ls 1 t''
reset
