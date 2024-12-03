
# System Monitoring Script  

---

## Description  

This Bash script monitors system performance in real-time. It tracks:  

- CPU usage.  
- RAM utilization.  
- Disk space usage.  

The script sends notifications if any metrics exceed predefined thresholds and logs the data for further analysis.  

---

## Features  

1. **System metrics tracking**:  
   - Percentage of CPU load.  
   - Percentage of RAM usage.  
   - Percentage of disk space usage.  

2. **Customizable thresholds**:  
   You can set thresholds for each metric in the script's configuration.  

3. **Notifications**:  
   Sends alerts via `notify-send` (if available).  

4. **Logging**:  
   Logs all events to `/var/log/system_monitor.log`.  

---

## Installation  

1. Download the script and save it as `system_monitor.sh`.  

2. Make the script executable:  
   ```bash
   chmod +x system_monitor.sh

    Ensure your user has administrative privileges (to write logs).

## Usage

    Run the script with administrator privileges:

    sudo ./system_monitor.sh

    The script will monitor the system in real-time with a check interval of 5 seconds.

## Configuration

You can adjust thresholds and the log file path by editing the following variables in the script:

CPU_THRESHOLD=80     # CPU load threshold in percentage
RAM_THRESHOLD=80     # RAM usage threshold in percentage
DISK_THRESHOLD=80    # Disk usage threshold in percentage
LOG_FILE="/var/log/system_monitor.log" # Log file path

## Example Output

    CPU Load: 45% | RAM Usage: 70% | Disk Usage: 60%
    CPU Load: 85% | RAM Usage: 90% | Disk Usage: 95%
    [Notification]: CPU Load exceeded: 85%
    [Notification]: Disk Usage exceeded: 95%

### Requirements

    Operating System: Linux (including Kali Linux).
    Utilities:
        notify-send (for notifications).
        Administrator privileges to write logs in the system directory.

### Future Enhancements

- Add support for sending notifications via Telegram or email.
- Implement a graphical interface to display metrics.
- Integrate with data analysis tools (e.g., load graphs).

## Author

Created for practical use and to improve system parameter monitoring.

Feel free to suggest improvements! 


Let me know if you need further refinements or additions!))