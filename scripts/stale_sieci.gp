reset

set encoding iso_8859_1

set term post eps enhanced size 12cm,14cm
set out '../img/stale_sieci.eps'
set fit errorvariables
set border lw 2

data = '../dane/lattice_constant.dat'

set style line 1 lt 1 lw 4 lc rgb "navy" pt 7 ps 1
set style line 2 lt 1 lw 4 lc rgb "red" pt 7 ps 1
set style line 3 lt 1 lw 4 lc rgb "blue" pt 7 ps 1
set style line 4 lt 1 lw 0.5 lc rgb 'black' pt 7 ps 1


f(x) = a*x + b
g(x) = c*x + d
h(x) = e*x + f
fit f(x) data u 1:2 via a,b
fit g(x) data u 1:4 via c,d
fit h(x) data u 2:6 via e,f

#set label at 3.2,55 "{/Symbol \D}t = 4 [{/Symbol m}s]"

set multiplot layout 3,1

################### PIERWSZY MP ###################

set ylabel "{/=20Va [{\305}]}" offset -1,0

set bmargin at screen 0.98
set tmargin at screen 0.68
set lmargin at screen 0.12

set xtics ('' -0.2, '' 0, '' 0.2, '' 0.4, '' 0.6, '' 0.8, '' 1, '' 1.2)
set ytics ('' 7.33, '7.34' 7.34, '7.35' 7.35, '7.36' 7.36, '7.37' 7.37, '7.38' 7.38, '7.39' 7.39, '7.40' 7.40, '' 7.41)

set xrange [-0.2:1.2]

plot data u 1:2:3 w errorbars ls 1 t'', f(x) w l ls 2 t ''

################### Drugi MP ###################


set ylabel "{/=20V [{\305}^3]}" offset -2.1,0

set bmargin at screen 0.68
set tmargin at screen 0.38
set lmargin at screen 0.12

set xtics ('' -0.2, '' 0, '' 0.2, '' 0.4, '' 0.6, '' 0.8, '' 1, '' 1.2)
set ytics ('' 394, '396' 396, '398' 398, '400' 400, '402' 402, '404' 404, '406' 406, '' 408)

set xrange [-0.2:1.2]

plot data u 1:4:5 w errorbars ls 1 t'', g(x) w l ls 2 t ''


################### Trzeci MP ###################

set ylabel "{/=20V_{at} [{/Symbol m}m^3]}" offset -0.8,0

set bmargin at screen 0.38
set tmargin at screen 0.08
set lmargin at screen 0.12


#set xlabel "{/=20Domieszka gadolinu x (Tb_{0.27}Dy_{0.73})_{1-x}Gd_xFe_2}"
set xlabel "{/=20 x}

#set xtics ('' -0.2, '0' 0, '0.2' 0.2, '0.4' 0.4, '0.6' 0.6, '0.8' 0.8, '1.0' 1, '' 1.2)
set xtics ('' 7.33, '7.34' 7.34, '7.35' 7.35, '7.36' 7.36, '7.37' 7.37, '7.38' 7.38, '7.39' 7.39, '7.40' 7.40, '' 7.41)
set ytics ('' 33.2, '33.3' 33.3, '33.4' 33.4, '33.5' 33.5, '33.6' 33.6, '33.7' 33.7, '33.8' 33.8, '33.9' 33.9, '34.0' 34.0, '34.1' 34.1, '' 34.2)

set yrange [33.2:34.2]
set xrange [7.33:7.41]

plot data u 2:6:3 w xerrorbars ls 1 t'', h(x) w l ls 2 t ''

unset multiplot
