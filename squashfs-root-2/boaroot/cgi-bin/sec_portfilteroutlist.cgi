#!/bin/sh

echo "Content-Type: text/html"
echo ""

echo "<html><head><meta http-equiv=Content-Script-Type content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html; charset=gb2312\"><link rel=\"stylesheet\"
href=\"/JS/stylemain_skyw.css?v=2\" type=\"text/css\"></head><SCRIPT language=javascript src="/JS/util_skyw.js"></SCRIPT><script language=\"JavaScript\">
function formatstr(sourcestr, searchstr)
{
	var restr;
	var offset = sourcestr.indexOf(searchstr);
	if(offset == -1)
		return null;
	var lenstr = searchstr.toString();	
	restr = sourcestr.substring(0, offset) + sourcestr.substring((offset+parseInt(lenstr.length)+1), sourcestr.length);
	return restr;
}
function doDel(i)
{
	var f = parent.document.ConfigForm;
	var tempstr;
	var rmlout = document.getElementsByName('rmlout');
	if (rmlout == null)
		return;
	if(rmlout.length>0)
	{
		for(var n=0;n<(rmlout.length);n++)
		{
			if(rmlout[n].value == i){
				if(rmlout[n].checked)
				{
					tempstr = i + \",\";
					f.delnum.value = f.delnum.value + tempstr;
					
				}
				else
				{
					f.delnum.value = formatstr(f.delnum.value,i);
				}
				break;
			}
		}
	}
}
function stPortFilterOut(domain,Activate,Interface,IPName,Protocol,SrcIPAddr,SrcIPMask,SrcPort,DesIPAddr,DesIPMask,DesPort)
{
this.domain = domain;
this.Activate = Activate;
this.Interface = Interface;
this.IPName = IPName;
this.Protocol = Protocol;
this.SrcIPAddr = SrcIPAddr;
this.SrcIPMask = SrcIPMask;
this.SrcPort = SrcPort;
this.DesIPAddr = DesIPAddr;
this.DesIPMask = DesIPMask;
this.DesPort = DesPort;
}
function stPortFilterOut2(domain,Activate,Interface,IPName,Protocol,SrcIPAddr,SrcIPEndAddr,SrcIPMask,SrcPort,SrcPortEnd,DesIPAddr,DesIPEndAddr,DesIPMask,DesPort,DesPortEnd)
{
this.domain = domain;
this.Activate = Activate;
this.Interface = Interface;
this.IPName = IPName;
this.Protocol = Protocol;
this.SrcIPAddr = SrcIPAddr;
this.SrcIPEndAddr = SrcIPEndAddr;
this.SrcIPMask = SrcIPMask;
this.SrcPort = SrcPort;
this.SrcPortEnd = SrcPortEnd;
this.DesIPAddr = DesIPAddr;
this.DesIPEndAddr = DesIPEndAddr;
this.DesIPMask = DesIPMask;
this.DesPort = DesPort;
this.DesPortEnd = DesPortEnd;
}
</script><body topmargin=\"10\" leftmargin=\"0\"><table width=\"450\" align=center cellpadding=\"0\" cellspacing=\"0\">"

echo "<tr><td><table width=\"450\" border=\"1\" align=center cellpadding=\"3\" cellspacing=\"0\" bordercolor=\"#CCCCCC\"
bgcolor=\"#FFFFFF\"><tr><TD class=table_title align=middle width=\"18%\"><STRONG>Filter Name</STRONG></TD><td width=\"10%\" align=center
class=\"table_title\"><strong>Protocol</strong></td><TD class=table_title align=middle
width=\"14%\"><STRONG>Source Address</STRONG></TD><td width=\"12%\" align=center
class=\"table_title\"><strong>Source Port</strong></td><td width=\"12%\" align=center
class=\"table_title\"><strong>Destination Address</strong></td><td width=\"12%\" align=center
class=\"table_title\"><strong>Destination Port</strong></td><td width=\"12%\" align=center
class=\"table_title\"><strong>Enable</strong></td><td width=\"10%\" align=center
class=\"table_title\"><strong>Delete</strong></td></TR></tr>"

