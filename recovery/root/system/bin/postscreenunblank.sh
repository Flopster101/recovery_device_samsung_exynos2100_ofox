#!/system/bin/sh

TSP_INPUT="/sys/class/sec/tsp/input/enabled"

if [ -w "$TSP_INPUT" ]; then
	sleep 0.1
	echo 1 > "$TSP_INPUT"
fi
