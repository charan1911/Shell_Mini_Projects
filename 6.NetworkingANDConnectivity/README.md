````md
# 🌐 Networking & Connectivity (Project 6)

Straight facts first:  
This project **automates file transfer** and **tests network connectivity**.  
Local transfers work perfectly.  
Remote transfers depend on real networking, not WSL illusions.

---

## 📌 What This Project Does

Project 6 focuses on **two core networking tasks**:

1. **Automated File Transfer (Local)**
2. **Basic Network Connectivity Check (Ping Test)**

No fancy networking stacks. Just practical basics done right.

---

## 📁 1. File Transfer Automation Script

### Purpose  
Automatically transfers files from one folder to another and logs the result.

This simulates:
- Backup movement
- Data sync
- Pre-network transfer practice

---

### 🧠 How File Transfer Works

- Uses `rsync` for reliable copying
- Transfers files from **Folder A → Folder B**
- Preserves file content (not timestamps)
- Logs success or failure

If transfer fails, it’s written down.  
If it succeeds, it’s written down too.

---

### 📂 Directory Structure

```text
6.NetworkingANDConnectivity/
└── file_transfer/
    ├── A/              # Source folder
    ├── B/              # Destination folder
    └── transfer.log    # Transfer log
````

---

### 📝 Logging

The log file records:

* Transfer start time
* Transfer end status (success/failure)

No silent operations.

---

## 🌍 Local vs Remote Transfer (Reality Check)

### Local Transfer ✅

* Works perfectly on Linux and WSL
* Uses filesystem paths
* No networking required

### Remote Transfer ❌ (on WSL)

* WSL private IPs (`172.x.x.x`) are **not reachable**
* Laptop-to-laptop transfer will fail

### Remote Transfer ✅ (Real Linux / Cloud)

* Works with:

  * Public IP
  * Proper SSH access
* Example (concept only):

  ```bash
  rsync -r SOURCE user@PUBLIC_IP:/path/
  ```

This is a **networking limitation**, not script failure.

---

## 📡 2. Simple Ping Test Logic

### Purpose

Checks whether the system has **basic network connectivity**.

Ping is the “hello?” of networking.

---

### 🧠 Simple Ping Logic (5-Step)

1. Choose a reliable host (example: `8.8.8.8`)
2. Send 1 ICMP packet
3. Wait for response
4. If reply received → network is UP
5. If no reply → network is DOWN

Simple. Binary. Effective.

---

### 🧪 Example Logic Used

* Command: `ping -c 1`
* Success → Connected
* Failure → Disconnected

No DNS dependency if IP is used.

---

## 📦 Requirements

* Bash
* Tools used:

  * `rsync`
  * `ping`
  * `mkdir`
  * `date`
* Linux or WSL

---

## ⚠️ WSL Notes (Be Honest)

* Local file transfer works fine
* Ping works fine
* Remote rsync between laptops:

  * ❌ Not reliable
  * ❌ Not real networking
* Use real Linux or cloud VM for true testing

WSL is a sandbox, not a real network node.

---

## 🚫 What This Project Is NOT

* Not a full network automation suite
* Not SCP replacement
* Not secure transfer system
* Not multi-host sync tool

It demonstrates **fundamentals**, not enterprise networking.

---

## 🧪 Tested Environment

* Linux ✅
* WSL ⚠️ (local only)

---

## 🏁 Final Verdict

* File transfer logic: solid
* Logging: clean
* Ping test: basic but correct
* Networking realism: limited by WSL

If you understand this project, you understand **networking basics**.
That’s the real win here.

```
```

