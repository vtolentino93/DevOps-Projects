#!/bin/bash

echo "Server Performance Stats"
echo "========================"
#Total CPU Usage
get_cpu_usage() {
    echo "Total CPU Usage:"
    idle=$(mpstat 1 1 | awk '/Average/ {print 100 - $12}' | bc)
    echo "CPU Usage: ${idle}%"
    echo ""
}
get_cpu_usage

#Total memory usage (free vs used including percentage)

#Total disk usage (free vs userd including percentage)
#du

#Top 5 Process by CPU usage

#Top 5 Processes by memory usage

###additional
#os version

#uptime
#uptime

#load average

#logged in users
#who

#failed login attempts


