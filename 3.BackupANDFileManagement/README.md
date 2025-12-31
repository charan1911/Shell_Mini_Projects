````md
# 💾 Backup & File Management (Project 3)

Blunt truth first:  
This project **backs up your data** and **cleans old backups**.  
No compression tricks. No cloud magic. Just files, timestamps, and discipline.

---

## 📌 What This Project Does

Project 3 has **two simple jobs**:

1. **Automated Full Backup**
2. **Old Backup Cleanup**

If you don’t back up data, you will lose it.  
If you never clean backups, you will lose disk space.

This project handles both.

---

## 🗂️ 1. Automated Full Backup Script

### Purpose  
Creates a **compressed full backup** of a directory with a timestamped filename.

---

### 🧠 How the Backup Works

- Takes a source directory
- Creates a `.tar.gz` archive
- Names it using the current date & time
- Stores it in a backup directory
- Logs every backup event

Every run = one full backup.  
No incremental logic. No guessing.

---

### 📂 Backup Structure

```text
BackupANDFileManagement/
├── data/                  # Source data to back up
└── backups/
    ├── full_backup_YYYY-MM-DD_HH-MM-SS.tar.gz
    └── backup_log.txt
````

---

### 📝 Backup Logging

Each backup entry includes:

* Timestamp
* Backup filename

Logs are appended to:

```text
backup_log.txt
```

If it’s not logged, it didn’t happen.

---

## 🧹 2. Old Backup Cleanup Script

### Purpose

Deletes **old backup files** to prevent storage abuse.

This version is set to **10 minutes** for testing.
In real life, you’d use days or weeks.

---

### 🧠 How Cleanup Works

* Scans the backup directory
* Finds files older than **10 minutes**
* Deletes them silently
* Logs the cleanup action

No confirmation prompts.
Automation means automation.

---

### 📂 Cleanup Files

```text
BackupANDFileManagement/
└── backups/
    ├── cleanup_log.txt
    └── (old backup files removed automatically)
```

---

## ⏱️ Cleanup Rule (Current)

| Rule     | Value        |
| -------- | ------------ |
| File age | > 10 minutes |
| Action   | Delete       |

This is for testing only.
Do not use this timing in production unless you enjoy pain.

---

## 📦 Requirements

* Bash
* Standard Linux tools:

  * `tar`
  * `find`
  * `date`
* Linux or WSL

---

## ⚠️ WSL Notes

* File timestamps work correctly
* Paths must be valid Windows-mounted paths
* Performance depends on Windows disk speed

Functionally correct. Just not blazing fast.

---

## 🚫 What This Project Is NOT

* Not cloud backup
* Not encrypted backup
* Not incremental backup
* Not version-controlled storage

It’s a **basic file safety net**.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ✅

---

## 🏁 Final Verdict

* Backup: solid and predictable
* Cleanup: aggressive (by design)
* Complexity: minimal
* Reliability: high

If you want **control**, this is good.
If you want **enterprise features**, look elsewhere.

```
```

