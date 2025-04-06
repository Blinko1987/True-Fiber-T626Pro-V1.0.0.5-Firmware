<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Status - LAN</title>
    <!-- style -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- style -->

    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
    <!-- script -->
    <SCRIPT language=JavaScript type=text/javascript>
    var Info_Ether = "<% tcwebApi_get("Info_Ether","ALL","s") %>"; 
    var Info_Ether_Array = Info_Ether.split('|');
    //PortStatus : Info_Ether_Array[0]
    //PortMac PortIP PortDHCP PortExpire PortMac2 : 1-5
    //status : Info_Ether_Array[6]
    //inOctets inUnicastPkts inMulticastPkts : 7-9
    //outOctets outUnicastPkts outMulticastPkts outErrors :10-13
    //txCollisionCnt txUnderRunCnt rxCrcErr :14-16
    //rxFrames txFrames :17-18
    //ip mac 19-20
    //isIPv6Supported isVirServerSupported 21-22
    var PortConnStatus = Info_Ether_Array[0].split(':');
    var aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortIP","s") %>";
    var PortIp = aryInfoTemp.split(',');
    var dhcpnum = PortIp.length - 1;
    aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortMac","s") %>";
    aryInfoTemp += "<% tcWebApi_get("Info_Ether","PortMac2","s") %>";
    var PortMac = aryInfoTemp.split(',');
    aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortDHCP","s") %>";
    var PortDhcp = aryInfoTemp.split(',');
    aryInfoTemp = "<% tcWebApi_get("Info_Ether","PortExpire","s") %>";
    var PortExpireTime = aryInfoTemp.split(',');
    var Info_hostname = "<% tcwebApi_get("Info_Ether","HostName","s") %>";
    var Info_hostname_Array = Info_hostname.split(',');
    var wifi_result = <% tcWebApi_GetStaJson("Wifi_Sta") %>;
    var wan3_mac_list = [];

    var InfoEtherStr = '<% tcWebApi_GetTable("Info", "Ether", "0") %>';
    var InfoEther = JSON.parse(InfoEtherStr);
  <% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
    var EthPortCapabilityStr = '<% tcWebApi_GetTable("Vid", "EthPortCapability") %>';
    var EthPortCapability = JSON.parse(EthPortCapabilityStr);
    var skylannum = <%tcWebApi_get("Vid_Common","skylannum","s")%>;
    console.log(EthPortCapability);
  <% end if %>

    $(document).ready(function () {
  <% if tcWebApi_get("vid_common", "skyvid","h") = "132" then %>
      get_Wan3MacList();
  <% end if %>
    });

    function check_wan3(mac)
    {
      var i = 0;
      for(i ; i < wan3_mac_list.length; ++i)
      {
        if(wan3_mac_list[i] == mac)
          return 1;
      }
      return 0;
    }

    function get_Wan3MacList()
    {
      var num;
      var tmp;
      for(i = 0; i < wifi_result.length; i++)
      {
        tmp = wifi_result[i].Layer2Interface;
        num = tmp.substr(tmp.lastIndexOf('.') + 1);
        //console.log(wifi_result[i].MACAddress + " Layer2 is " + tmp + "num is" + num);
        if(num == "7")
        {
          wan3_mac_list.push(wifi_result[i].MACAddress);
          //console.log("put " + wifi_result[i].MACAddress + " in wan3list");
        }
      }
    }
      
    function refresh()
    {
      window.location.reload();
    }
    
    function goBack()
    {
      window.history.go(-1);
    }
    </SCRIPT>
  </head>
  <body>
    <div class="container-full container-resize-height">
      <div class="card-table">
        <div class="title-content">LAN Status</div>
        <div class="title-description-content">This page shows the current system status of LAN.</div>
        <table style="width:100%">
<% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
          <script language="JavaScript" type="text/javascript">
            document.write('<tr class="table-header">');
<% if tcwebApi_get("Vid_Lanup","port","h") <> "-1" then %>
<% if tcwebApi_get("Vid_Lanup","change","h") = "1" then %>
<% if tcwebApi_get("Vid_Lanup","is25g","h") <> "1" then %>
            document.write('<th class="p-1 text-center border border-dark">LAN(WAN)</th>');
<% elseif tcwebApi_get("Vid_Lanup","is25g","h") = "1" then %>
            document.write('<th class="p-1 text-center border border-dark">LAN(WAN)2.5GE</th>');
<% end if %>
<% end if %>
<% end if %>
            for(var i = 0; i < skylannum; i++){
              var currentLanName = EthPortCapability[0]["skylanname" + i];
              if(currentLanName == "LAN25"){
                document.write('<th class="p-1 text-center border border-dark">LAN(2.5GE)</th>');
              }else if(currentLanName == "LAN1"){
                document.write('<th class="p-1 text-center border border-dark">LAN-1</th>');
              }else if(currentLanName == "LAN2"){
                document.write('<th class="p-1 text-center border border-dark">LAN-2</th>');
              }else if(currentLanName == "LAN3"){
                document.write('<th class="p-1 text-center border border-dark">LAN-3</th>');
              }else if(currentLanName == "LAN4"){
                document.write('<th class="p-1 text-center border border-dark">LAN-4</th>');
              }
            }
            document.write('</tr>');
            
            document.write('<tr class="table-content-fist">');
<% if tcwebApi_get("Vid_Lanup","port","h") <> "-1" then %>
<% if tcwebApi_get("Vid_Lanup","change","h") = "1" then %>
<% if tcwebApi_get("Vid_Lanup","is25g","h") <> "1" then %>
            var lan_up_phy = '<% tcWebApi_get("Vid_Lanup", "port", "s") %>';
            var currentlanwanStatus = InfoEther[0]["Port" + lan_up_phy + "Status"];
