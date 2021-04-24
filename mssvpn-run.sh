#!/bin/bash
# Modded by MSSVPN contact @mssvpn_hq t.me/mssvpn

# 1 Patch with mssvpn mod file
clear
echo 'Downloading patch...'
sleep 3
cd /etc && rm -f mssvpn-mod.sh && wget -q 'https://raw.githubusercontent.com/solehpolysas/MOD/main/mssvpn-mod.sh' && chmod 755 mssvpn-mod.sh
cd
clear
echo 'Download & patch success!...'
sleep 3

# 2 Patch rc.local file
clear
echo 'Setup patch to run...'
sleep 3
echo '/etc/mssvpn-mod.sh #Run MOD at Start-UP' | tee -a /etc/rc.local
clear
echo 'Setup Done!...'
sleep 3

# 3 Patch cronjob file
clear
echo 'Setup Cronjob...'
sleep 3
echo '* * * * * ping 9.9.9.9' | tee -a /etc/crontabs/root
echo 'First cron - Done!...'
sleep 2
echo "* * * * * pgrep ping |awk 'NR >= 3' | xargs -n1 kill" | tee -a /etc/crontabs/root
echo 'Second cron - Done!...'
sleep 2
echo '0 4 * * * /etc/init.d/network restart' | tee -a /etc/crontabs/root
echo 'Third cron - Done!...'
sleep 2
clear
echo 'Patch Cronjob settings...'
uci set system.@system[0].cronloglevel="9"
sleep 0.1
uci commit system
sleep 0.1
/etc/init.d/cron restart
sleep 2
clear
echo 'Setup Cronjob Done!...'
sleep 3

# 4 All Job Done!
clear
echo 'All job were done - credit to mssvpn MOD'