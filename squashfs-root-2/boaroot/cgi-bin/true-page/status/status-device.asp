<%
if Request_Form("Wan_Flag") = "1" then

  TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
  TCWebApi_set("WanInfo_WanIF","IFIdx","WanCurrIFIdx")

  TCWebApi_commit("WanInfo_WanPVC")
  TCWebApi_save()

end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - Device</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/lib/JsBarcode.all.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
  <SCRIPT language=JavaScript type=text/javascript>
    var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    //get all value
    // num 0
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var Wan_WanName = vArrayStr.split(',');
    // num 1
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var Wan_WanValue = vArrayStr.split(',');
    // num 2
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_VidPRI","s") %>";
    var Wan_WanVlan = vArrayStr.split(',');
    
    // num 3
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Actives","s") %>";
    var Wan_Actives = vArrayStr.split(',');
    // num 4
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
    var WANEnNAT = vArrayStr.split(',');
    // num 5
    
    // num 6
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
    var Wan_IPVERSION = vArrayStr.split(',');
    // num 7
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Status4","s") %>";
    var Wan_Status4 = vArrayStr.split(',');
    // num 8
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP4","s") %>";
    var Wan_IP4 = vArrayStr.split(',');
    // num 9
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_ENCAP","s") %>";
    var Wan_ENCAP = vArrayStr.split(',');
    // num 10
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_GateWay4","s") %>";
    var Wan_GateWay4 = vArrayStr.split(',');
    // num 11
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_DNS4","s") %>";
    var Wan_DNS4 = vArrayStr.split(',');
    // num 12
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_SecDNS4","s") %>";
    var Wan_SecDNS4 = vArrayStr.split(',');
    // num 13
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Status6","s") %>";
    var Wan_Status6 = vArrayStr.split(',');
    // num 14
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP6","s") %>";
    var Wan_IP6 = vArrayStr.split(',');
    // num 15
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_GateWay6","s") %>";
    var Wan_GateWay6 = vArrayStr.split(',');
    // num 16
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_DNS6","s") %>";
    var Wan_DNS6 = vArrayStr.split(',');
    // num 17
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_SecDNS6","s") %>";
    var Wan_SecDNS6 = vArrayStr.split(',');
    // num 18
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_PD6","s") %>";
    var Wan_PD6 = vArrayStr.split(',');
    // num 19
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_NetMask4","s") %>";
    var Wan_NetMask4 = vArrayStr.split(',');
    // num 20
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
    var IFIdxArray = vArrayStr.split(',');
    // num 21
    
    // num 22
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Connection","s") %>";
    var Wan_Connection = vArrayStr.split(',');
    // num 23
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_VidPRI","s") %>";
    var Wan_VidPRI = vArrayStr.split(',');
    // num 24
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_MAC","s") %>";
    var Wan_MAC = vArrayStr.split(',');
    //num 25
    
    //num 26
    
    //num 27
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_uptime","s") %>";//pppConnTime
    var Wan_uptime = vArrayStr.split(',');
    //num 28
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_uptime6","s") %>";//pppConnTime6
    var Wan_uptime6 = vArrayStr.split(',');
    
    SortUtil.SetReplaceStrflag(1);
    Wan_WanName = SortUtil.UpdateWanIFName( Wan_WanName, pvc_counts );
    Wan_WanValue = SortUtil.SortMyArray( Wan_WanValue );
    Wan_WanVlan = SortUtil.SortMyArray( Wan_WanVlan );
    Wan_Actives = SortUtil.SortMyArray( Wan_Actives );
    Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
    Wan_Status4 = SortUtil.SortMyArray( Wan_Status4 );
    Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
    Wan_ENCAP = SortUtil.SortMyArray( Wan_ENCAP );
    Wan_GateWay4 = SortUtil.SortMyArray( Wan_GateWay4 );
    Wan_DNS4 = SortUtil.SortMyArray( Wan_DNS4 );
    Wan_SecDNS4 = SortUtil.SortMyArray( Wan_SecDNS4 );
    Wan_Status6 = SortUtil.SortMyArray( Wan_Status6 );
    Wan_IP6 = SortUtil.SortMyArray( Wan_IP6 );
    Wan_GateWay6 = SortUtil.SortMyArray( Wan_GateWay6 );
    Wan_DNS6 = SortUtil.SortMyArray( Wan_DNS6 );
    Wan_SecDNS6 = SortUtil.SortMyArray( Wan_SecDNS6 );
    Wan_PD6 = SortUtil.SortMyArray( Wan_PD6 );
    Wan_NetMask4 = SortUtil.SortMyArray( Wan_NetMask4 );
    IFIdxArray = SortUtil.SortMyArray( IFIdxArray );
    Wan_Connection = SortUtil.SortMyArray( Wan_Connection );
    Wan_VidPRI = SortUtil.SortMyArray( Wan_VidPRI );
    Wan_MAC = SortUtil.SortMyArray( Wan_MAC );
    
    Wan_uptime = SortUtil.SortMyArray( Wan_uptime );
    Wan_uptime6 = SortUtil.SortMyArray( Wan_uptime6 );
    function connect(ifIndex)
    {
      return 0;
    }
    
    function ListCreate_info()
    {
      var index = 1;
      var num = 0;
      for(var i=0;i<pvc_counts;i++)
      {
        if(Wan_Actives[i] != "N/A")
        {
          if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
          {
            var vlanidArray=Wan_VidPRI[i].split("/");
            var vlanid= (vlanidArray[0]===undefined?"":vlanidArray[0]);
            <%if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h" ) = "1" then%>
              if(vlanid == 293)
                continue;
            <%end if%>
            if(num % 2 == 0){
              document.write('<tr class="table-content-fist center">');
            }else{
              document.write('<tr class="table-content-second center">');
            }
            num = num + 1 ;
            if(Wan_WanVlan[i].indexOf("293") >= 0)
              document.write('<td class="p-1">' + "THSI" + '</td>');
            else
              document.write('<td class="p-1">' + Wan_WanValue[i] + '</td>');
            document.write('<td>' + vlanid + '</td>');
            var type = "";
            if(Wan_WanName[i].indexOf('TR069_VOICE_INTERNET') >= 0){
              type = "TR069_VOICE_INTERNET";
            }else if(Wan_WanName[i].indexOf('TR069_VOICE') >= 0){
              type = "TR069_VOICE";
            }else if(Wan_WanName[i].indexOf('TR069_INTERNET') >= 0){
              type = "TR069_INTERNET";
            }else if(Wan_WanName[i].indexOf('VOICE_INTERNET') >= 0){
              type = "VOICE_INTERNET";
            }else if(Wan_WanName[i].indexOf('INTERNET') >= 0){
              type = "INTERNET";
            }else if(Wan_WanName[i].indexOf('VOICE') >= 0){
              type = "VOICE";
            }else if(Wan_WanName[i].indexOf('TR069') >= 0){
              type = "TR069";
            }else if(Wan_WanName[i].indexOf('OTHER') >= 0){
              type = "OTHER";
            } 
            document.write('<td>' + type + '</td>');
            document.write('<td>' + Wan_ENCAP[i] + '</td>');
            document.write('<td>' + Wan_IP4[i] + '</td>');
            document.write('<td>' + Wan_GateWay4[i] + '</td>');
            if ('up' == Wan_Status4[i]){
                dns = Wan_DNS4[i] + "" + Wan_SecDNS4[i];
                gateway = Wan_GateWay4[i];
                if(Wan_ENCAP[i] == "PPPoE"){
                  document.write('<td class="center">up&nbsp;' + Wan_uptime[i] + '</td>');
                }else{
                  document.write('<td class="center">up</td>');
                }
            }
            <% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
            else if(Wan_Actives[i]=="Yes" && ( Wan_WanName[i].indexOf('_B_') >= 0
                    ||'PPPoE' != Wan_ENCAP[i]
                    || ('PPPoE' == Wan_ENCAP[i] && ('Connect_Keep_Alive' == Wan_Connection[i] || '-' == Wan_Connection[i])))
                    ){
            <% else %>
            else if(Wan_Actives[i]=="Yes"){
            <% end if %>
              if(Wan_ENCAP[i] == "PPPoE"){
                document.write('<td class="center">connecting</td>');
              }else{
                document.write('<td class="center">connecting</td>');
              }
            }else{
                if(Wan_ENCAP[i] == "PPPoE"){
                  
                  if(Wan_WanName[i] != "")
                  {
                    var curIndexArray = Wan_WanName[i].split("_");
                    document.write('<td class="center">down&nbsp;' + Wan_uptime[i] + '<br/><button type="button" class="btn-table" id="' + IFIdxArray[i] + '" value="' + curIndexArray[0] + '" onclick="reConnectPPP(' + curIndexArray[0] + ')">Connect</button></td>');
                  }
                  
                }else{
                  document.write('<td class="center">down</td>');
                }
            }
            index = index + 1;
          }
          else 
          {
            if(Wan_IPVERSION[i] == "IPv6")
            {
              index = index + 1;
            }
          }
        }
      }
    }

    function RefreshPage()
    {
      location.href = document.location.href;
    }

    var vManualEnable = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStart","s") %>";
    var rPhyStatus = "<%tcWebApi_get("XPON_Common","losStatus","s") %>";
    var ponConnect = "<% tcWebApi_get("XPON_Common","trafficStatus","s") %>";
    function reConnectPPP(CurrIFIdx)
    {
      if(rPhyStatus == "down")
      {
        alert("Sorry, You don't connect fiber.");
        return ;
      }
      
      if(ponConnect != "up")
      {
        alert("The terminal failed to register on the OLT, please check whether the fiber is plugged in, or whether the power is normal, or whether the LOID is correct.");
        return;
      }
      console.log(CurrIFIdx);
      var vForm = document.ConfigForm;
      vForm.OperatorStyle.value = "Modify";
      document.ConfigForm.Wan_Flag.value = "1";
      vForm.WanCurrIFIdx.value = CurrIFIdx;
      
      document.ConfigForm.submit();
      showLoading();
    }

    var DeviceUsingTime = "<%tcWebApi_get("DeviceInfo","DeviceUsingTime","s")%>";
    function UsingTime()
    {
      // var UsingDay = parseInt(DeviceUsingTime)/2;
      // UsingDay = Math.floor(UsingDay);
      // var UsingHour = parseInt(DeviceUsingTime)%2;
      // var tmp ;
      // if(UsingHour == 0)
      //   UsingHour = 0;
      // else
      //   UsingHour = 12;
      // tmp = UsingDay+" Days "+UsingHour+" Hours "+"00 Minutes";
      // document.write(tmp);
      document.write(DeviceUsingTime);
      return ;
    }
    
    function showBr0DelegatePrefix()
    {
      var Enable6rd = "<% tcWebApi_get("WanInfo_WanIF","Enable6rd","s") %>";
      for(var i=0;i<pvc_counts;i++)
      {
        if(Wan_Actives[i] != "N/A")
        {
          if( Wan_WanName[i].indexOf('INTERNET') >= 0 )
          {
            //
            if(Wan_IPVERSION[i] == "IPv6" || Wan_IPVERSION[i] == "IPv4/IPv6" || Enable6rd == "Yes")
            {
              document.write(Wan_PD6[i]);
            }
          }
        }
      }
    }
    </SCRIPT>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/status/status-device.asp" method="post">
      <input type="hidden" name="Wan_Flag" value="0">
      <input type="hidden" name="OperatorStyle" value="Add">
      <input type="hidden" name="WanCurrIFIdx" value='1'>
      <div class="card-table">
        <div class="title-content">Device Status</div>
        <div class="title-description-content">This page shows the current status and some basic settings of the device.</div>
        <table style="width:100%">
          <tr class="table-header">
            <th colspan="2" class="p-1">System</th>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">Device Name</td>
            <td style="width: 50%;"><%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%></td>
          </tr>
          <tr class="table-content-second">
            <td style="width: 50%;" class="table-header-content p-1">Device SN</td>
            <td style="width: 50%;"><%If tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%></td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">TRUE SN</td>
            <td style="width: 50%;"><%If tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","h") <> "" Then tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","s") else tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%></td>
          </tr>
          <tr class="table-content-second">
            <td style="width: 50%;" class="table-header-content p-1">Manufacturer</td>
            <td style="width: 50%;"><%If tcWebApi_get("DeviceInfo_devParaStatic","Manufacturer","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","Manufacturer","s") end if%></td>
          </tr>
          <% if tcWebApi_get("vid_common", "skyvid","h") <> "10" then %>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">GPON SN</td>
            <td style="width: 50%;"><%If tcWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" Then tcWebApi_get("GPON_ONU","SerialNumber","s") end if%></td>
          </tr>
          <% end if %>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">Hardware Version</td>
            <td style="width: 50%;"><%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s") end if%></td>
          </tr>
          <tr class="table-content-second">
            <td style="width: 50%;" class="table-header-content p-1">Firmware Version</td>
            <td style="width: 50%;"><%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%></td>
          </tr>
          <tr class="table-content-fist">
            <td class="table-header-content p-1">CPU Usage</td>
            <td><%If tcWebApi_get("Info_SysDevice","CpuUsage","h") <> "N/A" Then tcWebApi_get("Info_SysDevice","CpuUsage","s") end if%>&nbsp;%</td>
          </tr>
          <tr class="table-content-second">
            <td style="width: 50%;" class="table-header-content p-1">Memory Usage</td>
            <td style="width: 50%;"><%If tcWebApi_get("Info_SysDevice","MemoryUsage","h") <> "N/A" Then tcWebApi_get("Info_SysDevice","MemoryUsage","s") end if%>&nbsp;%</td>
          </tr>
          <tr class="table-content-fist">
            <td class="table-header-content p-1">IPv4 Name servers</td>
            <td>
              <SCRIPT language=JavaScript type=text/javascript>
                var index = 0;
                for(var i=0;i<pvc_counts;i++)
                {
                  if(Wan_Actives[i] != "N/A")
                  {
                    if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
                    {
                      if ('up' == Wan_Status4[i]){
                        if(index == 0){
                          document.write(Wan_DNS4[i] + ";" + Wan_SecDNS4[i]);
                        }else{
                          document.write(";" + Wan_DNS4[i] + ";" + Wan_SecDNS4[i]);
                        }
                        index ++;
                      }
                    }
                  }
                }
              </SCRIPT>
            </td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">IPv6 Name servers</td>
            <td>
              <SCRIPT language=JavaScript type=text/javascript>
                var index = 0;
                for(var i=0;i<pvc_counts;i++)
                {
                  if(Wan_Actives[i] != "N/A")
                  {
                    if(Wan_IPVERSION[i] == "IPv6" || Wan_IPVERSION[i] == "IPv4/IPv6")
                    {
                      if ('up' == Wan_Status6[i]){
                        if(index == 0){
                          document.write(Wan_DNS6[i] + ";" + Wan_SecDNS6[i]);
                        }else{
                          document.write(";" + Wan_DNS6[i] + ";" + Wan_SecDNS6[i]);
                        }
                        index ++;
                      }
                    }
                  }
                }
              </SCRIPT>
            </td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">IPv4 Default Gateway</td>
            <td style="width: 50%;">
              <SCRIPT language=JavaScript type=text/javascript>
                var index = 0;
                for(var i=0;i<pvc_counts;i++)
                {
                  if(Wan_Actives[i] != "N/A")
                  {
                    if(Wan_IPVERSION[i] == "IPv4" || Wan_IPVERSION[i] == "IPv4/IPv6")
                    {
                      if ('up' == Wan_Status4[i]){
                        if(index == 0){
                          document.write(Wan_GateWay4[i]);
                        }else{
                          document.write(";"+Wan_GateWay4[i]);
                        }
                        index ++;
                      }
                    }
                  }
                }
              </SCRIPT>
            </td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">IPv6 Default Gateway</td>
            <td>
              <SCRIPT language=JavaScript type=text/javascript>
              var index = 0;
                for(var i=0;i<pvc_counts;i++)
                {
                  if(Wan_Actives[i] != "N/A")
                  {
                    if(Wan_IPVERSION[i] == "IPv6" || Wan_IPVERSION[i] == "IPv4/IPv6")
                    {
                      var isIPGWUp = 0;
                      if ( 0 != Wan_IP6[i].length && '-' != Wan_IP6[i]
                        && 0 != Wan_GateWay6[i].length && '-' != Wan_GateWay6[i] )
                        isIPGWUp = 1;
                      if(Wan_WanName[i].indexOf('_B_') >= 0)
                        isIPGWUp = 1;
                      if ('up' == Wan_Status6[i] && (1 == isIPGWUp)){
                        if(index == 0){
                          document.write(Wan_GateWay6[i]);
                        }else{
                          document.write(";"+Wan_GateWay6[i]);
                        }
                        index ++;
                      }
                    }
                  }
                }
              </SCRIPT>
            </td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Uptime</td>
            <td><%If tcWebApi_get("DeviceInfo","SysUptime","h") <> "N/A" Then tcWebApi_get("DeviceInfo","SysUptime","s") end if%></td>
          </tr>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">Device using time</td>
            <td style="width: 50%;">
              <SCRIPT language=JavaScript type=text/javascript>
                UsingTime();
              </SCRIPT>
            </td>
          </tr>
