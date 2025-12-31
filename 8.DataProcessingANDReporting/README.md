````md
# 📊 Data Processing & Reporting (Project 8)

Straight to the point:  
This project **extracts data**, **processes it**, and **produces readable reports**.  
No dashboards. No charts. Just clean, scripted reporting.

Project 8 has **two reporting scripts**:
1. Disk Usage Report
2. Top 10 IPs Report

---

## 📌 What This Project Does

- Monitors disk usage across mounts
- Flags disks crossing a usage threshold
- Extracts IP addresses from system logs
- Reports the most frequent IPs
- Writes everything to log files for review

This is reporting, not monitoring.  
Run it when you want answers.

---

## 💽 8.1 Disk Usage Report Script

### Purpose  
Checks disk usage for selected mount points and reports status based on a threshold.

---

### 🧠 How Disk Usage Logic Works

- Uses `df -h` to fetch disk details
- Extracts:
  - Filesystem
  - Total space
  - Used space
  - Free space
  - Usage percentage
- Compares usage against a predefined threshold
- Marks disk as:
  - `OK`
  - `WARNING`

Clear rules. Clear output.

---

### ⚙️ Configuration

- **Threshold:** `50%`
- **Mounts Checked:**
  - `/`
  - `/mnt/c`
  - `/mnt/d`

You can add or remove mounts easily.

---

### 📂 Output File

```text
8.1DiskUsageReportScript/
└── DiskUsageReport.txt
````

Each execution appends a timestamped report.

---

### 📝 Sample Report Line

```text
FileSystem:/dev/sda1 Total:100G Used:60G Free:40G Percentage:60% Status:WARNING
```

No interpretation needed. It speaks plainly.

---

## 🌐 8.2 Top 10 IPs Report Script

### Purpose

Finds and reports the **top 10 most frequent IP addresses** from system logs.

This helps identify:

* Repeated connections
* Suspicious traffic patterns
* Noisy sources

---

### 🧠 How IP Analysis Works

* Scans `/var/log/syslog`
* Extracts valid IPv4 addresses using regex
* Counts occurrences
* Sorts by frequency
* Outputs the top 10

No external tools. Just text processing.

---

### 📂 Output File

```text
8.2Top10ipsReport/
└── Top10IpsReportLog.txt
```

Each run appends a new timestamped block.

---

## 📦 Requirements

* Bash
* Standard Linux tools:

  * `df`
  * `awk`
  * `grep`
  * `sort`
  * `uniq`
  * `wc`
* Read access to `/var/log/syslog`

---

## ⚠️ WSL Reality Check

### Disk Usage

* `/mnt/c` and `/mnt/d` work correctly
* Disk stats are mapped from Windows

### IP Report ❌

* `/var/log/syslog` may be empty or incomplete
* IP analysis may return no useful data

For meaningful IP reports, use **real Linux**.

---

## 🚫 What This Project Is NOT

* Not real-time monitoring
* Not alerting system
* Not log correlation engine
* Not security analytics platform

It’s **script-level reporting**, by design.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ⚠️ (disk reporting works, log-based IP reporting limited)

---

## 🏁 Final Verdict

* Disk reporting: clean and practical
* IP analysis: powerful on real Linux
* Complexity: low
* Learning value: high

If you can process text, you can extract insights.
This project proves that.

```
```

