#! /bin/bash
# status script for spectrwm
# sources : https://github.com/xorg62/wmfs/wiki/statusbar
########################################################################

# power - BAT0 #########################################################
pwr(){
    if [ -e /sys/class/power_supply/BAT0 ];then
        pwrsta="$(cat /sys/class/power_supply/AC/online)"
        if [ "$pwrsta" == "0" ];then
            state="-"
        else
            state="+"
        fi
        pwrperc="$(awk 'sub(/,/,"") {print $4}' <(acpi -b) | cut -d , -f 1 $1 | tail -n1)"
        if [ "$pwrperc" == "F" ];then
            perc="F"
        else
            perc="$pwrperc"
        fi
        echo "[bat $state$pwrperc]"
    else
        echo ""
    fi
}
# cpu section ##########################################################
cpu(){
    cpu="$(eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4;
	      eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat);
	      intervaltotal=$((total-${prevtotal:-0}));
	      echo "$((100*( (intervaltotal) - ($idle-${previdle:-0}) ) / (intervaltotal) ))")"
	      echo "[cpu $cpu %]" 
}
# mem section ##########################################################
mem(){
    memu="$(free -m | sed -n 's|^-.*:[ \t]*\([0-9]*\) .*|\1|gp')"
    memt="$(free -m | sed -n 's|^M.*:[ \t]*\([0-9]*\) .*|\1|gp')"
    memperc="$(( ((100*$memu)) / $memt))"
    echo "[mem $memperc%]"
}
# hdd section - only for / #############################################
hdd(){
    hdd="$(df -h|grep "rootfs  "|awk '{print $5}')"
    echo "[hdd $hdd]"
}
# internet section - eth0/wlan0 ########################################
int(){ 
    if [ -e /sys/class/net/eth0 ];then
        RXB="$(cat /sys/class/net/eth0/statistics/rx_bytes)"
        TXB="$(cat /sys/class/net/eth0/statistics/tx_bytes)"
        sleep 2
        RXBN="$(cat /sys/class/net/eth0/statistics/rx_bytes)"
        TXBN="$(cat /sys/class/net/eth0/statistics/tx_bytes)"

        RXDIF="$(echo $((RXBN - RXB)) )"
        TXDIF="$(echo $((TXBN - TXB)) )"
        echo "[dl $((RXDIF / 1024 / 2))k/s up $((TXDIF / 1024 / 2))k/s]" 

    elif [ -e /sys/class/net/wlan0 ];then
        RXB="$(cat /sys/class/net/wlan0/statistics/rx_bytes)"
        TXB="$(cat /sys/class/net/wlan0/statistics/tx_bytes)"
        sleep 2
        RXBN="$(cat /sys/class/net/wlan0/statistics/rx_bytes)"
        TXBN="$(cat /sys/class/net/wlan0/statistics/tx_bytes)"
        
        RXDIF="$(echo $((RXBN - RXB)) )"
        TXDIF="$(echo $((TXBN - TXB)) )"
        echo "[dl $((RXDIF / 1024 / 2))k/s up $((TXDIF / 1024 / 2))k/s]" 

    else
        echo ""
    fi
}
# date/time section ####################################################
dte(){
    dte="$(date +"%a %d/%m %H:%M")"
    echo "[$dte]"
}
# reload interval ######################################################
TIMING=1
# set output ###########################################################
statustext(){
    echo "$(pwr) $(cpu) $(mem) $(hdd) $(int) $(dte)"
}
# run it ###############################################################
while true;
do
    statustext
    sleep $TIMING
done
# eof ##################################################################
