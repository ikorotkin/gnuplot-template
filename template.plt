set terminal pngcairo fontscale 3 linewidth 3 font 'Verdana' size 1600,1200
set output 'figure.png'

set grid
set samples 1000

# Legend
set key box opaque top left maxrows 3 font 'Verdana,9' width 0 height 0.5
# set key autotitle columnhead
# set datafile separator ',' # '\t'

# Ticks and border
set border linewidth 1.25
set tics scale 0.75
set style line 13 lc rgb 'grey' lt 1 lw 0.5
set grid xtics ytics ls 13

# Title and axis labels
set title 'Plot title' font 'Verdana,14'
set xlabel '{/:Italic x}' # font 'Verdana,14'
set ylabel '{/:Italic y}'

# Ranges
set logscale x 10
set format x '10^{%T}'
set xrange [1e-3:1e-1]
set yrange [0:1]

# Line styles
set style line 1 lc rgb '#0060ad' lt 1 dashtype 1   lw 2 pointtype 7 pointsize 2.5
set style line 2 lc rgb '#dd181f' lt 2 dashtype '-' lw 2 pointtype 5 pointsize 2.5
set style line 3 lc rgb '#9400d3' lt 3 dashtype '.' lw 2 pointtype 2 pointsize 2.5

# Labels
set label 'Label' textcolor rgb '#777777' font 'Verdana,10' at 0.0012,0.5 front

f(x) = 3*GPVAL_pi*x - 1e-3

file_name = 'data.dat'

plot \
    '+' using ($1):(0.45):(0.55) lc rgb '#dddddd' notitle with filledcurves, \
    file_name u 1:2 w points ls 1 title '{/:Italic a} = 1', \
    file_name u 1:($3*1.2) w linespoints ls 2 title '{/:Italic a} = 2', \
    f(x) w lines ls 3 notitle


# Delete lc rgb to use lt:
# 0 - black dots
# 1 - purple line (default)
# 2 - green line
# 3 - light blue
# 4 - orange
# 5 - yellow
# 6 - blue
# 7 - red
# 8 - black
