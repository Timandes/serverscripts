#! /bin/sh

# 警告：这是试验性脚本，暂时不可以用于实际应用
# 自动检查“招财通”是否已经关闭
# 若已关闭，就备份日志并尝试重新启动
# 建议作为定时任务，每分钟执行一次
# 亚男，2013-7-29

. /etc/rc.d/init.d/functions

PIDFILE="/var/run/whtimserver.pid"
LOGFILE="/var/log/whtimserver.log"
APPPID=`tail $PIDFILE`
DATESTRING=`date +%Y%m%d%H%M%S`
BAKLOGFILE="/home/v-yanan/whtimserver.log-$DATESTRING"

echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: begin checking ..."
if checkpid $APPPID; then
    echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: normally running."
    exit 0
else
    echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: cannot find running process, maybe crashed."
    echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: saving log file ..."
    cp $LOGFILE $BAKLOGFILE
    echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: trying to start ..."
    /etc/init.d/whtimserver start
    echo `date "+%Y-%m-%d %H:%M:%S"`" autorecover: command 'starting' executed."
fi

