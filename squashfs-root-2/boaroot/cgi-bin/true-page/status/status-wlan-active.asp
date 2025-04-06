<%
  tcWebApi_constSet("wifiMacTab_Common","refreshFlag","1")
  TCWebApi_commit("wifiMacTab")
  TCWebApi_get("wifiMacTab_Common", "Waiting-3s")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - WLAN</title>
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
  var index;

  function getIndex(){
    var url = location.search;
    if (url.indexOf("?") != -1){
      var str = url.substr(1);
      strs = str.split("=");
        index = strs[1];
      return;
    }
    index = 1;
    return;
  }

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
        var found = 0;
        if (index <= 8) { //2.4G interface
          if (result_Wifi[i].apcli0_MAC != "N/A" && (result_Wifi[i].apcli0_MAC.toUpperCase() == MAC.toUpperCase())) {
            found = 1;
          }
        } else if (index <= 16) { //5G interface
          if (result_Wifi[i].apclii0_MAC != "N/A" && (result_Wifi[i].apclii0_MAC.toUpperCase() == MAC.toUpperCase())) {
            found = 1;
          }
        }
        if (found == 1) {
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
  
  function GetStaListInfo()
  {
    getIndex();
    var ncount = 64;
    var nCurTemp = 0;
    var vcurLinks = new Array(ncount);
    if (index == "1") {
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
    } else if (index == "2") {
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
    } else if (index == "3") {
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
    } else if (index == "4"){
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
    }  else if (index == "5") {
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
    } else if (index == "6") {
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
    } else if (index == "7") {
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
    } else if (index == "8") { //2.4G BH sta
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
    } else if (index == "9") {
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
    } else if (index == "10") {
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
    } else if (index == "11") {
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
    } else if(index == "12") {
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
    } else if (index == "13") {
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
    } else if (index == "14") {
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
    } else if (index == "15") {
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
    } else if (index == "16"){ //5G BH sta
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
    }

    var vObjRet = new Array(nCurTemp+1);
    for(var m=0; m<nCurTemp; m++)
    {
      vObjRet[m] = vcurLinks[m];
    }
    vObjRet[nCurTemp] = null;
    return vObjRet;
  }
  var StaListInfo = GetStaListInfo();

  function Undo(){
      location.reload() 
  }
  
  function Close(){
      window.history.go(-1);
  }
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
                    <th class="p-1 text-center border border-dark">Tx Rate (Maps)</th>
                    <th class="p-1 text-center border border-dark">RSSI</th>
                    <th class="p-1 text-center border border-dark">SNR</th>
                    <th class="p-1 text-center border border-dark">Power Saving</th>
                    <th class="p-1 text-center border border-dark">Expired Time (sec)</th>
                </tr>
                <SCRIPT language=JavaScript type=text/javascript>
<% if tcWebApi_get("vid_common", "skyvid","h") <> "10" then %>
                  if(index != 11)
                  {
<% end if %>
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
<% if tcWebApi_get("vid_common", "skyvid","h") <> "10" then %>
                 }
<% end if %>
                </SCRIPT>
            </table>
        </div>
        <div class="card-btn-bottom">
            <button class="btn-dashboard" type="button" onclick="Undo()">Refresh</button>
            <button class="btn-dashboard" onclick="Close();">Close</button>
        </div>
    </div>
</body>

</html>