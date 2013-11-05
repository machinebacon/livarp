#!/bin/bash
# conky_mocp_infos.sh <arpinux@2013>
########################################################################
# print mocp info in conky
# format:
# ${if_running mocp}${texeci 5 /path/to/script}${endif}
########################################################################
## check mocp instance
if [ "$(pidof mocp)" ];then
    ## query datas #########################################################
    # status
    STATUS=$(mocp -Q %state)
    # title
    TITLE=$(mocp -Q %title)
    # artist
    ARTIST=$(mocp -Q %artist)
    # album
    ALBUM=$(mocp -Q %album)
    # time
    TIMECUR=$(mocp -Q %cs)
    TIMETOT=$(mocp -Q %ts)
    TIMEPRC=$(( (($TIMECUR * 100)) / $TIMETOT ))
    ## output ##############################################################
    if [ "$STATUS" == "STOP" ];then
        echo "mocp: $TITLE by $ARTIST from $ALBUM is $STATUS"
    elif [ "$STATUS" == "PAUSE" ];then
        echo "mocp: $TITLE by $ARTIST from $ALBUM is $STATUS at $TIMEPRC%"
    else
        echo "mocp $STATUS $TITLE by $ARTIST from $ALBUM $DFT- $TIMEPRC% "
    fi
else
    echo "no zik"
fi
