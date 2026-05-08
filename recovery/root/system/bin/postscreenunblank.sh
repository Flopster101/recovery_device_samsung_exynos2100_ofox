#!/system/bin/sh

TSP_INPUT="/sys/class/sec/tsp/input/enabled"

if [ -w "$TSP_INPUT" ]; then
	echo 1 > "$TSP_INPUT"
fi
