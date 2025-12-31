````md
# 🤖 Automation & Scheduling (Project 4)

Blunt truth first:  
This project **automates boring but important system tasks**.  
It logs startup details and keeps the system updated.  
No clicking. No forgetting. No mercy.

---

## 📌 What This Project Does

Project 4 focuses on **automation at boot and on schedule**.  
It contains **two scripts**:

1. **Startup System Information Logger**
2. **Automated System Update Script**

These are meant to run without you babysitting them.

---

## 🚀 1. Startup Script – System Initialization Info

### Purpose  
Captures **system state at startup** and writes it to a log file.

If the system boots, this script leaves evidence.

---

### 🧠 What It Logs

- System startup time
- System uptime
- Network connectivity status
- Running services (top 10)
- Disk usage
- CPU and memory snapshot

Everything goes into a single log file.

---

### 📂 Startup Script Files

```text
4.AutomationANDScheduling/
└── Startup_Log.txt
````

Each boot appends a new section.
History is preserved. Nothing overwritten.

---

### ⚠️ Notes About WSL

* `systemctl` output may be limited or fake
* Desktop notifications (`notify-send`) do not work
* Logs still work correctly

WSL pretends to be Linux. This script politely exposes that.

---

## 🔄 2. Automated System Update Script

### Purpose

Keeps the system **updated, cleaned, and logged** automatically.

No excuses like “I forgot to update”.

---

### 🧠 What This Script Does

* Runs `apt update` and `apt upgrade`
* Logs success or failure
* Runs cleanup:

  * `autoremove`
  * `autoclean`
* Sends:

  * Desktop notification
  * Email with log attached (if mail is configured)

Automation means **zero interaction**.

---

### 📂 Update Script Files

```text
4.AutomationANDScheduling/
└── SystemUpdate_Log.txt
```

Every update attempt is logged with a timestamp.

---

## 📦 Requirements

* Bash
* Debian/Ubuntu-based system
* Tools used:

  * `uptime`
  * `ping`
  * `df`
  * `top`
  * `systemctl`
  * `apt`
  * `notify-send` (optional)
  * `mail` (optional)

---

## ⚠️ Important Reality Checks

### On WSL ❌

* `notify-send` will not work
* Email sending works only if mail is configured
* `systemctl` is limited or non-functional

### On Real Linux ✅

* Full functionality
* Notifications and scheduling work as expected

These are platform limits, not script bugs.

---

## 🚫 What This Project Is NOT

* Not a configuration management tool
* Not Ansible
* Not cron replacement by itself
* Not enterprise automation

It’s **practical automation**, not buzzword automation.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ⚠️ (partial feature support)

---

## 🏁 Final Verdict

* Startup logging: useful and clean
* Update automation: solid and hands-free
* Noise level: low
* Forgetfulness prevention: high

If you hate repetitive admin work, this project earns its place.

```
```

