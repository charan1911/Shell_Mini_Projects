````md
# 🚀 DevOps & Deployment Automation (Project 10)

Blunt version first:  
This project **pulls code**, **deploys it**, and **tells you what happened**.  
No CI/CD buzzwords. No fake pipelines. Just automation that actually runs.

Project 10 focuses on **deployment automation**, both **local** and **multi-server**.

---

## 📌 What This Project Does

Project 10 contains **two deployment scripts**:

1. **Local Auto Deployment Script**
2. **Multi-Server Deployment Script**

Together, they simulate a **real DevOps workflow** using plain Bash.

---

## 🔄 1. Local Auto Deployment Script

### Purpose  
Automatically pulls the latest code from GitHub and updates the local SMP project.

If code changes exist → they get deployed.  
If something breaks → you get alerted.

---

### 🧠 How Local Deployment Works

- Moves into the SMP root directory
- Runs `git pull` from the `main` branch
- Checks command success
- Shows a **Windows popup notification**:
  - Success → green path
  - Failure → error alert

No silent failures. You always know.

---

### 📂 Files Involved

```text
Shell_Script_Projects/
└── AutoDeploymentScript.sh
````

This script assumes:

* Git is already configured
* SSH or HTTPS auth is already set

Deployment ≠ authentication.

---

## 🖥️ Notification Behavior

* Uses `powershell.exe` from Bash
* Displays a Windows MessageBox
* Works best in **WSL**

Linux runs the script.
Windows shows the result.

---

## 🌐 2. Multi-Server Deployment Script

### Purpose

Deploys the same project across **multiple servers automatically**.

One command. Many servers. Same result.

---

### 🧠 How Multi-Server Deployment Works

* Defines a list of servers (IP + user)
* Loops through each server
* Connects using SSH
* Runs the local deployment script remotely

Sequential deployment. Simple and predictable.

---

### 📂 Multi-Server Logic

```text
SERVERS=(
  "root@172.18.0.2"
  "root@172.18.0.3"
  "root@172.18.0.4"
)
```

These are **private IPs** (Docker / internal network).

Not public cloud.
Not production.
Learning setup only.

---

## 📦 Requirements

* Bash
* Git
* SSH configured (key-based preferred)
* PowerShell (for notifications)
* WSL or Linux

---

## ⚠️ Environment Reality Check

### On WSL ✅

* Local deployment works
* Windows popups work
* SSH to internal servers works

### On Real Linux ⚠️

* Deployment works
* PowerShell popups will NOT work
* Notifications must be replaced

This project is **WSL-optimized**, not cross-platform perfect.

---

## 🚫 What This Project Is NOT

* Not Jenkins
* Not GitHub Actions
* Not Kubernetes
* Not zero-downtime deployment

It’s **script-driven DevOps**, intentionally simple.

---

## 🧪 Tested Environment

* WSL + Windows ✅
* Linux (without popups) ✅

---

## 🏁 Final Verdict

* Deployment logic: solid
* Multi-server rollout: clean
* Feedback to user: immediate
* Complexity: low, by design

If you understand this project, you understand **core DevOps thinking**.
Tools change. Logic doesn’t.

