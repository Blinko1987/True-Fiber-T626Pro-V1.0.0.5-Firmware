<!-- IPV4表单内容保存 -->
<%
if Request_Form("IPV4_Flag") = "1" then
	if tcwebApi_get("Lan_Entry","IP","h") <> Request_Form("ethIpAddress") then
		TCWebApi_constSet("Account_Entry0","Logged","0")
		TCWebApi_constSet("Account_Entry0","Logoff","1")
		TCWebApi_constSet("Account_Entry1","Logged","0")
		TCWebApi_constSet("Account_Entry1","Logoff","1")
		TCWebApi_constSet("Account_Entry2","Logged","0")
		TCWebApi_constSet("Account_Entry2","Logoff","1")
		TCWebApi_set("Lan_Entry","IP","ethIpAddress")
		TCWebApi_set("Dhcpd_Common","start","dhcpEthStart")
		TCWebApi_set("Dhcpd_Common","pool_count","EthendIPcount")
	end if
	TCWebApi_set("Lan_Entry","netmask","ethSubnetMask")
	TCWebApi_commit("Lan")
	TCWebApi_commit("Dhcpd_Common")
	TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LAN - Interface Setting</title>
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
<%if Request_Form("IPV4_Flag") = "1" then %>
  <script language=JavaScript type="text/javascript">
    var Tips = applyAlert({
      "content": "submit successful.",
      "buttons":{
      },
      "autoClose": 2
    });
  </script>
<% end if %>
	<SCRIPT language=JavaScript type="text/javascript">

  var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
  var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
  var vEntryName = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP4","s") %>";
  var Wan_IP4 = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
  var Wan_IPVERSION = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_NetMask4","s") %>";
  var Wan_NetMask4 = vArrayStr.split(',');
  
  vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
  Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
  Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
  Wan_NetMask4 = SortUtil.SortMyArray( Wan_NetMask4 );

	var Wan_PD6 = "<% tcWebApi_get("WanInfo_Common","Wan_PD6","s") %>";
	
    function setdhcp_st_ip_char()
    {
        var landhcp_start = "<%tcWebApi_get("Dhcpd_Common","start","s") %>";
        var lanIP = document.forms["lanSettingForm"].ethIpAddress.value;
        var pool_count = "<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>";

        var arr=new Array();
        arr=lanIP.split('.');
        var barr=new Array();
        barr=landhcp_start.split('.');
        document.forms["lanSettingForm"].dhcpEthStart.value = arr[0]+'.'+arr[1]+'.'+arr[2]+'.'+barr[3];
    }
	</script>
</head>

