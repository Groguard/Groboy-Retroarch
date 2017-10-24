#!/bin/sh -x

echo "Starting retroarch"
DISPLAY=:0 retroarch && echo "shutting down" &&
echo s > /host/proc/sysrq-trigger && echo u > /host/proc/sysrq-trigger && echo s > /host/proc/sysrq-trigger &&
echo o > /host/proc/sysrq-trigger
