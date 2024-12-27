#!/bin/bash

echo "=============================="
echo "===Server Performance Stats==="
echo "=============================="
echo ""


#######Total CPU Usage
get_cpu_usage() {
	echo "Total CPU Usage:"
	local cpu=$(mpstat 1 1 | awk '/Average/ {print 100 - $12}' | bc)
	echo "CPU Usage is currently at ${cpu}%"
}
get_cpu_usage
echo ""


#######Total memory usage (free vs used including percentage)
echo "========================"
echo ""
get_mem_usage() {
	echo "Total Memory Usage"
	local mem_used=$(free -g | awk '/Mem/ {print $3}')
	local mem_available=$(free -g | awk '/Mem/ {print $4}')
	let local mem_percent=100*$mem_used/$mem_available
	printf "Total Memory Used is ${mem_used} GB\nTotal Memory Available is ${mem_available} GB\nMemory Usage: ${mem_percent}%%"
}
get_mem_usage
echo ""


#######Total disk usage (free vs used including percentage)
echo ""
echo "========================"
echo ""
get_disk_usage() {
	echo "Disk Usage:"
        local disk_used=$(df -BG -l | awk '{sum3+=$3}END{print sum3;}' | bc)
        local disk_available=$(df -BG -l | awk '{sum4+=$4}END{print sum4;}' | bc)
        let local disk_percent=100*$disk_used/$disk_available 
        printf "Total Disk Used is ${disk_used} GB\nTotal Disk Available is ${disk_available} GB\nDisk Usage: ${disk_percent}%%"
}
get_disk_usage
echo ""

#Top 5 Process by CPU usage
echo ""
echo "========================"
echo ""
#Top 5 Processes by memory usage
echo ""
echo "========================"
###additional
#os version
echo ""
echo "========================"
#uptime
echo ""
echo "========================"
#uptime

#load average
echo ""
echo "========================"
#logged in users

echo ""
echo "========================"
#who

#failed login attempts
echo ""
echo "========================"

