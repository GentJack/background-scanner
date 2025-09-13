# 🔍 Background Process Scanner

A lightweight Bash script designed to scan for hidden or suspicious background processes running on a Linux system. Ideal for cybersecurity students, ethical hackers, or anyone wanting to better understand their system's behavior.

---

## 🛠 Features

- ✅ Scans and lists all background processes (TTY = `?`)
- ✅ Flags unknown or suspicious processes that are not part of the core system
- ✅ Avoids false positives by using a list of trusted system processes
- ✅ Safe to run — does **not kill**, modify, or interfere with running services
- ✅ Perfect for cybersecurity labs, forensics, or personal monitoring

---

## 🔧 How It Works

The script uses `ps` to enumerate processes, filters out known safe system services, and highlights anything that could be abnormal or unexpected.

---

## 📂 Example Output

```bash
🛡️  Scanning for background processes...
✅ [PID: 1234] Trusted system process: systemd
⚠️  [PID: 5678 | PPID: 1] Suspicious Background Process → my_sneaky_script
✅ [PID: 4321] Trusted system process: dbus-daemon

✅ Done scanning background processes.
🔍 Review any ⚠️ entries for possible suspicious activity.
