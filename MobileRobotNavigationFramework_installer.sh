#!/bin/sh

#SFML install
sudo apt-get install libsfml-dev     #SFMLインストール

#MRPT install
wget https://github.com/jlblancoc/mrpt/archive/1.4.0.tar.gz
tar xzvf 1.4.0.tar.gz
rm -rf 1.4.0.tar.gz
cd mrpt-1.4.0
mkdir build
cd build
cmake ..
make
sudo make install
sudo ldconfig
cd ../..

#Git install
sudo apt-get install git     #gitインストール

#Ant install
sudo apt-get install ant     #antインストール

#YP-Spur install
git clone https://openspur.org/repos/yp-spur.git     #yp-spur gitclone
cd yp-spur     #yp-spurディレクトリへ移動
mkdir build     #buildというディレクトリ作成
cd build     #buildディレクトリへ移動
../configure     #1つ前の階層でMakefileを生成する
make     #コンパイルを行う
sudo make install     #ビルドしたソフトウェアをインストールする
sudo ldconfig     #共有ライブラリの依存関係情報の更新
cd ../..


mkdir log

sudo addgroup $USER dialout