<body>
    <!-- form -->
    <form name="lanSettingForm" method="post" action="/cgi-bin/true-page/lan/lan-interface.asp">
        <!-- Ipv4隐藏变量 -->
        <input type="hidden" name="portDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","PortDHCPRelay","s") %>">
        <input type="hidden" name="portLan1" value="<% tcWebApi_get("Dhcpd_Common","PortLan1","s") %>">
        <input type="hidden" name="portLan2" value="<% tcWebApi_get("Dhcpd_Common","PortLan2","s") %>">
        <input type="hidden" name="portLan3" value="<% tcWebApi_get("Dhcpd_Common","PortLan3","s") %>">
        <input type="hidden" name="portLan4" value="<% tcWebApi_get("Dhcpd_Common","PortLan4","s") %>">
        <input type="hidden" name="portSSID1" value="<% tcWebApi_get("Dhcpd_Common","PortSSID1","s") %>">
        <input type="hidden" name="portSSID2" value="<% tcWebApi_get("Dhcpd_Common","PortSSID2","s") %>">
        <input type="hidden" name="portSSID3" value="<% tcWebApi_get("Dhcpd_Common","PortSSID3","s") %>">
        <input type="hidden" name="portSSID4" value="<% tcWebApi_get("Dhcpd_Common","PortSSID4","s") %>">
        <input type="hidden" name="DeviceDHCPRelayFlag" value="<% tcWebApi_get("Dhcpd_Common","DeviceDHCPRelay","s") %>">
        <input type="hidden" name="IPV4_Flag" value="0">
        <input type="hidden" name="DeviceendIPcount" value="80">
        
        <input type="hidden" name="dhcpEthStart" value="<%if tcWebApi_get("Dhcpd_Common","start","h" ) <> "N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if %>">
        <input type="hidden" name="EthendIPcount" value="<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>">

        <!-- content -->
        <div class="col-md-12 col-sm-12">
            <div class="container-full container-resize-height">
                <div class="title-text">LAN Interface Setting</div>
                <div class="title-description-text">This page is used to configure the LAN interface of your Device. Here you may change the setting for IP addresses, subnet mask, etc..</div>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">Interface Name:</div>
                    </div>
                    <div class="col-6">
                        <div class="title-text-right">br0</div>
                    </div>
                </div>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">IP Address:</div>
                    </div>
                    <div class="col-6">
                        <input class="form-control input-textfield" type="text" name="ethIpAddress"
                            value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>">
                    </div>
                </div>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">Subnet Mask:</div>
                    </div>
                    <div class="col-6">
                        <input class="form-control input-textfield" type="text" name="ethSubnetMask"
                            value="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>">
                    </div>
                </div>
                <div class="mt-2 center">
                    <button class="btn-dashboard" type="button" onClick="javascript: return onSubmit();">Apply</button>
                </div>
            </div>
        </div>
        <!-- content -->
    </form>

    <script>
        // IPv4表单提交触发方法
        function btnSaveIPv4() 
        {
            if (CheckForm() == true) 
            {
                var vForm = document.forms["lanSettingForm"];

                vForm.IPV4_Flag.value = "1";
                return true;
            }

            return false;
        }
        function CheckForm()
        {
            with(document.forms["lanSettingForm"]) 
            {
                if(!checkIpAddress(ethIpAddress,false))
                {
                    return false
                }
                if(!checkIpAddress(ethSubnetMask,true)){
                    return false
                }
                for(var i = 0; i < nEntryNum; i++)
                {
                  if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)|| 'IPv6' == Wan_IPVERSION[i] )
                    continue;
                  if (!isEqualSegment(ethIpAddress.value,Wan_IP4[i],Wan_NetMask4[i]))
                  {
                    alert("LAN IP and Wan IP should be at the different network segment!");
                    return false;
                  }
                }

                oldAddrPrimary = ethIpAddress.value;
                oldMaskPrimary = ethSubnetMask.value;
                console.log('ethIpAddress&&ethSubnetMask is vaild')
            }

            return true;
        }

        function ipConfiltWanIP(lanip) 
        {
            var pvc_counts = parseInt('<% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>');

            //get all value
            // num 8
            var vArrayStr = '<% tcWebApi_get("WanInfo_Common","Wan_IP4","s") %>';
            var Wan_IP4 = vArrayStr.split(',');

            for (i = 0; i < pvc_counts; i++) 
            {
                var lanips = lanip.split('.');
                var wanips = Wan_IP4[i].split('.');

                lansec = parseInt(lanips[0]);
                wansec = parseInt(wanips[0]);

                if (lansec == wansec) 
                {
                    lansec = parseInt(lanips[1]);
                    wansec = parseInt(wanips[1]);
                    if (lansec == wansec) {
                        lansec = parseInt(lanips[2]);
                        wansec = parseInt(wanips[2]);
                        if (lansec == wansec) 
                        {
                            return true;
                        }
                    }
                }
            
            }
            return false;

        }

        // lan-interface表单提交
        function onSubmit() 
        {
            var ipv4Flag = btnSaveIPv4();

            setdhcp_st_ip_char();
            
            if (ipv4Flag) 
            {
                document.lanSettingForm.submit();
                //showLoading();
                return true;
            }

            return false;
        }

    </script>
</body>

</html>
