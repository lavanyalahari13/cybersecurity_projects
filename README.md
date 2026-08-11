# 🛡️ Cybersecurity Projects Portfolio

![Cybersecurity](https://img.shields.io/badge/Domain-Cybersecurity-blue)
![Projects](https://img.shields.io/badge/Projects-3-brightgreen)
![Status](https://img.shields.io/badge/Status-Active-success)
![Author](https://img.shields.io/badge/Author-Lavanya%20Lahari%20Narra-purple)

A collection of hands-on cybersecurity projects covering **Security Operations (SOC)**, 
**Enterprise Infrastructure Security**, and **Web Application Penetration Testing** — 
built to simulate real-world threat detection, incident response, and vulnerability 
assessment scenarios.

---

## 👩‍💻 About

I am a Software Engineer at Optum (UnitedHealth Group) transitioning into Cybersecurity.  
These projects represent my self-directed learning journey — each one is built from scratch 
in a lab environment using industry-standard tools aligned with real-world SOC workflows.

> 🎓 Currently pursuing: **Course in Cybersecurity** — SimpliLearn x IIIT Bangalore

---

## 📂 Projects

---

### 1. 🤖 AI-Augmented SOC — Enterprise Threat Detection & Response

> **Domain:** Security Operations Center (SOC) | AI/ML Security | SOAR Automation

**Overview:**  
A complete enterprise-grade SOC pipeline built across 4 phases — from raw log collection 
to AI-driven threat detection, threat hunting, and automated incident response — with 
security control gap analysis using the MITRE D3FEND framework.

| Phase | What Was Built |
|-------|----------------|
| Log Ingestion | Splunk Enterprise (SIEM) + Splunk Universal Forwarder on Kali Linux |
| AI Detection | Zeek for network traffic analysis + LogAI for anomaly detection & IOC pivoting |
| Threat Hunting | LogAI GUI dashboard for real-time log anomaly investigation |
| SOAR + Gap Analysis | Shuffle SOAR automated playbooks + MITRE D3FEND control mapping in Splunk |

**Key Tools:** `Splunk` `Zeek` `LogAI` `Shuffle` `Docker` `Python` `Kali Linux` `Windows Server 2022`

**Highlights:**
- Centralized log ingestion from Kali Linux into Splunk Enterprise over port 9997
- AI-powered anomaly detection and IOC pivoting via LogAI dashboard
- Automated security response workflows built in Shuffle SOAR
- MITRE D3FEND gap analysis identifying unmapped defensive techniques with coverage %
- Fully isolated Host-only lab network — no external exposure

📁 [View Project →](./AI%20Augumented%20SOC/)

---

### 2. 🍯 Honeypot Deployment & SSH Brute-Force Detection

> **Domain:** Enterprise & Infrastructure Security | Threat Intelligence | Security Automation

**Overview:**  
Deployment of a multi-service honeypot on CentOS Linux to detect, log, and automatically 
block SSH brute-force attacks — simulating a real-world decoy server used to attract and 
analyze malicious activity.

| Task | What Was Built |
|------|----------------|
| Honeypot Setup | CentOS VM with SSH (port 2222), vsftpd FTP, Apache httpd as decoy services |
| SSH Hardening | Port change 22 → 2222, SELinux policy, root login restriction |
| Auto IP Blocking | Bash script parsing /var/log/secure — blocks IPs with 6+ failed attempts via firewalld |
| Threat Intelligence | Daily WHOIS lookups on attacker IPs via cron-scheduled script |

**Key Tools:** `CentOS Stream 9` `Kali Linux` `firewalld` `SELinux` `OpenSSH` `Splunk` `Bash` `VMware`

**Highlights:**
- Brute-force attempts detected within minutes of server exposure
- Automated IP blocking with firewalld rich rules — verified with Connection refused
- WHOIS analysis revealed multi-country attack sources
- Attack reports served via Apache web endpoint for easy review

📁 [View Project →](./honeypot-ssh-detection/)

---

### 3. 🔍 Web Application VAPT — Vulnerability Assessment & Penetration Testing

> **Domain:** Application & Web Application Security | Ethical Hacking | Security Reporting

**Overview:**  
End-to-end Vulnerability Assessment and Penetration Testing (VAPT) on a simulated 
vulnerable web application — covering reconnaissance, exploitation, and structured 
security reporting with remediation recommendations.

| Phase | What Was Done |
|-------|---------------|
| Reconnaissance | nmap -A scan — identified open ports 21 (FTP), 22 (SSH), 80 (HTTP) |
| Vulnerability Assessment | FTP anonymous login, web directory enumeration, source code analysis |
| Exploitation | FTP file retrieval, Gobuster directory brute-force, hidden path discovery |
| Reporting | Documented findings with risk ratings and remediation strategies |

**Key Tools:** `Kali Linux` `Nmap` `Gobuster` `SecLists` `FTP` `VirtualBox`

**Highlights:**
- Exploited FTP anonymous login to retrieve sensitive files
- Discovered hidden directories `/c0nf1g` and `/4dm1n` via Gobuster + SecLists
- Identified information disclosure via HTML source code analysis
- Delivered structured VAPT report with actionable remediation recommendations

📁 [View Project →](./VAPT-Project/)

---

## 🧰 Tools & Technologies Used Across Projects

| Category | Tools |
|----------|-------|
| SIEM | Splunk Enterprise, Splunk Universal Forwarder, SPL |
| SOAR | Shuffle (Docker-based) |
| Network Analysis | Zeek, Nmap |
| AI/ML Detection | LogAI |
| Penetration Testing | Gobuster, Hydra, Nmap, FTP exploitation |
| Threat Frameworks | MITRE ATT&CK, MITRE D3FEND |
| OS & Platforms | Kali Linux, CentOS Stream 9, Windows Server 2022 |
| Scripting | Bash, Python 3 |
| Virtualization | VMware Workstation Pro, Oracle VirtualBox |
| Firewall & Hardening | firewalld, SELinux, OpenSSH |
| Containers | Docker, Docker Compose |

---

## 📊 Skills Demonstrated
✅ SOC Pipeline Design & Implementation
✅ SIEM Configuration & Log Analysis
✅ AI-Driven Threat Detection & IOC Pivoting
✅ SOAR Automation & Incident Response Playbooks
✅ MITRE ATT&CK & D3FEND Framework Application
✅ Honeypot Design & Deployment
✅ SSH Hardening & Firewall Automation
✅ Network Reconnaissance & Port Scanning
✅ Web Application Penetration Testing
✅ VAPT Reporting & Remediation Planning
✅ Linux Administration & Bash Scripting
✅ Threat Intelligence (WHOIS, IOC Analysis)


---

## 📬 Connect

**Lavanya Lahari Narra**  
📧 narralavanyalahari@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/narralavanyalahari)  
💻 [GitHub](https://github.com/lavanyalahari13/cybersecurity_projects)

---
