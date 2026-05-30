# Application & Web Application Security – Course End Project

## 📌 Project Overview
This project demonstrates a **Vulnerability Assessment and Penetration Testing (VAPT)** on a simulated web application environment.  
The goal was to identify misconfigurations, exploit weaknesses, and recommend security improvements.

---

## 🛠️ Steps Performed
1. **Deploy Vulnerable VM** – Set up target machine in VirtualBox.  
2. **Configure Network** – Created NAT Network (`NATNetwork1`) and connected Kali Linux + vulnerable VM.  
3. **Reconnaissance** – Ran `nmap -A` to identify open ports (21, 22, 80).  
4. **Vulnerability Assessment** – Tested FTP anonymous login, web directory enumeration, and source code analysis.  
5. **Exploitation** – Retrieved flags via FTP, Gobuster, and direct URL access.  
6. **Reporting** – Documented vulnerabilities, exploitation methods, and remediation strategies.

---

## 🔎 Key Findings
- **FTP Anonymous Login** → Unauthorized access to files (`flag1.txt`).  
- **Unsecured Web Directories** → Sensitive flags exposed (`robots.txt`, `/c0nf1g`, `/4dm1n`).  
- **Information Disclosure** → Hidden flags in HTML source code.  
- **Weak Access Controls** → No authentication on critical directories.  
- **Multiple Open Ports** → SSH & HTTP exposed without hardening.

---

## ⚡ Exploitation Techniques
- **FTP Exploitation** → Logged in as anonymous, used `wget` to download files.  
- **Web Enumeration** → `gobuster` + SecLists to brute-force directories.  
- **Source Code Analysis** → Viewed HTML source (`Ctrl+U`) to uncover flags.  
- **Direct Navigation** → Accessed sensitive paths directly.

---

## 🛡️ Security Recommendations
- Disable anonymous FTP access.  
- Implement authentication for sensitive directories.  
- Harden web server configs (remove sensitive entries in `robots.txt`).  
- Patch and update FTP, SSH, and HTTP services.  
- Deploy IDS/IPS to detect brute-force and enumeration attempts.  
- Conduct regular security audits.


