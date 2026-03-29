# Open Source Shell Scripts Project

## Student Information

- **Student Name:** Pritam Chatterjee
- **Roll Number:** 24MIP10113
- **Course:** Open Source Software
- **Chosen Software:** MySQL (Relational Database Management System)

---

## Project Overview

This repository contains five Bash shell scripts created as part of the OSS Capstone Project.  
The scripts demonstrate key Linux concepts such as system inspection, package verification, directory auditing, log analysis, and user-interactive automation.  
The chosen open-source software for this project is **MySQL**, licensed under **GPL v2**.

---

## Script Descriptions

### 1. Script 1: System Identity Report (`script1_system_identity.sh`)

Displays system information including:
- Distribution name  
- Kernel version  
- Logged-in user  
- Home directory  
- System uptime  
- Current date/time  
- A license note for the operating system  

---

### 2. Script 2: FOSS Package Inspector (`script2_foss_inspector.sh`)

Checks if **MySQL** (default package: `mysql-server`) is installed on the system.  
The script:
- Detects the active package manager (`dpkg`, `rpm`, or `pacman`)
- Displays version and license information if installed
- Uses a `case` statement to print a one-line philosophy note about MySQL  

---

### 3. Script 3: Disk and Permission Auditor (`script3_disk_auditor.sh`)

Audits a set of critical Linux directories such as:
- `/etc`
- `/var/log`
- `/home`
- `/usr/bin`
- `/tmp`

For each, it reports:
- Disk usage  
- Permissions  
- Owner and group  

It also checks **MySQL configuration directories** depending on the distribution:

- **Debian/Ubuntu:** `/etc/mysql`  
- **Fedora/RHEL:** `/etc/my.cnf.d`  
- **Arch-based systems:** `/etc/my.cnf`  
- **Debian variant:** `/etc/mysql/mysql.conf.d`  

If a matching directory or file is found, its permissions are printed in the report.

---

### 4. Script 4: Log File Analyzer (`script4_log_analyzer.sh`)

Reads a log file line-by-line, counting how many lines contain a given keyword (default: `"error"`).  
It also:
- Performs a retry if the log is missing or empty  
- Displays the last five matching log entries  
- Works with MySQL logs such as:

---

### 5. Script 5: Open Source Manifesto Generator (`script5_manifesto_generator.sh`)

An interactive script that asks three open-source–related questions and generates a personalized manifesto, saved as:
Dependencies


---


## Dependencies

These scripts rely on standard GNU/Linux utilities available on most distributions.

| Category | Tools/Commands |
|---------|----------------|
| **Core Utilities** | `bash`, `echo`, `grep`, `awk`, `cut`, `tr`, `uname`, `whoami`, `uptime`, `date`, `du`, `ls`, `tail`, `cat` |
| **Database Packages Detected (Script 2)** | `mysql-server`, `mysql`, `mariadb-server`, `mariadb` |

---

## Package Managers Supported

| Distribution Family | Package Manager | Command |
|---------------------|-----------------|---------|
| Debian / Ubuntu | `dpkg` | `dpkg -l` |
| Fedora / RHEL / CentOS | `rpm` | `rpm -qi` |
| Arch Linux | `pacman` | `pacman -Qi` |

---


---

## Installing MariaDB (All Major Linux Distros)

Script 2 automatically detects any of the following packages: `mysql-server`,`mysql`,`mariadb-server`,`mariadb`


Below are installation commands for all popular distros.

---

### ▶ **Ubuntu / Debian**

```bash
sudo apt update
sudo apt install mariadb-server mariadb-client
sudo systemctl enable --now mariadb
```

Check version:

```bash
mysql --version
mariadb --version
```

Check service status:

```bash
systemctl status mariadb
```

Start/Stop/Restart MariaDB:

```bash
sudo systemctl start mariadb
sudo systemctl stop mariadb
sudo systemctl restart mariadb
```

---

### ▶ **Fedora / RHEL / CentOS**

```bash
sudo dnf install mariadb-server
sudo systemctl enable --now mariadb
```

Check version:

```bash
mariadb --version
```

Service control:

```bash
sudo systemctl start mariadb
sudo systemctl stop mariadb
sudo systemctl restart mariadb
```

---

### ▶ **Arch Linux / Manjaro / EndeavourOS**

```bash
sudo pacman -Syu mariadb
sudo systemctl enable --now mariadb
```

Initialize database:

```bash
sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
```

Check version:

```bash
mysql --version
```

Service management:

```bash
sudo systemctl start mariadb
sudo systemctl stop mariadb
sudo systemctl restart mariadb
```

---

### ▶ **OpenSUSE**

```bash
sudo zypper install mariadb
sudo systemctl enable --now mariadb
```

---

### ▶ **Alpine Linux**

```bash
sudo apk add mariadb mariadb-client
sudo rc-update add mariadb
sudo rc-service mariadb start
```

---

## Optional (Recommended): Secure the Installation

```bash
sudo mysql_secure_installation
```

This allows you to:

- Set a root password  
- Remove anonymous users  
- Disable remote root login  
- Remove test databases  

---

## Useful MariaDB / MySQL Commands

### Enter the MariaDB/MySQL shell:

```bash
sudo mysql -u root -p
```

### Show all databases:

```sql
SHOW DATABASES;
```

### View MariaDB logs:

```bash
sudo tail -f /var/log/mysql/error.log
sudo tail -f /var/log/mysqld.log
```

### Check if MySQL/MariaDB binaries exist:

```bash
command -v mysql
command -v mariadb
```

### Check installed packages:

```bash
dpkg -l | grep -E 'mysql|mariadb'
rpm -qa | grep -E 'mysql|mariadb'
pacman -Q | grep -E 'mysql|mariadb'
```
