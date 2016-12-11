#!/bin/sh



mkdir github     #githubディレクトへ移動

cd github     #githubディレクトリへ移動

#コンポーネントのコンパイル関数
build_rtc(){
    cd $1     #各コンポーネントのディレクトリへ移動
    mkdir -p build     #buildディレクトリ作成
    cd build     #buildディレクトリへ移動
    cmake ..     #コンパイル行える環境を整える Makefile作成
    make     #コンパイルを行う
#   cp src/$1.so ../../../bin     #.soファイルをbinディレクトリにコピーする
    cd ../..
}

#rtc.conf編集関数
rtc_conf(){
    cd $1     #各コンポーネントのディレクトリへ移動  
    sed -i -e '218s!# naming.formats: %h.host/%n.rtc!naming.formats: %n.rtc!g' rtc.conf
    cd ..
}



#TEC-1.param install
git clone https://github.com/rsdlab/tec-1-param     #TEC-1用のパラメータファイルをダウンロードしてくる


#SpurRTC
git clone https://github.com/rsdlab/SpurRTC     #SpurRTCをダウンロードしてくる


#UrgRTC
git clone https://github.com/rsdlab/UrgRTC     #UrgRTCをダウンロードしてくる
cd UrgRTC     #UrgRTCディレクトリへ移動
git clone https://github.com/rsdlab/urglib     #Urgのライブラリをダウンロードしてくる
cd ..


#SFMLJoystick
git clone https://github.com/rsdlab/SFMLJoystick     #SFMLJoystickをダウンロードしてくる


#SFMLJoysticktoVelocity
git clone https://github.com/sugarsweetrobotics/SFMLJoystickToVelocity     #SFMLJoysticktoVelocityをダウンロードしてくる


#Mapper_MRPT
git clone https://github.com/rsdlab/Mapper_MRPT     #Mapper_MRPTをダウンロードしてくる


#NavigationManager
git clone https://github.com/sugarsweetrobotics/NavigationManager     #NavigationManagerをダウンロードしてくる

#NavigationManagerのコンポーネントはjavaであるため，eclipse上でコンパイルを行う


#Localization_MRPT
git clone https://github.com/sugarsweetrobotics/Localization_MRPT     #Localization_MRPTをダウンロードしてくる

#PathPlanner_MRPT
git clone https://github.com/sugarsweetrobotics/PathPlanner_MRPT     #PathPlanner_MRPTをダウンロードしてくる

#SimplePathFollower
git clone https://github.com/sugarsweetrobotics/SimplePathFollower     #SimplePathFollowerをダウンロードしてくる

#MapServer
git clone https://github.com/sugarsweetrobotics/MapServer     #MapServerをダウンロードしてくる

#MapServerのコンポーネントはjavaであるため，eclipse上でコンパイルを行う


build_rtc SpurRTC
build_rtc UrgRTC
build_rtc SFMLJoystick
build_rtc SFMLJoystickToVelocity
build_rtc Mapper_MRPT
build_rtc Localization_MRPT
build_rtc PathPlanner_MRPT
build_rtc SimplePathFollower


cd SpurRTC
sed -i -e '36s!SpurRTC.conf!../conf/SpurRTC.conf!2' rtc.conf
cd ..


cd UrgRTC
sed -i -e '36s!UrgRTC.conf!../conf/UrgRTC.conf!2' rtc.conf
cd ..

 
cd SFMLJoystick
sed -i -e '36s!SFMLJoystick.conf!../conf/SFMLJoystick.conf!2' rtc.conf
cd ..

cd SFMLJoystickToVelocity
sed -i -e '36s!SFMLJoystickToVelocity.conf!../conf/SFMLJoystickToVelocity.conf!2' rtc.conf
cd ..

cd Mapper_MRPT
sed -i -e '36s!Mapper_MRPT.conf!../conf/Mapper_MRPT.conf!2' rtc.conf
cd ..

cd NavigationManager
sed -i -e '36s!MapperViewer.conf!../../../conf/NavigationManager.conf!2' rtc.conf
cd ..

cd Localization_MRPT
sed -i -e '36s!Localization_MRPT.conf!../conf/Localization_MRPT.conf!2' rtc.conf
cd ..

cd PathPlanner_MRPT
sed -i -e '36s!PathPlanner_MRPT.conf!../conf/PathPlanner_MRPT.conf!2' rtc.conf
cd ..

cd SimplePathFollower
sed -i -e '36s!SimplePathFollower.conf!../conf/SimplePathFollower.conf!2' rtc.conf
cd ..

cd MapServer
sed -i -e '36s!MapServer.conf!../../../conf/MapServer.conf!2' rtc.conf
cd ..



rtc_conf SpurRTC
rtc_conf UrgRTC
rtc_conf SFMLJoystick
rtc_conf SFMLJoystickToVelocity
rtc_conf Mapper_MRPT
rtc_conf NavigationManager
rtc_conf Localization_MRPT
rtc_conf PathPlanner_MRPT
rtc_conf SimplePathFollower
rtc_conf MapServer


cd NavigationManager
sed -i -e '8s!OpenRTM-aist-1.1.0.jar!OpenRTM-aist-1.1.2.jar!g' MapperViewer.sh
sed -i -e '10s!MapperViewerComp -f rtc.conf!NavigationManagerComp -f ../rtc.conf!g' MapperViewer.sh
sed -i -e '19s!../jdk1.7.0_17/bin/idlj!../bin/idlj!g' build_NavigationManager.xml

cd src/ssr/nameservice/ui
sed -i -e '44d' RTSTreeNodeBuilder.java
sed -i -e '50d' RTSTreeNodeBuilder.java
sed -i -e '489d' RTSTreeNode.java

cd ../../../../

ant -f build_NavigationManager.xml

cd ..


cd MapServer
sed -i -e '8s!OpenRTM-aist-1.1.0.jar!OpenRTM-aist-1.1.2.jar!g' MapServer.sh
sed -i -e '10s!rtc.conf!../rtc.conf!g' MapServer.sh
sed -i -e '20s!C:\\Users\\ysuga\\rtm\\idl\\!idl!g' build_MapServer.xml
sed -i -e '23s!C:\\Users\\ysuga\\rtm\\idl\\!idl!g' build_MapServer.xml
sed -i -e '26s!C:\\Users\\ysuga\\rtm\\idl\\!idl!g' build_MapServer.xml
sed -i -e '29s!C:\\Users\\ysuga\\rtm\\idl\\!idl!g' build_MapServer.xml


#IdltoMapServer
cp /usr/include/openrtm-1.1/rtm/idl/BasicDataType.idl /usr/include/openrtm-1.1/rtm/idl/InterfaceDataTypes.idl /usr/include/openrtm-1.1/rtm/idl/ExtendedDataTypes.idl idl

cd ..



#rtcd.jar downloads
#cd
#cp OpenRTM-aist/1.1/jar/rtcd.jar bin

#Java Version yaml install
#cd bin
#wget https://sourceforge.net/projects/jyaml/files/jyaml/jyaml-1.3/jyaml-1.3.jar
#cd ..

