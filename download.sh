
#!/bin/bash
# Author: Tushar saini
# Date: 14/11/25
# --- Script to log CPU and memory usage to a file at regular intervals ---
# log file path
log_file_path="/home/tushar7357/monitoring_logs "
log_file="$log_file_path/sys_monitoring.log"
# interval in seconds (default: 5)
interval=5
# create log file directory if it doesn't exist
mkdir -p "$log_file_path"
# create log file if it doesn’t exist
if [ ! -f "$log_file" ]; then
echo "Timestamp, CPU(%), Memory(%)" > "$log_file"
fi
# infinite loop to log usage
while true
do
timestamp=$(date +"%Y-%m-%d %H:%M:%S")
# get CPU usage (user + system)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
# get memory usage (%)
mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
# append to log file
echo "$timestamp, $cpu_usage, $mem_usage" >> "$log_file"
#real time logs dislpay
tail -f /home/tushar7357/monitoring_logs/sys_monitoring.log
# sleep until the interval
sleep $interval
done 
