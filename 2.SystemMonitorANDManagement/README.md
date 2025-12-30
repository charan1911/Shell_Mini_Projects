---

# 📄 System Resource Management Script

**Script Name:** `SystemResourceManagement.sh`
**Purpose:** Monitor CPU, Memory, and Disk usage on Linux and log warnings if thresholds are exceeded.

---

## 1️⃣ Features

* **CPU Monitoring:** Checks current CPU usage and logs if usage exceeds defined threshold.
* **Memory Monitoring:** Calculates memory usage percentage and logs if usage exceeds threshold.
* **Disk Monitoring:** Monitors root (`/`) disk usage and logs if usage exceeds threshold.
* **Logging:** All events are logged in a central log file (`srm_logs.txt`) with timestamps.
* **Customizable Thresholds:** Set CPU, Memory, and Disk limits easily via variables.

---

## 2️⃣ Requirements

* Linux system (Ubuntu, Debian, RHEL, CentOS, etc.)
* Bash shell
* `bc` installed (used for decimal comparisons)
* Permissions to write logs to the chosen folder

**Install `bc` if missing:**

```bash
sudo apt install bc       # Debian/Ubuntu
sudo yum install bc       # RHEL/CentOS
```

---

## 3️⃣ Installation / Setup

1. Place the script in your desired folder, e.g.:

```bash
/mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/
```

2. Ensure the log directory exists:

```bash
mkdir -p /mnt/c/Users/DELL/Desktop/Shell_Scripting_Basic_Projects
touch /mnt/c/Users/DELL/Desktop/Shell_Scripting_Basic_Projects/srm_logs.txt
```

3. Make the script executable:

```bash
chmod +x SystemResourceManagement.sh
```

4. Test run:

```bash
bash SystemResourceManagement.sh
```

---

## 4️⃣ Script Configuration

Open the script and adjust thresholds:

```bash
CPU_THRESHOLD=75     # % CPU usage limit
MEM_THRESHOLD=80     # % Memory usage limit
DISK_THRESHOLD=90    # % Disk usage limit
LOG_FILE="/mnt/c/Users/DELL/Desktop/Shell_Scripting_Basic_Projects/srm_logs.txt"
```

---

## 5️⃣ Logging

* Logs are stored in `$LOG_FILE`.
* Example log entry:

```
2025-10-08 15:00:12 - CPU Crossed: 85.32% (Over by 10.32%)
2025-10-08 15:00:12 - Memory Crossed: 82.45% (Over by 2.45%)
```

* Each entry includes **timestamp**, **resource**, **current usage**, and **amount over threshold**.

---

## 6️⃣ Automate with Cron

To run the script automatically at regular intervals:

1. Open crontab for the current user:

```bash
crontab -e
```

2. Add a line to run the script every 5 minutes:

```bash
*/5 * * * * /bin/bash /mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/SystemResourceManagement.sh
```

**Explanation of cron syntax:**

```
┌───────────── minute (0-59)
│ ┌───────────── hour (0-23)
│ │ ┌───────────── day of month (1-31)
│ │ │ ┌───────────── month (1-12)
│ │ │ │ ┌───────────── day of week (0-7) (Sunday=0 or 7)
│ │ │ │ │
*/5 * * * *   -> run every 5 minutes
```

3. Save and exit. Cron will now automatically execute the script and append logs.

---

## 7️⃣ Optional Enhancements

* **Alerts:** Send email or Slack notifications when thresholds are exceeded.
* **Separate Logs:** Maintain separate logs for CPU, Memory, Disk.
* **CSV Output:** For easier plotting in Excel or Google Sheets.
* **Real-time Monitoring:** Run continuously with `watch` or a daemon script.

---

## 8️⃣ Notes

* Ensure you have write permissions to the log file path.
* Thresholds are percentages; adjust based on your system’s capacity.
* The script is lightweight and suitable for personal or small server monitoring.

---
