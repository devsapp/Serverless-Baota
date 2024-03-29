#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

curPath=`pwd`
rootPath=$(dirname "$curPath")
rootPath=$(dirname "$rootPath")
serverPath=$(dirname "$rootPath")


# cd /www/server/mdserver-web/plugins/mysql-yum && bash install.sh install 8.0
# cd /www/server/mdserver-web/plugins/mysql-yum && bash install.sh uninstall 8.0
# cd /www/server/mdserver-web && python3 /www/server/mdserver-web/plugins/mysql-yum/index.py start 8.0

install_tmp=${rootPath}/tmp/mw_install.pl


action=$1
type=$2



if [ "${2}" == "" ];then
	echo '缺少安装脚本...' > $install_tmp
	exit 0
fi 

if [ ! -d $curPath/versions/$2 ];then
	echo '缺少安装脚本2...' > $install_tmp
	exit 0
fi

if [ "${action}" == "uninstall" ];then
	
	cd ${rootPath} && python3 ${rootPath}/plugins/mysql-yum/index.py stop ${type}
	cd ${rootPath} && python3 ${rootPath}/plugins/mysql-yum/index.py initd_uninstall ${type}
	cd $curPath
fi

sh -x $curPath/versions/$2/install.sh $1

if [ "${action}" == "install" ];then
# 	#初始化 
	cd ${rootPath} && python3 ${rootPath}/plugins/mysql-yum/index.py start ${type}
	cd ${rootPath} && python3 ${rootPath}/plugins/mysql-yum/index.py initd_install ${type}
fi
