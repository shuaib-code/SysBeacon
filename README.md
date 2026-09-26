<div align="center">
  <img src="favicon.svg" alt="SysBeacon Logo" width="80" height="80" />
  <h1>SysBeacon</h1>
  <p><strong>Silent PC activity and uptime monitoring with visual telemetry heatmaps.</strong></p>

  <p>
    <a href="https://sysbeacon.vercel.app/SysBeacon.zip" download="SysBeacon.zip"><strong>Download Setup Archive</strong></a> ·
    <a href="#-local-endpoints"><strong>Local Endpoints</strong></a> ·
    <a href="#-features"><strong>Features</strong></a>
  </p>

  <img src="https://img.shields.io/badge/Platform-Windows%20x64-FC5200?style=flat-square&logo=windows&logoColor=white" alt="Windows x64" />
  <img src="https://img.shields.io/badge/Database-SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white" alt="SQLite" />
  <img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat-square" alt="License" />
</div>

<br>

---

## Overview

**SysBeacon** is a lightweight local telemetry tracker designed for Windows. It records background activity pings every minute directly to a local SQLite database, allowing you to monitor your system uptime, track working hours, and inspect raw historical data through an embedded web dashboard—all without sending data to external cloud services.

---

## Download & Quick Start

1. **Download the Archive:**
   - Get the latest `SysBeacon.zip` package from the releases or the project root directory and extract its contents.
2. **Configure Automatic Startup (Windows Task Scheduler):**
   - Press <kbd>Win</kbd> + <kbd>R</kbd>, type `taskschd.msc`, and press Enter.
   - Click **Create Basic Task** in the right-hand panel, name it `SysBeacon`, and click Next.
   - Choose **When I log on** as the trigger, then select **Start a program**.
   - Browse and select your extracted `SysBeacon.exe` file, click Finish, and then right-click the newly created task in the library and select **Run** to verify it works instantly.

---

## Features

- **Minute-by-Minute Logging:** Continuously records system uptime states into a local SQLite database with zero configuration.
- **Visual Heatmaps:** Review daily usage patterns and active work blocks via an intuitive web-based interface.
- **Database Explorer:** Inspect raw telemetry records and timestamps directly through your browser.
- **100% Local Privacy:** Your data never leaves your machine. Everything is kept inside a lightweight local database.

---

## Local App Routes

Once `SysBeacon.exe` is running, you can access the following local endpoints in your browser:

| Feature           | Local URL                            | Description                          |
| :---------------- | :----------------------------------- | :----------------------------------- |
| **Dashboard**     | `http://localhost:321/`              | Main web interface & status overview |
| **Heatmap**       | `http://localhost:321/heatmap`       | Visual activity heatmap              |
| **DB Explorer**   | `http://localhost:321/db-ui`         | SQLite record viewer and inspector   |
| **API Analytics** | `http://localhost:321/api/analytics` | Aggregated telemetry JSON payload    |

---

## Author & Links

- **Portfolio:** [mohammad-shuaib.vercel.app](https://mohammad-shuaib.vercel.app)
- **GitHub:** [@shuaib-code](https://github.com/shuaib-code)
- **Facebook:** [shuaib.code](https://www.facebook.com/shuaib.code)

---

<div align="center">
  <sub>Built with precision for seamless uptime tracking.</sub>
</div>
