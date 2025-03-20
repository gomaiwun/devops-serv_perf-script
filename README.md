# System Information Report Script

This project consists of a Bash script that collects and presents system information in an HTML report. The script retrieves data about system uptime, home space usage, disk usage, memory usage, CPU usage, logged-in users, and system load.

## Features

- Generates an HTML page displaying various system statistics.
- Collects information about:
  - Uptime
  - Home Directory Space Usage
  - Disk Usage
  - Memory Usage
  - CPU Usage
  - Logged In Users
  - System Load

## Prerequisites

- A Unix-like operating system (Linux, macOS) with Bash.
- The user must have permissions to run the commands used within the script.

## Setup

1. Clone or download the repository to your local machine.

   ```bash
   git clone <repository-url>
   cd <repository-directory>

2. Make sure the script is executable. If it’s not, run the following command:

    ```bash
    chmod +x sys_info_report.sh

## Running the script
   - To execute the script, run the command below. Upon execution, the script will create a file named sys_info_page.html in the current directory containing the system information.:

   ``` bash
   ./sys_info_report.sh

## Viweing the report
    - OPen the generated HTML file in a web browser
    ```bash
    xdg-open sys_info_page.html  # For Linux
    open sys_info_page.html       # For macOS

## Customization
    - You can modify the script if you need to change the HTML output format, add more statistics, or change the styling.
 

