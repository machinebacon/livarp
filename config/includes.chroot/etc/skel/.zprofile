#!/bin/zsh
source ~/.zshrc
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Si on est dans une console, et qu'aucune instance de X n'est détecté,
# demander si startx doit être lancé
if [[ -t 0 && $(tty) =~ /dev/tty1 ]] && ! pgrep -u $USER startx &> /dev/null; then
    clear
    echo
    echo -e "${cyan}welcome to ${red}Debian${cyan} livarp system"
    echo
    echo -e "${red}           ------------------------------"
    echo -e "${red}           $NC Debian GNU/Linux livarp 04$NC"
    echo -e "${red}           ------------------------------"
    echo -e "${red} ${yellow} kernel information"
    echo -e "${red} ${yellow} $NC `uname -a`"
    echo -e "${red} ${green} machine stats"
    echo -e "${red} ${green} $NC`uptime`"
    echo -e "${red} ----------------------------------------$NC"
    echo ""
    echo ""
    echo -e " ${BLUE} start X [Y|n] ?  ${blue}>>$NC"
    read a
	if [ "$a" = "n" ] || [ "$a" = "N" ];then
        clear
        echo ""
		echo -e "${green}if there is a shell ... there is a way$NC"
		echo ""
        ## console layout config # safe to remove after installation
        ## ---------------------------------------------------------
        if [ -d /home/human ];then
            echo -e "${cyan} console keyboard selection:"
            echo -e " ---------------------------$NC"
            echo ""
            echo " f : fr"
            echo " b : be"
            echo " e : es"
            echo " r : ru"
            echo " k : uk"
            echo " u : us"
            echo " d : de"
            echo ""
            echo -e "${cyan} type a letter to load your keyboard layout >>$NC"
            read kb
            case $kb in
                f) sudo loadkeys fr-pc ;;
                b) sudo loadkeys be-latin1 ;;
                e) sudo loadkeys es ;;
                r) sudo loadkeys ru ;;
                k) sudo loadkeys uk ;;
                u) sudo loadkeys us ;;
                d) sudo loadkeys de ;;
                *) sudo loadkeys us ;;
            esac
            ## launch dvtm console manager
            ## ---------------------------
            dvtm h
        fi
    else
        startx
    fi
fi

# startx automatique
#if [[ -t 0 && $(tty) =~ /dev/tty1 ]] && ! pgrep -u $USER startx &> /dev/null; then
#    startx
#fi
