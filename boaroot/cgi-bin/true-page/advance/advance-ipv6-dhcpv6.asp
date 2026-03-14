<%
if Request_Form("Dhcp1_Flag") = "1" then
    TCWebApi_set("Dhcp6s_Entry","Enable","EnDHCPServerFlag")
    if Request_Form("EnDHCPServerFlag") = "1" then
        TCWebApi_set("Dhcp6s_Entry","Mode","DHCPSetTypeFlag")
        if Request_Form("DHCPSetTypeFlag") = "1" then
            TCWebApi_set("Dhcp6s_Entry","AddrFormat","AddrFormat")
            TCWebApi_set("Dhcp6s_Entry","PrefixIPv6","dhcpPrefix")
            TCWebApi_set("Dhcp6s_Entry","Prefixv6Len","PrefixLen")
            TCWebApi_set("Dhcp6s_Entry","PreferredLifetime","t1")
            TCWebApi_set("Dhcp6s_Entry","ValidLifetime","t2")
            TCWebApi_set("Dhcp6s_Entry","MinAddress","MinAddress")
            TCWebApi_set("Dhcp6s_Entry","MaxAddress","MaxAddress")
            TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne")
            TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo")
            TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
        else
            if Request_Form("dnssource") = "999" then
                TCWebApi_constSet("Dhcp6s_Entry","DNSType","2")
            elseif Request_Form("dnssource") = "998" then
                TCWebApi_constSet("Dhcp6s_Entry","DNSType","1")
                TCWebApi_set("Dhcp6s_Entry","DNSserver","DnsSrvOne")
                TCWebApi_set("Dhcp6s_Entry","SecDNSserver","DnsSrvTwo")
            else
                TCWebApi_constSet("Dhcp6s_Entry","DNSType","0")
                TCWebApi_set("Dhcp6s_Entry","DNSWANConnection","dnssource")
            end if
        end if
    end if

    TCWebApi_commit("Dhcp6s_Entry")
    TCWebApi_save("Dhcp6s_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 DHCPv6 Setting</title>
    <!-- style -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- style -->
    
    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
    <!-- script -->
    
    <!-- self sript -->
    <script src="/scripts/utils/util_skyw.js"></script>
<%if Request_Form("SaveAlter_Flag") = "1" then %>
  <script language=JavaScript type="text/javascript">
    var Tips = applyAlert({
      "content": "submit successful.",
      "buttons":{
      },
      "autoClose": 2
    });
  </script>
<% end if %>
    
</head>

<body>
<!-- content -->
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-ipv6-dhcpv6.asp">
    <input type="hidden" name="Dhcp1_Flag" value="0">
    <input type="hidden" name="EnDHCPServerFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>">
    <input type="hidden" name="DHCPSetTypeFlag" value="<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
    <div class="container-full container-resize-height">
        <div class="title-text">DHCPv6 Setting</div>
        <div class="title-description-text">This page is used to configure DHCPv6 Server and DHCPv6 Relay.</div>
        <div class="row p-1">
            <div class="col-4">
                <div class="title-text-left">DHCPv6 Mode:</div>
            </div>
            <div class="col-8">
                <input id="dhcp6SrvType1" type="radio" value="0" name="dhcp6SrvType" onclick="dhcpv6Mode(this.value)">
                <label class="input-radio">None</label>
             
                <input id="dhcp6SrvType2" type="radio" value="1" name="dhcp6SrvType" onclick="dhcpv6Mode(this.value)">
                <label class="input-radio">DHCP Server(Manual)</label>
                
                <input id="dhcp6SrvType3" type="radio" value="2" name="dhcp6SrvType" onclick="dhcpv6Mode(this.value)">
                <label class="input-radio">DHCP Server(Auto)</label>
                
                <input id="dhcp6SrvType4" type="radio" value="3" name="dhcp6SrvType" onclick="dhcpv6Mode(this.value)">
                <label class="input-radio">DHCP Server(Auto Prefix)</label>
            </div>
        </div>
        <hr>
        
        <!--Manual-->
        <div class="row p-1 manual-mode" id="addressformat">
            <div class="col-6">
                <div class="title-text-left">Address Format:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <select class="form-control input-select" id="AddrFormat" name="AddrFormat" onchange="onAddrFormatChange(this)">
                            <option value="AddrPool" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "AddrPool" then asp_Write("selected") end if%>>Address Pool</option>
                            <option value="EUI64" <%if tcWebApi_get("Dhcp6s_Entry","AddrFormat","h") = "EUI64" then asp_Write("selected") end if%>>EUI64</option>
                        </select>
                    </div>
                   
                </div>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="namePrefix">
            <div class="col-6">
                <div class="title-text-left">Prefix:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="dhcpPrefix"
                            maxLength="39" onchange="this.value = this.value.toLowerCase()"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","PrefixIPv6", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") end if%>">
                    </div>
                    <div class="col-5 pl-0 title-text-right">
                        <strong style="color: #ff0033">*</strong>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="namePrefixLen">
            <div class="col-6">
                <div class="title-text-left">Prefix Length:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="PrefixLen" maxLength="2"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Prefixv6Len", "s") end if%>">
                    </div>
                    <div class="col-5 pl-0 title-text-right">
                        <strong style="color: #ff0033">*</strong>
                        <label>[16 - 64]</label>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="preferredtime">
            <div class="col-6">
                <div class="title-text-left">Preferred Lifetime:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="t1" maxLength="10"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime", "s") end if%>">
                    </div>
                    <div class="col-5 pl-0 title-text-right">
                        <strong style="color: #ff0033">*</strong>
                        <label>[60 - 4294967295 S]</label>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="validtime">
            <div class="col-6">
                <div class="title-text-left">Valid Lifetime:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="t2" maxLength="10"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime", "s") end if%>">
                    </div>
                    <div class="col-5 pl-0 title-text-right">
                        <strong style="color: #ff0033">*</strong>
                        <label>[60 - 4294967295 S]</label>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Auto config domain -->
        <div class="row p-1 manual-mode" id="domainnameserver">
            <div class="col-6">
                <div class="title-text-left">Domain Name Server:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <select class="form-control input-select" id="dnssource" name="dnssource" onChange="dnsSourceListChg()"></select>
                        </select>
                    </div>
                   
                </div>
            </div>
        </div>

        <!-- startAddress -->
        <div class="row p-1 manual-mode" id="startAddressDIV">
            <div class="col-6">
                <div class="title-text-left">Start Address:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <INPUT class="form-control input-textfield" type="text" maxLength=39 
                    		onchange="this.value = this.value.toLowerCase()" name="MinAddress" 
                    		value="<%if tcWebApi_get("Dhcp6s_Entry","MinAddress", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","MinAddress","s") end if%>">
                    </div>
                </div>
            </div>
        </div>


        <!-- endAddress -->
        <div class="row p-1 manual-mode" id="endAddressDIV">
            <div class="col-6">
                <div class="title-text-left">End Address:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                    	<INPUT class="form-control input-textfield" type="text" maxLength=39 
                    		onchange="this.value = this.value.toLowerCase()" name="MaxAddress" 
                    		value="<%if tcWebApi_get("Dhcp6s_Entry","MaxAddress", "h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","MaxAddress","s") end if%>">
                    </div>
                </div>
            </div>
        </div>


        
        
        <!-- dns server -->
        <div class="row p-1 manual-mode" id="PrimaryDNS">
            <div class="col-6">
                <div class="title-text-left">Primary DNS Server:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="DnsSrvOne" maxLength="39"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
                    </div>
                    <div class="col-5 pl-0 title-text-right">
                        <strong style="color: #ff0033">*</strong>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="SecondaryDNS">
            <div class="col-6">
                <div class="title-text-left">Secondary DNS Server:</div>
            </div>
            <div class="col-6">
                <div class="row">
                    <div class="col-7 pr-0">
                        <input class="form-control input-textfield" type="text" name="DnsSrvTwo" maxLength="39"
                            value="<%if tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
                    </div>
                    
                </div>
            </div>
        </div>
        
        <div class="mt-3 mb-3 center">
            <button type="button" onclick="OnSubmit()" class="btn-dashboard">Apply Changes</button>
        </div>
    </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
    var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
    // num 0
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(','); 
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
    var vEntryIndex = vArrayStr.split(',');
    //<% tcWebApi_constSet("WanInfo_Common", "CycleJump", "5") %>
    // num 6
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
    var vIPVersion = vArrayStr.split(',');

    var vArrayStr = '<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>';
    var vEntryValue = vArrayStr.split(','); 

    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_ipv6rd","s") %>";
    var vIPv6rdEnable = vArrayStr.split(',');

    function initDnsSourceList()
    {
        var DnsSourceIdx = '<% tcWebApi_get("Dhcp6s_Entry","DNSWANConnection","s") %>';
        var DnsType = '<% tcWebApi_get("Dhcp6s_Entry","DNSType","s") %>';
        var EnDHCPServerFlagBuf = "<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>";
        var i = 0;
        var isSel = -1;
        var itemCnt = 0;
    
        with (getElById('dnssource'))
        {
            for( i=0; i< parseInt(nEntryNum) + 2; i++)
            {
                var opt;
    
                if ( 0 == i )
                    opt = new Option('HGWProxy', '999');
                else if ( 1 == i )
                    opt = new Option('Static', '998');
                else
                {
                    var WAN_Entry = i - 2;
                    var CONName = vEntryName[WAN_Entry];
                    var CONValue = vEntryValue[WAN_Entry];
                    if (( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
                        || 'IPv4' == vIPVersion[WAN_Entry] ) && ('Yes' != vIPv6rdEnable[WAN_Entry]))
                        continue;
    
                    opt = new Option(CONValue, vEntryIndex[WAN_Entry]);
                }
                
                if ( 0 == i && '2' == DnsType )
                {
                    opt.selected = true;
                    isSel = 0;
                }
                else if ( 1 == i && '1' == DnsType )
                {
                    opt.selected = true;
                    isSel = 1;
                }
                else if ( i > 1 &&  '0' == DnsType && DnsSourceIdx == vEntryIndex[i - 2] )
                {
                    opt.selected = true;
                    isSel = itemCnt;
                }
                
                itemCnt ++;
                options.add ( opt );
            }
            
            if ( isSel >= 0 )
                options[isSel].setAttribute('selected', 'true');
        }
        if(EnDHCPServerFlagBuf == "1")//刷新页面后，如果option为Static，此时先执行LoadFrame，Static的Option还未创建，所以在此又进行了一次判断
        {
          dnsSourceListChg();
        }
    }

    function dnsSourceListChg()
    {
        var dnsSourceType = getSelectVal('dnssource');
        //alert(dnsSourceType);
        if ( "998" == dnsSourceType)
        {
            $("#PrimaryDNS").show();
            $("#SecondaryDNS").show();
        }
        else
        {
            $("#PrimaryDNS").hide();
            $("#SecondaryDNS").hide();
        }
    }
    
    function dhcpv6Mode()
    {
      with(document.forms[0])
      {
        EnDHCPServerFlag.value = "1";
        //alert(dhcp6SrvType.value);
        if ("0" == dhcp6SrvType.value) {
          $("#addressformat").hide();
          $("#namePrefix").hide();
          $("#namePrefixLen").hide();
          $("#preferredtime").hide();
          $("#validtime").hide();
          $("#domainnameserver").hide();
          $("#PrimaryDNS").hide();
          $("#SecondaryDNS").hide();
		  $("#startAddressDIV").hide();
		  $("#endAddressDIV").hide();

          EnDHCPServerFlag.value = "0";
        }

        if ("1" == dhcp6SrvType.value) {
          $("#addressformat").show();
          $("#namePrefix").show();
          $("#namePrefixLen").show();
          $("#preferredtime").show();
          $("#validtime").show();
          $("#domainnameserver").hide();
          $("#PrimaryDNS").show();
          $("#SecondaryDNS").show();

		  if(AddrFormat.value == "AddrPool")
	  	{
	  		$("#startAddressDIV").show();
			$("#endAddressDIV").show();
	  	}
	  	else
	  	{
	  		$("#startAddressDIV").hide();
			$("#endAddressDIV").hide();
	  	}

          DHCPSetTypeFlag.value = "1";
        }
        else if("2" == dhcp6SrvType.value || "3" == dhcp6SrvType.value) {

          if("2" == dhcp6SrvType.value)
            DHCPSetTypeFlag.value = "0";
          else if("3" == dhcp6SrvType.value)
            DHCPSetTypeFlag.value = "2";
          $("#addressformat").hide();
          $("#namePrefix").hide();
          $("#namePrefixLen").hide();
          $("#preferredtime").hide();
          $("#validtime").hide();
          $("#domainnameserver").show();
          
          var Dhcp6sMode = "<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>";
          var Dns6sType = "<% tcWebApi_get("Dhcp6s_Entry","DNSType","s") %>";
          if(Dns6sType == "1")
          {
            $("#PrimaryDNS").show();
            $("#SecondaryDNS").show();
          }
          else
          {
            $("#PrimaryDNS").hide();
            $("#SecondaryDNS").hide();
          }
          $("#startAddressDIV").hide();
          $("#endAddressDIV").hide();
        }

        if ("0" != dhcp6SrvType.value && "1" != dhcp6SrvType.value) {
          dnsSourceListChg();
        }
      }
    }

    function LoadFrame() {
        var Dhcp6sEnable = "<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %>";
        var Dhcp6sMode = "<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %>";
        
        if(Dhcp6sEnable == "0"){
            $("input[name=dhcp6SrvType]:eq(0)").prop("checked",'checked');
        }
        
        if(Dhcp6sEnable != "0"){
            if(Dhcp6sMode == "1"){
                $("input[name=dhcp6SrvType]:eq(1)").prop("checked",'checked');
            }else if(Dhcp6sMode == "0"){
                $("input[name=dhcp6SrvType]:eq(2)").prop("checked",'checked');
            }else if(Dhcp6sMode == "2"){
                $("input[name=dhcp6SrvType]:eq(3)").prop("checked",'checked');
            }
        }
        dhcpv6Mode();
    }
    
    function CheckTime(Time1,Time2)
    {
        var TemTime1 = Time1;
        var TemTime2 = Time2;
        if ( TemTime1.length > 10 || '' == TemTime1 )
        {
            return 1;
        }
        if ( TemTime2.length > 10 || '' == TemTime2 )
        {
            return 2;
        }
        if ( true != isPlusInteger(TemTime1))
        {
            return 1;
        }
        if ( true != isPlusInteger(TemTime2))
        {
            return 2;
        }
        TemTime1 = parseInt(Time1);
        TemTime2 = parseInt(Time2);
        if ( TemTime1 > 4294967295 || TemTime1 < 60 )
        {
            return 1;
        }
        if ( TemTime2 > 4294967295 || TemTime2 < 60 )
        {
            return 2;
        }
        if ( TemTime2 <= TemTime1 )
        {
            return 3;
        }
        return true;
    }
    
    function CheckPrefix(Prefix,type)
    {
        var IpAddress1 = Prefix.split(':');
        var IpAddress3 = Prefix;
        if ( 1 == type && '' == IpAddress3)
        {
            return true;
        }
        if ( true != isUnicastIpv6Address(IpAddress3) )
        {
            return false;
        }
        switch (type)
        {
            case 0 :
                if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
                {
                    switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
                    {
                        case 15 :
                            return false;
                        case 14 :
                        if ( 8 <= parseInt(IpAddress1[0].substring(2, 3),16) && 12 > parseInt(IpAddress1[0].substring(2, 3),16) )
                        {
                            return false;
                        }
                            break;
                        default:
                            break;
                    }
                }
                break;
            case 1 :
                if ( 15 == parseInt(IpAddress1[0].substring(0, 1),16) )
                {
                    switch ( parseInt(IpAddress1[0].substring(1, 2),16) )
                    {
                        case 15 :
                            return false;
                        default:
                            break;
                    }
                }
                break;
            default:
                return false;
        }
        return true;
    }
    
    function CheckLength(Length)
    {
        var TemLen = parseInt(Length);
        if ( true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
        {
            return false;
        }
        return true;
    }

	function special_char_check(val)
	 {
	    var specialchar = new Array("`", "<", ">", "++", "--");
	    var len = specialchar.length;
	    var i = 0;
	    var ret = false;
	    
	    for( i = 0; i < len; i++ )
	    {
	      if (val.indexOf(specialchar[i]) >= 0)
	      {
	        break;
	      }
	    }
	    
	    if ( i < len )
	        ret = true;
	  
	    return ret;
	}

	function ipv6PoolAddrCheck(ipv6PoolAddr){
        var characters = "::";
        var Addr = ipv6PoolAddr;
        var target = ":";
        var index = Addr.indexOf(characters); 
        var num = 0;
        while(index != -1) {
            Addr = Addr.replace(characters, target);
            index = Addr.indexOf(characters);
            num++;
        }
        if(num > 1){
          return false;
        }
        return true;
   }

	function isNullString(checkText){
	      if(checkText == null || checkText == "" || checkText.length == 0)
	          return true;
	      else
	          return false;
   }

	function splitIPv6AddressToArray(addr)
   {
	    var parts = new Array(8);
	    if (-1 == addr.indexOf('::'))
	    {
	      parts = addr.split(':');
	      for (var i=0; i<8; i++)
	      {
	        if (isNullString(parts[i]))
	          parts[i] = '0';
	      }
	    } 
	    else
	    {
	      var twopart = addr.split('::');
	      var parts1 = twopart[0].split(':'), parts2 = twopart[1].split(':');
	      for (var i=0; i<parts1.length; i++)
	      {
	        parts[i] = parts1[i];
	      }
	      var startIndex = 8-parts2.length
	      for(var m=0; m<(8-parts1.length-parts2.length); m++)
	      {
	        parts[m+parts1.lengt] = '0';
	      }
	      for (var j=startIndex; j<8; j++)
	      {
	        parts[i] = parts2[j-startIndex];
	      }
	    }
	    return parts;
   }

	function isValidIPv6AddressRange(minAddr, maxAddr)
	{
	    var minAddrParts = splitIPv6AddressToArray(minAddr), maxAddrParts = splitIPv6AddressToArray(maxAddr);
	    for(var i=0; i < 8; i++)
	    {
	      var minPart = parseInt(minAddrParts[i], 16), maxPart = parseInt(maxAddrParts[i], 16);
	      if (minPart > maxPart)
	        return false;
	    }
	    return true;
	}

	function hex_to_bin(str_16_based) {
	    var str_2_based="";
	    var str_array = str_16_based.split(":");
	    for(var index = 0; index < str_array.length; index++,value=""){
	      var value = parseInt(str_array[index],16).toString(2).padStart(16,'0');
	      str_2_based = str_2_based.concat(value);
	    }
	    //console.log("str_2_based: " + str_2_based);
	    return str_2_based;
   }

	function CompareAddrPoolRange(Prefix,ipv6PoolStartAddr,ipv6PoolEndAddr,PrefixLen){
	    var prefix_fomart = convert2CompleteIpV6(Prefix);
	    var prefix_fomart_to_bin = hex_to_bin(prefix_fomart).substring(0,PrefixLen);
	    
	    var prefix_ipv6_start = convert2CompleteIpV6(ipv6PoolStartAddr);
	    var prefix_ipv6_start_to_bin = hex_to_bin(prefix_ipv6_start).substring(0,PrefixLen);
	    
	    var prefix_ipv6_end = convert2CompleteIpV6(ipv6PoolEndAddr);
	    var prefix_ipv6_end_to_bin = hex_to_bin(prefix_ipv6_end).substring(0,PrefixLen);
	    
	    if(prefix_ipv6_start.length != 39 || prefix_ipv6_end.length != 39 )//3001:1111:0000:0000:0000:0000:0000:1111(39-bit)
	    {
	      console.log("IPv6 address format is wrong.");
	      return false;
	    }
	    if(prefix_fomart_to_bin != prefix_ipv6_start_to_bin || prefix_fomart_to_bin != prefix_ipv6_end_to_bin){
	      console.log("IPv6 address format is different with start/end address.");
	      return false;
	    }
	    return true;
   }

	function convert2CompleteIpV6(ip){
	    var ipV6 = ip;
	    var ipv6Address;
	    var index = ip.indexOf("::");
	    if(index > 0){
	      var size = 8-(ipV6.split(":").length-1);
	      var tmp = "";
	      for(var i = 0; i < size; i++){
	        tmp += ":0000";
	      }
	      tmp += ":";
	      ipV6 = ip.replace("::",tmp);
	    }
	    else if(index == 0){
	      if(ip == "::"){
	        ipV6 = "0000:0000:0000:0000:0000:0000:0000:0000";
	      }
	      else{
	        ipV6 = ip.replace("::","0000:0000:0000:0000:0000:0000:0000:");
	      }
	    }
	    ipv6Address = ipv6AddrFormart(ipV6);
	    return ipv6Address;
   }

	function ipv6AddrFormart(ipV6)
	{
	    var ipv6Address = null;
	    var parts = ipV6.split(":");
	    for(var i = 0; i < parts.length; i++){
	      if(parts[i].length < 4){
	        parts[i] = parts[i].padStart(4,'0');
	      }
	      if(i == 0){
	        ipv6Address = parts[i];
	      }else{
	        ipv6Address += ":" + parts[i];
	      }
	    }
	    return ipv6Address;
	}
    
  function DhcpCheckForm(type)
  {
      with (document.forms[0])
      {
        if ("1" != dhcp6SrvType.value)
        {
          if (("2" == dhcp6SrvType.value) || ("3" == dhcp6SrvType.value))
          {
            var dnsSourceType = getSelectVal('dnssource');
            
            if ( '998' == dnsSourceType )
            {
              if ("" == DnsSrvOne.value || true != CheckPrefix(DnsSrvOne.value,1))
              {
                alert('Primary DNS server : "' + DnsSrvOne.value + '" is not valid IPv6 address.');
                return false;
              }
              
              if ("" != DnsSrvTwo.value && true != CheckPrefix(DnsSrvTwo.value,1))
              {
                alert('Secondary DNS server : "' + DnsSrvTwo.value + '" is not valid IPv6 address.');
                return false;
              }
            }
          }
          return true;
        }
        if (true != CheckPrefix(dhcpPrefix.value,0))
        {
          alert('Prefix : "' + dhcpPrefix.value +'" is not valid IPv6 address.');
          return false;
        }
        
        if (true != CheckLength(PrefixLen.value))
        {
          alert("Prefix length:\"" + PrefixLen.value + "\"is invalid.");
          return false;
        }
        
        switch (CheckTime(t1.value,t2.value))
        {
          case 1 :
          {
            alert('T1 : "' + t1.value + '" is invalid.');
            return false;
          }
          case 2 :
          {
            alert('T2 : "' + t2.value + '" is invalid.');
            return false;
          }
          case 3 :
          {
            alert('T2 : ' + t2.value + 'less than ' + 'T1 : ' + t1.value);
            return false;
          }
        }
        
        if ("" == DnsSrvOne.value || true != CheckPrefix(DnsSrvOne.value,1))
        {
          alert('Primary DNS server : "' + DnsSrvOne.value + '" is not valid IPv6 address.');
          return false;
        }
        
        if ("" != DnsSrvTwo.value && true != CheckPrefix(DnsSrvTwo.value,1))
        {
          alert('Secondary DNS server : "' + DnsSrvTwo.value + '" is not valid IPv6 address.');
          return false;
        }

		if(true == special_char_check(MinAddress.value)){
		  alert('Start Address : "' + MinAddress.value + '" is not valid IPv6 address.');
	      return false;
	    }

		if(true == special_char_check(MaxAddress.value)){
		  alert('End Address : "' + MaxAddress.value + '" is not valid IPv6 address.');
	      return false;
	    }
		
	    if ("" != MinAddress.value || "" != MaxAddress.value){
	      if ( ("" == MinAddress.value && "" != MaxAddress.value)
	          || ("" == MinAddress.value && "" != MaxAddress.value)
	          || true != ipv6PoolAddrCheck(MinAddress.value)
	          || true != ipv6PoolAddrCheck(MaxAddress.value)
	          || true != isValidIPv6AddressRange(MinAddress.value,MaxAddress.value) 
	          || true != CompareAddrPoolRange(dhcpPrefix.value,MinAddress.value,MaxAddress.value,PrefixLen.value))
	      {
	        alert("Invalid start address and end address range.");
	        return false;
	      }
	    }
      }
      return true;
    }

    function onAddrFormatChange(addFormat)
	{
		if(addFormat.value == "AddrPool"){
			setDisplay('startAddressDIV',1);
			setDisplay('endAddressDIV',1);
		}else{
			setDisplay('startAddressDIV',0);
			setDisplay('endAddressDIV',0);
		}
	}
    
    function OnSubmit()
    {
        if (DhcpCheckForm() == true){
            with(document.forms[0])
            {
                Dhcp1_Flag.value = "1";
                document.ConfigForm.SaveAlter_Flag.value = "1";
                document.ConfigForm.submit();
                //showLoading();
            }
        }
    }
    
    $(document).ready(function(){
        LoadFrame();
        initDnsSourceList();
    });
</script>
</body>

</html>