<%
If Request_Form("saveFlag")="1" Then
  'TCWebApi_set("wlan_entry1","EnableSSID","enableAP1")
  TCWebApi_set("wlan_entry2","EnableSSID","enableAP2")
  TCWebApi_set("wlan_entry3","EnableSSID","enableAP3")
  TCWebApi_set("wlan_entry4","EnableSSID","enableAP4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","EnableSSID","enableAP5")
  TCWebApi_set("wlan_entry6","EnableSSID","enableAP6")
  TCWebApi_set("wlan_entry7","EnableSSID","enableAP7")
end if

  'TCWebApi_set("wlan_entry1","SSID","SSIDAP1")
  TCWebApi_set("wlan_entry2","SSID","SSIDAP2")
  TCWebApi_set("wlan_entry3","SSID","SSIDAP3")
  TCWebApi_set("wlan_entry4","SSID","SSIDAP4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","SSID","SSIDAP5")
  TCWebApi_set("wlan_entry6","SSID","SSIDAP6")
  TCWebApi_set("wlan_entry7","SSID","SSIDAP7")
  TCWebApi_set("wlan_entry0","SSID","SSIDAP8")
end if

  'TCWebApi_set("wlan_entry1","HideSSID","hideSSIDAP1")
  TCWebApi_set("wlan_entry2","HideSSID","hideSSIDAP2")
  TCWebApi_set("wlan_entry3","HideSSID","hideSSIDAP3")
  TCWebApi_set("wlan_entry4","HideSSID","hideSSIDAP4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","HideSSID","hideSSIDAP5")
  TCWebApi_set("wlan_entry6","HideSSID","hideSSIDAP6")
  TCWebApi_set("wlan_entry7","HideSSID","hideSSIDAP7")
  TCWebApi_set("wlan_entry0","HideSSID","hideSSIDAP8")
end if

  'TCWebApi_set("wlan_entry1","WMM","WMMAP1")
  TCWebApi_set("wlan_entry2","WMM","WMMAP2")
  TCWebApi_set("wlan_entry3","WMM","WMMAP3")
  TCWebApi_set("wlan_entry4","WMM","WMMAP4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","WMM","WMMAP5")
  TCWebApi_set("wlan_entry6","WMM","WMMAP6")
  TCWebApi_set("wlan_entry7","WMM","WMMAP7")
  TCWebApi_set("wlan_entry0","WMM","WMMAP8")
end if

  'TCWebApi_set("wlan_entry1","IgmpSnEn","IgmpSnEnAP1")
  TCWebApi_set("wlan_entry2","IgmpSnEn","IgmpSnEnAP2")
  TCWebApi_set("wlan_entry3","IgmpSnEn","IgmpSnEnAP3")
  TCWebApi_set("wlan_entry4","IgmpSnEn","IgmpSnEnAP4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","IgmpSnEn","IgmpSnEnAP5")
  TCWebApi_set("wlan_entry6","IgmpSnEn","IgmpSnEnAP6")
  TCWebApi_set("wlan_entry7","IgmpSnEn","IgmpSnEnAP7")
  TCWebApi_set("wlan_entry0","IgmpSnEn","IgmpSnEnAP8")
end if

  'TCWebApi_set("wlan_entry1","GuestNetwork","GuestNetwork1")
  TCWebApi_set("wlan_entry2","GuestNetwork","GuestNetwork2")
  TCWebApi_set("wlan_entry3","GuestNetwork","GuestNetwork3")
  TCWebApi_set("wlan_entry4","GuestNetwork","GuestNetwork4")
if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then 
  TCWebApi_set("wlan_entry5","GuestNetwork","GuestNetwork5")
  TCWebApi_set("wlan_entry6","GuestNetwork","GuestNetwork6")
  TCWebApi_set("wlan_entry7","GuestNetwork","GuestNetwork7")
  TCWebApi_set("wlan_entry0","GuestNetwork","GuestNetwork8")
end if

  TCWebApi_save()
  tcWebApi_commit("wlan_Entry")
