# 🍯 Honeypot Deployment & SSH Brute-Force Detection

![Security](https://img.shields.io/badge/Domain-Cybersecurity-blue)
![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20CentOS-green)
![Tools](https://img.shields.io/badge/Tools-Firewalld%20%7C%20OpenSSH%20%7C%20Splunk-orange)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📌 Overview

This project demonstrates the deployment of a **honeypot system** on a CentOS Linux VM to detect, log, and automatically block **SSH brute-force attacks**. It simulates a real-world enterprise security scenario where a decoy server is used to attract and analyze malicious activity.

> **Domain:** Enterprise & Infrastructure Security  
> **Category:** Threat Detection | Intrusion Analysis | Security Automation

---

## 🎯 Problem Statement

Organizations running Linux servers with public IP addresses are prime targets for **SSH brute-force attacks** — where attackers systematically try username/password combinations to gain unauthorized access.

**Key challenges addressed:**
- Detecting and logging brute-force login attempts in real time
- Automatically blocking attacker IPs after repeated failures
- Analyzing attack patterns to improve threat intelligence
- Hardening SSH configuration to reduce attack surface

---

## 🏗️ Architecture

```
┌─────────────────────┐          ┌──────────────────────────┐
│   Kali Linux VM     │  SSH →   │   CentOS Honeypot VM     │
│  (Attacker Sim)     │  FTP →   │                          │
│                     │  HTTP →  │  ┌────────────────────┐  │
│  - Brute-force sim  │          │  │  Services Running  │  │
│  - SSH attempts     │          │  │  • sshd (port 2222)│  │
└─────────────────────┘          │  │  • vsftpd (FTP)    │  │
         │                       │  │  • httpd (HTTP)    │  │
         │   VMware NAT Network  │  └────────────────────┘  │
         └───────────────────────│                          │
                                 │  ┌────────────────────┐  │
                                 │  │  Security Layer    │  │
                                 │  │  • firewalld       │  │
                                 │  │  • SELinux         │  │
                                 │  │  • Custom Scripts  │  │
                                 │  └────────────────────┘  │
                                 └──────────────────────────┘
```

---

## 🛠️ Tools & Technologies

| Category | Tool/Technology |
|---|---|
| Virtualization | VMware Workstation Pro |
| Honeypot OS | CentOS Stream 9 |
| Attacker OS | Kali Linux |
| SSH Service | OpenSSH (port 2222) |
| FTP Service | vsftpd |
| Web Server | Apache httpd |
| Firewall | firewalld (rich rules) |
| Access Control | SELinux (Enforcing) |
| Log Analysis | Splunk, custom Bash scripts |
| WHOIS Lookup | whois utility |

---

## 📋 Tasks Completed

### ✅ Task 1 — Understanding Brute-Force Attacks
- Researched SSH brute-force attack mechanics (tools like Hydra, Medusa)
- Identified common Linux server vulnerabilities:
  - Default port 22 exposure
  - Weak/no password policies
  - Root login enabled via SSH
  - Missing IDS/IPS (fail2ban, SSHGuard)
  - Lack of firewall configuration

### ✅ Task 2 — Honeypot Deployment
- Set up CentOS Stream 9 VM in VMware Workstation
- Configured NAT networking between CentOS and Kali Linux VMs
- Installed and configured:
  - `openssh-server` — SSH attack surface
  - `vsftpd` — FTP decoy (uploads disabled for safety)
  - `httpd` (Apache) — Fake web server serving attack reports
- Created fake website at `testsite.mydomain.local`
- Configured `/Reports` directory served via Apache for log viewing
- Applied SELinux contexts to allow Apache to serve log files

### ✅ Task 3 — SSH Hardening
- Changed SSH port from `22` → `2222` to reduce automated scans
- Added port `2222` to SELinux policy using `semanage`
- Verified failed login attempts are captured in `/var/log/secure`
- Simulated failed logins from Kali Linux to generate log data
- Automated log collection with a scheduled cron job (`@daily`)

### ✅ Task 4 — Automated IP Blocking
- Developed `protect_ssh.sh` script to parse `/var/log/secure` for failed SSH login IPs
- Blocks IPs with **6+ failed attempts** using `firewalld` rich rules
- Verified blocked IPs receive `Connection refused` from Kali
- Enabled `firewalld` to persist rules across reboots
- Viewed blocked IP reports via browser at `http://testsite.mydomain.local/reports/`

---

## 📁 Repository Structure

```
honeypot-ssh-detection/
│
├── README.md                    # Project overview (this file)
├── .gitignore
├── scripts/
│   ├── b_track_ssh_daily.sh     # Daily log collection & WHOIS lookup script
│   └── protect_ssh.sh           # Automated IP blocking script
└── docs/
    ├── setup-guide.md           # Full step-by-step setup guide
    └── images/                  # Screenshots from the lab
```

---

## 🚀 Quick Start

> Prerequisites: VMware Workstation, CentOS Stream 9 VM, Kali Linux VM

```bash
# 1. Clone this repo
git clone https://github.com/<your-username>/honeypot-ssh-detection.git

# 2. On CentOS VM — make scripts executable
chmod +x scripts/b_track_ssh_daily.sh
chmod +x scripts/protect_ssh.sh

# 3. Copy scripts to root home
cp scripts/b_track_ssh_daily.sh /root/b_track_ssh_daily
cp scripts/protect_ssh.sh /root/protect_ssh

# 4. Schedule daily log collection
crontab -e
# Add: @daily /root/b_track_ssh_daily

# 5. Run IP blocker manually
/root/protect_ssh
```

See [docs/setup-guide.md](docs/setup-guide.md) for the full walkthrough.

---

## 🔍 Key Findings

- SSH brute-force attempts begin **within minutes** of exposing a server publicly
- Attackers target common usernames: `root`, `admin`, `ubuntu`, `test`
- WHOIS lookups revealed attack sources from multiple countries
- Automated IP blocking via `firewalld` rich rules effectively stops repeat attackers
- Changing SSH port from 22 → 2222 significantly reduced automated scan noise

---

## 🔐 Security Concepts Demonstrated

- **Honeypot design** — Decoy system to attract and log attackers
- **SSH hardening** — Port change, login restrictions, SELinux policy
- **Firewall automation** — Dynamic IP blocking with `firewalld` rich rules
- **Log analysis** — Parsing `/var/log/secure` for threat intelligence
- **SELinux** — Enforcing mode with custom file contexts
- **Cron automation** — Scheduled security reporting

---

## 📸 Screenshots

Screenshots of all key steps are available in [docs/images/](docs/images/) and referenced throughout [docs/setup-guide.md](docs/setup-guide.md).

---

## 📚 References

- [OpenSSH Documentation](https://www.openssh.com/manual.html)
- [firewalld Rich Rules](https://firewalld.org/documentation/man-pages/firewalld.richlanguage.html)
- [SELinux User Guide - Red Hat](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/using_selinux/)
- [CentOS Stream 9](https://www.centos.org/centos-stream/)

---

## 👤 Author

**Lavanya N**  
Cybersecurity Enthusiast | Enterprise & Infrastructure Security  
[LinkedIn](https://linkedin.com/in/your-profile) • [GitHub](https://github.com/your-username)
