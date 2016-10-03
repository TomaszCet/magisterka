reset

set encoding iso_8859_2

set term post eps enhanced size 10cm,14cm
set out '../../img/magneto/compare_wzdluzna.eps'
set fit errorvariables

set key top left

data_1x00 = '../../dane/magneto/x00/wzdluzna_up.dat'
data_2x00= '../../dane/magneto/x00/poprzeczna_up.dat'
data_1x02 = '../../dane/magneto/x02/wzdluzna_up.dat'
data_2x02= '../../dane/magneto/x02/poprzeczna_up.dat'
data_1x04 = '../../dane/magneto/x04/wzdluzna_up.dat'
data_2x04= '../../dane/magneto/x04/poprzeczna_up.dat'
data_1x05= '../../dane/magneto/x05/wzdluzna_up.dat'
data_2x05= '../../dane/magneto/x05/poprzeczna_up.dat'
data_1x06 = '../../dane/magneto/x06/wzdluzna_up.dat'
data_2x06= '../../dane/magneto/x06/poprzeczna_up.dat'
data_1x08 = '../../dane/magneto/x08/wzdluzna_up.dat'
data_2x08= '../../dane/magneto/x08/poprzeczna_up.dat'
data_1x10 = '../../dane/magneto/x10/wzdluzna_up.dat'
data_2x10= '../../dane/magneto/x10/poprzeczna_up.dat'


set style line 1 lt 1 lc rgb "navy" pt 7 ps 1
set style line 2 lt 1 lc rgb "navy" pt 13 ps 1.4
set style line 3 lt 1 lc rgb "red" pt 7 ps 1
set style line 4 lt 1 lc rgb "red" pt 13 ps 1.4
set style line 5 lt 1 lc rgb "green" pt 7 ps 1
set style line 6 lt 1 lc rgb "green" pt 13 ps 1.4
set style line 7 lt 1 lc rgb "violet" pt 7 ps 1
set style line 8 lt 1 lc rgb "violet" pt 13 ps 1.4
set style line 9 lt 1 lc rgb "orange" pt 7 ps 1
set style line 10 lt 1 lc rgb "orange" pt 13 ps 1.4
set style line 11 lt 1 lc rgb "brown" pt 7 ps 1
set style line 12 lt 1 lc rgb "brown" pt 13 ps 1.4
set style line 13 lt 1 lc rgb "pink" pt 7 ps 1
set style line 14 lt 1 lc rgb "pink" pt 13 ps 1.4

set style arrow 1 nohead lw 0.5 
set lmargin at screen 0.18
set bmargin at screen 0.1
set border lw 1.5
set xrange [0:8]
set xtics (''0,'1'1,'2'2,'3'3,'4'4,'5'5,'6'6,'7'7,''8)  font ",28"
set xlabel "{/=28 H[kOe]}" offset 0,-1.5

set ylabel "{/=28{/Symbol \l}_{||} [ppm]}" offset -3.5,0
set ytics ('' 0, '100' 100, '200' 200, '300' 300, '400' 400, '500' 500, '600' 600, '700' 700, '800' 800) font ",28"

plot data_1x00 w p ls 1 t 'x=0',data_1x02 w p ls 3 t 'x=0.2',data_1x04 w p ls 5 t 'x=0.4',data_1x05 w p ls 7 t 'x=0.5',data_1x06 w p ls 9 t 'x=0.6',data_1x08 w p ls 11 t 'x=0.8',data_1x10 w p ls 13 t 'x=1.0'


set out '../../img/magneto/compare_poprzeczna.eps'
set yrange [-550:0]
set ytics ('' 0, '-100' -100, '-200' -200, '-300' -300, '-400' -400, '-500' -500, '-600' -600, '-700' -700) font ",28"

set ylabel '{/=28{/Symbol l}_{/Symbol \136} [ppm]}' offset -2.8,0
set key bottom left 

plot data_2x00 w p ls 1 t 'x=0', data_2x02 w p ls 3 t 'x=0.2', data_2x04 w p ls 5 t 'x=0.4', data_2x05 w p ls 7 t 'x=0.5', data_2x06 w p ls 9 t 'x=0.6', data_2x08 w p ls 11 t 'x=0.8', data_2x10 w p ls 13 t 'x=1.0'
