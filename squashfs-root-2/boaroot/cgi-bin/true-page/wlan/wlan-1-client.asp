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
          //find mesh apcli0 entry
          if (result_Wifi[i].apcli0_MAC != "N/A" && (result_Wifi[i].apcli0_MAC.toUpperCase() == MAC.toUpperCase())) {
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

      <% if tcwebApi_get("wifiMacTab_Common","NUM0","h" ) <> "0" then %>
      var stalist0_num = "<% tcWebApi_get("wifiMacTab_Common","NUM0","s") %>";
        var wifitab_pvc0 = '<% tcWebApi_GetTable("wifiMacTab_PVC0", "Entry", "0,63") %>';
      var list0 = JSON.parse(wifitab_pvc0);
      
      for(var i=0; i<stalist0_num; i++)
      {
        if(list0[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list0[i]["MAC"], list0[i]["IP"], list0[i]["PhyMode"], list0[i]["BW"], list0[i]["AuthMode"], list0[i]["WepStatus"],list0[i]["ClientDataRate"],list0[i]["RSSIA"],list0[i]["TxPackets"],list0[i]["RxPackets"],list0[i]["TxRate"],list0[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM1","h" ) <> "0" then %>
      var stalist1_num = "<% tcWebApi_get("wifiMacTab_Common","NUM1","s") %>";
        var wifitab_pvc1 = '<% tcWebApi_GetTable("wifiMacTab_PVC1", "Entry", "0,63") %>';
      var list1 = JSON.parse(wifitab_pvc1);
      
      for(var i=0; i<stalist1_num; i++)
      {
        if(list1[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list1[i]["MAC"], list1[i]["IP"], list1[i]["PhyMode"], list1[i]["BW"], list1[i]["AuthMode"], list1[i]["WepStatus"],list1[i]["ClientDataRate"],list1[i]["RSSIA"],list1[i]["TxPackets"],list1[i]["RxPackets"],list1[i]["TxRate"],list1[i]["SNR"]);
        }
      }
      <% end if %>
      
      <% if tcwebApi_get("wifiMacTab_Common","NUM2","h" ) <> "0" then %>
      var stalist2_num = "<% tcWebApi_get("wifiMacTab_Common","NUM2","s") %>";
        var wifitab_pvc2 = '<% tcWebApi_GetTable("wifiMacTab_PVC2", "Entry", "0,63") %>';
      var list2 = JSON.parse(wifitab_pvc2);
      
      for(var i=0; i<stalist2_num; i++)
      {
        if(list2[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list2[i]["MAC"], list2[i]["IP"], list2[i]["PhyMode"], list2[i]["BW"], list2[i]["AuthMode"], list2[i]["WepStatus"],list2[i]["ClientDataRate"],list2[i]["RSSIA"],list2[i]["TxPackets"],list2[i]["RxPackets"],list2[i]["TxRate"],list2[i]["SNR"]);
        }
      }
      <% end if %>
      
      <% if tcwebApi_get("wifiMacTab_Common","NUM3","h" ) <> "0" then %>
      var stalist3_num = "<% tcWebApi_get("wifiMacTab_Common","NUM3","s") %>";
        var wifitab_pvc3 = '<% tcWebApi_GetTable("wifiMacTab_PVC3", "Entry", "0,63") %>';
      var list3 = JSON.parse(wifitab_pvc3);
      
      for(var i=0; i<stalist3_num; i++)
      {
        if(list3[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list3[i]["MAC"], list3[i]["IP"], list3[i]["PhyMode"], list3[i]["BW"], list3[i]["AuthMode"], list3[i]["WepStatus"],list3[i]["ClientDataRate"],list3[i]["RSSIA"],list3[i]["TxPackets"],list3[i]["RxPackets"],list3[i]["TxRate"],list3[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM4","h" ) <> "0" then %>
      var stalist4_num = "<% tcWebApi_get("wifiMacTab_Common","NUM4","s") %>";
        var wifitab_pvc4 = '<% tcWebApi_GetTable("wifiMacTab_PVC4", "Entry", "0,63") %>';
      var list4 = JSON.parse(wifitab_pvc4);
      
      for(var i=0; i<stalist4_num; i++)
      {
        if(list4[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list4[i]["MAC"], list4[i]["IP"], list4[i]["PhyMode"], list4[i]["BW"], list4[i]["AuthMode"], list4[i]["WepStatus"],list4[i]["ClientDataRate"],list4[i]["RSSIA"],list4[i]["TxPackets"],list4[i]["RxPackets"],list4[i]["TxRate"],list4[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM5","h" ) <> "0" then %>
      var stalist5_num = "<% tcWebApi_get("wifiMacTab_Common","NUM5","s") %>";
        var wifitab_pvc5 = '<% tcWebApi_GetTable("wifiMacTab_PVC5", "Entry", "0,63") %>';
      var list5 = JSON.parse(wifitab_pvc5);
      
      for(var i=0; i<stalist5_num; i++)
      {
        if(list5[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list5[i]["MAC"], list5[i]["IP"], list5[i]["PhyMode"], list5[i]["BW"], list5[i]["AuthMode"], list5[i]["WepStatus"],list5[i]["ClientDataRate"],list5[i]["RSSIA"],list5[i]["TxPackets"],list5[i]["RxPackets"],list5[i]["TxRate"],list5[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM6","h" ) <> "0" then %>
      var stalist6_num = "<% tcWebApi_get("wifiMacTab_Common","NUM6","s") %>";
        var wifitab_pvc6 = '<% tcWebApi_GetTable("wifiMacTab_PVC6", "Entry", "0,63") %>';
      var list6 = JSON.parse(wifitab_pvc6);
      
      for(var i=0; i<stalist6_num; i++)
      {
        if(list6[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list6[i]["MAC"], list6[i]["IP"], list6[i]["PhyMode"], list6[i]["BW"], list6[i]["AuthMode"], list6[i]["WepStatus"],list6[i]["ClientDataRate"],list6[i]["RSSIA"],list6[i]["TxPackets"],list6[i]["RxPackets"],list6[i]["TxRate"],list6[i]["SNR"]);
        }
      }
      <% end if %>

      <% if tcwebApi_get("wifiMacTab_Common","NUM7","h" ) <> "0" then %>
      var stalist7_num = "<% tcWebApi_get("wifiMacTab_Common","NUM7","s") %>";
        var wifitab_pvc7 = '<% tcWebApi_GetTable("wifiMacTab_PVC7", "Entry", "0,63") %>';
      var list7 = JSON.parse(wifitab_pvc7);
      
      for(var i=0; i<stalist7_num; i++)
      {
        if(list7[i] != "N/A")
        {
          vcurLinks[nCurTemp++] = new setStaList(i, list7[i]["MAC"], list7[i]["IP"], list7[i]["PhyMode"], list7[i]["BW"], list7[i]["AuthMode"], list7[i]["WepStatus"],list7[i]["ClientDataRate"],list7[i]["RSSIA"],list7[i]["TxPackets"],list7[i]["RxPackets"],list7[i]["TxRate"],list7[i]["SNR"]);
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