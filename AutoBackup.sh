#!/bin/bash
#项目地址 https://github.com/ACGMC/Linux_Backup_Minecraft


. /etc/profile
. ~/.bash_profile
#最大备份数量
maxNum=10
#时间格式化
TM=`date +%m%d_%H_%M_%S`
M=`date +%m-月`

#备份到目标
BKD=/opt/Linux_Backup_Minecraft/backup

#记录备份动作操作过程
LGD=$BKD/logs

#服务端主目录
SERVER=/opt/mcsmanager/daemon/data/InstanceData/e67d378060854bc5a166541cc32a2ee3

#要打包压缩的文件夹
dp=$SERVER/RE/dp
playerdata=$SERVER/RE/playerdata
region=$SERVER/worlds

#判断有没有目标文件夹,没有就mkdir
if [ ! -d $BKD/$M ];then
   mkdir -pv $BKD/$M
fi

if [ ! -d $LGD ];then
   mkdir -pv $LGD
fi



#输出到logs用
echo "--------------------------"
startDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "[$startDate] 开始备份数据"

#用绝对路径 zip可以换成7z tar 可配合在线解压工具
zip -rv -1 $BKD/$M/$TM-region-主地图.zip $region > $LGD/$TM-region.log
echo $BKD/$M/$TM-region-主地图.zip

endDate=`date +"%Y-%m-%d %H:%M:%S"`
echo "[$endDate] 备份数据成功"



j=0
fileNum=`ls -l $BKD/$M/|grep "^-" |wc -l`
for i in `ls -1 $BKD/$M/`
do
	tmp=`expr $j + $maxNum`
	
	if [ $tmp -lt $fileNum ];then
		echo "删除了 [$BKD/$M/$i] 以节省存储"
		rm $BKD/$M/$i
	fi
	j=`expr $j + 1`
done

j=0
fileNum=`ls -l $LGD/|grep "^-" |wc -l`
for i in `ls -1 $LGD/`
do
	tmp=`expr $j + $maxNum`
	
	if [ $tmp -lt $fileNum ];then
		echo "删除了 [$LGD/$i] 以节省存储"
		rm $LGD/$i
	fi
	j=`expr $j + 1`
done


fileNum=`ls -l $BKD/$M/|grep "^-" |wc -l`
echo "现在有[$fileNum]个备份文件"

echo "--------------------------"
