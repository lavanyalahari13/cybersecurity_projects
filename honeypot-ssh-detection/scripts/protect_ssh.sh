#!/bin/bash
# =============================================================================
# protect_ssh.sh
# Description : Parses /var/log/secure for failed SSH login IPs and
#               automatically blocks any IP with 6+ failed attempts
#               using firewalld rich rules.
# Usage       : chmod +x protect_ssh.sh && cp to /root/protect_ssh
#               Run manually or schedule via cron.
# =============================================================================

# Extract unique IPs with failed SSH login attempts
grep ssh /var/log/secure \
  | grep -i Failed \
  | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" \
  | sort -u > /tmp/blacklist

# Block IPs that exceed the failed attempt threshold (6+)
while read ip; do
    attempts=$(grep -c "$ip" /var/log/secure)

    if [ "$attempts" -ge 6 ]; then
        echo "Blocking IP: $ip (failed attempts: $attempts)"
        firewall-cmd --permanent --zone=public \
          --add-rich-rule="rule family='ipv4' source address='$ip' reject"
    fi
done < /tmp/blacklist

# Reload firewall once after all rules are applied
firewall-cmd --reload

echo "Done. Run 'firewall-cmd --list-rich-rules' to verify blocked IPs."