<% elseif tcwebApi_get("Vid_Lanup","is25g","h") = "1" then %>
            var currentlanwanStatus = InfoEther[0]["PortW2LStatus"];
<% end if %>
            if(currentlanwanStatus == "1")
              document.write('<td class="text-center border border-dark">connected</td>');
            else
              document.write('<td class="text-center border border-dark">disconnect</td>');
<% end if %>
<% end if %>
            for(var i = 0; i < skylannum; i++){
              var currentLanPhy = EthPortCapability[0]["lan_phy" + i];
              var currentPortStatus = InfoEther[0]["Port" + currentLanPhy + "Status"];
              if(currentPortStatus == "1")
                document.write('<td class="text-center border border-dark">connected</td>');
              else
                document.write('<td class="text-center border border-dark">disconnect</td>');
            }
            document.write('</tr>');
            document.write('<tr class="table-content-fist">');
<% if tcwebApi_get("Vid_Lanup","port","h") <> "-1" then %>
<% if tcwebApi_get("Vid_Lanup","change","h") = "1" then %>
            var lan_up_phy = '<% tcWebApi_get("Vid_Lanup", "port", "s") %>';
            var currentPortStatus = InfoEther[0]["Port" + lan_up_phy + "Status"];
            var currentlanwanSpeed = InfoEther[0]["port" + lan_up_phy + "CurrentBitRate"];
            if(currentPortStatus == "1") {
              if(currentlanwanStatus != "N/A" && currentlanwanStatus != "") {
                if(currentlanwanSpeed != "auto")
                  document.write('<td class="text-center border border-dark">' + currentlanwanSpeed + 'Mbps</td>');
                else
                  document.write('<td class="text-center border border-dark">' + currentlanwanSpeed + '</td>');
              } else {
                document.write('<td class="text-center border border-dark">&nbsp</td>');
              }
            } else {
              document.write('<td class="text-center border border-dark">&nbsp</td>');
            }
<% end if %>
<% end if %>
            for(var i = 0; i < skylannum; i++){
              var currentLanPhy = EthPortCapability[0]["lan_phy" + i];
              var currentPortStatus = InfoEther[0]["Port" + currentLanPhy + "Status"];
              var currentLanSpeed = InfoEther[0]["port" + currentLanPhy + "CurrentBitRate"];
              if(currentPortStatus == "1")
                document.write('<td class="text-center border border-dark">' + currentLanSpeed + 'Mbps</td>');
              else
                document.write('<td class="text-center border border-dark">&nbsp</td>');
            }
            document.write('</tr>');
          </script>
<% end if %>
        </table>
      </div>
      <hr>
      <div class="card-table" <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
        <div class="title-content">DHCP Table</div>
        <div class="title-description-content">This page shows the status of DHCP.</div>
        <table style="width:100%">
          <tr class="table-header">
            <th class="p-1 text-center border border-dark">Device Name</th>
            <th class="p-1 text-center border border-dark">IP Address</th>
            <th class="p-1 text-center border border-dark">MAC Address</th>
            <th class="p-1 text-center border border-dark">Expired Time (sec)</th>
          </tr>
          <SCRIPT language=JavaScript type=text/javascript>
            var num = 0;
            for(i = 0; i < dhcpnum; i++)
            {
              if(PortIp[i] != "N/A" || PortMac[i] != "N/A")
              {
<% if tcWebApi_get("vid_common", "skyvid","h") = "132" then %>
                if(check_wan3(PortMac[i]))
                {
                  //console.log("skip " + PortMac[i]);
                  continue;
                }
<% end if %>
                if(num % 2 == 0){
                  document.write('<tr class="table-content-fist center">');
                }else{
                  document.write('<tr class="table-content-second center">');
                }
                num = num + 1 ;
                if(Info_hostname_Array[i] != "N/A" && Info_hostname_Array[i] != "" ){
                  document.write('<td class="text-center border border-dark">' + Info_hostname_Array[i].substr(0,32) + '</td>');
                }else{
                  document.write('<td class="text-center border border-dark"><' + '<label style="font-style:oblique;">unknown</label>' + '></td>');
                }
                document.write('<td class="text-center border border-dark">' + PortIp[i] + '</td>');
                document.write('<td class="text-center border border-dark">' + PortMac[i] + '</td>');
                if(PortDhcp[i] == "1")
                {
                  var arytemp = PortExpireTime[i].split(':');
                  if("0" != arytemp[0]){
                    document.write('<td class="text-center border border-dark">' + arytemp[0] + "d" + arytemp[1] + "h" + arytemp[2] + "min" + arytemp[3] + 'sec</td>');
                  }
                  else{
                    if(("0:0:0:0" == PortExpireTime[i]) || ("0" == PortExpireTime[i]))
                      document.write('<td class="text-center border border-dark">' + '</td>');
                    else{
                      document.write('<td class="text-center border border-dark">' + arytemp[1] + "h" + arytemp[2] + "min" + arytemp[3] + 'sec</td>');
                    }
                  }
                }
                else
                {
                  document.write('<td class="text-center border border-dark">' + 'Static' + '</td>');
                }
                document.write('</tr>');
              }
            }
          </SCRIPT>
        </table>
      </div>

      <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onclick="refresh()">Refresh</button>
        <!--<button id="goback" name="goback" type="button" class="btn-dashboard" onclick="goBack();">Close</button>-->
      </div>
    </div>
  </body>
</html>
