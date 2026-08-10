# 🛡️ AI-Augmented SOC — Enterprise Threat Detection & Response

![License](https://img.shields.io/badge/license-All%20Rights%20Reserved-red.svg)
![Platform](https://img.shields.io/badge/platform-Kali%20Linux%20%7C%20Windows%20Server%202022-lightgrey)
![Tools](https://img.shields.io/badge/tools-Splunk%20%7C%20Zeek%20%7C%20LogAI%20%7C%20Shuffle-orange)
![Status](https://img.shields.io/badge/status-Complete-brightgreen)

A hands-on implementation of an **AI-augmented Security Operations Center (SOC)** that integrates SIEM, AI-driven analytics, network threat intelligence, and SOAR capabilities for enterprise-grade threat detection and response.

---

## 📌 Project Overview

This project walks through building a complete SOC pipeline across 4 tasks — from raw log collection all the way to automated incident response and security control gap analysis using the MITRE D3FEND framework.

| Task | Description |
|------|-------------|
| **Task 1** | Log collection & ingestion using Splunk Enterprise and Splunk Universal Forwarder |
| **Task 2** | AI-driven network threat intelligence using Zeek |
| **Task 3** | Threat hunting and IOC pivoting using LogAI GUI |
| **Task 4** | SOAR automation with Shuffle + MITRE D3FEND control mapping and gap analysis |

---

## 🧰 Tools & Technologies

| Tool | Version | Purpose |
|------|---------|---------|
| **Splunk Enterprise** | Latest | SIEM platform for log aggregation, search, and dashboards |
| **Splunk Universal Forwarder** | Latest | Ships logs from Kali Linux to Splunk Enterprise |
| **Zeek** | 6.x | Network traffic analysis and structured log generation |
| **LogAI** | Latest | AI-powered log anomaly detection and IOC pivoting |
| **Shuffle** | Latest | SOAR platform for automated security playbooks |
| **Docker & Docker Compose** | Latest | Container orchestration for running Shuffle |
| **Python 3** | 3.8+ | Runtime for LogAI and virtual environment |
| **Kali Linux** | Latest | Log source endpoint and attack simulation machine |
| **Windows Server 2022** | Latest | Splunk Enterprise SIEM host |
| **Oracle VirtualBox / VMware** | Latest | Virtualization platform for the lab environment |

---

## 🏗️ Architecture

```
┌──────────────────────────────────────────────────────────────────┐
│                        SOC Lab Pipeline                          │
│                                                                  │
│   Kali Linux VM                                                  │
│   ├── Splunk Universal Forwarder ──► Windows Server 2022         │
│   │       /var/log/auth.log              └── Splunk Enterprise   │
│   │       /var/log/syslog                     (SIEM + Dashboards)│
│   │       /var/log/journal-export.log                            │
│   │                                                              │
│   ├── Zeek (Network Traffic Analysis)                            │
│   │       conn.log / dns.log / http.log                          │
│   │                                                              │
│   ├── LogAI (AI Anomaly Detection + IOC Pivoting)                │
│   │       GUI Dashboard → http://127.0.0.1:8050                  │
│   │                                                              │
│   └── Shuffle SOAR (Automated Response Playbooks)                │
│           Dashboard → http://127.0.0.1:3001                      │
│           MITRE D3FEND Gap Analysis via Splunk Lookups           │
└──────────────────────────────────────────────────────────────────┘
```

---

## 🚀 Getting Started

### Prerequisites

- Oracle VirtualBox or VMware Workstation installed on your host machine
- Windows Server 2022 VM (acts as the Splunk SIEM server)
- Kali Linux VM (acts as the log source and tool host)
- Both VMs configured with a **Host-only Network Adapter**
- Internet access for downloading tools
- Python 3.8+ on Kali Linux

### Setup

```bash
# Clone this repository
git clone https://github.com/<your-username>/AI-Augmented-SOC.git
cd AI-Augmented-SOC
```

Follow the step-by-step task guides in the [`docs/`](./docs/) folder in order:

1. [Task 1 — Log Collection & Ingestion](./docs/task1-log-collection.md)
2. [Task 2 — AI-Driven Detection & Threat Intelligence](./docs/task2-ai-detection.md)
3. [Task 3 — Threat Hunting & IOC Pivoting](./docs/task3-threat-hunting.md)
4. [Task 4 — SOAR Automation & MITRE D3FEND Gap Analysis](./docs/task4-soar-gap-analysis.md)

---

## 📁 Repository Structure

```
AI-Augmented-SOC/
├── docs/
│   ├── task1-log-collection.md       # Splunk Enterprise + Forwarder setup (Steps 1.1–1.20)
│   ├── task2-ai-detection.md         # Zeek installation and network threat intelligence (Steps 2.1–2.10)
│   ├── task3-threat-hunting.md       # LogAI setup, patching, and IOC pivoting (Steps 3.1–3.16)
│   └── task4-soar-gap-analysis.md    # Shuffle SOAR + D3FEND gap analysis (Steps 4.1–4.32)
├── images/
│   ├── task1-01-splunk-download-page.png
│   ├── task1-02-splunk-account-creation.png
│   ├── task1-03-splunk-enterprise-download.png
│   ├── task1-04-splunk-installation.png
│   ├── task1-05-splunk-internal-search.png
│   ├── task1-06-splunk-forwarder-download.png
│   ├── task1-07-splunk-forwarder-extract.png
│   ├── task1-08-splunk-forwarder-start.png
│   ├── task1-09-windows-vm-ip.png
│   ├── task1-10-splunk-receiving-port.png
│   ├── task1-11-splunk-data-flow-verified.png
│   ├── task2-01-zeek-website.png
│   ├── task2-02-zeek-installed-version.png
│   ├── task2-03-zeek-path-configured.png
│   ├── task3-01-logai-cloned.png
│   ├── task3-02-logai-venv-installed.png
│   ├── task3-03-logai-gui-installed.png
│   ├── task3-04-logai-app-patched.png
│   ├── task3-05-logai-running.png
│   ├── task3-06-logai-dashboard.png
│   ├── task4-01-docker-installed.png
│   ├── task4-02-shuffle-cloned-started.png
│   ├── task4-03-shuffle-containers-running.png
│   ├── task4-04-shuffle-dashboard.png
│   ├── task4-05-splunk-lookup-upload.png
│   ├── task4-06-splunk-controls-mapped.png
│   ├── task4-07-splunk-coverage-query.png
│   ├── task4-08-splunk-gap-analysis.png
│   └── task4-09-splunk-dashboard-final.png
├── configs/
│   ├── inputs.conf                   # Splunk Forwarder log source configuration
│   └── outputs.conf                  # Splunk Forwarder → Enterprise connection config
├── scripts/
│   └── setup_logai.sh                # One-shot LogAI install and patch script
├── .gitignore
├── LICENSE
└── README.md
```

---

## 📋 Step-by-Step Summary

### Task 1 — Log Collection & Ingestion
- Configure Windows Server 2022 VM with Host-only network adapter
- Download and install Splunk Enterprise on Windows Server
- Verify Splunk with `index="_internal"` search
- Install Splunk Universal Forwarder on Kali Linux via wget
- Configure `inputs.conf` to monitor `/var/log/auth.log`, `/var/log/syslog`, `/var/log/journal-export.log`
- Configure `outputs.conf` to forward logs to Splunk Enterprise on port `9997`
- Verify data flow and generate failed SSH login events
- Save search results as a Splunk Report

### Task 2 — AI-Driven Detection & Threat Intelligence
- Install Zeek on Kali Linux via the official OpenSUSE repository
- Add GPG key and update package list
- Install Zeek and verify version
- Add Zeek to PATH permanently via `.zshrc`
- Zeek generates structured network logs: `conn.log`, `dns.log`, `http.log`, `ssl.log`, `weird.log`

### Task 3 — Threat Hunting & IOC Pivoting
- Clone LogAI repository from GitHub
- Create Python virtual environment and install LogAI with GUI and dev extras
- Patch `gui/application.py` — replace `app.run_server()` with `app.run()`
- Set `PYTHONPATH=.` and launch LogAI GUI
- Access dashboard at `http://127.0.0.1:8050` for anomaly detection and IOC pivoting

### Task 4 — SOAR Automation & Gap Analysis
- Install Docker and Docker Compose on Kali Linux
- Clone and start Shuffle SOAR via `docker-compose up -d`
- Create Shuffle admin account and access dashboard at `http://127.0.0.1:3001`
- Upload three CSV lookup files to Splunk: `controls_inventory.csv`, `d3fend_techniques.csv`, `attack_mitigation_to_d3fend.csv`
- Run SPL queries to map controls to D3FEND techniques and identify coverage gaps
- Calculate overall coverage percentage
- Save all results to a unified Splunk Dashboard

---

## 📊 Key Outcomes

- ✅ Centralized log ingestion from Kali Linux into Splunk Enterprise
- ✅ Network traffic parsed into structured logs using Zeek
- ✅ AI-powered anomaly detection and IOC pivoting via LogAI dashboard
- ✅ Automated security response workflows built in Shuffle SOAR
- ✅ Security controls mapped to MITRE D3FEND defensive techniques
- ✅ Gap analysis identifying unmapped D3FEND techniques with coverage percentage

---

## 🔐 Security Considerations

- All VMs operate on a **Host-only network** — fully isolated from external traffic
- Splunk receiving port `9997` is scoped to the internal Host-only adapter only
- Shuffle runs entirely inside **Docker containers** — no host-level exposure
- No credentials, secrets, or sensitive data are stored in this repository

---

## 📄 License

Copyright (c) 2025 Lavanya Narahari. All Rights Reserved.

No part of this project may be copied, modified, or distributed without explicit written permission from the author.

---

## 👤 Author

**Lavanya Narahari**
Cybersecurity | SOC Engineering | AI-Driven Security Operations
