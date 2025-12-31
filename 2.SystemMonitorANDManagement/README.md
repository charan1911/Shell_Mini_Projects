````md
# ⚙️ System Monitor & Process Auto-Restart (Project 2)

Blunt version up front:  
This project **keeps scripts alive** and **keeps an eye on system resources**.  
If something dies, it gets restarted.  
If resources cross limits, it gets logged.  
No GUI. No excuses.

---

## 📌 What This Project Does

This project has **two responsibilities**:

1. **Process Auto-Restart**
2. **System Resource Monitoring**

They can run together or separately, depending on how paranoid you are.

---

## 🔁 1. Process Auto-Restart

### Purpose  
Ensures critical scripts (`task1.sh`, `task2.sh`) are **always running**.

If a script stops:
- It is restarted automatically
- It runs **fully detached**
- Closing the terminal will NOT kill it

This is basic reliability. Nothing fancy.

---

### 🧠 How Auto-Restart Works

- Uses `pgrep -f` to check if the process is running
- If **not running**:
  - Starts it using `setsid + nohup`
  - Redirects output to log files
- If **running**:
  - Does nothing
  - Prints status

Detached means detached.  
Terminal death ≠ process death.

---

### 📂 Auto-Restart Directory Structure

```text
ProcessAutoRestart/
├── task1/
│   ├── task1.sh
│   └── task1.log
├── task2/
│   ├── task2.sh
│   └── task2.log
└── auto_restart.sh
````

Each task has its own folder and log.
No mixed mess.

---

## 📊 2. System Resource Monitor

### Purpose

Monitors **CPU**, **Memory**, and **Disk** usage and logs violations.

This is **threshold-based**, not AI, not predictive.

---

### 🧠 What Gets Monitored

| Resource | Threshold | Action |
| -------- | --------- | ------ |
| CPU      | > 1.25%   | Logged |
| Memory   | > 6.4%    | Logged |
| Disk     | > 0.25%   | Logged |

Yes, the thresholds are intentionally low.
This is for testing and learning, not production tuning.

---

### 📝 Logging Behavior

* Logs are appended to:

  ```text
  SRM_Logs.txt
  ```
* Each log entry includes:

  * Timestamp
  * Resource type
  * Current usage
  * How much it exceeded the limit

No alerts.
No notifications.
Just evidence.

---

## 📂 Resource Monitor Files

```text
SystemMonitorANDManagement/
├── SystemResourceManagement.sh
└── SRM_Logs.txt
```

---

## 📦 Requirements

* Bash
* Linux utilities:

  * `pgrep`
  * `top`
  * `free`
  * `df`
  * `awk`
  * `bc`
* Linux or WSL

---

## ⚠️ WSL Notes (Reality Check)

* Resource values on WSL are **not always accurate**
* CPU and memory stats depend on Windows host behavior
* Logs are still generated correctly

Works, but don’t treat numbers as gospel.

---

## 🚫 What This Project Is NOT

* Not systemd
* Not a supervisor daemon
* Not Prometheus
* Not production monitoring

It’s a **learning-focused monitoring setup**.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ⚠️ (stats depend on host system)

---

## 🏁 Final Verdict

* Auto-restart: solid
* Resource monitoring: basic but honest
* Logging: clean
* Overengineering: zero

If you want real monitoring, integrate proper tools.
If you want to understand **how things work under the hood**, this is perfect.

```
```

