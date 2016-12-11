#!bin/sh

cecho() {
    echo "\033[1;36m$1\033[m"
}

recho() {
    echo "\033[1;31m$1\033[m"
}

navi_link(){
    rtcon localhost/$1.rtc:$2 localhost/$3.rtc:$4
}

navi_link UrgRTC0 range Localization_MRPT0 range
navi_link UrgRTC0 range NavigationManager0 range
navi_link Localization_MRPT0 estimatedPose NavigationManager0 currentPose
navi_link Localization_MRPT0 estimatedPose SimplePathFollower0 currentPose
navi_link SimplePathFollower0 PathFollower NavigationManager0 pathFollower
navi_link Localization_MRPT0 mapServer MapServer0 mapServer
navi_link MapServer0 mapServer NavigationManager0 mapServer
navi_link PathPlanner_MRPT0 pathPlanner NavigationManager0 pathPlanner


while :

do

    cecho "Which component did you execute ? "
    cecho "1:TEC-1 2:Kobuki"
    echo -n ">>"
    read Robot

    case "$Robot" in
	"1")
	    navi_link SpurRTC0 currentPose Localization_MRPT0 odometry
	    navi_link SpurRTC0 targetVelocity SimplePathFollower0 velocity
	    break ;;
	
	"2")
	    navi_link KobukiRTC0 currentPose Localization_MRPT0 odometr
	    navi_link KobukiRTC0 targetVelocity SimplePathFollower0 velocity
	    break ;;

	*)
	    recho "Please choose from a choice" ;;

    esac

done



