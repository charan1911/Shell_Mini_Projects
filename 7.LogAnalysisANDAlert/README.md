````md
# 📜 Log Monitoring & Analysis (Project 7)

Blunt reality first:  
This project **reads system logs**, **counts problems**, and **reports patterns**.  
No dashboards. No AI. Just raw logs telling the truth.

If something breaks, logs already know. This project listens.

---

## 📌 What This Project Does

Project 7 focuses on **log monitoring and analysis** using two scripts:

1. **Incremental Error Report Generator**
2. **Daily Log Analysis & Security Summary**

This is about **visibility**, not prevention.

---

## 🚨 1. Incremental Error Report Script

### Purpose  
Extracts **new errors only** from `/var/log/syslog` and appends them to a report.

No reprocessing old noise.

---

### 🧠 How It Works

- Reads the last processed line number from a state file
- Scans only **new log entries**
- Filters keywords:
  - `error`
  - `warning`
  - `failed`
  - `denied`
- Counts errors
- Appends results to a report file

Incremental analysis = faster + cleaner.

---

### 📂 Files Used

```text
Project7/
├── temp/syslog_last_line      # Stores last read line number
└── reports/error_report.txt  # Error reports
````

---

### 📝 Report Includes

* Timestamp
* Total errors found
* Exact error log lines

If it’s in the report, it actually happened.

---

## 📊 2. Daily Log Analysis Script

### Purpose

Analyzes **today’s logs**, compares them with **yesterday**, and highlights risks.

This script is about **trend awareness**.

---

### 🧠 What Gets Analyzed

* Total log entries today
* Error count
* Warning count
* Failed events
* Successful logins
* Failed logins
* Yesterday vs today comparison
* Peak log activity hour
* Top repeated error messages
* Sudo command usage (who & when)

Security + stability in one place.

---

### 📈 Key Logic Highlights

* Date-based filtering (`YYYY-MM-DD`)
* Separate handling for:

  * `/var/log/syslog`
  * `/var/log/auth.log`
* Simple comparison logic:

  * If today > yesterday → alert

No prediction. Just math.

---

## 📂 Log Sources Used

```text
/var/log/syslog
/var/log/auth.log
```

These logs are the backbone of Linux diagnostics.

---

## ⚠️ WSL Reality Check

### On WSL ❌

* `/var/log/syslog` may be empty or incomplete
* `/var/log/auth.log` often does not exist
* Login statistics are unreliable

### On Real Linux ✅

* Full log availability
* Accurate login tracking
* Meaningful security analysis

This project **expects real Linux logs**.

---

## 📦 Requirements

* Bash
* Root or sudo access
* Tools used:

  * `grep`
  * `awk`
  * `cut`
  * `sort`
  * `uniq`
  * `wc`
  * `date`

---

## 🚫 What This Project Is NOT

* Not SIEM
* Not IDS
* Not real-time alerting
* Not log rotation tool

It’s **log intelligence at script level**.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ❌ (log sources incomplete)

---

## 🏁 Final Verdict

* Incremental error tracking: smart
* Daily analysis: detailed
* Security visibility: useful
* Noise filtering: manual but effective

If you can read logs, you can debug systems.
This project proves that skill.

