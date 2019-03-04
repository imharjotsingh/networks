#!/bin/bash



time=200
bwnetdef=2
qsizedef=100

delay=5

iperf_port=5001

for qsize in 20 100; do
    dir=queue$qsize

    python tcp.py --bw-net $bwnetdef --delay $delay --dir $dir --time $time --maxq $qsize
 
    python plot_queue.py -f $dir/q.txt -o $dir/q.png
    python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png
done

for bw in 1000 100; do
    dir=bw$bw

    python tcp.py --bw-net $bw --delay $delay --dir $dir --time $time --maxq $qsizedef
   
    python plot_queue.py -f $dir/q.txt -o $dir/q.png
    python plot_ping.py -f $dir/ping.txt -o $dir/rtt.png
done