End If
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Multiple APs</title>
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
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-1-multiple-aps.asp" method="post" >
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="saveFlag" value="0" >
      <!-- <input TYPE="hidden" name="enableAP1" value="<% if tcWebApi_get("wlan_entry1","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" > -->
      <input TYPE="hidden" name="enableAP2" value="<% if tcWebApi_get("wlan_entry2","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="enableAP3" value="<% if tcWebApi_get("wlan_entry3","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="enableAP4" value="<% if tcWebApi_get("wlan_entry4","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <input TYPE="hidden" name="enableAP5" value="<% if tcWebApi_get("wlan_entry5","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="enableAP6" value="<% if tcWebApi_get("wlan_entry6","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="enableAP7" value="<% if tcWebApi_get("wlan_entry7","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="enableAP8" value="<% if tcWebApi_get("wlan_entry0","EnableSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% end if %>

      <!-- <input TYPE="hidden" name="hideSSIDAP1" value="<% if tcWebApi_get("wlan_entry1","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" > -->
      <input TYPE="hidden" name="hideSSIDAP2" value="<% if tcWebApi_get("wlan_entry2","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="hideSSIDAP3" value="<% if tcWebApi_get("wlan_entry3","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="hideSSIDAP4" value="<% if tcWebApi_get("wlan_entry4","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <input TYPE="hidden" name="hideSSIDAP5" value="<% if tcWebApi_get("wlan_entry5","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="hideSSIDAP6" value="<% if tcWebApi_get("wlan_entry6","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="hideSSIDAP8" value="<% if tcWebApi_get("wlan_entry0","HideSSID","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% end if %>

      <!-- <input TYPE="hidden" name="WMMAP1" value="<% if tcWebApi_get("wlan_entry1","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" > -->
      <input TYPE="hidden" name="WMMAP2" value="<% if tcWebApi_get("wlan_entry2","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="WMMAP3" value="<% if tcWebApi_get("wlan_entry3","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="WMMAP4" value="<% if tcWebApi_get("wlan_entry4","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <input TYPE="hidden" name="WMMAP5" value="<% if tcWebApi_get("wlan_entry5","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="WMMAP6" value="<% if tcWebApi_get("wlan_entry6","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="WMMAP7" value="<% if tcWebApi_get("wlan_entry7","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="WMMAP8" value="<% if tcWebApi_get("wlan_entry0","WMM","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% end if %>

      <!-- <input TYPE="hidden" name="IgmpSnEnAP1" value="<% if tcWebApi_get("wlan_entry1","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" > -->
      <input TYPE="hidden" name="IgmpSnEnAP2" value="<% if tcWebApi_get("wlan_entry2","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="IgmpSnEnAP3" value="<% if tcWebApi_get("wlan_entry3","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="IgmpSnEnAP4" value="<% if tcWebApi_get("wlan_entry4","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <input TYPE="hidden" name="IgmpSnEnAP5" value="<% if tcWebApi_get("wlan_entry5","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="IgmpSnEnAP6" value="<% if tcWebApi_get("wlan_entry6","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="IgmpSnEnAP7" value="<% if tcWebApi_get("wlan_entry7","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="IgmpSnEnAP8" value="<% if tcWebApi_get("wlan_entry0","IgmpSnEn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% end if %>

      <!-- <input TYPE="hidden" name="GuestNetwork1" value="<% if tcWebApi_get("wlan_entry1","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" > -->
      <input TYPE="hidden" name="GuestNetwork2" value="<% if tcWebApi_get("wlan_entry2","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="GuestNetwork3" value="<% if tcWebApi_get("wlan_entry3","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="GuestNetwork4" value="<% if tcWebApi_get("wlan_entry4","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <input TYPE="hidden" name="GuestNetwork5" value="<% if tcWebApi_get("wlan_entry5","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="GuestNetwork6" value="<% if tcWebApi_get("wlan_entry6","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="GuestNetwork7" value="<% if tcWebApi_get("wlan_entry7","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <input TYPE="hidden" name="GuestNetwork8" value="<% if tcWebApi_get("wlan_entry0","GuestNetwork","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
