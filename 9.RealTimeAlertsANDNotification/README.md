# 🔔 Notifications & Alerts Automation (Project 9)

Straight facts first:  
This project **notifies humans** when scripts run or when something important is missing.  
No logs-only silence. No guessing. If something happens, you get pinged.

This project bridges **Linux shell scripts** with **Windows notifications and email**.

---

## 📌 What This Project Does

Project 9 focuses on **alerting and notifications**, not background logging.

It includes **two alert mechanisms**:

1. **Desktop Notification + Email Alert**
2. **Process Health Check Alert**

If automation runs silently, it’s useless.  
This project makes sure you *know*.

---

## 🖥️ 1. Desktop Notification & Email Alert Script

### Purpose  
Sends:
- A **Windows desktop notification**
- An **email notification**

Triggered after a script runs successfully.

This is especially useful in **WSL + Windows environments**.

---

### 🧠 How It Works

- Uses `powershell.exe` from Bash
- Imports the **BurntToast** PowerShell module for notifications
- Displays a desktop toast notification
- Sends an email using Gmail SMTP

Linux triggers it.  
Windows delivers it.

---

### 📬 Notification Details

**Desktop Notification**
- Title and message shown instantly on Windows

**Email**
- Sent via Gmail SMTP
- Uses App Password authentication
- Includes subject and body

This is real alerting, not console echo.

---

### ⚠️ Security Note (Very Important)

- Gmail **App Passwords** are used
- Credentials are hardcoded for testing
- **Do NOT do this in production**

In real setups:
- Use environment variables
- Use secret managers
- Never commit credentials

This project demonstrates **functionality**, not security best practices.

---

## 🧪 Environment Notes

- Works only on:
  - WSL
  - Windows-hosted Linux shells
- Requires:
  - PowerShell
  - BurntToast module installed

Pure Linux systems will not support this approach.

---

## 🧠 2. Process Health Check Alert Script

### Purpose  
Checks whether a specific process is running.  
If it’s not, it alerts immediately.

No logs. No delay. Just an alert.

---

### 🧠 How Process Check Works

- Uses `pgrep` to check for a process
- If the process is missing:
  - Triggers a **Windows popup alert**
- Uses PowerShell MessageBox

This is binary health checking:
- Running → silence
- Not running → alert

---

### 📂 Process Check Logic

- Target process name: `sleep`
- Can be replaced with:
  - Services
  - Custom scripts
  - Background jobs

---

## 📦 Requirements

- Bash
- WSL environment
- Windows PowerShell
- PowerShell module:
  - `BurntToast`
- Internet access (for email)

---

## ⚠️ Platform Reality Check

### On WSL ✅
- Desktop notifications work
- Email alerts work
- Process checking works

### On Real Linux ❌
- PowerShell calls will fail
- Desktop notifications won’t work
- Email logic must be rewritten

This project is **Windows-integrated by design**.

---

## 🚫 What This Project Is NOT

- Not a monitoring system
- Not a notification queue
- Not retry-based alerting
- Not secure credential handling

It’s **event-based alerting**, nothing more.

---

## 🧪 Tested Environment

- WSL + Windows ✅
- Pure Linux ❌

---

## 🏁 Final Verdict

- Alerts: instant
- Visibility: high
- Setup: simple
- Security: demo-level

If automation runs and nobody knows, it failed.  
This project fixes that.

