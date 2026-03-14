<%
If Request_Form("wlanWEPFlag")="3" Then
  tcWebApi_constSet("WebCurSet_Entry","wlan_ac_id","1")
  'tcWebApi_set("WLan11ac_Common","TxPower","wlTxPwr")
  'TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
  'tcWebApi_set("WLan11ac_Common","DfsChannEnable","wlDFSEnbl")
  TCWebApi_set("WLan11ac_Common","APOn","wlan_APenable")
  'TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
  if tcwebApi_get("WebCustom_Entry","isHguTrueSupported","h") = "Yes" then
    'TCWebApi_set("WLan11ac_Common","TrueTxPower","trueTxPower")
  end if
 
  'TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
  'TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
  'TCWebApi_set("WLan11ac_Common","WL_BW","WLANChannelBandwidth")
  if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
    'tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M20M_Coexistence")
  end if
 
  If Request_Form("Is11nMode") = "1" then
    'TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
  end IF
  If Request_Form("StationNum") <> "" then
    TCWebApi_set("WLan11ac_Entry","MaxStaNum","StationNum")
  End if
  'TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")
  'TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
  TCWebApi_set("WLan11ac_Entry","SSID","ESSID")
  TCWebApi_set("WLan11ac_Entry1","HideSSID","wlHide")

  TCWebApi_save()
  tcWebApi_commit("WLan11ac_Entry")
  tcWebApi_commit("WLan11ac_Common")
else
  tcWebApi_constSet("WebCurSet_Entry","wlan_ac_id","1")
