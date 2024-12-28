#!/bin/bash

echo "=============================="
echo "===Server Performance Stats==="
echo "=============================="
echo ""


#######Total CPU Usage
get_cpu_usage() {
	echo ":CPU Usage:"
	local cpu=$(mpstat 1 1 | awk '/Average/ {print 100 - $12}' | bc)
	echo "CPU Usage is currently at ${cpu}%"
}
get_cpu_usage
echo ""

#Top 5 Process by CPU usage
echo "Top 5 Processes by CPU Usage:"
ps -eo user,cmd,%mem,%cpu --sort=-%cpu | head -6



echo ""
#######Total memory usage (free vs used including percentage)
echo "========================"
echo ""
get_mem_usage() {
	echo ":Memory Usage:"
	local mem_used=$(free -g | awk '/Mem/ {print $3}')
	local mem_available=$(free -g | awk '/Mem/ {print $4}')
	let local mem_percent=100*$mem_used/$mem_available
	printf "Total Memory Used is ${mem_used} GB\nTotal Memory Available is ${mem_available} GB\nMemory Usage: ${mem_percent}%%"
}
get_mem_usage
echo ""
#Top 5 Processes by memory usage
echo ""
echo "Top 5 Processes by Memory Usage"
ps -eo user,cmd,%mem,%cpu --sort=-%mem | head -6

#######Total disk usage (free vs used including percentage)
echo ""
echo "========================"
echo ""
get_disk_usage() {
	echo ":Disk Usage:"
        local disk_used=$(df -BG -l | awk '{sum3+=$3}END{print sum3;}' | bc)
        local disk_available=$(df -BG -l | awk '{sum4+=$4}END{print sum4;}' | bc)
        let local disk_percent=100*$disk_used/$disk_available 
        printf "Total Disk Used is ${disk_used} GB\nTotal Disk Available is ${disk_available} GB\nDisk Usage: ${disk_percent}%%"
}
get_disk_usage
echo ""


###additional stats
#os version
echo ""
echo "========================"
echo ""
get_os() {
	local os_version=$(lsb_release -d | awk -F"\t" '{print $2}')
	echo "The current OS is $os_version."
}
get_os
#uptime
echo ""
echo "========================"
echo ""

get_uptime() {
	local up1=$(uptime -p | awk '{print $1}')
	local up2=$(uptime -p | awk '{print $2" "$3}')
	echo "This user has been $up1 for $up2."
}
get_uptime

#load average
echo ""
echo "========================"
echo ""
load_average() {
	local laverage=$(uptime | awk -F'load average:' '{print $2}')
	echo "The average load for the past 1, 5, and 15 minutes:"
	echo "$laverage"

}
load_average

#logged in users
echo ""
echo "========================"
echo ""
get_users() {
	local users=$(who | awk '{print $1}')
	local number_users=$(who | wc -l)
	echo "There is currently $number_users user(s) online:"
	echo "User(s) Online:"
	echo "$users"
}

get_users



#failed login attempts
echo ""
echo "========================"
echo ""
get_failed() {
	local fattempt=$(grep "Failed password" /var/log/auth.log | wc -l)
	echo "There have been $fattempt Failed Login Attempts."
}
get_failed

echo ""
