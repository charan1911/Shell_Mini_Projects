grep -i "error" /var/log/syslog | sort | uniq -c | sort -nr | head -3

