## Linux_Backup_Minecraft
> 用linux的crontab实现自动备份
> 适用各种需求

* 此脚本能备份指定文件夹
* 压缩包用日期格式.
* 还有备份日记
* 暂时没有删除功能
* 使用之前先自定义文件路径
* 注意给运行权限.
* 请先测试脚本运行时目标路径有没有写的权限
* 改权限用命令 chmod +rwx MC.sh
* r=读
* w=写
* x=执行



## How to use:

#### 编辑crontab
``` 
crontab -e
``` 
#### 设置每天3点1分运行:
``` 
0 */4 * * * /opt/Linux_Backup_Minecraft/AutoBackup.sh >> /opt/Linux_Backup_Minecraft/cron.log 2>&1
``` 
#### 保存退出
```
:wq
``` 


#### 或直接用:
``` 
root@D /opt/Linux_Backup_Minecraft/AutoBackup.sh 
[2022-08-10 12:00:01] 开始备份数据
zip warning: No such file or directory
/opt/Linux_Backup_Minecraft/backup/08-月/0810_12_00_01-region-主地图.zip
[2022-08-10 12:00:02] 备份数据成功
删除了 [/opt/Linux_Backup_Minecraft/backup/08-月/0809_18_24_01-region-主地图.zip] 以节省存储
现在有[10]个备份文件
--------------------------
``` 




