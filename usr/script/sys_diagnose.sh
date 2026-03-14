#!/bin/sh
RST_PATH="/tmp/diagnose" 
OMCI_PID="/tmp/omci.pid"
OMCI_LOGFILE_PATH="/tmp/omci_trace.log"
OMCI_BAK_LOGFILE_PATH="/tmp/omci_trace_bak.log"
TR069_LOGFILE_PATH="/tmp/uploadtr69_log.txt"
DMESG_LOGFILE_PATH="/usr/ubifs/dmesg"
SYSLOG_LOGFILE_PATH="/usr/ubifs/syslog"
ROMFILE_BAD_BIN_PATH="/tmp/romfile_bad.bin"

FileDir="/tmp/"
FileType="DE"

diagnose_type=$1
if [ -z "$1" ]; then
	echo "===>diagnose_type is local"
else
	echo "===>diagnose_type is $diagnose_type"
fi

cd /tmp
/bin/rm -rf $RST_PATH
/bin/mkdir -p $RST_PATH
cd $RST_PATH

#diagnose_testCmds start
#wan pvc
/bin/date > sys_others.log

echo "#/bin/cat /userfs/release" >> sys_others.log
/bin/cat /userfs/release >> sys_others.log

echo "#/sbin/ifconfig" >> sys_others.log
/sbin/ifconfig >> sys_others.log

echo "#/bin/ps" >> sys_others.log
/bin/ps >> sys_others.log

echo "#/sbin/ifconfig" >> sys_others.log
/usr/bin/mpstat -P ALL >> sys_others.log

echo "#/bin/ping -c 6 8.8.8.8" >> sys_others.log
/bin/ping -c 6 8.8.8.8 >> sys_others.log

echo "#/sbin/route" >> sys_others.log
/sbin/route >> sys_others.log

echo "#/usr/bin/iptables -nvL" >> sys_others.log
/usr/bin/iptables -nvL >> sys_others.log

echo "#echo show_BoB_information" >> sys_others.log
echo show_BoB_information >/proc/pon_phy/debug >> sys_others.log

echo "#/userfs/bin/tcapi get gpon_onu SerialNumber" >> sys_others.log
/userfs/bin/tcapi get gpon_onu SerialNumber >> sys_others.log

echo "#/userfs/bin/tcapi show XPON " >> sys_others.log
/userfs/bin/tcapi show XPON >> sys_others.log

echo "#/userfs/bin/tcapi show waninfo " >> sys_others.log
/userfs/bin/tcapi show waninfo >> sys_others.log 

#wan pvc
echo "===>all wan pvc"
/bin/date > allwan.log
echo "#/userfs/bin/tcapi show wan " >> allwan.log
/userfs/bin/tcapi show wan >> allwan.log
#wan.pvc. 1~8 
for i in `tcapi show wan |grep OID | cut -d ":" -f 2 |grep PVC |cut -c1-1`
do
	echo "#/userfs/bin/tcapi show wan.pvc.$i" >> allwan.log
	/userfs/bin/tcapi show wan.pvc.$i >> allwan.log
done

#wifi 2.4G
echo "===>wifi 2.4G"
/bin/date > wifiinfo.log
echo "#/userfs/bin/iwpriv ra0 stat" >> wifiinfo.log
/userfs/bin/iwpriv ra0 stat >> wifiinfo.log 

echo "#/userfs/bin/iwpriv ra0 stainfo" >> wifiinfo.log
/userfs/bin/iwpriv ra0 stainfo >> wifiinfo.log 

#wifi 5G
echo "===>wifi 5G"
/bin/date >> wifiinfo.log
echo "#/userfs/bin/iwpriv rai0 stat" >> wifiinfo.log
/userfs/bin/iwpriv rai0 stat >> wifiinfo.log 

echo "#/userfs/bin/iwpriv rai0 stainfo" >> wifiinfo.log
/userfs/bin/iwpriv rai0 stainfo >> wifiinfo.log 

