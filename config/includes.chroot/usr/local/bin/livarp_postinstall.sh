#!/bin/bash
############################################
## script de post-installation livarp_0.4 ##
##----------------------------------------##

# enable colors
source ~/.bashrc
clear

# are you root ?
# ----------------------------------------------------------------------
if [ "`whoami`" != "root" ]; then
    echo ""
    echo " you're not root..."
    echo " this script needs admin privileges"
    echo "   please launch this script as root."
    sleep 4s && exit 0
fi

# run only once
# ----------------------------------------------------------------------
touch /usr/share/livarp/livarpfirstlog
echo "file auto-generated by livarp_post-install script. don't remove." > /usr/share/livarp/livarpfirstlog

# set user
# ----------------------------------------------------------------------
HUMAN=`w -h | tail -n1 | awk '{print $1}'`

# allow user to sudo halt/reboot without password
# ----------------------------------------------------------------------
if [ "`cat /etc/sudoers | grep shutdown`" = "" ]; then
    echo "$HUMAN    ALL=(ALL:ALL) NOPASSWD: /sbin/shutdown, /sbin/reboot" >> /etc/sudoers
fi

# fix network-manager
# ----------------------------------------------------------------------
#sed --in-place=.bak 's/managed=false/managed=true/' /etc/NetworkManager/NetworkManager.conf

# message
# ----------------------------------------------------------------------
clear
echo ""
echo -e "${blue} ###############################################################"
echo -e "${blue} # bienvenue dans le script de post-installation du livarp_0.4 #"
echo -e "${blue} ##-----------------------------------------------------------##"
echo ""
echo -e "${cyan}  ce script termine le processus d'installation du livarp:$NC"
echo "  - autorise $HUMAN à éteindre ou redémarrer sans mot de passe ...fait"
echo ""
echo -e "${cyan} dans votre dossier ~/bin/clickmes/ vous trouverez de quoi:$NC"
echo "  - installer un noyau 100% libre,"
echo "  - installer des packs de logiciels,"
echo "  - désinstaller certaines sessions une par une,"
echo "  - installer des trucs non-free (si vous en avez vraiment besoin...)"
echo ""
echo ""
echo -e "${cyan}             amusez-vous bien avec livarp$NC"
echo " n'hésitez pas à me contacter si vous rencontrez des problèmes"
echo ""
echo -e "${cyan}                in${red} Debian${cyan} we trust..$NC"
echo ""
echo -n " presser Enter pour quitter"
read anykey
exit 0
