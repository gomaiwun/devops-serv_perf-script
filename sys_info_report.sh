#!/bin/bash

# Variables
TITLE="System Information Report for $HOSTNAME"
CURRENT_TIME=$(date +"%Y-%m-%d %H:%M:%S")
TIMESTAMP="Generated on: $CURRENT_TIME, by $USER"

# FUNCTIONS

# Function to report uptime
report_uptime() {
    uptime -p
}

# Function to report on home space
report_home_space() {
    du -sh /home/* 2>/dev/null || echo "No home directories found or permission denied."
}

# Function to report disk usage
report_disk_usage() {
    df -h
}

# Function to report memory usage
report_memory_usage() {
    free -h
}

# Function to report CPU usage
report_cpu_usage() {
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}'
}

# Function to report logged in users
report_logged_in_users() {
    who
}

# Function to report system load
report_system_load() {
    uptime | awk -F 'load average:' '{ print $2 }'
}

# Function to create a system information HTML page
generate_html() {
    # Define the output file
    local output_file="sys_info_page.html"

    # Create the HTML file using heredoc
    cat <<EOF > "$output_file"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$TITLE</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
            color: #333;
        }
        h1, h2 {
            color: #0056b3;
        }
        pre {
            background-color: #e9ecef;
            padding: 10px;
            border-radius: 5px;
        }
        p {
            font-style: italic;
        }
    </style>
</head>
<body>
    <h1>$TITLE</h1>
    <p>$TIMESTAMP</p>
    <h2>Uptime</h2>
    <pre>$(report_uptime)</pre>
    <h2>Home Space Usage</h2>
    <pre>$(report_home_space)</pre>
    <h2>Disk Usage</h2>
    <pre>$(report_disk_usage)</pre>
    <h2>Memory Usage</h2>
    <pre>$(report_memory_usage)</pre>
    <h2>CPU Usage</h2>
    <pre>$(report_cpu_usage)</pre>
    <h2>Logged In Users</h2>
    <pre>$(report_logged_in_users)</pre>
    <h2>System Load</h2>
    <pre>$(report_system_load)</pre>
</body>
</html>
EOF
}

# Invoke the function to generate the HTML page
generate_html