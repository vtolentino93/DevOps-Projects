#!/bin/bash
echo "=============================="
echo "===Server Performance Stats==="
echo "=============================="
echo ""
#Total CPU Usage
get_cpu_usage() {
	echo "Total CPU Usage:"
	local cpu=$(mpstat 1 1 | awk '/Average/ {print 100 - $12}' | bc)
	echo "CPU Usage is currently at ${cpu}%"
	echo ""
}
get_cpu_usage

#Total memory usage (free vs used including percentage)
echo "========================"
echo ""

#Total disk usage (free vs used including percentage)
echo "========================"
echo ""
get_disk_usage() {
	echo "Disk Usage:"
        local disk_used=$(df -BG -l | awk '{sum3+=$3}END{print sum3;}' | bc)
        local disk_available=$(df -BG -l | awk '{sum4+=$4}END{print sum4;}' | bc)
        local disk_percent=$(vailable)) | bc)
        printf "Total Disk Used is ${disk_used} GB\nTotal Disk Available is ${disk_available} GB\nDisk Usage: ${disk_percent}%%"
 	echo ""
}
get_disk_usage

#Top 5 Process by CPU usage
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

