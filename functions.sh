#!/bin/bash

# VARIABLES COULEURS
ENDCOLOR='\033[0m'
BLUE='\033[1;34m'
BLUE0='\033[0;34m'
GREEN='\033[1;32m'
GREEN0='\033[0;32m'
RED='\033[1;31m'
RED0='\033[0;31m'
VIOLET='\033[1;35m'
VIOLET0='\033[0;35m'
YELLOW='\033[1;33m'
YELLOW0='\033[0;33m'
TODO_COLOR='\033[0;34;47m'


# FUNCTIONS

# @name goornotgo
# demande à l'utilisateur de donné une reponse de type y/n et retourne la reponse
#
# @param1(facultatif) : chaine pour la question
#
# @return 0 si la reponse est y ou Y
# @return 1 si la reponse est n ou N
# @return 99 si l'uitilisateur écrit autre choses
goornotgo()
{
	if [ "$1" != "" ]; then
		QUESTION=$1
	else
		QUESTION="continuer ?"
	fi
	read -p "$QUESTION (y/n) : " GO
	if [ "$GO" == "y" ] || [ "$GO" == "Y" ]; then
		return 0
	elif [ "$GO" == "n" ] || [ "$GO" == "N" ]; then
		return 1
	else
	{
		echo -e "$RED Il faut taper y ou n!! Pas $GO $ENDCOLOR"
		return 99
	}
	fi
}

# @name switch-awesome-mode
# switch awesome mode (test, clean)
#
# @ param1 : string
# @return 0 if all right
# @return -1 if error
switch-awesome-mode()
{
    echo -e "$VIOLET0"
    cd ~/.config/awesome/
    pwd

    if [ "$1" == "t" ]; then
        ln -fs mod-test.lua rc-include.lua
    elif [ "$1" == "y" ]; then
        ln -fs mod-clean.lua rc-include.lua
    else
    {
        echo -e "$ENDCOLOR"
        return -1
    }
    fi

    ls -la rc-include.lua
    echo -e "$ENDCOLOR"
    return 0
}


# @name print_screen_info 
# print selected xrandr output
print_screen_info()
{
    echo -e "$GREEN0 list of connected screens : $ENDCOLOR $YELLOW"
    xrandr | grep -v disconnected | grep connected
    echo -e "$ENDCOLOR"
}


# @name cleanexit
cleanexit()
{
    # switch to awesome's mode-clean
    switch-awesome-mode "y"

    echo -e "$GREEN exit adjust-screen.sh $ENDCOLOR"
}


### END FUNCTIONS ###
