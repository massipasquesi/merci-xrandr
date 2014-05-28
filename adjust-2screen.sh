#!/bin/bash

### INCLUDES ###
source functions.sh


### NOTES ###
### notes pour un developpement ulterieur du script
#screen_list=( LGFlatron )
#echo $screen_list
#echo $(xrandr | grep -v disconnected | grep connected)
###


### SCRIPT START ###
echo -e "$GREEN start adjust-screen.sh $ENDCOLOR"

# switch to awesome's mode-test
# need it to not reload doubles widgets with xrandr commands
switch-awesome-mode "t"
if [ "$?" != 0 ]; then
    exit -1
fi


# list of connected screens with infos
SCRN1="LVDS1"
print_screen_info
# goornotgo
goornotgo "$SCRN1 is your first screen's name ?"
if [ "$?" != 0 ]; then
    cleanexit; exit 1;
fi


# use xrandr to turn-off VGA1
echo -e "$GREEN0 execute $ENDCOLOR $GREEN xrandr --output VGA1 --off $ENDCOLOR"
goornotgo "Parameters are rights ?"
GO=$?
if [ "$GO" == 0 ]; then
{   
    echo -e "$GREEN0 all right! we go process. $ENDCOLOR"
    xrandr --output VGA1 --off
    print_screen_info
}
else
{
    echo -e "$RED Adjust parameters and run again. $ENDCOLOR"
    cleanexit; exit 1;
}
fi


# use xrandr to reconfigure VGA1
echo -e "$GREEN0 execute $ENDCOLOR $GREEN xrandr --output LVDS1 --mode 1920x1080 --output VGA1 --mode 1024x768 --right-of LVDS1 $ENDCOLOR"
# demande confirmation
goornotgo "Parameters are rights ?"
GO=$?
if [ "$GO" == 0 ]; then
{
    echo -e "$GREEN0 all right! we go process. $ENDCOLOR"
    xrandr --output LVDS1 --mode 1920x1080 --output VGA1 --mode 1024x768 --right-of LVDS1
    echo "$!"
    print_screen_info
    read -p "are you happy now ? " GO
}
else
    echo -e "$RED Adjust parameters and run again. $ENDCOLOR"
fi


# switch to awesome's mode-clean
cleanexit

### SCRIPT END ###
exit 0;
