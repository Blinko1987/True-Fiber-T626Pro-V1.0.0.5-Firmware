#!/bin/sh

ulimit -c unlimited

echo "/tmp/core-%e-%p" > /proc/sys/kernel/core_pattern
