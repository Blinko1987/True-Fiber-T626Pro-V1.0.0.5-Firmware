#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"><link rel=\"stylesheet\"
href=\"/JS/stylemain_skyw.css?v=2\" type=\"text/css\"></head>
</SCRIPT><script language=\"JavaScript\">
function doDel(i)
{ 
	var f = parent.document.PortTriggerForm;
	var element = document.getElementById(i);

	if(element.checked)
	{
		if(i==0) f.hPortTriggerEntry0.value=i;
		else if(i==1) f.hPortTriggerEntry1.value=i;
		else if(i==2) f.hPortTriggerEntry2.value=i;
		else if(i==3) f.hPortTriggerEntry3.value=i;
		else if(i==4) f.hPortTriggerEntry4.value=i;
		else if(i==5) f.hPortTriggerEntry5.value=i;
		else if(i==6) f.hPortTriggerEntry6.value=i;
		else if(i==7) f.hPortTriggerEntry7.value=i;
		else if(i==8) f.hPortTriggerEntry8.value=i;
		else if(i==9) f.hPortTriggerEntry9.value=i;
		else if(i==10) f.hPortTriggerEntry10.value=i;
		else if(i==11) f.hPortTriggerEntry11.value=i;
		else if(i==12) f.hPortTriggerEntry12.value=i;
		else if(i==13) f.hPortTriggerEntry13.value=i;
		else if(i==14) f.hPortTriggerEntry14.value=i;
		else if(i==15) f.hPortTriggerEntry15.value=i;
		else if(i==16) f.hPortTriggerEntry16.value=i;
		else if(i==17) f.hPortTriggerEntry17.value=i;
		else if(i==18) f.hPortTriggerEntry18.value=i;
		else if(i==19) f.hPortTriggerEntry19.value=i;
		else if(i==20) f.hPortTriggerEntry20.value=i;
		else if(i==21) f.hPortTriggerEntry21.value=i;
		else if(i==22) f.hPortTriggerEntry22.value=i;
		else if(i==23) f.hPortTriggerEntry23.value=i;
		else if(i==24) f.hPortTriggerEntry24.value=i;
		else if(i==25) f.hPortTriggerEntry25.value=i;
		else if(i==26) f.hPortTriggerEntry26.value=i;
		else if(i==27) f.hPortTriggerEntry27.value=i;
		else if(i==28) f.hPortTriggerEntry28.value=i;
		else if(i==29) f.hPortTriggerEntry29.value=i;
		else if(i==30) f.hPortTriggerEntry30.value=i;
		else if(i==31) f.hPortTriggerEntry31.value=i;
		else if(i==32) f.hPortTriggerEntry32.value=i;
		else if(i==33) f.hPortTriggerEntry33.value=i;
		else if(i==34) f.hPortTriggerEntry34.value=i;
		else if(i==35) f.hPortTriggerEntry35.value=i;
		else if(i==36) f.hPortTriggerEntry36.value=i;
		else if(i==37) f.hPortTriggerEntry37.value=i;
		else if(i==38) f.hPortTriggerEntry38.value=i;
		else if(i==39) f.hPortTriggerEntry39.value=i;
		else if(i==40) f.hPortTriggerEntry40.value=i;
		else if(i==41) f.hPortTriggerEntry41.value=i;
		else if(i==42) f.hPortTriggerEntry42.value=i;
		else if(i==43) f.hPortTriggerEntry43.value=i;
		else if(i==44) f.hPortTriggerEntry44.value=i;
		else if(i==45) f.hPortTriggerEntry45.value=i;
		else if(i==46) f.hPortTriggerEntry46.value=i;
		else if(i==47) f.hPortTriggerEntry47.value=i;
		else if(i==48) f.hPortTriggerEntry48.value=i;
		else if(i==49) f.hPortTriggerEntry49.value=i;
		else if(i==50) f.hPortTriggerEntry50.value=i;
		else if(i==51) f.hPortTriggerEntry51.value=i;
		else if(i==52) f.hPortTriggerEntry52.value=i;
		else if(i==53) f.hPortTriggerEntry53.value=i;
		else if(i==54) f.hPortTriggerEntry54.value=i;
		else if(i==55) f.hPortTriggerEntry55.value=i;
		else if(i==56) f.hPortTriggerEntry56.value=i;
		else if(i==57) f.hPortTriggerEntry57.value=i;
		else if(i==58) f.hPortTriggerEntry58.value=i;
		else if(i==59) f.hPortTriggerEntry59.value=i;
		else if(i==60) f.hPortTriggerEntry60.value=i;
		else if(i==61) f.hPortTriggerEntry61.value=i;
		else if(i==62) f.hPortTriggerEntry62.value=i;
		else if(i==63) f.hPortTriggerEntry63.value=i;
	}
	else
	{
		if(i==0) f.hPortTriggerEntry0.value=\"-1\";
		else if(i==1) f.hPortTriggerEntry1.value=\"-1\";
		else if(i==2) f.hPortTriggerEntry2.value=\"-1\";
		else if(i==3) f.hPortTriggerEntry3.value=\"-1\";
		else if(i==4) f.hPortTriggerEntry4.value=\"-1\";
		else if(i==5) f.hPortTriggerEntry5.value=\"-1\";
		else if(i==6) f.hPortTriggerEntry6.value=\"-1\";
		else if(i==7) f.hPortTriggerEntry7.value=\"-1\";
		else if(i==8) f.hPortTriggerEntry8.value=\"-1\";
		else if(i==9) f.hPortTriggerEntry9.value=\"-1\";
		else if(i==10) f.hPortTriggerEntry10.value=\"-1\";
		else if(i==11) f.hPortTriggerEntry11.value=\"-1\";
		else if(i==12) f.hPortTriggerEntry12.value=\"-1\";
		else if(i==13) f.hPortTriggerEntry13.value=\"-1\";
		else if(i==14) f.hPortTriggerEntry14.value=\"-1\";
		else if(i==15) f.hPortTriggerEntry15.value=\"-1\";
		else if(i==16) f.hPortTriggerEntry16.value=\"-1\";
		else if(i==17) f.hPortTriggerEntry17.value=\"-1\";
		else if(i==18) f.hPortTriggerEntry18.value=\"-1\";
		else if(i==19) f.hPortTriggerEntry19.value=\"-1\";
		else if(i==20) f.hPortTriggerEntry20.value=\"-1\";
		else if(i==21) f.hPortTriggerEntry21.value=\"-1\";
		else if(i==22) f.hPortTriggerEntry22.value=\"-1\";
		else if(i==23) f.hPortTriggerEntry23.value=\"-1\";
		else if(i==24) f.hPortTriggerEntry24.value=\"-1\";
		else if(i==25) f.hPortTriggerEntry25.value=\"-1\";
		else if(i==26) f.hPortTriggerEntry26.value=\"-1\";
		else if(i==27) f.hPortTriggerEntry27.value=\"-1\";
		else if(i==28) f.hPortTriggerEntry28.value=\"-1\";
		else if(i==29) f.hPortTriggerEntry29.value=\"-1\";
		else if(i==30) f.hPortTriggerEntry30.value=\"-1\";
		else if(i==31) f.hPortTriggerEntry31.value=\"-1\";
		else if(i==32) f.hPortTriggerEntry32.value=\"-1\";
		else if(i==33) f.hPortTriggerEntry33.value=\"-1\";
		else if(i==34) f.hPortTriggerEntry34.value=\"-1\";
		else if(i==35) f.hPortTriggerEntry35.value=\"-1\";
		else if(i==36) f.hPortTriggerEntry36.value=\"-1\";
		else if(i==37) f.hPortTriggerEntry37.value=\"-1\";
		else if(i==38) f.hPortTriggerEntry38.value=\"-1\";
		else if(i==39) f.hPortTriggerEntry39.value=\"-1\";
		else if(i==40) f.hPortTriggerEntry40.value=\"-1\";
		else if(i==41) f.hPortTriggerEntry41.value=\"-1\";
		else if(i==42) f.hPortTriggerEntry42.value=\"-1\";
		else if(i==43) f.hPortTriggerEntry43.value=\"-1\";
		else if(i==44) f.hPortTriggerEntry44.value=\"-1\";
		else if(i==45) f.hPortTriggerEntry45.value=\"-1\";
		else if(i==46) f.hPortTriggerEntry46.value=\"-1\";
		else if(i==47) f.hPortTriggerEntry47.value=\"-1\";
		else if(i==48) f.hPortTriggerEntry48.value=\"-1\";
		else if(i==49) f.hPortTriggerEntry49.value=\"-1\";
		else if(i==50) f.hPortTriggerEntry50.value=\"-1\";
		else if(i==51) f.hPortTriggerEntry51.value=\"-1\";
		else if(i==52) f.hPortTriggerEntry52.value=\"-1\";
		else if(i==53) f.hPortTriggerEntry53.value=\"-1\";
		else if(i==54) f.hPortTriggerEntry54.value=\"-1\";
		else if(i==55) f.hPortTriggerEntry55.value=\"-1\";
		else if(i==56) f.hPortTriggerEntry56.value=\"-1\";
		else if(i==57) f.hPortTriggerEntry57.value=\"-1\";
		else if(i==58) f.hPortTriggerEntry58.value=\"-1\";
		else if(i==59) f.hPortTriggerEntry59.value=\"-1\";
		else if(i==60) f.hPortTriggerEntry60.value=\"-1\";
		else if(i==61) f.hPortTriggerEntry61.value=\"-1\";
		else if(i==62) f.hPortTriggerEntry62.value=\"-1\";
		else if(i==63) f.hPortTriggerEntry63.value=\"-1\";	
	}
}
</script>
	
