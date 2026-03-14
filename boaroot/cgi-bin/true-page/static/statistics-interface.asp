<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Statistics - Interface</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <script>
    function stLan(domain,RxUnicase,RxMulticast,RxBroadcast,RxDrop,rxbytes,rxpackets,TxUnicase,TxMulticast,TxBroadcast,txbytes,txpackets,rxCrcerr,rxFragmenterr,rxJabbererr,txDrop)
    {
        this.domain = domain;
        this.RxUnicase = RxUnicase;
        this.RxMulticast = RxMulticast;
        this.RxBroadcast = RxBroadcast;
        this.RxDrop = RxDrop;
        this.rxbytes = rxbytes;
        this.rxpackets = rxpackets;
        this.TxUnicase = TxUnicase;
        this.TxMulticast = TxMulticast;
        this.TxBroadcast = TxBroadcast;
        this.txbytes = txbytes;
        this.txpackets = txpackets;
        //add for true
        this.rxCrcerr = rxCrcerr;
        this.rxFragmenterr = rxFragmenterr;
        this.rxJabbererr = rxJabbererr;
        this.txDrop = txDrop;
    }

    var EthPortCapabilityStr = '<% tcWebApi_GetTable("Vid", "EthPortCapability") %>';
    var EthPortCapability = JSON.parse(EthPortCapabilityStr);
    var skylannum = <%tcWebApi_get("Vid_Common","skylannum","s")%>;
    var lanIndex = 0;
    console.log(EthPortCapability);

    //if mesh role is agent
<% if tcwebApi_get("Vid_Lanup","port","h") <> "-1" then %>
<% if tcwebApi_get("Vid_Lanup","is25g","h") <> "1" then %>
<% if tcwebApi_get("Vid_Lanup","change","h") = "1" then %>
    lanIndex++;
<% end if %>
<% end if %>
<% end if %>
    var lanInfo = new Array(skylannum + lanIndex);
    var Rxerror = new Array(skylannum + lanIndex);
    var Info_lanPort;
    var Info_lanPort_Array;
    var Info_eth;
    var Info_eth_Array;
    var lanNameIndex;

    //if mesh role is agent
<% if tcwebApi_get("Vid_Lanup","port","h") <> "-1" then %>
<% if tcwebApi_get("Vid_Lanup","is25g","h") <> "1" then %>
<% if tcwebApi_get("Vid_Lanup","change","h") = "1" then %>
    Info_lanPort = "<% tcwebApi_get("Info_LanUpPort","ALL","s") %>";
    Info_lanPort_Array = Info_lanPort.split('|');
    lanNameIndex = 'LAN(WAN)';

    var lan_up_phy = '<% tcWebApi_get("Vid_Lanup", "port", "s") %>';
    if(lan_up_phy == "1")
    {
      Info_eth = "<% tcwebApi_get("Info_eth0.1","ALL","s") %>";
    }
    else if(lan_up_phy == "2")
    {
      Info_eth = "<% tcwebApi_get("Info_eth0.2","ALL","s") %>";
    }
    else if(lan_up_phy == "3")
    {
      Info_eth = "<% tcwebApi_get("Info_eth0.3","ALL","s") %>";
    }
    else if(lan_up_phy == "4")
    {
      Info_eth = "<% tcwebApi_get("Info_eth0.4","ALL","s") %>";
    }
    Info_eth_Array = Info_eth.split('|');
    lanInfo[0] = new stLan(lanNameIndex,Info_lanPort_Array[0],Info_lanPort_Array[1],Info_lanPort_Array[2],Info_eth_Array[6],Info_eth_Array[2],Info_eth_Array[0],Info_lanPort_Array[5],Info_lanPort_Array[6],Info_lanPort_Array[7],Info_eth_Array[3],Info_eth_Array[1],Info_lanPort_Array[3],Info_lanPort_Array[8],Info_lanPort_Array[9],Info_lanPort_Array[10]);
    Rxerror[0] = (parseInt(lanInfo[0].rxCrcerr) + parseInt(lanInfo[0].rxFragmenterr) + parseInt(lanInfo[0].rxJabbererr));
