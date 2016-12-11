#!/bin/sh

cecho() {
    echo "\033[1;36m$1\033[m"
}

recho() {
    echo "\033[1;31m$1\033[m"
}


while :

do

    cecho "Do you install OpenRTM-aist C++ ? <y/n>"
    echo -n ">>"
    read Key

    case "$Key" in
	"y")
	    #OpenRTM-aist C++ 1.1.2RELEASE install
	    wget http://svn.openrtm.org/OpenRTM-aist/tags/RELEASE_1_1_2/OpenRTM-aist/build/pkg_install_ubuntu.sh     #OpenRTM-aist C++ 1.1.2RELEASE インストールのためのスクリプトファイルをダウンロードしてくる 
	    sudo sh pkg_install_ubuntu.sh -c     #OpenRTM-aist C++ 1.1.2RELEASEをインストールする
	    rm -rf pkg_install_ubuntu.sh     #スクリプトファイルを消去する
	    
	    sudo apt-get install cmake
	    
	    break ;;
	
	"n")
	    break ;;

	*)
	    recho "Please choose which it is"

    esac

done


#Oracle Java 8 install
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer     #Oracle Java 8インストール


while :

do

    cecho "Do you install OpenRTM-aist java ? <y/n>"
    echo -n ">>"
    read Key2

    case "$Key2" in
	"y")
	    #OpenRTM-aist java 1.1.2 RELEASE install
	    wget http://openrtm.org/pub/OpenRTM-aist/java/1.1.2/OpenRTM-aist-Java-1.1.2-RELEASE-jar.zip     #OpenRTM-aist Java 1.1.2 RELEASE の圧縮ファイルをダウンロードしてくる
	    unzip OpenRTM-aist-Java-1.1.2-RELEASE-jar.zip     #圧縮ファイルを解凍する
	    rm -rf OpenRTM-aist-Java-1.1.2-RELEASE-jar.zip
	    
	    mv OpenRTM-aist /home/$USER/
	    
	    echo "export RTM_JAVA_ROOT=/home/$USER/OpenRTM-aist/1.1" >> ~/.bashrc
	    echo 'export CLASSPATH=.:$RTM_JAVA_ROOT/jar/OpenRTM-aist-1.1.2.jar:$RTM_JAVA_ROOT/jar/commons-cli-1.1.jar' >> ~/.bashrc

	    break ;;
	
	"n")
	    break ;;

	*)
	    recho "Please choose which it is"

    esac

done



while :

do

    cecho "Do you install OpenRTM-aist python ? <y/n>"
    echo -n ">>"
    read Key3

    case "$Key3" in
	"y")
	    #OpenRTM-aist python 1.1.2RELEASE install
	    wget http://svn.openrtm.org/OpenRTM-aist-Python/tags/RELEASE_1_1_2/OpenRTM-aist-Python/installer/install_scripts/pkg_install_python_ubuntu.sh     #OpenRTM-aist python 1.1.2RELEASE インストールのためのスクリプトファイルをダウンロードしてくる 
	    sudo sh pkg_install_python_ubuntu.sh     #OpenRTM-aist python 1.1.2RELEASEをインストールする
	    rm -rf pkg_install_python_ubuntu.sh     #スクリプトファイルを消去する
	    
	
	    sudo apt-get install python-sphinx
	
	    sudo apt-get install curl
	    
	    wget https://bootstrap.pypa.io/get-pip.py
	    sudo python get-pip.py
	    rm -rf get-pip.py
	    
	    sudo pip install rtshell
	    
#	    sudo sed -i -e '23s/omniORB/omniORB.any/g' /usr/local/lib/python2.7/dist-packages/rtctree/utils.py
	    
	    cecho "To a question,please push <y> appropriately"
	    sleep 3
	    sudo rtshell_post_install
	
	    break ;;
	"n")
	    break ;;

	*)
	    recho "Please choose which it is"

    esac

done


cd
cd Downloads
wget http://openrtm.org/pub/openrtp/packages/1.1.2.v20160526/eclipse442-openrtp112v20160526-ja-linux-gtk-x86_64.tar.gz
tar xvzf eclipse442-openrtp112v20160526-ja-linux-gtk-x86_64.tar.gz
rm -rf eclipse442-openrtp112v20160526-ja-linux-gtk-x86_64.tar.gz
sudo ln -s /home/$USER/Downloads/eclipse/eclipse /usr/bin