<body topmargin=\"10\"
leftmargin=\"0\"><table width=\"100%\" align=center cellpadding=\"0\" cellspacing=\"0\">"

echo "<tr><td><table width=\"100%\" border=\"1\" align=center style=\"border-collapse:collapse\" cellpadding=\"3\" cellspacing=\"0\" bordercolor=\"#AEAEAE\"
bgcolor=\"#FFFFFF\"><tr><TD class=table_title align=middle
width=\"10%\"><STRONG>Enable</STRONG></TD><td width=\"15%\" align=center
class=\"table_title\"><strong>Interface</strong></td><TD class=table_title align=middle
width=\"10%\"><STRONG>TriggerPort</STRONG></TD><td width=\"10%\" align=center
class=\"table_title\"><strong>TriggerPortEnd</strong></td><td width=\"15%\" align=center
class=\"table_title\"><strong>TriggerProtocol</strong></td><td width=\"10%\" align=center
class=\"table_title\"><strong>OpenPort</strong></td><td width=\"10%\" align=center
class=\"table_title\"><strong>OpenPortEnd</strong></td><td width=\"10%\" align=center
class=\"table_title\"><strong>OpenProtocol</strong></td><td width=\"10%\" align=center
class=\"table_title\"><strong>Delete</strong></td></TR></tr>"
node_index1=`/userfs/bin/tcapi get PortTrigger_Common Entrylist1`
node_index2=`/userfs/bin/tcapi get PortTrigger_Common Entrylist2`
for j in $node_index1$node_index2
do
	node_name="PortTrigger_Entry$j"
  	Enable=`/userfs/bin/tcapi get $node_name Enable`
  	Interface=`/userfs/bin/tcapi get $node_name Interface`
	TriggerPort=`/userfs/bin/tcapi get $node_name TriggerPort`
  	TriggerPortEnd=`/userfs/bin/tcapi get $node_name TriggerPortEnd`
  	TriggerProtocol=`/userfs/bin/tcapi get $node_name TriggerProtocol`
  	OpenPort=`/userfs/bin/tcapi get $node_name OpenPort`
    OpenPortEnd=`/userfs/bin/tcapi get $node_name OpenPortEnd`
    OpenProtocol=`/userfs/bin/tcapi get $node_name OpenProtocol`

	if [ "$Enable" = "no attribute information" -o "$Enable" = "no node information" -o "$Enable" = "N/A" -o "$Enable" = "" ]
	then
		Enable="N/A"
		continue
	fi
	
  	if [ "$Enable" = "1" ] 
  	then
  		Enable="Enable"
	elif [ "$Enable" = "0" ] 
	then
		Enable="Disabled"
	else  Enable="Wrong setting"
	fi
	
	if [ "$Interface" = "no attribute information" -o "$Interface" = "no node information" ]
	then
		Interface="N/A"
	fi
	
	if [ "$TriggerPort" = "no attribute information" -o "$TriggerPort" = "no node information" ]
	then
		TriggerPort="N/A"
	fi
	
	if [ "$TriggerPortEnd" = "no attribute information" -o "$TriggerPortEnd" = "no node information" ]
	then
		TriggerPortEnd="N/A"
	fi
	
	if [ "$TriggerProtocol" = "no attribute information" -o "$TriggerProtocol" = "no node information" ]
	then
		TriggerProtocol="N/A"
	fi
	
	if [ "$OpenPort" = "no attribute information" -o "$OpenPort" = "no node information" ]
    then
        OpenPort="N/A"
    fi
    
    if [ "$OpenPortEnd" = "no attribute information" -o "$OpenPortEnd" = "no node information" ]
    then
        OpenPortEnd="N/A"
    fi
    
    if [ "$OpenProtocol" = "no attribute information" -o "$OpenProtocol" = "no node information" ]
    then
        OpenProtocol="N/A"
    fi

	echo "<tr align=\"middle\"><td width=\"10%\">$Enable</td><td
	width=\"15%\">$Interface</td><td width=\"10%\">$TriggerPort</td><td
	width=\"10%\">$TriggerPortEnd</td><td
	width=\"15%\">$TriggerProtocol</td><td
	width=\"10%\">$OpenPort</td><td width=\"10%\">$OpenPortEnd</td><td width=\"10%\">$OpenProtocol</td><td width=\"10%\"><input id=\"$j\" type=\"checkbox\" name=\"rml\" onclick=\"doDel($j);\" value=\"$j\"></td></tr>"

done

echo "</table></td></tr></table></body></html>"