<% end if %>
<% end if %>
<% end if %>

    for(var i = 0; i < skylannum; i++)
    {
      var currentLanName = EthPortCapability[0]["skylanname" + i];
      var currentVirtualName = EthPortCapability[0]["virtual_name" + i];
      if(currentLanName == "LAN1")
      {
        Info_lanPort = "<% tcwebApi_get("Info_Lan1Port","ALL","s") %>";
        lanNameIndex = 'LAN-1';
      }
      else if(currentLanName == "LAN2")
      {
        Info_lanPort = "<% tcwebApi_get("Info_Lan2Port","ALL","s") %>";
        lanNameIndex = 'LAN-2';
      }
      else if(currentLanName == "LAN3")
      {
        Info_lanPort = "<% tcwebApi_get("Info_Lan3Port","ALL","s") %>";
        lanNameIndex = 'LAN-3';
      }
      else if(currentLanName == "LAN4")
      {
        Info_lanPort = "<% tcwebApi_get("Info_Lan4Port","ALL","s") %>";
        lanNameIndex = 'LAN-4';
      }
      else if(currentLanName == "LAN25")
      {
        Info_lanPort = "<% tcwebApi_get("Info_Lan25Port","ALL","s") %>";
        lanNameIndex = 'LAN(2.5GE)';
      }
      Info_lanPort_Array = Info_lanPort.split('|');
      
      if(currentVirtualName == "eth0.1")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.1","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.2")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.2","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.3")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.3","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.4")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.4","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.5")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.5","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.6")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.6","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.7")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.7","ALL","s") %>";
      }
      else if(currentVirtualName == "eth0.8")
      {
        Info_eth = "<% tcwebApi_get("Info_eth0.8","ALL","s") %>";
      }
      Info_eth_Array = Info_eth.split('|');
      if(currentLanName == "LAN25")
      {
        lanInfo[lanIndex] = new stLan(lanNameIndex,Info_lanPort_Array[7],Info_lanPort_Array[5],Info_lanPort_Array[4],Info_eth_Array[6],Info_eth_Array[2],Info_eth_Array[0],Info_lanPort_Array[6],Info_lanPort_Array[2],Info_lanPort_Array[1],Info_eth_Array[3],Info_eth_Array[1],Info_lanPort_Array[9],Info_lanPort_Array[10],Info_lanPort_Array[11],Info_lanPort_Array[8]);
      }
      else
      {
        lanInfo[lanIndex] = new stLan(lanNameIndex,Info_lanPort_Array[0],Info_lanPort_Array[1],Info_lanPort_Array[2],Info_eth_Array[6],Info_eth_Array[2],Info_eth_Array[0],Info_lanPort_Array[5],Info_lanPort_Array[6],Info_lanPort_Array[7],Info_eth_Array[3],Info_eth_Array[1],Info_lanPort_Array[3],Info_lanPort_Array[8],Info_lanPort_Array[9],Info_lanPort_Array[10]);
      }
      Rxerror[lanIndex] = (parseInt(lanInfo[lanIndex].rxCrcerr) + parseInt(lanInfo[lanIndex].rxFragmenterr) + parseInt(lanInfo[lanIndex].rxJabbererr));
      lanIndex++;
    }

    //This code must be preserved, used to get wlan data
    var info_wlan;
    info_wlan = "<% tcWebApi_get("Info_ra1","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra2","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra3","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra4","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra5","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra6","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_ra7","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai1","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai2","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai3","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai4","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai5","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai6","rxbytes","s") %>";
    info_wlan = "<% tcWebApi_get("Info_rai7","rxbytes","s") %>";

    //get info of wlan0 and wlan1
    var wlanEnbl = "<% TCWebApi_get("WLan_Common", "APOn", "s") %>";
    var wlanacEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";

    var wlaninfo = <% tcWebApi_GetTable("Info","ra","1,7") %>;
    var wlanacinfo = <% tcWebApi_GetTable("Info","rai","1,7") %>;

  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="card-table">
      <div class="title-content">Interface Statistics</div>
      <div class="title-description-content">This page shows the packet statistics for transmission and reception regarding to network interface.</div>
      <table style="width:100%">
        <tr class="table-header center">
            <th style="width: 16%;" class="p-1">Interface</th>
            <th style="width: 22%;">Rx pkt</th>
            <th style="width: 10%;">Rx err</th>
            <th style="width: 10%;">Rx drop</th>
            <th style="width: 22%;">Tx pkt</th>
            <th style="width: 10%;">Tx err</th>
            <th style="width: 10%;">Tx drop</th>
        </tr>
        <SCRIPT language=javascript>
          //lan
          var generate_index;
          for(generate_index = 0; generate_index < lanInfo.length; ++generate_index)
          {
            document.writeln("<tr class='table-content-fist center'>");
            document.writeln("<td class='p-1'>" + lanInfo[generate_index].domain + "</td>");
            document.writeln("<td>" + lanInfo[generate_index].rxpackets + "</td>");
            document.writeln("<td>" + Rxerror[generate_index] + "</td>");
            document.writeln("<td>" + lanInfo[generate_index].RxDrop + "</td>");
            document.writeln("<td>" + lanInfo[generate_index].txpackets + "</td>");
            document.writeln("<td>0</td>");
            document.writeln("<td>" + lanInfo[generate_index].txDrop + "</td>");
            document.writeln("</tr>");
          }
          //wlan
          document.writeln(" <tr class='table-content-fist center'>");
          document.writeln(" <td class='p-1'>wlan0</td>");
          if (wlanEnbl == "1")
          {
            var wlan_rxpackets = 0;
            var wlan_rxerrors = 0;
            var wlan_rxdropped = 0;
            var wlan_txpackets = 0;
            var wlan_txerrors = 0;
            var wlan_txdropped = 0;
            var ssidnum=<% tcWebApi_get("WLan_Common","BssidNum","s") %>;
            for (var i = 0; i < ssidnum - 1; i++)
            {
              wlan_rxpackets += parseInt(wlaninfo[i].rxpackets);
              wlan_rxerrors += parseInt(wlaninfo[i].rxerrors);
              wlan_rxdropped += parseInt(wlaninfo[i].rxdropped);
              wlan_txpackets += parseInt(wlaninfo[i].txpackets);
              wlan_txerrors += parseInt(wlaninfo[i].txerrors);
              wlan_txdropped += parseInt(wlaninfo[i].txdropped);
            }
            document.writeln("<td>" + wlan_rxpackets + "</td>");
            document.writeln(" <td>"+ wlan_rxerrors +"</td>");
            document.writeln("<td>" + wlan_rxdropped + "</td>");
            document.writeln("<td>" + wlan_txpackets + "&nbsp;</td>");
            document.writeln("<td>" + wlan_txerrors + "&nbsp;</td>");
            document.writeln("<td>" + wlan_txdropped + "&nbsp;</td>");
          }
          document.writeln("  </tr>");
          //wlan11ac
          document.writeln(" <tr class='table-content-fist center'>");
          document.writeln(" <td class='p-1'>wlan1</td>");
          if (wlanacEnbl == "1")
          {
            var wlanac_rxpackets = 0;
            var wlanac_rxerrors = 0;
            var wlanac_rxdropped = 0;
            var wlanac_txpackets = 0;
            var wlanac_txerrors = 0;
            var wlanac_txdropped = 0;
            var ssidnum=<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>;
            for (var i = 0; i < ssidnum - 1; i++)
            {
              wlanac_rxpackets += parseInt(wlanacinfo[i].rxpackets);
              wlanac_rxerrors += parseInt(wlanacinfo[i].rxerrors);
              wlanac_rxdropped += parseInt(wlanacinfo[i].rxdropped);
              wlanac_txpackets += parseInt(wlanacinfo[i].txpackets);
              wlanac_txerrors += parseInt(wlanacinfo[i].txerrors);
              wlanac_txdropped += parseInt(wlanacinfo[i].txdropped);
            }
            document.writeln("<td>" + wlanac_rxpackets + "</td>");
            document.writeln(" <td>"+ wlanac_rxerrors +"</td>");
            document.writeln("<td>" + wlanac_rxdropped + "</td>");
            document.writeln("<td>" + wlanac_txpackets + "&nbsp;</td>");
            document.writeln("<td>" + wlanac_txerrors + "&nbsp;</td>");
            document.writeln("<td>" + wlanac_txdropped + "&nbsp;</td>");
          }
          document.writeln("  </tr>");
        </SCRIPT>
      </table>
    </div>
    <div class="card-btn-bottom">
      <button class="btn-dashboard" id="Refresh">Refresh</button>
      <!-- <button class="btn-file button-disable-gray" disabled>Reset Statistics </button> -->
    </div>
  </div>
  <!-- content -->
</body>
<script>
  $('#Refresh').click(function()
  {
      location.reload();
  });
</script>
</html>
<!--
   旧页面：sta-network_ng.asp
-->
