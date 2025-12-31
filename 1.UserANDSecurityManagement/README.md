````md
# 🛡️ User Login Tracker (Bash Script)

Straight answer first:  
This script tracks **user login and logout sessions**, calculates **how long the user stayed logged in**, and logs everything.  
It logs facts. It does not act like a security guard.

---

## 📌 What This Script Does

- Detects **LOGIN** and **LOGOUT**
- Calculates **session duration** (hours, minutes, seconds)
- Logs session details into a file
- Uses a temporary file to remember login state

Temp file missing → LOGIN  
Temp file exists → LOGOUT  

No guessing. No background magic.

---

## 📂 Directory Structure

```text
UserSecurityManagement/
├── session_log.txt          # Permanent session history
└── .<username>_login_info   # Temporary login timestamp
````

---

## ⚙️ How It Works

1. **First run**

   * Temp file does not exist
   * Script assumes **LOGIN**
   * Stores epoch timestamp

2. **Second run**

   * Temp file exists
   * Script assumes **LOGOUT**
   * Calculates session duration
   * Writes full session info to `session_log.txt`
   * Deletes temp file

State-based tracking. Simple and predictable.

---

## 🧠 Information Logged Per Session

* UserName
* UserShell
* SessionPID
* Terminal (TTY)
* LoginDate
* LoginTime
* LogOutDate
* LogOutTime
* IdleTime
* Total Duration

Each session is clearly separated in the log file.

---

## 📦 Requirements

* Bash shell
* Standard Linux commands:

  * `who`
  * `tty`
  * `awk`
  * `grep`
* Linux or WSL environment

---

## ⚠️ Failed Login Alert (Important)

### WSL ❌

* Failed login alert **does NOT work reliably**
* WSL does not fully support:

  * PAM
  * Authentication logs (`/var/log/auth.log`)
* Failed login attempts may be missing or inaccurate

### Real Linux ✅

* Failed login detection works correctly
* Authentication logs are available

This is a **platform limitation**, not a script issue.

---

## 🚫 What This Script Is NOT

* Not a firewall
* Not an intrusion detection system
* Not real-time monitoring
* Not production-ready security

It logs sessions. Nothing more.

---

## 🧪 Tested On

* Linux ✅
* WSL ⚠️ (partial feature support)

---

## 🏁 Final Words

Clean script.
Clear limits.
No over-promising.

Use it, study it, extend it if you need more.

```
```

