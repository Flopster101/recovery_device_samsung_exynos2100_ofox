#!/system/bin/sh

TSP_INPUT="/sys/class/sec/tsp/input/enabled"
TSP_CMD="/sys/class/sec/tsp/cmd"

if [ -w "$TSP_INPUT" ]; then
	echo 0 > "$TSP_INPUT"
fi

if [ -w "$TSP_CMD" ]; then
	echo aot_enable,1 > "$TSP_CMD"
fi
