<%
  tcWebApi_constSet("wifiMacTab_Common","refreshFlag","1")
  TCWebApi_commit("wifiMacTab")
  TCWebApi_get("wifiMacTab_Common", "Waiting-5s")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Basic Setting</title>
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
    var result_Wifi = <% tcWebApi_GetStaJson("Wifi_Sta") %>;
    var localsystime = "<% tcWebApi_get("DeviceInfo","SysUptime","s") %>";
    var localsystime_Array = localsystime.split(':');
    var syshor = parseInt(localsystime_Array[0]);
    var sysmin = parseInt(localsystime_Array[1]);
    var syssec = parseInt(localsystime_Array[2]);
    var SEC_PER_DAY  = 86400; 
    var SEC_PER_HOUR = 3600;
    var SEC_PER_MIN  = 60;
    var currenttime = syshor*SEC_PER_HOUR + sysmin*SEC_PER_MIN + syssec;

    function setStaList(Domain, MAC, IP, PhyMode, BW, AuthMode, WepStatus, ClientDataRate,RSSI,TxPackets,RxPackets,TxRate,SNR,deviceName,time)
    {
      this.Domain = Domain;
      this.IP = IP;
      this.MAC = MAC;
      this.PhyMode = PhyMode;
      this.BW = BW;
      this.AuthMode = AuthMode;
      this.WepStatus = WepStatus;
      this.ClientDataRate = ClientDataRate;
      this.RSSI = RSSI;
      this.TxPackets = TxPackets;
      this.RxPackets = RxPackets;
      this.TxRate = TxRate;
      this.SNR = SNR;

      for(i = 0; i < result_Wifi.length; i++)
      {
        if (result_Wifi[i].isMeshDevice == "1") { //mesh device
          //find mesh apclii0 entry
          if (result_Wifi[i].apclii0_MAC != "N/A" && (result_Wifi[i].apclii0_MAC.toUpperCase() == MAC.toUpperCase())) {
            if (result_Wifi[i].HostName != "N/A" && result_Wifi[i].HostName != "") {
              this.deviceName = result_Wifi[i].HostName.substr(0,32);
            } else {
              this.deviceName = "<" + "<label style=\"font-style:oblique;\">unknown</label>" + ">";
            }
            var wlanexpire = result_Wifi[i].expire;
            var lefttime = wlanexpire - currenttime;
            var day = parseInt(lefttime/SEC_PER_DAY);
            var hour = parseInt((lefttime - SEC_PER_DAY * day) / SEC_PER_HOUR); 
            var min = parseInt((lefttime - SEC_PER_DAY * day - SEC_PER_HOUR * hour) / SEC_PER_MIN);
            var sec = lefttime - SEC_PER_DAY * day - SEC_PER_HOUR * hour - SEC_PER_MIN * min;
            this.time = day + "d" + hour + "h" + min + "min" + sec + "sec";
          }
        } else { //other device
          if (result_Wifi[i].MACAddress != "N/A" && (result_Wifi[i].MACAddress.toUpperCase() == MAC.toUpperCase())) {
            if (result_Wifi[i].HostName != "N/A" && result_Wifi[i].HostName != "") {
              this.deviceName = result_Wifi[i].HostName.substr(0,32);
            } else {
              this.deviceName = "<" + "<label style=\"font-style:oblique;\">unknown</label>" + ">";
            }
            var wlanexpire = result_Wifi[i].expire;
            var lefttime = wlanexpire - currenttime;
            var day = parseInt(lefttime/SEC_PER_DAY);
            var hour = parseInt((lefttime - SEC_PER_DAY * day) / SEC_PER_HOUR); 
            var min = parseInt((lefttime - SEC_PER_DAY * day - SEC_PER_HOUR * hour) / SEC_PER_MIN);
            var sec = lefttime - SEC_PER_DAY * day - SEC_PER_HOUR * hour - SEC_PER_MIN * min;
            this.time = day + "d" + hour + "h" + min + "min" + sec + "sec";
          }
        }
      }
    }

    function GetStaListInfo(){
      var ncount = 256;
      var num = 64;
      var nCurTemp = 0;
      var vcurLinks = new Array(ncount);

      <% if tcwebApi_get("wifiMacTab_Common","NUM8","h" ) <> "0" then %>
      var stalist8_num = "<% tcWebApi_get("wifiMacTab_Common","NUM8","s") %>";
      var wifitab_pvc8 = '<% tcWebApi_GetTable("wifiMacTab_PVC8", "Entry", "0,63") %>';
      var list8 = JSON.parse(wifitab_pvc8);
      
      for(var i=0; i<stalist8_num; i++)
      {
        if(list8[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list8[i]["MAC"], list8[i]["IP"], list8[i]["PhyMode"], list8[i]["BW"], list8[i]["AuthMode"], list8[i]["WepStatus"],list8[i]["ClientDataRate"],list8[i]["RSSIA"],list8[i]["TxPackets"],list8[i]["RxPackets"],list8[i]["TxRate"],list8[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM9","h" ) <> "0" then %>
      var stalist9_num = "<% tcWebApi_get("wifiMacTab_Common","NUM9","s") %>";
      var wifitab_pvc9 = '<% tcWebApi_GetTable("wifiMacTab_PVC9", "Entry", "0,63") %>';
      var list9 = JSON.parse(wifitab_pvc9);
      
      for(var i=0; i<stalist9_num; i++)
      {
        if(list9[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list9[i]["MAC"], list9[i]["IP"], list9[i]["PhyMode"], list9[i]["BW"], list9[i]["AuthMode"], list9[i]["WepStatus"],list9[i]["ClientDataRate"],list9[i]["RSSIA"],list9[i]["TxPackets"],list9[i]["RxPackets"],list9[i]["TxRate"],list9[i]["SNR"]);
        }
      }
      <% end if %>
      
      <% if tcwebApi_get("wifiMacTab_Common","NUM10","h" ) <> "0" then %>
      var stalist10_num = "<% tcWebApi_get("wifiMacTab_Common","NUM10","s") %>";
        var wifitab_pvc10 = '<% tcWebApi_GetTable("wifiMacTab_PVC10", "Entry", "0,63") %>';
      var list10 = JSON.parse(wifitab_pvc10);
      
      for(var i=0; i<stalist10_num; i++)
      {
        if(list10[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list10[i]["MAC"], list10[i]["IP"], list10[i]["PhyMode"], list10[i]["BW"], list10[i]["AuthMode"], list10[i]["WepStatus"],list10[i]["ClientDataRate"],list10[i]["RSSIA"],list10[i]["TxPackets"],list10[i]["RxPackets"],list10[i]["TxRate"],list10[i]["SNR"]);
        }
      }
      <% end if %>
      
      <% if tcwebApi_get("wifiMacTab_Common","NUM11","h" ) <> "0" then %>
      var stalist11_num = "<% tcWebApi_get("wifiMacTab_Common","NUM11","s") %>";
        var wifitab_pvc11 = '<% tcWebApi_GetTable("wifiMacTab_PVC11", "Entry", "0,63") %>';
      var list11 = JSON.parse(wifitab_pvc11);
      
      for(var i=0; i<stalist11_num; i++)
      {
        if(list11[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list11[i]["MAC"], list11[i]["IP"], list11[i]["PhyMode"], list11[i]["BW"], list11[i]["AuthMode"], list11[i]["WepStatus"],list11[i]["ClientDataRate"],list11[i]["RSSIA"],list11[i]["TxPackets"],list11[i]["RxPackets"],list11[i]["TxRate"],list11[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM12","h" ) <> "0" then %>
      var stalist12_num = "<% tcWebApi_get("wifiMacTab_Common","NUM12","s") %>";
        var wifitab_pvc12 = '<% tcWebApi_GetTable("wifiMacTab_PVC12", "Entry", "0,63") %>';
      var list12 = JSON.parse(wifitab_pvc12);
      
      for(var i=0; i<stalist12_num; i++)
      {
        if(list12[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list12[i]["MAC"], list12[i]["IP"], list12[i]["PhyMode"], list12[i]["BW"], list12[i]["AuthMode"], list12[i]["WepStatus"],list12[i]["ClientDataRate"],list12[i]["RSSIA"],list12[i]["TxPackets"],list12[i]["RxPackets"],list12[i]["TxRate"],list12[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM13","h" ) <> "0" then %>
      var stalist13_num = "<% tcWebApi_get("wifiMacTab_Common","NUM13","s") %>";
        var wifitab_pvc13 = '<% tcWebApi_GetTable("wifiMacTab_PVC13", "Entry", "0,63") %>';
      var list13 = JSON.parse(wifitab_pvc13);
      
      for(var i=0; i<stalist13_num; i++)
      {
        if(list13[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list13[i]["MAC"], list13[i]["IP"], list13[i]["PhyMode"], list13[i]["BW"], list13[i]["AuthMode"], list13[i]["WepStatus"],list13[i]["ClientDataRate"],list13[i]["RSSIA"],list13[i]["TxPackets"],list13[i]["RxPackets"],list13[i]["TxRate"],list13[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM14","h" ) <> "0" then %>
      var stalist14_num = "<% tcWebApi_get("wifiMacTab_Common","NUM14","s") %>";
        var wifitab_pvc14 = '<% tcWebApi_GetTable("wifiMacTab_PVC14", "Entry", "0,63") %>';
      var list14 = JSON.parse(wifitab_pvc14);
      
      for(var i=0; i<stalist14_num; i++)
      {
        if(list14[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list14[i]["MAC"], list14[i]["IP"], list14[i]["PhyMode"], list14[i]["BW"], list14[i]["AuthMode"], list14[i]["WepStatus"],list14[i]["ClientDataRate"],list14[i]["RSSIA"],list14[i]["TxPackets"],list14[i]["RxPackets"],list14[i]["TxRate"],list14[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM15","h" ) <> "0" then %>
      var stalist15_num = "<% tcWebApi_get("wifiMacTab_Common","NUM15","s") %>";
        var wifitab_pvc15 = '<% tcWebApi_GetTable("wifiMacTab_PVC15", "Entry", "0,63") %>';
      var list15 = JSON.parse(wifitab_pvc15);
      
      for(var i=0; i<stalist15_num; i++)
      {
        if(list15[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list15[i]["MAC"], list15[i]["IP"], list15[i]["PhyMode"], list15[i]["BW"], list15[i]["AuthMode"], list15[i]["WepStatus"],list15[i]["ClientDataRate"],list15[i]["RSSIA"],list15[i]["TxPackets"],list15[i]["RxPackets"],list15[i]["TxRate"],list15[i]["SNR"]);
        }
      }
      <% end if %>

      var vObjRet = new Array(nCurTemp+1);
      for(var m=0; m<nCurTemp; m++)
      {
        vObjRet[m] = vcurLinks[m];
      }
      vObjRet[nCurTemp] = null;
      return vObjRet;
    }
    var StaListInfo = GetStaListInfo();
  </SCRIPT>
</head>

<body>
    <!-- content -->
    <div class="container-full container-resize-height">
        <div class="card-table">
            <div class="title-content">Show Active WLAN Clients</div>
            <table style="width:100%">
                <tr class="table-header">
                    <th class="p-1 text-center border border-dark">Device Name</th>
                    <th class="p-1 text-center border border-dark">MAC Address</th>
                    <th class="p-1 text-center border border-dark">Tx Packets</th>
                    <th class="p-1 text-center border border-dark">Rx Packets</th>
                    <th class="p-1 text-center border border-dark">Tx Rate (Mbps)</th>
                    <th class="p-1 text-center border border-dark">RSSI</th>
                    <th class="p-1 text-center border border-dark">SNR</th>
                    <th class="p-1 text-center border border-dark">Power Saving</th>
                    <th class="p-1 text-center border border-dark">Expired Time (sec)</th>
                </tr>
                <SCRIPT language=JavaScript type=text/javascript>
                  for (i = 0; i < StaListInfo.length-1; i++)
                  {
                    document.write('<tr class="table-content-fist">');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].deviceName + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].MAC + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].TxPackets + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].RxPackets + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].TxRate + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].RSSI + '</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].SNR + '</td>');
                    document.write('<td class="text-center border border-dark">Legacy</td>');
                    document.write('<td class="text-center border border-dark">' + StaListInfo[i].time + '</td>');
                    document.write('</tr>');
                  }
                </SCRIPT>
            </table>

        </div>
      </div>
</body>

</html>