<% end if %>
      <div class="card-table">
        <div class="title-content">WLAN - Multiple APs</div>
        <p class="pl-2">This page show and updates the wireless setting for multiple APs.</p>
        <table style="width:100%">
          <tr class="table-header center">
            <th class="p-1">Index</th>
            <th>Enable</th>
            <th style="width: 22%">Band</th>
            <th style="width: 13%">Data Rate:</th>
            <th style="width: 30%">SSID</th>
            <th style="width: 5%">BroadCast SSID</th>
            <th>WMM</th>
            <!--<th>Ready Blocking</th>-->
            <!--<th style="width: 10%">Active Client List</th>-->
            <th style="width: 5%">MultiCast to Unicast</th>
            <th>Guest Network</th>
          </tr>
          <tr class="table-content-fist center" name="SSID1" id="SSID1">
            <td class="p-1" name="TEXT1" id="TEXT1">AP1</td>
            <td><input type="checkbox" name="enableSsid1" id="enableSsid1" onclick="SSIDEnableClick(1)" <% if tcWebApi_get("wlan_entry1","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode1" name="WirelessMode1" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate1" name="DataRate1" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP1" name="SSIDAP1" disabled value='<% If tcWebApi_get("wlan_Entry1","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry1","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID1" id="broadCastSSID1" disabled <% If tcWebApi_get("wlan_Entry1","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM1" id="WMM1" disabled <% If tcWebApi_get("wlan_Entry1","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=1">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn1" id="IgmpSnEn1" disabled></td>
            <td><input type="checkbox" name="GuestNet1" id="GuestNet1" <% If tcWebApi_get("wlan_Entry1","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID2" id="SSID2">
            <td class="p-1" id="TEXT2" name="TEXT2">AP2</td>
            <td><input type="checkbox" name="enableSsid2" id="enableSsid2" onclick="SSIDEnableClick(2)" <% if tcWebApi_get("wlan_entry2","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode2" name="WirelessMode2" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate2" name="DataRate2" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP2" name="SSIDAP2" disabled value='<% If tcWebApi_get("wlan_Entry2","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry2","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID2" id="broadCastSSID2" disabled <% If tcWebApi_get("wlan_Entry2","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM2" id="WMM2" disabled <% If tcWebApi_get("wlan_Entry2","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=2">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn2" id="IgmpSnEn2" disabled></td>
            <td><input type="checkbox" name="GuestNet2" id="GuestNet2" <% If tcWebApi_get("wlan_Entry2","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID3" id="SSID3">
            <td class="p-1" id="TEXT3" name="TEXT3">AP3</td>
            <td><input type="checkbox" name="enableSsid3" id="enableSsid3" onclick="SSIDEnableClick(3)" <% if tcWebApi_get("wlan_entry3","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode3" name="WirelessMode3" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate3" name="DataRate3" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP3" name="SSIDAP3" disabled value='<% If tcWebApi_get("wlan_Entry3","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry3","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID3" id="broadCastSSID3" disabled <% If tcWebApi_get("wlan_Entry3","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM3" id="WMM3" disabled <% If tcWebApi_get("wlan_Entry3","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=3">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn3" id="IgmpSnEn3" disabled></td>
            <td><input type="checkbox" name="GuestNet3" id="GuestNet3" <% If tcWebApi_get("wlan_Entry3","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID4" id="SSID4">
            <td class="p-1" id="TEXT4" name="TEXT4">AP4</td>
            <td><input type="checkbox" name="enableSsid4" id="enableSsid4" onclick="SSIDEnableClick(4)" <% if tcWebApi_get("wlan_entry4","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode4" name="WirelessMode4" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate4" name="DataRate4" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP4" name="SSIDAP4" disabled value='<% If tcWebApi_get("wlan_Entry4","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry4","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID4" id="broadCastSSID4" disabled <% If tcWebApi_get("wlan_Entry4","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM4" id="WMM4" disabled <% If tcWebApi_get("wlan_Entry4","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=4">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn4" id="IgmpSnEn4" disabled></td>
            <td><input type="checkbox" name="GuestNet4" id="GuestNet4" <% If tcWebApi_get("wlan_Entry4","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID5" id="SSID5">
            <td class="p-1" id="TEXT5" name="TEXT5">AP5</td>
            <td><input type="checkbox" name="enableSsid5" id="enableSsid5" onclick="SSIDEnableClick(5)" <% if tcWebApi_get("wlan_entry5","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode5" name="WirelessMode5" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate5" name="DataRate5" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP5" name="SSIDAP5" disabled value='<% If tcWebApi_get("wlan_Entry5","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry5","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID5" id="broadCastSSID5" disabled <% If tcWebApi_get("wlan_Entry5","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM5" id="WMM5" disabled <% If tcWebApi_get("wlan_Entry5","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=5">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn5" id="IgmpSnEn5" disabled></td>
            <td><input type="checkbox" name="GuestNet5" id="GuestNet5" <% If tcWebApi_get("wlan_Entry5","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID6" id="SSID6">
            <td class="p-1" id="TEXT6" name="TEXT6">AP6</td>
            <td><input type="checkbox" name="enableSsid6" id="enableSsid6" onclick="SSIDEnableClick(6)" <% if tcWebApi_get("wlan_entry6","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode6" name="WirelessMode6" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate6" name="DataRate6" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP6" name="SSIDAP6" disabled value='<% If tcWebApi_get("wlan_Entry6","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry6","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID6" id="broadCastSSID6" disabled <% If tcWebApi_get("wlan_Entry6","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM6" id="WMM6" disabled <% If tcWebApi_get("wlan_Entry6","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=6">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn6" id="IgmpSnEn6" disabled></td>
            <td><input type="checkbox" name="GuestNet6" id="GuestNet6" <% If tcWebApi_get("wlan_Entry6","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>
          <tr class="table-content-fist center" name="SSID7" id="SSID7">
            <td class="p-1" id="TEXT7" name="TEXT7">AP7</td>
            <td><input type="checkbox" name="enableSsid7" id="enableSsid7" onclick="SSIDEnableClick(7)" <% if tcWebApi_get("wlan_entry7","EnableSSID","h") = "1" then asp_Write("checked") end if %>></td>
            <td>
              <select class="form-control input-select" id="WirelessMode7" name="WirelessMode7" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate7" name="DataRate7" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP7" name="SSIDAP7" disabled value='<% If tcWebApi_get("wlan_Entry7","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry7","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID7" id="broadCastSSID7" disabled <% If tcWebApi_get("wlan_Entry7","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM7" id="WMM7" disabled <% If tcWebApi_get("wlan_Entry7","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=7">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn7" id="IgmpSnEn7" disabled></td>
            <td><input type="checkbox" name="GuestNet7" id="GuestNet7" <% If tcWebApi_get("wlan_Entry7","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>

          <tr class="table-content-fist center" name="SSID8" id="SSID8">
            <td class="p-1" id="TEXT8" name="TEXT8">AP8</td>
            <td><input type="checkbox" name="enableSsid8" id="enableSsid8" onclick="SSIDEnableClick(8)" <% if tcWebApi_get("wlan_entry0","EnableSSID","h") = "1" then asp_Write("checked") end if %> disabled></td>
            <td>
              <select class="form-control input-select" id="WirelessMode8" name="WirelessMode8" disabled>
                <option value="b,g,n" >2.4GHz (B+G+N)</option>
                <option value="b,g" >2.4GHz (B+G)</option>
                <option value="n,g" >2.4GHz (G+N)</option>
                <option value="n" >2.4GHz (N)</option>
                <option value="g" >2.4GHz (G)</option>
                <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
                <option value="g,n,ax">802.11g/n/ax Mixed</option>
<% end if %>
              </select>
            </td>
            <td>
              <select class="form-control input-select" id="DataRate8" name="DataRate8" disabled></select>
            </td>
            <td><input type="text" class="form-control input-textfield m-1" id="SSIDAP8" name="SSIDAP8" disabled value='<% If tcWebApi_get("wlan_Entry0","SSID","h") <> "N/A" then tcWebApi_get("wlan_Entry0","SSID","s") end if %>'></td>
            <td><input type="checkbox" name="broadCastSSID8" id="broadCastSSID8" disabled <% If tcWebApi_get("wlan_Entry0","HideSSID","h") = "0" then asp_Write("checked") end if %> ></td>
            <td><input type="checkbox" name="WMM8" id="WMM8" disabled <% If tcWebApi_get("wlan_Entry0","WMM","h") = "1" then asp_Write("checked") end if %> ></td>
            <!--<td><input type="text" class="form-control input-textfield m-1" value="Enable" disabled></td>-->
            <!--<td><a class="btn-file btn-a" href="/cgi-bin/true-page/status/status-wlan-active.asp?index=7">show</a></td>-->
            <td><input type="checkbox" name="IgmpSnEn8" id="IgmpSnEn8" disabled></td>
            <td><input type="checkbox" name="GuestNet8" id="GuestNet8" <% If tcWebApi_get("wlan_Entry0","GuestNetwork","h") = "1" then asp_Write("checked") end if %> disabled></td>
          </tr>

        </table>
      </div>
      <div class="card-btn-bottom">
          <button class="btn-dashboard" type="button" onclick="doSave()">Apply Changes</button>
          <button class="btn-dashboard">Reset</button>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    function SSIDEnableClick(num)
    {
      var enableSsid = "#enableSsid" + num;
      var SSIDAP = "#SSIDAP" + num;
      var broadCastSSID = "#broadCastSSID" + num;
      var WMM = "#WMM" + num;
      var IgmpSnEn = "#IgmpSnEn" +num;
      var GuestNet = "#GuestNet" +num;
      if ($(enableSsid).prop("checked") == true)
      {
        $(SSIDAP).removeAttr("disabled");
        if(num != "8")
        {
          $(broadCastSSID).removeAttr("disabled");
          $(WMM).removeAttr("disabled");
          $(IgmpSnEn).removeAttr("disabled");
          $(GuestNet).removeAttr("disabled");
        }
      }
      else
      {
        $(SSIDAP).attr("disabled", "disabled");
        $(broadCastSSID).attr("disabled", "disabled");
        $(WMM).attr("disabled", "disabled");
        $(IgmpSnEn).attr("disabled", "disabled");
        $(GuestNet).attr("disabled", "disabled");
      }
    }

    function doSave()
    {
      if(checkPara())
      {
        SetCtlValue();
        $("input[name='saveFlag']").val(1);
        document.ConfigForm.submit();
      }
    }

    function checkPara() 
    {
      var web_ssid_2g_all =
       [
            "<% tcWebApi_get("wlan_entry1", "SSID", "s") %>",
            document.ConfigForm.SSIDAP2.value,
            document.ConfigForm.SSIDAP3.value,
            document.ConfigForm.SSIDAP4.value,
            document.ConfigForm.SSIDAP5.value,
            document.ConfigForm.SSIDAP6.value,
            document.ConfigForm.SSIDAP7.value,
            document.ConfigForm.SSIDAP8.value
      ];
      
      for (var i = 0; i < web_ssid_2g_all.length; i++) {
          for (var j = i + 1; j < web_ssid_2g_all.length; j++) {
             if (web_ssid_2g_all[i] === web_ssid_2g_all[j]) {
                alert("Do not repeat the name: " + web_ssid_2g_all[i] + " !");
                return false;
             }
          }
      }
      /*
      if(!SSIDCheck(document.ConfigForm.SSIDAP1))
      {
        return false;
      }
      */
      if(!SSIDCheck(document.ConfigForm.SSIDAP2))
      {
        return false;
      }
      if(!SSIDCheck(document.ConfigForm.SSIDAP3))
      {
        return false;
      }
      if(!SSIDCheck(document.ConfigForm.SSIDAP4))
      {
        return false;
      }
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if(!SSIDCheck(document.ConfigForm.SSIDAP5))
      {
        return false;
      }
      if(!SSIDCheck(document.ConfigForm.SSIDAP6))
      {
        return false;
      }
      if(!SSIDCheck(document.ConfigForm.SSIDAP7))
      {
        return false;
      }
      if(!SSIDCheck(document.ConfigForm.SSIDAP8))
      {
        return false;
      }
<% end if %>
      return true;
    }

    function SSIDCheck(obj) 
    {
      if(obj.value.length <= 0)
      {
        alert("SSID is empty");
        return false;
      }
      if(obj.value.match(/[^\x00-\xff]/g))
      {
        alert("Invalid SSID Input!");
        return false;
      }
      if (obj.value.indexOf("\\") >= 0 )
      {
        alert("SSID cannot contain backslashes.");
        return false;
      }
      if (obj.value.indexOf("\"") >= 0 )
      {
        alert("SSID cannot contain double quotation marks.");
        return false;
      }
      if (obj.value.indexOf("'") >= 0 )
      {
        alert("SSID cannot contain single quotation marks.");
        return false;
      }
	  if (obj.value.charAt(obj.value.length - 1) == ' ' )
      {
        alert("SSID must not be end with space or tab characters.");
        return false;
      }
      
      return true;
    }
    
    function SetCtlValue(){
      //enableSsid
      /*
      if($("#enableSsid1").prop("checked"))
        $("input[name='enableAP1']").val(1);
      else
        $("input[name='enableAP1']").val(0);
      */

      if($("#enableSsid2").prop("checked"))
        $("input[name='enableAP2']").val(1);
      else
        $("input[name='enableAP2']").val(0);

      if($("#enableSsid3").prop("checked"))
        $("input[name='enableAP3']").val(1);
      else
        $("input[name='enableAP3']").val(0);

      if($("#enableSsid4").prop("checked"))
        $("input[name='enableAP4']").val(1);
      else
        $("input[name='enableAP4']").val(0);

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if($("#enableSsid5").prop("checked"))
        $("input[name='enableAP5']").val(1);
      else
        $("input[name='enableAP5']").val(0);

      if($("#enableSsid6").prop("checked"))
        $("input[name='enableAP6']").val(1);
      else
        $("input[name='enableAP6']").val(0);

      if($("#enableSsid7").prop("checked"))
        $("input[name='enableAP7']").val(1);
      else
        $("input[name='enableAP7']").val(0);
      if($("#enableSsid8").prop("checked"))
        $("input[name='enableAP8']").val(1);
      else
        $("input[name='enableAP8']").val(0);
<% end if %>

      //broadCastSSID
      /*
      if($("#broadCastSSID1").prop("checked"))
        $("input[name='hideSSIDAP1']").val(0);
      else
        $("input[name='hideSSIDAP1']").val(1);
      */

      if($("#broadCastSSID2").prop("checked"))
        $("input[name='hideSSIDAP2']").val(0);
      else
        $("input[name='hideSSIDAP2']").val(1);

      if($("#broadCastSSID3").prop("checked"))
        $("input[name='hideSSIDAP3']").val(0);
      else
        $("input[name='hideSSIDAP3']").val(1);

      if($("#broadCastSSID4").prop("checked"))
        $("input[name='hideSSIDAP4']").val(0);
      else
        $("input[name='hideSSIDAP4']").val(1);

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if($("#broadCastSSID5").prop("checked"))
        $("input[name='hideSSIDAP5']").val(0);
      else
        $("input[name='hideSSIDAP5']").val(1);

      if($("#broadCastSSID6").prop("checked"))
        $("input[name='hideSSIDAP6']").val(0);
      else
        $("input[name='hideSSIDAP6']").val(1);

      if($("#broadCastSSID7").prop("checked"))
        $("input[name='hideSSIDAP7']").val(0);
      else
        $("input[name='hideSSIDAP7']").val(1);
      if($("#broadCastSSID8").prop("checked"))
        $("input[name='hideSSIDAP8']").val(0);
      else
        $("input[name='hideSSIDAP8']").val(1);
<% end if %>

      //WMM
      /*
      if($("#WMM1").prop("checked"))
        $("input[name='WMMAP1']").val(1);
      else
        $("input[name='WMMAP1']").val(0);
      */

      if($("#WMM2").prop("checked"))
        $("input[name='WMMAP2']").val(1);
      else
        $("input[name='WMMAP2']").val(0);

      if($("#WMM3").prop("checked"))
        $("input[name='WMMAP3']").val(1);
      else
        $("input[name='WMMAP3']").val(0);

      if($("#WMM4").prop("checked"))
        $("input[name='WMMAP4']").val(1);
      else
        $("input[name='WMMAP4']").val(0);

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if($("#WMM5").prop("checked"))
        $("input[name='WMMAP5']").val(1);
      else
        $("input[name='WMMAP5']").val(0);

      if($("#WMM6").prop("checked"))
        $("input[name='WMMAP6']").val(1);
      else
        $("input[name='WMMAP6']").val(0);

      if($("#WMM7").prop("checked"))
        $("input[name='WMMAP7']").val(1);
      else
        $("input[name='WMMAP7']").val(0);
      if($("#WMM8").prop("checked"))
        $("input[name='WMMAP8']").val(1);
      else
        $("input[name='WMMAP8']").val(0);
<% end if %>

      //IgmpSnEn
      /*
      if($("#IgmpSnEn1").prop("checked"))
        $("input[name='IgmpSnEnAP1']").val(1);
      else
        $("input[name='IgmpSnEnAP1']").val(0);
      */

      if($("#IgmpSnEn2").prop("checked"))
        $("input[name='IgmpSnEnAP2']").val(1);
      else
        $("input[name='IgmpSnEnAP2']").val(0);

      if($("#IgmpSnEn3").prop("checked"))
        $("input[name='IgmpSnEnAP3']").val(1);
      else
        $("input[name='IgmpSnEnAP3']").val(0);

      if($("#IgmpSnEn4").prop("checked"))
        $("input[name='IgmpSnEnAP4']").val(1);
      else
        $("input[name='IgmpSnEnAP4']").val(0);

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if($("#IgmpSnEn5").prop("checked"))
        $("input[name='IgmpSnEnAP5']").val(1);
      else
        $("input[name='IgmpSnEnAP5']").val(0);

      if($("#IgmpSnEn6").prop("checked"))
        $("input[name='IgmpSnEnAP6']").val(1);
      else
        $("input[name='IgmpSnEnAP6']").val(0);

      if($("#IgmpSnEn7").prop("checked"))
        $("input[name='IgmpSnEnAP7']").val(1);
      else
        $("input[name='IgmpSnEnAP7']").val(0);

      if($("#IgmpSnEn8").prop("checked"))
        $("input[name='IgmpSnEnAP8']").val(1);
      else
        $("input[name='IgmpSnEnAP8']").val(0);
<% end if %>

      //GuestNet
      /*
      if($("#GuestNet1").prop("checked"))
        $("input[name='GuestNetwork1']").val(1);
      else
        $("input[name='GuestNetwork1']").val(0);
      */

      if($("#GuestNet2").prop("checked"))
        $("input[name='GuestNetwork2']").val(1);
      else
        $("input[name='GuestNetwork2']").val(0);

      if($("#GuestNet3").prop("checked"))
        $("input[name='GuestNetwork3']").val(1);
      else
        $("input[name='GuestNetwork3']").val(0);

      if($("#GuestNet4").prop("checked"))
        $("input[name='GuestNetwork4']").val(1);
      else
        $("input[name='GuestNetwork4']").val(0);

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      if($("#GuestNet5").prop("checked"))
        $("input[name='GuestNetwork5']").val(1);
      else
        $("input[name='GuestNetwork5']").val(0);

      if($("#GuestNet6").prop("checked"))
        $("input[name='GuestNetwork6']").val(1);
      else
        $("input[name='GuestNetwork6']").val(0);

      if($("#GuestNet7").prop("checked"))
        $("input[name='GuestNetwork7']").val(1);
      else
        $("input[name='GuestNetwork7']").val(0);

      if($("#GuestNet8").prop("checked"))
        $("input[name='GuestNetwork8']").val(1);
      else
        $("input[name='GuestNetwork8']").val(0);
<% end if %>
    }

    function initIgmp() 
    {
      /*
      <% if tcWebApi_get("wlan_Entry1","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn1").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry1","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn1").prop("checked",'checked');
        <% end if %>
      <% end if %>
      */

      <% if tcWebApi_get("wlan_Entry2","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn2").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry2","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn2").prop("checked",'checked');
        <% end if %>
      <% end if %>
      
      <% if tcWebApi_get("wlan_Entry3","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn3").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry3","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn3").prop("checked",'checked');
        <% end if %>
      <% end if %>
      
      <% if tcWebApi_get("wlan_Entry4","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn4").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry4","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn4").prop("checked",'checked');
        <% end if %>
      <% end if %>

<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <% if tcWebApi_get("wlan_Entry5","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn5").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry5","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn5").prop("checked",'checked');
        <% end if %>
      <% end if %>

      <% if tcWebApi_get("wlan_Entry6","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn6").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry6","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn6").prop("checked",'checked');
        <% end if %>
      <% end if %>

      <% if tcWebApi_get("wlan_Entry7","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn7").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry7","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn7").prop("checked",'checked');
        <% end if %>
      <% end if %>

      <% if tcWebApi_get("wlan_Entry0","IgmpSnEn","h") = "1" then %>
        $("#IgmpSnEn8").prop("checked",'checked');
      <% elseif tcWebApi_get("wlan_Entry0","IgmpSnEn","h") = "N/A" then %>
        <% if tcWebApi_get("wlan_Common","IgmpSnEnable","h") = "1" then %>
          $("#IgmpSnEn8").prop("checked",'checked');
        <% end if %>
      <% end if %>
<% end if %>
    }

    function initWirelessMode() 
    {
      var WirelessMode = '<% tcWebApi_get("WLan_Common","WirelessMode","s") %>';
      console.log("WirelessMode: " + WirelessMode);
      if (WirelessMode == '0')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 1;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 1;
<% end if %>
      }
      else if (WirelessMode == '1')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 5;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 5;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 5;
<% end if %>
      }
      else if (WirelessMode == '4')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 4;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 4;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 4;
<% end if %>
      }
      else if (WirelessMode == '6')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 3;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 3;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 3;
<% end if %>
      }
      else if (WirelessMode == '7')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 2;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 2;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 2;
<% end if %>
      }
      else if (WirelessMode == '9')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 0;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 0;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 0;
<% end if %>
      }
      else if (WirelessMode == '16')
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 6;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 6;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 6;
<% end if %>
      }
      else
      {
        //$("select[name='WirelessMode1']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode2']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode3']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode4']").get(0).selectedIndex = 1;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        $("select[name='WirelessMode5']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode6']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode7']").get(0).selectedIndex = 1;
        $("select[name='WirelessMode8']").get(0).selectedIndex = 1;
<% end if %>
      }
    }

    function loadSelectOptions(num)
    {
      var sId = "#DataRate" + num;
      var optionValue = new Array("Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M","MSC0","MSC1","MSC2","MSC3","MSC4","MSC5","MSC6","MSC7","MSC8","MSC9","MSC10","MSC11","MSC12","MSC13","MSC14","MSC15");
      var tmp = <% tcWebApi_get("WLan_Common","DataRate","s") %>
      for(i=0;i<optionValue.length; i++)
      {
        $(sId).append(new Option(optionValue[i], i));
        if(tmp == i)
          $(sId).val(i);
      }
    }

    function setTitle() 
    {
      var WirelessModeTitle = $("select[name='WirelessMode1']").find("option:selected").text();
      //$("select[name='WirelessMode1']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode2']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode3']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode4']").attr("title", WirelessModeTitle);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      $("select[name='WirelessMode5']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode6']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode7']").attr("title", WirelessModeTitle);
      $("select[name='WirelessMode8']").attr("title", WirelessModeTitle);
<% end if %>

      var SSIDTitle =  $("input[name='SSIDAP1']").val();
     // $("input[name='SSIDAP1']").attr("title", SSIDTitle);
      $("input[name='SSIDAP2']").attr("title", SSIDTitle);
      $("input[name='SSIDAP3']").attr("title", SSIDTitle);
      $("input[name='SSIDAP4']").attr("title", SSIDTitle);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      $("input[name='SSIDAP5']").attr("title", SSIDTitle);
      $("input[name='SSIDAP6']").attr("title", SSIDTitle);
      $("input[name='SSIDAP7']").attr("title", SSIDTitle);
      $("input[name='SSIDAP8']").attr("title", SSIDTitle);
<% end if %>
    }

    function ChangeText(sId, val)
    {
      getElement(sId).innerHTML = val;
    }

    $(document).ready(function()
    {
      //multiple SSID
      setDisplay("SSID1", 0);
      setDisplay("SSID2", 1);
      setDisplay("SSID3", 1);
      setDisplay("SSID4", 1);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      setDisplay("SSID5", 1);
      setDisplay("SSID6", 1);
      setDisplay("SSID7", 1);
      setDisplay("SSID8", 1);
<% else %>
      setDisplay("SSID5", 0);
      setDisplay("SSID6", 0);
      setDisplay("SSID7", 0);
      setDisplay("SSID8", 0);
<% end if %>
      ChangeText("TEXT2","SSID2");
      ChangeText("TEXT3","SSID3");
      ChangeText("TEXT4","SSID4");
      ChangeText("TEXT5","SSID5");
      ChangeText("TEXT6","SSID6");
      ChangeText("TEXT7","SSID7");
      ChangeText("TEXT8","SSID8");


      //Data Rate
      //loadSelectOptions(1);
      loadSelectOptions(2);
      loadSelectOptions(3);
      loadSelectOptions(4);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      loadSelectOptions(5);
      loadSelectOptions(6);
      loadSelectOptions(7);
      loadSelectOptions(8);
<% end if %>

      //SSIDEnableClick(1);
      SSIDEnableClick(2);
      SSIDEnableClick(3);
      SSIDEnableClick(4);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      SSIDEnableClick(5);
      SSIDEnableClick(6);
      SSIDEnableClick(7);
      SSIDEnableClick(8);
<% end if %>
      initIgmp();
      initWirelessMode();
      setTitle();
    });
  </script>
</body>

</html>

</html>
