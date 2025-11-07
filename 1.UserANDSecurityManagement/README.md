---

# 📄 User Login Tracker

**Script Name:** `UserLoginTracker.sh`
**Purpose:** Monitor and log all user login attempts on a Linux system, including failed logins, for security tracking and alerting.

---

## 1️⃣ Features

* **Track Logins:** Logs each user login with timestamp, username, and IP (if remote).
* **Failed Login Alerts:** Detects failed password attempts from `/var/log/auth.log`.
* **Logout Tracking:** Calculates session duration if implemented with login/logout timestamps.
* **Centralized Logs:** Stores all login attempts and alerts in a central log file (`login_tracker_logs.txt`).
* **Customizable:** Paths and alert thresholds can be configured in the script.

---

## 2️⃣ Requirements

* Linux system (Ubuntu/Debian/RHEL/CentOS)
* Bash shell
* `awk`, `grep`, `bc` (common Linux utilities)
* Permissions to read `/var/log/auth.log` and write to chosen log folder

---

## 3️⃣ Installation / Setup

1. **Place the script** in your desired folder, e.g.:

```bash
/mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement/
```

2. **Ensure the log directory exists:**

```bash
mkdir -p /mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement/Logs
touch /mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement/Logs/login_tracker_logs.txt
```

3. **Make the script executable:**

```bash
chmod +x UserLoginTracker.sh
```

4. **Test run:**

```bash
bash UserLoginTracker.sh
```

---

## 4️⃣ Script Configuration

* **Log file path:**

```bash
LOG_FILE="/mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement/Logs/login_tracker_logs.txt"
```

* **Failed login detection:**
  The script reads `/var/log/auth.log` (Ubuntu/Debian) or `/var/log/secure` (RHEL/CentOS).
  You can adjust for multiple users or custom thresholds.

---

## 5️⃣ Logging

* Each login or failed login is logged in the format:

```
2025-10-08 15:30:12 - User: charan1911 - Login Successful
2025-10-08 15:32:05 - User: admin - Failed Password from IP: 192.168.1.45
```

* Logs include **timestamp**, **username**, **IP (if remote)**, and **status**.

---

## 6️⃣ Automate with Cron

To run the tracker automatically at intervals:

1. Open crontab:

```bash
crontab -e
```

2. Add a line to check logins every 5 minutes:

```bash
*/5 * * * * /bin/bash /mnt/c/Users/DELL/Desktop/SMP/UserSecurityManagement/UserLoginTracker.sh
```

3. Save and exit. Cron will now automatically execute the script and append logs.

---

## 7️⃣ Notes

* Ensure your script has **read permission** on `/var/log/auth.log` or `/var/log/secure`.
* Test the script manually before setting up cron.
* Customize log folder paths according to your project setup.
* Can be extended to **multi-user monitoring** or **dashboard visualization**.

---