i=0
Activate="N/A"
Interface="N/A"
IPName="N/A"
Protocol="N/A"
SrcIPAddr="N/A"
SrcIPMask="N/A"
SrcPort="N/A"
DesIPAddr="N/A"
DesIPMask="N/A"
DesPort="N/A"
SrcIPEndAddr="N/A"
DesIPEndAddr="N/A"
SrcPortEnd="N/A"
DesPortEnd="N/A"
#isCMCCSupported=`/userfs/bin/tcapi get WebCustom_Entry isCMCCSupported`
isCMCCSupported="Yes"
cat /tmp/ipupvalid | while read LINE
do
	k=`expr $i % 11`
	if [ "$isCMCCSupported" = "Yes" ] 
	then
		k=`expr $i % 15`	
	fi	
	if [ $k = 0 ]
	then
		iEntry=$LINE
	elif [ $k = 1 ]
	then
		Activate=$LINE
		if [ "$Activate" = "Yes" ] 
  		then
  			Activate="Enable"
		elif [ "$Activate" = "No" ] 
		then
			Activate="Disabled"
		else  Activate="Wrong setting"
		fi
	elif [ $k = 3 ]
	then
		IPName=$LINE
	elif [ $k = 4 ]
	then
		Protocol=$LINE
	elif [ $k = 5 ]
	then
		SrcIPAddr=$LINE
	elif [ $k = 6 ]
	then
		SrcIPMask=$LINE
	elif [ $k = 7 ]
	then
		SrcPort=$LINE
	elif [ $k = 8 ]
	then
		DesIPAddr=$LINE
	elif [ $k = 9 ]
	then
		DesIPMask=$LINE
	elif [ $k = 10 ]
	then
		DesPort=$LINE
		if [ "$isCMCCSupported" = "Yes" ] 
		then
			echo ""
		else
		echo "<script language=\"javascript\">
		if(parent.portFilterOutIndex != null)
		{
			parent.portFilterOut[parent.portFilterOutIndex] = new stPortFilterOut(\"domain\", \"$Activate\", \"$Interface\", \"$IPName\", \"$Protocol\", \"$SrcIPAddr\", \"$SrcIPMask\", \"$SrcPort\", \"$DesIPAddr\", \"$DesIPMask\", \"$DesPort\");
			parent.portFilterOutIndex++;
		}
		</script>
		<tr align=\"middle\"><td width=\"18%\">$IPName</td><td width=\"10%\">$Protocol</td><td width=\"14%\">$SrcIPAddr "/" $SrcIPMask</td><td
		width=\"12%\">$SrcPort</td><td width=\"12%\">$DesIPAddr "/" $DesIPMask</td><td width=\"12%\">$DesPort</td><td
		width=\"12%\">$Activate</td><td width=\"10%\"><input type=\"checkbox\" name=\"rmlout\" onclick=\"doDel($iEntry);\" value=\"$iEntry\"></td></tr>"
	fi
	elif [ $k = 11 ]
	then
		SrcIPEndAddr=$LINE
	elif [ $k = 12 ]
	then
		DesIPEndAddr=$LINE
	elif [ $k = 13 ]
	then
		SrcPortEnd=$LINE
	elif [ $k = 14 ]
	then
		DesPortEnd=$LINE
			echo "<script language=\"javascript\">
			if(parent.portFilterOutIndex != null)
			{
				parent.portFilterOut[parent.portFilterOutIndex] = new stPortFilterOut2(\"domain\", \"$Activate\", \"$Interface\", \"$IPName\", \"$Protocol\", \"$SrcIPAddr\", \"$SrcIPEndAddr\", \"$SrcIPMask\", \"$SrcPort\", \"$SrcPortEnd\", \"$DesIPAddr\", \"$DesIPEndAddr\", \"$DesIPMask\", \"$DesPort\", \"$DesPortEnd\");
				parent.portFilterOutIndex++;
			}
			</script>
			<tr align=\"middle\"><td width=\"18%\">$IPName</td><td width=\"10%\">$Protocol</td><td width=\"14%\">$SrcIPAddr "-" $SrcIPEndAddr</td><td
			width=\"12%\">$SrcPort ":" $SrcPortEnd</td><td width=\"12%\">$DesIPAddr "-" $DesIPEndAddr</td><td width=\"12%\">$DesPort ":" $DesPortEnd</td><td
			width=\"12%\">$Activate</td><td width=\"10%\"><input type=\"checkbox\" name=\"rmlout\" onclick=\"doDel($iEntry);\" value=\"$iEntry\"></td></tr>"		
	fi
	i=`expr $i + 1`

done
rm -f /tmp/ipupvalid
echo "</table></td></tr></table></body></html>"

