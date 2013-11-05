#! /bin/bash
### BEGIN INIT INFO
# Provides:          firewall
# Required-Start:
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: launch firewall
# Description:       clean iptables rules then reload iptables
### END INIT INFO

# Author : arpinux <contact@arpinux.org>

. /lib/lsb/init-functions

# Le switch case ci-dessous permet de savoir si le système souhaite lancer ou arrêter le script (on le lance au démarrage et l'arrête à la fermeture du système)
case "$1" in
    start)
        log_action_msg "Basic Firewall: clean up rules"
        iptables -F
        iptables -Z
        iptables -X
        log_action_msg "Basic Firewall: restore iptables rules"
        iptables-restore < /etc/firewall.rules
        ip6tables-restore < /etc/firewall6.rules
        ;;
    restart)
        log_action_msg "Basic Firewall: clean up rules"
        iptables -F
        iptables -Z
        iptables -X
        log_action_msg "Basic Firewall: restore iptables rules"
        iptables-restore < /etc/firewall.rules
        ip6tables-restore < /etc/firewall6.rules
        ;;
    stop)
        iptables -F
        iptables -Z
        iptables -X
        log_action_msg "Basic Firewall: clean up rules"
        ;;
    status)
        log_action_msg "Basic Firewall: print status"
        iptables -L
        ;;
    *)
        echo 'Usage: /etc/init.d/firewall.sh {start|restart|stop|status}'
        exit 1
        ;;
esac
 
exit 0
