#!/bin/sh
CMD=$1
PPP_IF=$2
$CMD &
sleep 1
echo $! > /var/run/$PPP_IF/$PPP_IF.pid