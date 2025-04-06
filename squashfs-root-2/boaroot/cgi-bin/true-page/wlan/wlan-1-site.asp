<%
if Request_Form("apList_Flag") = "1" then 
	TCWebApi_set("wifiNeighborTabWeb_Common","IFIndex","wlan11ac_Flag")
	tcWebApi_constSet("wifiNeighborTabWeb_Common","refreshFlag1","1")
	TCWebApi_commit("wifiNeighborTabWeb")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Site Survey</title>
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
</head>

<body>
  <script language=JavaScript type=text/javascript>
  $(function(){
    <% if tcwebApi_get("wifiNeighborTabWeb_Common","refreshFlag1","h") <> "1" then %>
    btnReflash();
    <% else %>
    <% tcWebApi_constSet("wifiNeighborTabWeb_Common","refreshFlag1","0") %>
    <% end if %>
  });

  function setApList(Domain, SSID, RSSI, BSSID, Channel, Security, Signal)
  {
    this.Domain = Domain;
    this.SSID = SSID;
    this.RSSI = RSSI;
    this.BSSID = BSSID;
    this.Channel = Channel;
    if(Security.indexOf('/') >= 0){
      var info = Security.split("/");
      var auth,Encrypt;
      if(info[0].toUpperCase () == "WPAPSK"){
        auth = "WPA-PSK";
      }else if(info[0].toUpperCase () == "WPA2PSK"){
        auth = "WPA2-PSK";
      }else if(info[0].toUpperCase () == "WPAPSKWPA2PSK"){
        auth = "WPA-PSK/WPA2-PSK";
      }else{
        auth = info[0].toUpperCase ();
      }
      if(info[1].toUpperCase () == "TKIPAES"){
        Encrypt = "TKIP+AES";
      }else{
        Encrypt = info[1].toUpperCase ();
      }
      Security = auth + "/" + Encrypt;
    }
    this.Security = Security;
    this.Signal = Signal;
  }

  function GetApListInfo()
  {
    var ncount = 32;
    var	nCurTemp = 0;		
    var	vcurLinks = new Array(ncount);
    var array1;
    var stalist1_num = "<% tcWebApi_get("wifiNeighborTabWeb_Common","NUM1","s") %>";
    var	list1 = new Array(ncount);
    if(stalist1_num != "N/A" && stalist1_num != 0){
      list1[0] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry0","ALL","s") %>";
      list1[1] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry1","ALL","s") %>";
      list1[2] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry2","ALL","s") %>";
      list1[3] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry3","ALL","s") %>";
      list1[4] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry4","ALL","s") %>";
      list1[5] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry5","ALL","s") %>";
      list1[6] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry6","ALL","s") %>";
      list1[7] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry7","ALL","s") %>";
      list1[8] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry8","ALL","s") %>";
      list1[9] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry9","ALL","s") %>";
      list1[10] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry10","ALL","s") %>";
      list1[11] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry11","ALL","s") %>";
      list1[12] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry12","ALL","s") %>";
      list1[13] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry13","ALL","s") %>";
      list1[14] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry14","ALL","s") %>";
      list1[15] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry15","ALL","s") %>";
      list1[16] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry16","ALL","s") %>";
      list1[17] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry17","ALL","s") %>";
      list1[18] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry18","ALL","s") %>";
      list1[19] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry19","ALL","s") %>";
      list1[20] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry20","ALL","s") %>";
      list1[21] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry21","ALL","s") %>";
      list1[22] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry22","ALL","s") %>";
      list1[23] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry23","ALL","s") %>";
      list1[24] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry24","ALL","s") %>";
      list1[25] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry25","ALL","s") %>";
      list1[26] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry26","ALL","s") %>";
      list1[27] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry27","ALL","s") %>";
      list1[28] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry28","ALL","s") %>";
      list1[29] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry29","ALL","s") %>";
      list1[30] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry30","ALL","s") %>";
      list1[31] = "<% tcWebApi_get("wifiNeighborTabWeb_PVC1_Entry31","ALL","s") %>";
    }
    for(var i=0; i<stalist1_num; i++)
    {
      if(list1[i] != "N/A")
      {
        array1 = list1[i].split("|");
        vcurLinks[nCurTemp++] = new setApList(i, array1[0], array1[1], array1[2], array1[3], array1[4], array1[5]);
      }
    }
    var	vObjRet = new Array(nCurTemp+1);
    for(var m=0; m<nCurTemp; m++)
    {
      vObjRet[m] = vcurLinks[m];
    }
    vObjRet[nCurTemp] = null;
    return vObjRet;
  }

  var ApListInfo = GetApListInfo();
  function btnReflash()
  {
    document.apList.apList_Flag.value = "1";
    //document.apList.submit();
    //showLoading();
    window.parent.postMessage("showLoading", location.origin);
    var formData = $("#apList").serialize();
    var formName = $("#apList").attr("action");
    deferAjax(formName, formData)
    .done(function(_html){
      //console.log(_html);
      document.write(_html);
      document.close();
      window.parent.postMessage("hideLoading", location.origin);
    })
    .fail(function(fail){
      //console.log(fail);
      window.parent.postMessage("hideLoading", location.origin);
      alert("Request error! Please try again.");
    });
  }
  </script>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="card-table">
      <div class="title-content">Neighbors AP</div>
      <div class="title-description-content">This page provides tool to scan the wireless network. If any Access Point or IBSS is found, you could choose to connect it manually when client mode is enabled.</div>
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 20%;" class="p-1">SSID</th>
          <th style="width: 20%;">BSSID</th>
          <th style="width: 12%;">Channel</th>
          <th style="width: 12%;">Type</th>
          <th style="width: 12%;">Encryption</th>
          <th style="width: 12%;">RSSI</th>
          <th style="width: 12%;">Signal(%)</th>
        </tr>
        <script language=JavaScript type=text/javascript>
        for (i = 0; i < ApListInfo.length-1; i++)
        {
          if( (ApListInfo[i].SSID.indexOf("SKYMESH_") != -1) && (ApListInfo[i].SSID.indexOf("_BH_") != -1) )
            continue;
          document.writeln('<tr class="table-content-fist center">');
          document.writeln('<td class="p-1">' + ApListInfo[i].SSID + '</td>');
          document.writeln('<td>' + ApListInfo[i].BSSID + '</td>');
          document.writeln('<td>' + ApListInfo[i].Channel + '</td>');
          document.writeln('<td>AP</td>');
          document.writeln('<td>' + ApListInfo[i].Security + '</td>');
          document.writeln('<td>' + ApListInfo[i].RSSI + '</td>');
          document.writeln('<td>' + ApListInfo[i].Signal + '</td>');
          document.writeln('</tr>');
        }
        </script>
      </table>
    </div>
    <form name="apList" id="apList" action="/cgi-bin/true-page/wlan/wlan-1-site.asp" method="post">
      <input type="hidden" name="apList_Flag" value="0">
      <input type="hidden" name="wlan11ac_Flag" value="1">
    </form>
    <div class="card-btn-bottom">
      <button type="button" id="Refresh" onclick="btnReflash()" class="btn-dashboard">Refresh</button>
    </div>
  </div>
  <!-- content -->
</body>

</html>