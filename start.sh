#! /bin/sh

WORKINGDIR=`dirname $0`
APP="$WORKINGDIR/IM"
PIDFILE="$1"
STARTSTOPDAEMON="/usr/local/bin/start-stop-daemon"

$STARTSTOPDAEMON --start --chdir $WORKINGDIR --make-pidfile --pidfile $PIDFILE --exec $APP

exit $?

