#!/bin/bash
# =============================================================================
# b_track_ssh_daily.sh
# Description : Collects failed SSH login IPs, performs WHOIS lookup,
#               and generates a daily attack report saved to /Reports/
# Schedule    : @daily via crontab
# Usage       : chmod +x b_track_ssh_daily.sh && cp to /root/b_track_ssh_daily
# =============================================================================

# Remove previous temp files
rm -f ~/ssh_failed_sortlisted_logins.txt

# Extract unique failed SSH login IPs from all rotated secure logs
find /var/log -name "secure*" -exec cat {} \; \
  | grep ssh \
  | grep -i "Failed" \
  | grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" \
  | sort -u > ~/ssh_failed_sortlisted_logins.txt

# Remove previous report temp files
rm -f ~/1.txt ~/2.txt ~/3.htm

# WHOIS lookup for each attacker IP
while read -r ip; do
    whois_info=$(whois "$ip" | grep -i "country" | tr "a-z" "A-Z" | sort -u)
    echo "$ip" >> ~/1.txt
    if [[ -n "$whois_info" ]]; then
        echo "$whois_info" >> ~/1.txt
    else
        echo "COUNTRY: UNKNOWN" >> ~/1.txt
    fi
done < ~/ssh_failed_sortlisted_logins.txt

# Build report
echo "You were attacked by all IPs below from the following countries:" > ~/3.htm
cat ~/1.txt >> ~/3.htm

# Count total failed login attempts
failed_attempts=$(find /var/log -name "secure*" -exec cat {} \; \
  | grep ssh \
  | grep -i "Failed" \
  | grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" \
  | wc -l)

echo "Total Failed Login Attempts: $failed_attempts" >> ~/3.htm

# Append to persistent report file served by Apache
cat ~/3.htm >> /Reports/ssh_failed_logins_report.txt
