#!/bin/sh

cecho() {
    echo "\033[1;36m$1\033[m"
}
rcecho() {
    echo "\033[1;31m$1\033[m"
}

cd github

#Navigation_RUN function
navi_run(){
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
	    navi_run SpurRTC
	    break ;;
	
	"2")
	    navi_run KobukiRTC
	    break ;;

	*)
	    recho "Please choose from a choice"

    esac

done


navi_run UrgRTC
navi_run SimplePathFollower
navi_run PathPlanner_MRPT
navi_run Localization_MRPT


gnome-terminal -e 'sh NavigationManager/MapperViewer.sh'  -t NavigationManager
gnome-terminal -e 'sh MapServer/MapServer.sh'  -t MapServer
