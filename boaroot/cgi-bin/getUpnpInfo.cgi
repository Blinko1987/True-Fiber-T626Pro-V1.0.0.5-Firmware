#!/bin/sh

echo "Content-Type: text/html"
echo ""
SSWVer=`/userfs/bin/tcapi get DeviceInfo_devParaStatic CustomerSWVersion`
echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=UTF-8\"><link rel=\"stylesheet\" href=\"/JS/stylemain_skyw.css?v=$SSWVer\" type=\"text/css\">
<link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">
<link rel=\"stylesheet\" href=\"/css/style.css\">
<style>
body {
    background: #FFFFFF;
}
</style>
</head><SCRIPT language=javascript src=\"/JS/util_skyw.js?v=2\"></SCRIPT><script language=\"JavaScript\"></script>

<body topmargin=\"10\" leftmargin=\"0\"><table width=\"100%\" align=center cellpadding=\"0\" cellspacing=\"0\">"

#AppStr=`/userfs/bin/tcapi get String_Entry UPNPAPPText`
#ProtocolStr=`/userfs/bin/tcapi get String_Entry ProtocolText`
#PortStr=`/userfs/bin/tcapi get String_Entry UPNPExternalPortText`
#IPStr=`/userfs/bin/tcapi get String_Entry UPNPInternalIPText`
#InternalPortStr=`/userfs/bin/tcapi get String_Entry UPNPInternalPortText`
#UpnpActive=`/userfs/bin/tcapi get Upnpd_Entry Active`
AppStr="APP"
ProtocolStr="Protocol"
PortStr="External Port"
IPStr="Internal IP"
InternalPortStr="Internal Port"

echo "<tr ><td><table width=\"100%\" border=\"1\" align=center cellpadding=\"3\" cellspacing=\"0\">
<tr class=\"table-header center\"><TD align=middle width=\"20%\"><STRONG><FONT >$AppStr</FONT></STRONG></TD><td width=\"20%\" align=center>
<strong><FONT >$ProtocolStr</FONT></strong></td><TD align=middle
width=\"20%\"><STRONG><FONT >$PortStr</FONT></STRONG></TD><TD align=middle
width=\"20%\"><STRONG><FONT >$IPStr</FONT></STRONG></TD><td width=\"20%\" align=center>
<strong><FONT >$InternalPortStr</FONT></strong></td></TR></tr>"

#if [ "$UpnpActive" = "Yes" ]; then
cat /tmp/upnp_portmap | while read LINE
do
        APP=$(echo $LINE | awk -F ',' '{print $1}')
        PROTOCOL=$(echo $LINE | awk -F ',' '{print $2}')
        EXTERNALPORT=$(echo $LINE | awk -F ',' '{print $3}')
        INTERNALIP=$(echo $LINE | awk -F ',' '{print $4}')
        INTERNALPORT=$(echo $LINE | awk -F ',' '{print $5}')
        echo "<tr align=\"middle\"><td width=\"20%\">$APP</td><td width=\"20%\">$PROTOCOL</td><td width=\"20%\">$EXTERNALPORT</td><td width=\"20%\">$INTERNALIP</td><td width=\"20%\">$INTERNALPORT</td></tr>"
done
#fi

echo "</table></td></tr></table></body></html>"