<% end if %>
        </table>
      </div>

      <div class="card-table">
        <table style="width:100%">
          <tr class="table-header">
            <th colspan="2" class="p-1">IPV4 LAN Configuration</th>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">IP Address</td>
            <td style="width: 50%;"><% if TCWebApi_get("Lan_Entry0", "IP", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP", "s") end if %></td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Subnet Mask</td>
            <td><% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %></td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">DHCP Server</td>
            <td style="width: 50%;"><%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("Enabled") else asp_Write("Disable") end if %></td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">MAC Address</td>
            <td><% tcWebApi_get("Info_Ether","mac","s" ) %></td>
          </tr>
        </table>
      </div>

      <div class="card-table">
        <table style="width:100%">
          <tr class="table-header">
            <th colspan="2" class="p-1">IPv6 LAN Configuration</th>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 50%;" class="table-header-content p-1">IPv6 Address</td>
            <td style="width: 50%;">
            <SCRIPT language=JavaScript type=text/javascript>
                var vArrayStr = "<% tcWebApi_get("WanInfo_WanIF","TrueBr0Addr","s")  %>";
                if((vArrayStr != "N/A") && (vArrayStr != "" ))
                {
                    var Br0Addr = vArrayStr.split('/');
                    document.write(Br0Addr[0]);
                }
                else
                {
                    vArrayStr = "<% tcWebApi_get("WanInfo_WanIF","Br0Addr","s")  %>";
                    if((vArrayStr != "N/A") && (vArrayStr != "" ))
                    {
                        var Br0Addr = vArrayStr.split('/');
                        document.write(Br0Addr[0]);
                     }
                }
            </script>
            </td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">IPv6 Link-Local Address</td>
            <td><% if TCWebApi_get("Lan_Entry0", "IP6", "h") <> "N/A" then TCWebApi_get("Lan_Entry0", "IP6", "s") end if %></td>
          </tr>
          <tr class="table-content-fist">
              <td style="width: 50%;" class="table-header-content p-1">Prefix Delegate</td>
              <td style="width: 50%;">
              <SCRIPT language=JavaScript type=text/javascript>
                  showBr0DelegatePrefix();
              </SCRIPT>
              </td>
          </tr>
        </table>
      </div>
      <!--
      <div class="card-table">
        <div class="table-header">WAN Configuration</div>
        <table style="width:100%">
          <tr class="table-header center">
            <th style="width: 10%;" class="p-1">Interface</th>
            <th style="width: 10%;">VLAN ID</th>
            <th style="width: 15%;">Connection Type</th>
            <th style="width: 10%;">Protocol</th>
            <th style="width: 20%;">IP Address</th>
            <th style="width: 20%;">Gateway</th>
            <th style="width: 15%;">Status</th>
          </tr>
          <SCRIPT language=JavaScript type=text/javascript>
            ListCreate_info();
          </SCRIPT>
        </table>
      </div>
      -->
      <div class="card-btn-bottom">
        <button class="btn-dashboard" onclick="RefreshPage()">Refresh</button>
      </div>
    </form>
  </div>
</body>

</html>