End If
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
  <link rel="stylesheet" href="/css/main.css">
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
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-0-basic.asp" method="post" >
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="wlanWEPFlag" value="0" >
      <input TYPE="hidden" name="HTBW" value="<% tcWebApi_get("WLan11ac_Common","HT_BW","s") %>" >
      <input TYPE="hidden" name="VHTBW" value="<% tcWebApi_get("WLan11ac_Common","VHT_BW","s") %>" >
      <input type="hidden" name="hCountryRegionABand" value="<% tcWebApi_get("WLan11ac_Common","CountryRegionABand","s") %>" >
      <INPUT TYPE="hidden" name="RTDEVICE" value="<% tcWebApi_get("WLan11ac_Common","rt_device","s") %>" >
      <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
      <input TYPE="hidden" name="Wlan_HTBW40M20M_Coexistence" value="<% tcWebApi_get("WLan11ac_Common","HT_BSSCoexistence","s") %>" >
      <% end if %>
      <input TYPE="hidden" name="Is11nMode" value="<% tcWebApi_get("WLan11ac_Common","11nMode","s") %>" >
      <input TYPE="hidden" name="Is11acMode" value="<% tcWebApi_get("WLan11ac_Common","11acMode","s") %>" >
      <input TYPE="hidden" name="CountryName" value="<% tcWebApi_get("WLan11ac_Common","Country","s") %>" >
      <input TYPE="hidden" name="ExtChannFlag" value="<% tcWebApi_get("WLan11ac_Common","HT_EXTCHA","s") %>" >
      <input TYPE="hidden" name="maxStaNum" value="<% tcWebApi_get("Info_WLan11ac","maxStaNumSupported","s") %>" >
      <input TYPE="hidden" name="wlan_APenable" value="<% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then asp_Write("1") else asp_write("0") end if %>" >
      <div class="title-text">WLAN Basic Setting</div>
      <div class="title-description-text">This page is used to configure the parameters for WLAN clients which may connect to your Access Point. Here you may change wireless encryption settings as well as wireless network parameters.</div>
      <div class="row p-1">
        <div class="col-md-6 col-sx-12 pl60">
          <input onclick=wlClickEnble(this) type="checkbox" value="1" name="wlEnbl" <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "0" then asp_Write("checked") end if %> >
          <label class="input-radio">Disable WLAN Interface</label>
        </div>
      </div>
      <hr>
      <div id="wlInfo">
        <!--<div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Band:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name="WirelessMode" onChange="doWirelessModeChange()">
              <option value="2" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "2" then asp_Write("selected") end if %> >5GHz (A)</option>
              <option value="8" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "8" then asp_Write("selected") end if %> >5GHz (A+N)</option>
              <option value="14" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "14" then asp_Write("selected") end if %> >5GHz (A+N+AC)</option>
              <option value="15" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "15" then asp_Write("selected") end if %> >5GHz (N+AC)</option>
              <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
              <option value="17" <% if tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "17" then asp_Write("selected") end if %> <% If tcWebApi_get("WLan11ac_Common","WirelessMode","h") = "N/A" then asp_Write("selected") end if%> >5GHz (N+AC+AX)</option>
              <% end if %>
            </select>
          </div>
        </div>-->
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Mode:</div>
          </div>
          <div class="col-3 col-sx-2">
            <select class="form-control input-select" disabled>
              <option value="1" selected>AP</option>
              <option value="2">AC</option>
            </select>
          </div>
          <div class="col-3 left">
            <a class="btn-file btn-a" href="./wlan-0-multiple-aps.asp">Multiple AP</a>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">SSID:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" name="ESSID" maxlength="32" value="<% If tcWebApi_get("WLan11ac_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","SSID","s") end if %>">
          </div>
        </div>
        <!--<div class="row p-1" id="11nMode_1_div">
            <div class="col-6">
              <div class="title-text-left">Channel Width:</div>
            </div>
            <div class="col-6">
              <select name="WLANChannelBandwidth" class="form-control input-select" onChange="doChannelBandwidthChange();">
                <% if  tcWebApi_get("WLan11ac_Common","WirelessMode","h")="14" Then %>
                  <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
                  <option value="1" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
                  <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >80MHz</option>
                  <option value="3" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "4" then asp_Write("selected") end if %> >Auto</option>
                <% elseif tcWebApi_get("WLan11ac_Common","WirelessMode","h")="15" Then %>
                  <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
                  <option value="1" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
                  <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >80MHz</option>
                  <option value="3" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "3" then asp_Write("selected") end if %> >Auto</option>
                <% elseif tcWebApi_get("WLan11ac_Common","WirelessMode","h")="17" Then %>
                  <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
                  <option value="1" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
                  <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >80MHz</option>
                  <option value="3" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "3" then asp_Write("selected") end if %> >160MHz</option>
                  <!--<option value="4" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "4" then asp_Write("selected") end if %> >80+80</option>
                  <option value="5" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "5" then asp_Write("selected") end if %> >Auto</option>
                <% else %>
                  <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
                  <option value="1" <% If tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
                  <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >Auto</option>
                <% end If %>
              </select>
            </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Country Sideband:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" disabled>
              <option value="1">Auto</option>
            </select>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Channel Number:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name="Channel_ID" onChange="doExtChaLockChange()">
            </select>
          </div>
        </div>
        <div class="row p-1" id="HT_BW_1_div" style="display: none;">
          <div class="col-6">
            <div class="title-text-left">Extended Channel:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name="WLANExtensionChannel" onChange="doExtChannChange()">
              <option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %> >Down propagation channel</option>
              <option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %> >Up propagation channel</option>
            </select>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">DFS:</div>
          </div>
          <div class="col-6">
            <input type="radio" value="1" name="wlDFSEnbl" id="wlDFSEnbl1">
            <label class="input-radio">Enabled</label>
            <input type="radio" value="0" name="wlDFSEnbl" id="wlDFSEnbl2">
            <label class="input-radio">Disabled</label>
          </div>
        </div>-->
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Associate Number:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" id="StationNum" name="StationNum" value="<% if tcWebApi_get("WLan11ac_Entry","MaxStaNum","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","MaxStaNum","s") else asp_Write("64") end if %>" MAXLENGTH="2" onblur="checkStationNumValue();">
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Broadcast SSID:</div>
          </div>
          <div class="col-6">
            <input type="radio" value="0" name="wlHide" <% If tcWebApi_get("WLan11ac_Entry1","HideSSID","h") = "0" then asp_Write("checked") end if %>>
            <label class="input-radio">Enabled</label>
            <input type="radio" value="1" name="wlHide" <% If tcWebApi_get("WLan11ac_Entry1","HideSSID","h") = "1" then asp_Write("checked") end if %>>
            <label class="input-radio">Disabled</label>
          </div>
        </div>
        <!--
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Tx Power:</div>
          </div>
          <div class="col-6" id=wlPutOutPower>
            <select class="form-control input-select" name=wlTxPwr>
              <option value="100" <% If tcWebApi_get("WLan11ac_Common","TxPower","h") = "100" then asp_Write("selected") end if %>>100</option>
              <option value="75" <% If tcWebApi_get("WLan11ac_Common","TxPower","h") = "75" then asp_Write("selected") end if %>>75</option>
              <option value="50"<% If tcWebApi_get("WLan11ac_Common","TxPower","h") = "50" then asp_Write("selected") end if %>>50</option>
              <option value="25"<% If tcWebApi_get("WLan11ac_Common","TxPower","h") = "25" then asp_Write("selected") end if %>>25</option>
              <option value="15"<% If tcWebApi_get("WLan11ac_Common","TxPower","h") = "15" then asp_Write("selected") end if %>>15</option>
            </select>
          </div>
        </div>
        -->
        <!--<div class="row p-1" id="isHguTrueSupported_tr" style="display:none;">
          <div class="col-6">
            <div class="title-text-left">Radio Power:</div>
          </div>
          <div class="col-6">
            <input id="trueTxPower1" type="radio" name="trueTxPower" value="3">
            <label class="input-radio">High</label>
            <input id="trueTxPower2" type="radio" name="trueTxPower" value="2">
            <label class="input-radio">Medium</label>
            <input id="trueTxPower3" type="radio" name="trueTxPower" value="1">
            <label class="input-radio">Standard</label>
          </div>
        </div>-->
        <!--
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Associated Clients:</div>
          </div>
          <div class="col-6 left">
            <a class="btn-file btn-a" href="./wlan-0-client.asp">Show Active WLAN Client</a>
          </div>
        </div>
        -->
      </div>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" onclick="doSave()" >Apply</button>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    /*HT5GExtCh = new Array(22);
    for(var i = 0; i < 22; i++) {
      HT5GExtCh[i] = (i+1) % 2;
    }*/
    var enbl = <% tcWebApi_get("WLan11ac_Common","APOn","s") %>;
    var state = enbl;
    /*var dfsChannEnable_flag = "<% tcWebApi_get("WLan11ac_Common","DfsChannEnable","s") %>";
    var true_flag = "<% tcwebApi_get("WebCustom_Entry","isHguTrueSupported","s") %>";
    var trueTxPower_flag = "<% tcWebApi_get("WLan11ac_Common","TrueTxPower","s") %>";

    $(document).ready(function(){
      if(dfsChannEnable_flag == 1){
        $("input[name=wlDFSEnbl]:eq(0)").prop("checked",'checked');
      }else{
        $("input[name=wlDFSEnbl]:eq(1)").prop("checked",'checked');
      }
      LoadFrame();
    });

    $('input[type=radio][name=wlDFSEnbl]').change(function() {
      LoadFrame();
    });*/

    $(document).ready(function(){
      wlClickEnble(getElById('wlEnbl'));
    });

    function doChannelBandwidthChange(){
      $("input[name='wlanWEPFlag']").val(1);
      setHTVHTBW();
      LoadFrame();
    }
    
    function setHTVHTBW(){
      var WirelessMode = document.ConfigForm.WirelessMode;
      var WirelessMode_value = WirelessMode.options[WirelessMode.selectedIndex].value;

      var WLANChannelBandwidth = document.ConfigForm.WLANChannelBandwidth;
      var BandWidth_text = WLANChannelBandwidth.options[WLANChannelBandwidth.selectedIndex].text;

      <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
        document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 0;
      <% end if %>

      if(WirelessMode_value == 17)
      {//802.11n/ac/ax Mixed
        if(BandWidth_text == "Auto")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 1;
          <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
            document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 1;
          <% end if %>
        }
        else if(BandWidth_text == "80MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 1;
        }
        else if(BandWidth_text == "160MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 2;
        }
        else if(BandWidth_text == "80+80MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 3;
        }
        else if(BandWidth_text == "40MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 0;
        }
        else
        {
          document.ConfigForm.HTBW.value = 0;
          document.ConfigForm.VHTBW.value = 0;
        }
      }
      else if(WirelessMode_value == 14 || WirelessMode_value == 15)
      {//802.11a/n/ac or 802.11n/ac
        if(BandWidth_text == "Auto")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 1;
          <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
            document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 1;
          <% end if %>
        }
        else if(BandWidth_text == "80MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 1;
        }
        else if(BandWidth_text == "40MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 0;
        }
        else
        {
          document.ConfigForm.HTBW.value = 0;
          document.ConfigForm.VHTBW.value = 0;
        }
      }
      else if(WirelessMode_value == 8)
      {//802.11a/n
        if(BandWidth_text == "Auto")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 0;
          <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
            document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 1;
          <% end if %>
        }
        else if(BandWidth_text == "40MHz")
        {
          document.ConfigForm.HTBW.value = 1;
          document.ConfigForm.VHTBW.value = 0;
        }
        else
        {
          document.ConfigForm.HTBW.value = 0;
          document.ConfigForm.VHTBW.value = 0;
        }
      }
      else
      {//802.11a only
        document.ConfigForm.HTBW.value = 0;
        document.ConfigForm.VHTBW.value = 0;
      }
    }

    
    function wlClickEnble(wlEnbleCl)
    {
      if (wlEnbleCl.checked == true){
        $("#wlInfo").hide();
      }
      else{
        if (state == 1){
          $("#wlInfo").show();
        }
      }
    }

    function LoadFrame()
    {
      /*
      if (curUserName != sptUserName){
        $("#wlPutOutPower").hide();
      }
      */
      wlClickEnble(getElById('wlEnbl'));
      
      //doCheckSSID();
      var dfsEnable = $("input[name='wlDFSEnbl']:checked").val();
      console.log("current dsfEnable: " + dfsEnable);
      RefreshChannPage(dfsEnable);
      
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      console.log("wirelessModeIndex: " + wirelessModeIndex);
      var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
      if(wirelessModeIndex >= 1){
        $("input[name='Is11nMode']").val(1);
        if(wirelessModeIndex >=2 ){
          $("input[name='Is11acMode']").val(1);
        }else{
          $("input[name='Is11acMode']").val(0);
        }
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
        if(WLANChannelBandwidthIndex != 0){
        <% else %>
        if((WLANChannelBandwidthIndex != 0)&&(WLANChannelBandwidthIndex != 1)){
        <% end if %>
          chOpt = InsExtChOpt($("select[name='Channel_ID']").val());
          console.log("channelValue: " + chOpt);
          if(chOpt == 1){
            $("select[name='WLANExtensionChannel']").get(0).selectedIndex = 1; 
          }
          else{
            $("select[name='WLANExtensionChannel']").get(0).selectedIndex = 0;
          }
          $("select[name='WLANExtensionChannel']").attr("disabled","disabled");
        }
        /*默认不显示
        if(WLANChannelBandwidthIndex == 0){
          $("#HT_BW_1_div").hide();
        }else{
          $("#HT_BW_1_div").show();
        }
        */
      }else{
        $("input[name='Is11nMode']").val(0);
        $("input[name='Is11acMode']").val(0);
      }
      
      if(true_flag == "Yes")
      {
        $("#isHguTrueSupported_tr").show();
        if(trueTxPower_flag == "3"){
          $("input[name=trueTxPower]:eq(0)").prop("checked",'checked');
        }else if(trueTxPower_flag == "2"){
          $("input[name=trueTxPower]:eq(1)").prop("checked",'checked');
        }else if(trueTxPower_flag == "1" || trueTxPower_flag == "N/A"){
          $("input[name=trueTxPower]:eq(2)").prop("checked",'checked');
        }
      }
    }

    function InsExtChOpt(CurrCh)
    {
      var ExtChann = document.ConfigForm.ExtChannFlag;
      if ((1*CurrCh >= 36) && (1*CurrCh <= 64))
      {
          CurrCh = 1*CurrCh;
          CurrCh /= 4;
          CurrCh -= 9;

          ExtChann.value = HT5GExtCh[CurrCh];
      }
      else if ((1*CurrCh >= 100) && (1*CurrCh <= 136))
      {
          CurrCh = 1*CurrCh;
          CurrCh /= 4;
          CurrCh -= 17;

          ExtChann.value = HT5GExtCh[CurrCh];
      }
      else if ((1*CurrCh >= 149) && (1*CurrCh <= 161))
      {
          CurrCh = 1*CurrCh;
          CurrCh -= 1;
          CurrCh /= 4;
          CurrCh -= 19;

          ExtChann.value = HT5GExtCh[CurrCh];
      }
      else
      {
          ExtChann.value = 0;
      }
      return ExtChann.value;
    }

    var bInit = 1;
    function RefreshChannPage(wlDFSEnbl){
      var index = 0;
      var ctlChannel_ID = document.ConfigForm.Channel_ID;
      var vChannel = ctlChannel_ID.value;
      var vCountryRegionABand = document.ConfigForm.hCountryRegionABand.value;
      var sWLANChannelBandwidth = document.ConfigForm.WLANChannelBandwidth.selectedIndex;
      if(bInit == 1){
        vChannel = "<% tcWebApi_get("WLan11ac_Common","Channel","s") %>";
        bInit = 0;
      }
      ctlChannel_ID.length = 0;
      if(vCountryRegionABand == 0){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        if(wlDFSEnbl == "1")
        {//INDIA dfs channel 52, 56, 60, 64
          ctlChannel_ID.options[index++] = new Option("52", "52");
          ctlChannel_ID.options[index++] = new Option("56", "56");
          ctlChannel_ID.options[index++] = new Option("60", "60");
          ctlChannel_ID.options[index++] = new Option("64", "64");
        }
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        var WirelessMode = "<%tcWebApi_get("WLan11ac_Common","WirelessMode","s") %>";
        if((WirelessMode != "14" && WirelessMode != "15") || (sWLANChannelBandwidth != 2 && sWLANChannelBandwidth != 3)){
          ctlChannel_ID.options[index++] = new Option("165", "165");
        }
      }else if(vCountryRegionABand == 1){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
        ctlChannel_ID.options[index++] = new Option("124", "124");
        ctlChannel_ID.options[index++] = new Option("128", "128");
        ctlChannel_ID.options[index++] = new Option("132", "132");
        ctlChannel_ID.options[index++] = new Option("136", "136");
        ctlChannel_ID.options[index++] = new Option("140", "140");
      }else if(vCountryRegionABand == 2){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
      }else if(vCountryRegionABand == 3){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
      }else if(vCountryRegionABand == 4){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        ctlChannel_ID.options[index++] = new Option("165", "165");
      }else if(vCountryRegionABand == 5){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
      }else if(vCountryRegionABand == 6){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
      }else if(vCountryRegionABand == 8){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
      }else if(vCountryRegionABand == 9){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("132", "132");
        ctlChannel_ID.options[index++] = new Option("136", "136");
        ctlChannel_ID.options[index++] = new Option("140", "140");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        var WirelessMode = "<%tcWebApi_get("WLan11ac_Common","WirelessMode","s") %>";
        if((WirelessMode != "14" && WirelessMode != "15") || (sWLANChannelBandwidth != 2 && sWLANChannelBandwidth != 3)){
          ctlChannel_ID.options[index++] = new Option("165", "165");
        }
      }else if(vCountryRegionABand == 10){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        var WirelessMode = "<%tcWebApi_get("WLan11ac_Common","WirelessMode","s") %>";
        if((WirelessMode != "14" && WirelessMode != "15") || (sWLANChannelBandwidth != 2 && sWLANChannelBandwidth != 3)){
          ctlChannel_ID.options[index++] = new Option("165", "165");
        }
      }else if(vCountryRegionABand == 11){
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
      }else if(vCountryRegionABand == 13) //TRUE
      {
        var WLANChannelBandwidth = document.ConfigForm.WLANChannelBandwidth;
        var BW_value = WLANChannelBandwidth.options[WLANChannelBandwidth.selectedIndex].text;
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        if(wlDFSEnbl == "1")
        {
          ctlChannel_ID.options[index++] = new Option("52", "52");
          ctlChannel_ID.options[index++] = new Option("56", "56");
          ctlChannel_ID.options[index++] = new Option("60", "60");
          ctlChannel_ID.options[index++] = new Option("64", "64");
          ctlChannel_ID.options[index++] = new Option("100", "100");
          ctlChannel_ID.options[index++] = new Option("104", "104");
          ctlChannel_ID.options[index++] = new Option("108", "108");
          ctlChannel_ID.options[index++] = new Option("112", "112");
          ctlChannel_ID.options[index++] = new Option("116", "116");
          ctlChannel_ID.options[index++] = new Option("120", "120");
          ctlChannel_ID.options[index++] = new Option("124", "124");
          ctlChannel_ID.options[index++] = new Option("128", "128");
          if(BW_value != "160MHz")
          {
            ctlChannel_ID.options[index++] = new Option("132", "132");
            ctlChannel_ID.options[index++] = new Option("136", "136");
            ctlChannel_ID.options[index++] = new Option("140", "140");
            ctlChannel_ID.options[index++] = new Option("144", "144");
          }
        }
        if(BW_value != "160MHz")
        {
          ctlChannel_ID.options[index++] = new Option("149", "149");
          ctlChannel_ID.options[index++] = new Option("153", "153");
          ctlChannel_ID.options[index++] = new Option("157", "157");
          ctlChannel_ID.options[index++] = new Option("161", "161");
          if(BW_value == "20MHz")
          {
            ctlChannel_ID.options[index++] = new Option("165", "165");
          }
        }
      }
      else{
        ctlChannel_ID.options[index++] = new Option("Auto", "0");
        ctlChannel_ID.options[index++] = new Option("36", "36");
        ctlChannel_ID.options[index++] = new Option("40", "40");
        ctlChannel_ID.options[index++] = new Option("44", "44");
        ctlChannel_ID.options[index++] = new Option("48", "48");
        ctlChannel_ID.options[index++] = new Option("52", "52");
        ctlChannel_ID.options[index++] = new Option("56", "56");
        ctlChannel_ID.options[index++] = new Option("60", "60");
        ctlChannel_ID.options[index++] = new Option("64", "64");
        ctlChannel_ID.options[index++] = new Option("100", "100");
        ctlChannel_ID.options[index++] = new Option("104", "104");
        ctlChannel_ID.options[index++] = new Option("108", "108");
        ctlChannel_ID.options[index++] = new Option("112", "112");
        ctlChannel_ID.options[index++] = new Option("116", "116");
        ctlChannel_ID.options[index++] = new Option("120", "120");
        ctlChannel_ID.options[index++] = new Option("124", "124");
        ctlChannel_ID.options[index++] = new Option("128", "128");
        ctlChannel_ID.options[index++] = new Option("132", "132");
        ctlChannel_ID.options[index++] = new Option("136", "136");
        ctlChannel_ID.options[index++] = new Option("140", "140");
        ctlChannel_ID.options[index++] = new Option("149", "149");
        ctlChannel_ID.options[index++] = new Option("153", "153");
        ctlChannel_ID.options[index++] = new Option("157", "157");
        ctlChannel_ID.options[index++] = new Option("161", "161");
        var WirelessMode = "<%tcWebApi_get("WLan11ac_Common","WirelessMode","s") %>";
        if((WirelessMode != "14" && WirelessMode != "15") || sWLANChannelBandwidth != 2){
          ctlChannel_ID.options[index++] = new Option("165", "165");
        }
      }
      ctlChannel_ID.options[0].selected=true;
      SelectValue(ctlChannel_ID, vChannel);
      /*
      if($("input[name='Is11nMode']").val() == 1){
        $("#11nMode_1_div").show();
      }else{
        $("#11nMode_1_div").hide();
      }
      */
    }

    function SelectValue(o,v){
      for(var i=0; i<o.options.length; i++)
        if(o.options[i].value == v){
        o.options[i].selected=true;
        break;
      }
    }

    function doExtChaLockChange() {
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
      if(wirelessModeIndex >= 1){
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
          if((WLANChannelBandwidthIndex == 1)||(WLANChannelBandwidthIndex == 2)){
        <% else %>
          if(WLANChannelBandwidthIndex == 2){
        <% end if %>
            $("input[name='wlanWEPFlag']").val(1);
        }
        LoadFrame();
      }	
    }

    function doWirelessModeChange(){
      $("input[name='wlanWEPFlag']").val(1);
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      console.log("wirelessModeIndex: " + wirelessModeIndex);
      if(wirelessModeIndex >= 1){
        $("input[name='Is11nMode']").val(1);
        if(wirelessModeIndex >= 2){
          $("input[name='Is11acMode']").val(1);
        }else{
          $("input[name='Is11acMode']").val(0);
        }
      }else{
        $("input[name='Is11nMode']").val(0);
        $("input[name='Is11acMode']").val(0);
      }
      refreshChannelBandwidth();
      LoadFrame();
    }
    
    function refreshChannelBandwidth(){
      $("input[name='wlanWEPFlag']").val(1);
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      var WLANChannelBandwidth = document.ConfigForm.WLANChannelBandwidth;
      WLANChannelBandwidth.length = 0;
      
      if(wirelessModeIndex > 3)
      {
        WLANChannelBandwidth.options[0] = new Option("20MHz",0);
        WLANChannelBandwidth.options[1] = new Option("40MHz",1);
        WLANChannelBandwidth.options[2] = new Option("80MHz",2);
        WLANChannelBandwidth.options[3] = new Option("160MHz",3);
        /*
        WLANChannelBandwidth.options[4] = new Option("80+80",4);
        WLANChannelBandwidth.options[5] = new Option("Auto",5);//"20/40/80"
        */
        WLANChannelBandwidth.options[4] = new Option("Auto",5);//"20/40/80"
        WLANChannelBandwidth.options[3].selected = true;
        //$("select[name='WLANChannelBandwidth']").get(0).selectedIndex = 3;
        document.ConfigForm.HTBW.value = 1;
        document.ConfigForm.VHTBW.value = 2;
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
          document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 0;
        <% end if %>
      }
      else if(wirelessModeIndex > 1)
      {
        WLANChannelBandwidth.options[0] = new Option("20MHz",0);
        WLANChannelBandwidth.options[1] = new Option("40MHz",1);
        WLANChannelBandwidth.options[2] = new Option("80MHz",2);
        WLANChannelBandwidth.options[3] = new Option("Auto",3);//"20/40/80"
        WLANChannelBandwidth.options[3].selected = true;
        document.ConfigForm.HTBW.value = 1;
        document.ConfigForm.VHTBW.value = 1;
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
          document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 1;
        <% end if %>
      }
      else if(wirelessModeIndex == 1)
      {
        WLANChannelBandwidth.options[0] = new Option("20MHz",0);
        WLANChannelBandwidth.options[1] = new Option("40MHz",1);
        WLANChannelBandwidth.options[2] = new Option("Auto",2);//"20/40"
        WLANChannelBandwidth.options[2].selected = true;
        document.ConfigForm.HTBW.value = 1;
        document.ConfigForm.VHTBW.value = 0;
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
          document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 1;
        <% end if %>
      }
      else
      {
        WLANChannelBandwidth.options[0] = new Option("20MHz",0);
        WLANChannelBandwidth.options[0].selected = true;
        document.ConfigForm.HTBW.value = 0;
        document.ConfigForm.VHTBW.value = 0;
        <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
          document.ConfigForm.Wlan_HTBW40M20M_Coexistence.value = 0;
        <% end if %>
      }
    }

    function doExtChannChange(){
      if($("select[name='WLANExtensionChannel']").prop("selectedIndex")==0){
        $("input[name='ExtChannFlag']").val(0);
      }else{
        $("input[name='ExtChannFlag']").val(1);
      }
    }

    function SetCtlValue()
    {
      with ( document.forms[0])
      {
        if(wlEnbl.checked == true)
          $("input[name='wlan_APenable']").val(0);
        else
          $("input[name='wlan_APenable']").val(1);
      }
    }

    function doSave(){
      if(!doCheckSave())
      {
        setCheck('wlEnbl',0);
        wlClickEnble(getElById('wlEnbl'));
        return false;
      }
      else
      {
        SetCtlValue();
        document.ConfigForm.SaveAlter_Flag.value = "1";
        document.ConfigForm.submit();
        //showLoading();
      }
    }

    function checkStationNum(value, limit) 
    {
      if (!isNumeric(value) || parseInt(value,10) < 1 || parseInt(value,10) > parseInt(limit,10)){
        alert("Associate Number value must be between 1 and " + limit);
        return true;
      }
      return false;
    }

    function doCheckSave(){
      <% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
        if(checkStationNum($("input[name='StationNum']").val(), $("input[name='maxStaNum']").val())){
          return false;
        }
      <% End If %>

      if(strESSIDCheck(document.ConfigForm.ESSID)){
        return false;
      }
      
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
        if($("input[name='wlEnbl']").prop("checked")){
          alert("WLAN Interface cannot be disbale when mesh is enable.");
          return false;
        }
      <% end if %>

      $("input[name='wlanWEPFlag']").val(3);
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
      if(wirelessModeIndex >= 1){
        $("input[name='Is11nMode']").val(1);
        if(wirelessModeIndex >= 2){
          $("input[name='Is11acMode']").val(1);
        }else{
          $("input[name='Is11acMode']").val(0);
        }
        setHTVHTBW();
      }else{
        $("input[name='Is11nMode']").val(0);
        $("input[name='Is11acMode']").val(0);
      }
      
      return true;
    }

    function strESSIDCheck(str)
    {
      if(str.value.length <= 0)
      {
        alert("SSID is empty");
        return true;
      }
      if(str.value.match(/[^\x00-\xff]/g))
      {
        alert("Invalid SSID Input!");
        return true;
      }
      if (str.value.indexOf("\\") >= 0)
	  {
        alert("SSID cannot contain backslashes.");
        return true;
      }
      if (str.value.indexOf("\"") >= 0 )
      {
        if (str.value.indexOf("\\\"") >= 0 )
        {
          alert("SSID cannot contain escape double quotes.");
        }
        else
        {
          alert("SSID cannot contain double quotation marks.");
        }
        return true;
      }
      if (str.value.indexOf("'") >= 0 )
      {
        alert("SSID cannot contain single quotation marks.");
        return true;
      }
	  if (str.value.charAt(str.value.length - 1) == ' ' )
      {
        alert("SSID must not be end with space or tab characters.");
        return true;
      }
      
      return false;
    }
    
    function checkStationNumValue()
    {
        var value = document.getElementById("StationNum").value;
        var limit = $("input[name='maxStaNum']").val();
        if(false == isNumeric(value))
        {
            alert("Associate Number value must be between 1 and " + limit);
            document.getElementById("StationNum").value = '64';
        }
    }
  </script>
</body>

</html>
