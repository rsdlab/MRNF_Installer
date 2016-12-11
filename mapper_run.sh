#!/bin/sh

cecho() {
    echo "\033[1;36m$1\033[m"
}

recho() {
    echo "\033[1;31m$1\033[m"
}

cd github

#Mapper_RUN function
mapper_run(){
    gnome-terminal -e "./$1/build/src/$1Comp -f $1/rtc.conf" -t $1
}

#gnome-terminal -e eclipse

while :

do

    cecho "Please choose a mobile robot"
    cecho "1:TEC-1 2:Kobuki"
    echo -n ">>"
    read Robot

    case "$Robot" in
	"1")
	    mapper_run SpurRTC
	    break ;;
	
	"2")
	    mapper_run KobukiRTC
	    break ;;

	*)
	    recho "Please choose from a choice"

    esac

done


while :

do

    cecho "Do you use JoystickRTC? <y/n>"
    echo -n ">>"
    read Key

    case "$Key" in
	"y")
	    mapper_run SFMLJoystick
	    mapper_run SFMLJoystickToVelocity
	    break ;;
	
	"n")
	    break ;;

	*)
	    recho "Please choose which it is"

    esac

done

mapper_run UrgRTC
mapper_run Mapper_MRPT

gnome-terminal -e 'sh NavigationManager/MapperViewer.sh'  -t NavigationManager
