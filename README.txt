
##########################################################
RTミドルウェアコンテスト2016
移動ロボット開発支援のためのRTコンポーネント群
##########################################################


早稲田大学尾形研究室で開発された移動ロボット用フレームワークであるMobileRobotNavigationFrameworkをLinux環境で利用するための動作環境の構築からEclipse上でのコンポーネントの接続までをshellスクリプトで実行できる用にしたものである.

動作検証環境
OS:Ubuntu14.04 

以下にshellスクリプトの実行手順とそれぞれのshellの概要を説明する.
しかしながら,2箇所ほど各自で変更していただく必要がありますのでよろしくお願いいたします.

実行手順・概要
1.OpenRTM_installer.sh
 MobileRobotNavigationFrameworkを利用するために必要となるC++版とJava版のOpenRTM1.1.2のインストールとrtshellをのためのPython版のインストール,日本語版のEclipseをインストールする.

rtshellのインストールの関して,コンポーネントを接続するためのrtconを実行際に発生するエラーを解消するために下記のファイルの修正をお願いたします.

 $cd /usr/local/lib/python2.7/dist-packages/rtctree
 $sudo emacs utils.py

ここで,「import omniORB」と書かれている行を「import omniORB.any」と修正してください.


2.MobileRobotNavigationFramework_install.sh
 MobileRobotNavigatinFrameworkのコンポーネントをコンパイルするために必要なソフトウェア各種をインストールする.

3.MobileRobotNavigationFramework_downloads.sh
 MobileRobotNavigationFrameworkの各コンポーネントをそれぞれgithubからダウンロードしてきてソース単位でコンパイルを行う.

ここの工程において,MapをManagerに提供するためのコンポーネントであるMapServerをEclipse上でコンパイルしていただく必要がある.手順は以下のHPの「環境地図データを提供するためのRTコンポーネントのコンパイル」を参考にしてください.

4.mapper_run.sh
 Mapping用コンポーネント群を実行する.

5.mapper_link.sh
 実行されているMapping用コンポーネントを接続する.

Mappigの利用方法は以下のページを参照してください.
http://www2.meijo-u.ac.jp/~kohara/cms/technicalreport/mobilerobotnavigationframework-table-of-contents/mobile-robot-navigation-framework-utilization/mapping-components-execution

6.navi_run.sh
 Navigation用コンポーネント群を実行する.

5.navi_link.sh
 実行されているNavigation用コンポーネントを接続する.

Navigationの利用方法は以下のページを参照してください.
http://www2.meijo-u.ac.jp/~kohara/cms/technicalreport/mobilerobotnavigationframework-table-of-contents/mobile-robot-navigation-framework-utilization/navigation-components-execution


shellで実装できていない2箇所に関しましては修正・確認が出来ましたら随時更新させていただきます.

ご不明な点,ご不都合がございましたら以下にご連絡ください


##########################################################
名城大学　ロボットシステムデザイン研究室
Email : 130447091@ccmailg.meijo-u.ac.jp
##########################################################
