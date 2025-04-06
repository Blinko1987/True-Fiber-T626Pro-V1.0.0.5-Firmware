#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"><link rel=\"stylesheet\"
href=\"/JS/stylemain_skyw.css?v=2\" type=\"text/css\"></head>
</SCRIPT><script language=\"JavaScript\">
		top.window.location.href=\"/cgi-bin/VenID_set.asp\";
</script>
<body onload=\"\"><table width=\"580\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#CCCCCC\" bgcolor=\"#FFFFFF\">"

ven_ID=`/userfs/bin/tcapi get GPON_ONU VendorId`
echo "value='$ven_ID'"
ret = `/usr/bin/prolinecmd VendorID set $ven_ID `
echo "sucessfull."
`/userfs/bin/tcapi set System_Entry reboot_type 1`
`/userfs/bin/tcapi commit System_Entry`

echo "</table></body></html>"