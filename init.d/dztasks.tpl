#!/bin/sh
# chkconfig: 2345 55 25
# description: dztasks Service

### BEGIN INIT INFO
# Provides:          dztasks
# Required-Start:    $all
# Required-Stop:     $all
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: starts dztasks
# Description:       starts the MDW-Web
### END INIT INFO

# Simple dztasks init.d script conceived to work on Linux systems
# as it does use of the /proc filesystem.

app_start(){
	echo "Starting dztasks server..."
	cd {$SERVER_PATH}/dztasks
	./dztasks service >> {$SERVER_PATH}/dztasks/logs.pl 2>&1 &
}

app_stop(){
	echo "dztasks stopped"
	ps -ef| grep dztasks | grep -v grep | grep -v python | grep -v sh | awk '{print $2}'| xargs kill
}


case "$1" in
    start)
		app_start
        ;;
    stop)
        app_stop
        ;;
	restart|reload)
		app_stop
		sleep 0.3
		app_start
		;;
    *)
        echo "Please use start or stop as first argument"
        ;;
esac