#neighbor 2.4G
choose_wifi=`/userfs/bin/tcapi get syslog.entry moduleType`
echo "===>choose_wifi: $choose_wifi "
if [ -z "$choose_wifi" ]; then
	echo "===>wifi moduleType have not choosed!"
else
	#wifi_2g=${choose_wifi:5:1}	
	wifi_2g=`echo $choose_wifi | cut -c5-1`	
	echo "===>wifi_2g: $wifi_2g "
	if [ "$wifi_2g" = "1" ]
	then
		echo "#/userfs/bin/iwpriv ra0 set SiteSurvey=1" >> neighbor.log
		/userfs/bin/iwpriv ra0 set SiteSurvey=1 >> neighbor.log 

		echo "#/userfs/bin/iwpriv ra0 get_site_survey" >> neighbor.log
		/userfs/bin/iwpriv ra0 get_site_survey >> neighbor.log 
	fi

	#neighbor 5G
	#wifi_5g=${choose_wifi:5:1}
	wifi_5g=`echo $choose_wifi | cut -c7-1`	
	echo "===>wifi_5g: $wifi_5g "
	if [ "$wifi_5g" = "1" ]
	then
		echo "#/userfs/bin/iwpriv rai0 set SiteSurvey=1" >> neighbor.log
		/userfs/bin/iwpriv ra0 set SiteSurvey=1 >> neighbor.log 

		echo "#/userfs/bin/iwpriv rai0 get_site_survey" >> neighbor.log
		/userfs/bin/iwpriv ra0 get_site_survey >> neighbor.log 
	fi
fi
#echo "===>finish all diagnose_testCmds!"
#diagnose_testCmds end

#copy omci log file
echo "===>copy omci log file"
kill -USR2 `cat $OMCI_PID| sed 's/omci.pid=//' | awk '{print $1}'`
cp $OMCI_LOGFILE_PATH $RST_PATH
cp $OMCI_BAK_LOGFILE_PATH $RST_PATH

#copy tr69 log file
echo "===>copy tr69 log file"
cp $TR069_LOGFILE_PATH $RST_PATH

#copy romfile_bad.bin file
echo "===>copy romfile_bad.bin file"
cp $ROMFILE_BAD_BIN_PATH $RST_PATH

#copy syslog file
/bin/cat /var/log/currLogFile >> $RST_PATH/currLogFile.log
/bin/cat /var/log/messages >> $RST_PATH/currLogFile.log;
cp -r $SYSLOG_LOGFILE_PATH $RST_PATH
mv $RST_PATH/currLogFile.log $RST_PATH/syslog/

#copy dmesg file /ubifs/dmesg/ /ubifs/syslog
cp -r $DMESG_LOGFILE_PATH $RST_PATH

################################################
cd /tmp
if [ "$1" = "-tftp" ]; then	
	TFTP_SERVER=`/userfs/bin/tcapi get SysLog.Entry tftpLogServer`
	if [ -z "$TFTP_SERVER" ]; then
		echo "===>tftpLogServer is not found in syslog."
		exit 1
	fi	
	
	serialNumber=`/userfs/bin/tcapi get deviceinfo.devParaDynamic SerialNum`
	CurrentTime=$(date +%Y%m%d%H%M%S)
	FILE_NAME=$serialNumber"_"$CurrentTime"diagnose"$FileType".tar.gz"
	/bin/tar -zcvf $FILE_NAME diagnose	

	#tftp tar.gz
 	echo "===>/usr/bin/tftp -p -r $FILE_NAME -l $FILE_NAME $TFTP_SERVER"
	/usr/bin/tftp -p -r $FILE_NAME -l $FILE_NAME $TFTP_SERVER
	if [ $? = 0 ]; then
		/bin/rm -rf $FILE_NAME
		/bin/echo "tftp $FILE_NAME finished!"
	else
		/bin/echo "tftp $FILE_NAME fail..."
	fi
	
else 
	FILE_NAME="diagnose"$FileType".tar.gz"
	/bin/tar -zcvf $FILE_NAME diagnose	
fi	
