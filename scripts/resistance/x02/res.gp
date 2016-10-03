reset

set encoding iso_8859_2

set term post eps enhanced
set out '../../../img/opor/x02.eps'
set fit errorvariables

##########  SAMPLE  ##########
a = (2.89 + 2.99 + 2.95 + 2.97 + 2.84)/5
b = (1.75 + 1.79 + 1.76 + 1.77 + 1.74)/5
l = 7.06

##########  DATA  ##########
data = '../../../dane/opor/x02/x02.dat'

##########  LINE STYLE  ##########
set style line 1 lt 1 lc rgb "navy" pt 7 ps 0.7
set style line 2 lt 1 lc rgb "red" pt 7 ps 0.7

##########  GRID OPTIONS  ##########
set style arrow 1 nohead lw 0.5 
set lmargin at screen 0.18
set bmargin at screen 0.1
set border lw 1.5

##########  TICS PROPERTIES  ##########
#set xtics (''0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,''8)  font ",28"
set xlabel "{/=28 T[K]}"
set ylabel "{/=28 R[{/Symbol W]}"

plot data u 1:2#($2*a*b/l) w p ls 1
