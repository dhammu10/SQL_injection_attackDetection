# CloudSQLAttackApp

---

## Table of Contents

1. [Project overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Install & Setup](#install--setup)

   * [JDK 16.0.2 + JRE](#jdk-1602--jre)
   * [Copy Eclipse IDE 2021-06 (Java EE)](#copy-eclipse-ide-2021-06-java-ee)
   * [MySQL 8.0.27 + Workbench](#mysql-8027--mysql-workbench-8027)
   * [Python 3.9](#python-39)
   * [XAMPP 8.0.13](#xampp-8013)
   * [Visual Studio Code](#visual-studio-code)
4. [Restore Database](#restore-database)
5. [Run / Execute Project](#run--execute-project)
6. [DBConnector.py changes (XAMPP / Python)](#dbconnectorpy-changes-xampp--python)
7. [SQL Injection (example) & mitigation notes](#sql-injection-example--mitigation-notes)
8. [Stored Procedure example](#stored-procedure-example)
9. [Troubleshooting](#troubleshooting)
10. [License & Contact](#license--contact)

---

## Project overview

This repository contains the **CloudSQLAttackApp** Java web application (Eclipse project) and a Python app served via XAMPP `htdocs`. The README explains how to install required software, copy Eclipse IDE, configure environment variables, restore the MySQL database, and run both Java and Python parts locally.

---

## Prerequisites

* Operating System: Windows 10/11 (instructions will include Windows CLI paths). Linux commands are included where relevant.
* JDK: **Java 16.0.2** (with JRE)
* Eclipse IDE: **Eclipse 2021-06** (Java EE / Enterprise Edition)
* MySQL Server: **8.0.27**
* MySQL Workbench: **8.0.27**
* Python: **3.9**
* XAMPP: **8.0.13** (Apache + MySQL)
* Visual Studio Code (latest stable)

> Versions above are the tested ones for this project — use these exact versions to avoid compatibility issues.

---

## Install & Setup

### JDK 16.0.2 + JRE

1. Obtain the JDK 16.0.2 installer or archive (from Oracle/OpenJDK distribution you use).
2. Install or extract the JDK so you have a folder like `C:\Program Files\Java\jdk-16.0.2`.
3. Set environment variables:

**Windows (PowerShell / System Properties):**

```powershell
# Set JAVA_HOME (PowerShell example)
setx JAVA_HOME "C:\Program Files\Java\jdk-16.0.2" /M
# Add to PATH
setx PATH "%PATH%;%JAVA_HOME%\bin" /M
```

**Linux (bash):**

```bash
export JAVA_HOME=/usr/lib/jvm/jdk-16.0.2
export PATH="$JAVA_HOME/bin:$PATH"
```

4. Verify installation:

```bash
java -version
javac -version
```

You should see `java version "16.0.2"` (or equivalent) returned.

### Copy Eclipse IDE 2021-06 (Java EE)

1. Ensure JDK 16.0.2 is installed and `java -version` works.
2. If you have an existing extracted Eclipse 2021-06 folder, copy it to the target machine (e.g. `C:\eclipse\eclipse-2021-06`).
3. Launch `eclipse.exe` once to let workspace settings initialise.
4. Import the project:

   * File → `Open Projects from File System...` or `Import -> Existing Projects into Workspace`.
   * Select the `CloudSQLAttackApp` folder.

> If Eclipse complains about the Java compliance level, set Project → Properties → Java Compiler → Compiler compliance level to 16 (or switch to the installed JDK under Java Build Path → Libraries).

### MySQL 8.0.27 + MySQL Workbench 8.0.27

1. Install MySQL Server 8.0.27 using the installer for your OS.
2. Install MySQL Workbench 8.0.27.
3. Configure root password and remember it.

---

### Python 3.9

1. Install Python 3.9 (include `pip` and add Python to PATH on Windows).
2. Verify with:

```bash
python --version
pip --version
```

---

### XAMPP 8.0.13

1. Install XAMPP 8.0.13.
2. Start Apache (and optionally MySQL if you want to use XAMPP's MySQL instead of standalone).
3. The XAMPP `htdocs` folder is commonly at `C:\xampp\htdocs` (Windows) or `/opt/lampp/htdocs` (Linux).

#### Change configuration file of XAMPP server

If you need to change `php.ini` or `httpd.conf`, edit the files in the XAMPP installation folder.

Examples:

* To change `DocumentRoot`, edit `httpd.conf`.
* To modify PHP settings (max upload size, display errors), edit `php\php.ini`.

---

### Visual Studio Code

1. Install VS Code.
2. Open the Python project folder inside `htdocs`.
3. Install recommended extensions: Python, Pylance, Debugger for Chrome (optional).

---

## Restore Database (MySQL Workbench)

Steps to import a MySQL dump/backup using MySQL Workbench:

1. Open **MySQL Workbench** and connect to your local MySQL server (root or user with sufficient privileges).
2. From the menu, open **Server** → **Data Import** (or Navigation -> Data Import / Restore).
3. Choose **Import from Self-Contained File** or **Import from Dump Project Folder** depending on your backup format.
4. Browse and select the backup `.sql` file.
5. Select the target schema (or create a new schema) to import into.
6. Click **Start Import** and wait until the operation completes.

> Alternatively, using `mysql` CLI:

```bash
mysql -u root -p your_database_name < backup-file.sql
```

---

## Run / Execute Project

### Java Web App (Eclipse)

1. Open **Eclipse IDE**.
2. File → `Open Projects from File System` or `Import -> Existing Projects into Workspace`.
3. Select **CloudSQLAttackApp** project.
4. Right-click the project → `Run As` → `Java Application` (or `Run on Server` if it is a dynamic web project and you have a server configured such as Tomcat).

**Run instructions provided:**

* Right click on the project that you want to run.
* Click `Run As` → `Java Project` → select your project name from list → click OK.
* Open a browser and go to:

```
http://localhost:8080/home
```

> If you are using an embedded server or Tomcat, ensure the server is configured to use port 8080.

### Python App (XAMPP / htdocs)

1. Copy the Python project folder into the XAMPP `htdocs` directory (e.g. `C:\xampp\htdocs\python-app`).
2. Open the Python project in Visual Studio Code.
3. Open `DBConnector.py` and update the DB credentials (see below).
4. Start Apache from the XAMPP Control Panel.
5. Depending on how the Python app is run (CGI, Flask via mod\_wsgi, or as a standalone API), follow the project-specific run instructions. If the app is a simple Flask app and served on a different port (e.g. 5000), open `http://localhost:5000`.

---

## DBConnector.py changes (XAMPP / Python)

Open `DBConnector.py` and change the database password to match your MySQL user configuration. Typical sample snippet:

```python
import mysql.connector

conn = mysql.connector.connect(
    host='localhost',
    user='root',
    password='your_mysql_password',
    database='your_database_name'
)
```

Save the file and restart any services if necessary.

---

## SQL Injection — Example & Safe coding note

**Vulnerable example (do not use in production):**

```sql
SELECT * FROM users WHERE userid='sdfd' AND pass='fadsf' OR 1=1--'';
```

This example shows how concatenating user input into SQL allows `OR 1=1` to bypass authentication.

**Mitigation (use parameterized queries / prepared statements):**

* In Java (JDBC) use `PreparedStatement` with placeholders `?` and set values via `setString()`.
* In Python use parameterized queries provided by `mysql.connector` or `pymysql`:

```python
cursor.execute("SELECT * FROM users WHERE userid=%s AND pswd=%s", (userid, password))
```

Always validate and escape user input and use least-privileged DB users.

---

## Stored Procedure Example

```sql
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `chkPass`(
    IN userid1 VARCHAR(200),
    IN pass1 VARCHAR(200)
)
BEGIN
    SELECT * FROM users WHERE userid = userid1 AND pswd = pass1;
END$$
DELIMITER ;
```

> Note: Stored procedures also need safe input handling; avoid constructing SQL inside procedures using string concatenation.

---

## Troubleshooting

* **`java -version` shows incorrect version**: check `JAVA_HOME` and your PATH order.
* **Eclipse build errors**: check Project → Properties → Java Build Path and compiler compliance level.
* **MySQL import fails**: ensure the target schema exists and you have correct privileges; check the SQL file for `CREATE DATABASE` statements.
* **Port conflicts on 8080**: change the server port in server configuration or stop the service using the port.
* **XAMPP Apache not starting**: check logs; common cause: port 80/443 conflict with IIS or Skype.

---

## Commit-ready checklist

* [ ] Ensure `DBConnector.py` does **not** contain production secrets before committing.
* [ ] Add `.gitignore` to exclude `*.class`, build directories, `node_modules`, IDE workspace files, and local config files with secrets.
* [ ] Update README with any environment-specific instructions.

---

## Contact

    Name  : Dhammddip Modak
    Email : modakdhammdip@gmail.com

---
 
