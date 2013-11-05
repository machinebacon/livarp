#!/bin/bash
# conky_cmus_infos.sh <arpinux@2013>
########################################################################
# print cmus info in conky
# format:
# ${if_running cmus}${texeci 5 /path/to/script}${endif}
########################################################################
## query datas #########################################################
# status
STATUS=$(cmus-remote -Q | grep status | awk '{print $2}')
# title
TITLE=$(cmus-remote -Q | grep title | cut -d " " -f 3-)
# artist
ARTIST=$(cmus-remote -Q | grep -m 1 artist | cut -d " " -f 3-)
# album
ALBUM=$(cmus-remote -Q | grep -m 1 album | cut -d " " -f 3-)
# time
TIMECUR=$(cmus-remote -Q | grep position | awk '{print $2}')
TIMETOT=$(cmus-remote -Q | grep duration | awk '{print $2}')
TIMEPRC=$(( (($TIMECUR * 100)) / $TIMETOT ))
# volume
VOL=$(cmus-remote -Q | grep vol_left | awk '{print $3}')
## output ##############################################################
if [ "$STATUS" == "stopped" ];then
    echo "cmus: $TITLE by $ARTIST from $ALBUM is $STATUS"
elif [ "$STATUS" == "paused" ];then
    echo "cmus: $TITLE by $ARTIST from $ALBUM is $STATUS at $TIMEPRC%"
else
    echo "cmus is $STATUS $TITLE by $ARTIST from $ALBUM $DFT- $TIMEPRC% - vol:$VOL%"
fi
