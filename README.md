<div align="center">
  <img src="favicon.svg" alt="SysBeacon Logo" width="80" height="80" />
  <h1>SysBeacon</h1>
  <p><strong>Silent PC activity and uptime monitoring with visual telemetry heatmaps.</strong></p>

  <p>
    <a href="https://sysbeacon.vercel.app/SysBeacon.exe" download="SysBeacon.exe"><strong>Download Executable</strong></a> ·
    <a href="#-local-endpoints"><strong>Local Endpoints</strong></a> ·
    <a href="#-features"><strong>Features</strong></a>
  </p>

  <img src="https://img.shields.io/badge/Platform-Windows%20x64-FC5200?style=flat-square&logo=windows&logoColor=white" alt="Windows x64" />
  <img src="https://img.shields.io/badge/Database-SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white" alt="SQLite" />
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License" />
</div>

<br>

---

## 🚀 Overview

**SysBeacon** is a lightweight local telemetry tracker designed for Windows. It records background activity pings every minute directly to a local SQLite database, allowing you to monitor your system uptime, track working hours, and inspect raw historical data through an embedded web dashboard—all without sending data to external cloud services.

---

## 📥 Download & Quick Start

No complex setup or scripting required. Simply grab the pre-compiled binary and run it:

1. **Download the Executable:**
   - Get the latest `SysBeacon.exe` from the releases or the project root directory.
2. **Run the Application:**
   - Double-click `SysBeacon.exe` to start the local monitoring service and dashboard.
   - _(Optional)_ Right-click and select **"Run as administrator"** if you are setting it up to track background services reliably.

---

## ✨ Features

- **⏱️ Minute-by-Minute Logging:** Continuously records system uptime states into a local SQLite database with zero configuration.
- **📊 Visual Heatmaps:** Review daily usage patterns and active work blocks via an intuitive web-based interface.
- **🔍 Database Explorer:** Inspect raw telemetry records and timestamps directly through your browser.
- **🔒 100% Local Privacy:** Your data never leaves your machine. Everything is kept inside a lightweight local database.

---

## 🧭 Local App Routes

Once `SysBeacon.exe` is running, you can access the following local endpoints in your browser:

| Feature           | Local URL                              | Description                          |
| :---------------- | :------------------------------------- | :----------------------------------- |
| **Dashboard**     | `http://localhost:54321/`              | Main web interface & status overview |
| **Heatmap**       | `http://localhost:54321/heatmap`       | Visual activity heatmap              |
| **DB Explorer**   | `http://localhost:54321/db-ui`         | SQLite record viewer and inspector   |
| **API Analytics** | `http://localhost:54321/api/analytics` | Aggregated telemetry JSON payload    |

---

## 👤 Author & Links

- **Portfolio:** [mohammad-shuaib.vercel.app](https://mohammad-shuaib.vercel.app)
- **GitHub:** [@shuaib-code](https://github.com/shuaib-code)
- **Facebook:** [shuaib.code](https://www.facebook.com/shuaib.code)

---

<div align="center">
  <sub>Built with precision for seamless uptime tracking.</sub>
</div>
