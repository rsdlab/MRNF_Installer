#!bin/sh

cecho() {
    echo "\033[1;36m$1\033[m"
}
rcecho() {
    echo "\033[1;31m$1\033[m"
}

mapper_link(){
    rtcon localhost/$1.rtc:$2 localhost/$3.rtc:$4
}

mapper_link UrgRTC0 range Mapper_MRPT0 range
mapper_link UrgRTC0 range NavigationManager0 range
mapper_link Mapper_MRPT0 estimatedPose NavigationManager0 currentPose
mapper_link Mapper_MRPT0 gridMapper NavigationManager0 mapperService


while :

do

    cecho "Which component did you execute ? "
    cecho "1:TEC-1 2:Kobuki"
    echo -n ">>"
    read Robot

    case "$Robot" in
	"1")
	    mapper_link SpurRTC0 currentPose Mapper_MRPT0 odometry
	    break ;;
	
	"2")
	    mapper_link KobukiRTC0 currentPose Mapper_MRPT0 odometr
	    break ;;

	*)
	    recho "Please choose from a choice" ;;

    esac

done


while :

do

    cecho "Did you execute JoystickRTC? <y/n>"
    echo -n ">>"
    read Key

    case "$Key" in
	"y")
	    mapper_link SFMLJoystick0 axis SFMLJoystickToVelocity0 in
	    mapper_link SFMLJoystickToVelocity0 velocity SpurRTC0 targetVelocity
	    mapper_link SFMLJoystickToVelocity0 velocity KobukiRTC0 targetVelocity
	    break ;;
	
	"n")
	    mapper_link NavigationManager0 targetVelocity SpurRTC0 targetVelocity
	    mapper_link NavigationManager0 targetVelocity KobukiRTC0 targetVelocity
	    break ;;

	*)
	    recho "Please choose which it is"

    esac

done

