#!/bin/bash

TOP_OUTPUT=$(top -bn1)
DF_OUTPUT=$(df -h)
PS_CPU_OUTPUT=$(ps aux)
echo "System monitor"
echo "$TOP_OUTPUT" | awk '/%Cpu/ {print "CPU usage = " $2 + $4 " %"}'
echo "$TOP_OUTPUT" | awk '/MiB Mem/ {print "RAM used = " $6/$4*100 " %"}'
echo "$DF_OUTPUT" | awk '$6 == "/" {print "Disk usage = " $5}'
echo "Proccesses sorted by cpu"
ps aux --sort -%cpu | head -n 5 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t"}'
echo "Proccesses sorted by mem"
ps aux --sort -%mem | head -n 5 | awk '{print $1 "\t" $2 "\t" $3 "\t" $4 "\t"}'