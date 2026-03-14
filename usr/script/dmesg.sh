#!/bin/sh
#dmesg record
#Usage:./dmesg

DMESG_FILE_PATH="/usr/ubifs/dmesg/"
DMESG_FILE_NAME="dmesg"
CUR_NAME=$DMESG_FILE_PATH$DMESG_FILE_NAME

if [ ! -d $DMESG_FILE_PATH ];then
	mkdir $DMESG_FILE_PATH
fi

for i in 4 3 2 1; do
	CUR_NAME=${DMESG_FILE_PATH}${DMESG_FILE_NAME}.${i}
	if [ $i = "4" ];then
		rm -f $CUR_NAME
	fi

	if [ -f $CUR_NAME ];then
	j=`expr $i + 1`
	mv $CUR_NAME $DMESG_FILE_PATH$DMESG_FILE_NAME.$j
	fi
done

CUR_NAME=$DMESG_FILE_PATH$DMESG_FILE_NAME
if [ -f $CUR_NAME ];then
	mv $CUR_NAME $CUR_NAME.1
fi

dmesg > $CUR_NAME
