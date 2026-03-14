<%
If Request_Form("wlanWEPFlag")="3" Then
  tcWebApi_constSet("WebCurSet_Entry","wlan_ac_id","1")
  'TCWebApi_set("WLan11ac_Common","BeaconPeriod","BeaconInterval")
  'TCWebApi_set("WLan11ac_Common","RTSThreshold","RTSThreshold")
  'TCWebApi_set("WLan11ac_Common","FragThreshold","FragmentThreshold")
  'TCWebApi_set("WLan11ac_Common","DtimPeriod","DTIM")

  'TCWebApi_set("WLan11ac_Common","TxPreamble","TxPreamble") 
  TCWebApi_set("WLan11ac_Common","BGProtection","Protection") 
  'TCWebApi_set("WLan11ac_Common","PktAggregate","PktAggregate") 
  'TCWebApi_set("WLan11ac_Common","ITxBfEn","ITxBfEn")
  TCWebApi_set("WLan11ac_Common","AutoChannelDisable","AutoChannelDisable")
  TCWebApi_set("WLan11ac_Common","AutoChannelTime","ScanTimeValue")

  if Request_Form("wlan_a_flag")="0" then
  TCWebApi_set("WLan11ac_Common","MuOfdmaDlEnable","DownloadMUOFDMAEnable")
  'TCWebApi_set("WLan11ac_Common","MuOfdmaUlEnable","UploadMUOFDMAEnable")
  TCWebApi_set("WLan11ac_Common","MuMimoDlEnable","DownloadMUMIMOEnable")
  'TCWebApi_set("WLan11ac_Common","MuMimoUlEnable","UploadMUMIMOEnable")
  elseif Request_Form("wlan_a_flag") = "1" then
  tcWebApi_constSet("WLan11ac_Common","MuOfdmaDlEnable","0")
  'tcWebApi_constSet("WLan11ac_Common","MuOfdmaUlEnable","0")
  tcWebApi_constSet("WLan11ac_Common","MuMimoDlEnable","0")
  'tcWebApi_constSet("WLan11ac_Common","MuMimoUlEnable","0")
  end If

  'TCWebApi_set("WLan11ac_Common","IgmpSnEnable","IgmpSnEnable")
  TCWebApi_set("WLan11ac_Common","DataRate","DataRate")
  'TCWebApi_set("WLan11ac_Common","HT_GI","VHT_SGI")
  'TCWebApi_set("WLan11ac_Common","VHT_SGI","VHT_SGI")
  'TCWebApi_set("WLan11ac_Entry1","HideSSID","wlHide")
  TCWebApi_set("WLan11ac_Entry0","WMM","Wlwmm")
  TCWebApi_set("WLan11ac_Entry1","WMM","Wlwmm")
  'TCWebApi_set("WLan11ac_Common","TrueTxPower","trueTxPower")
  'TCWebApi_set("WLan11ac_Common","RRMEnable","rRMEnable")
  
  TCWebApi_set("WLan11ac_Common","Channel","Channel_ID")
  tcWebApi_set("WLan11ac_Common","DfsChannEnable","wlDFSEnbl")
  TCWebApi_set("WLan11ac_Common","WirelessMode","WirelessMode")
  
  if tcwebApi_get("WebCustom_Entry","isHguTrueSupported","h") = "Yes" then
    TCWebApi_set("WLan11ac_Common","TrueTxPower","trueTxPower")
  end if
 
  TCWebApi_set("WLan11ac_Common","HT_BW","HTBW")
  TCWebApi_set("WLan11ac_Common","VHT_BW","VHTBW")
  TCWebApi_set("WLan11ac_Common","WL_BW","WLANChannelBandwidth")
  
  if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
    tcWebApi_set("WLan11ac_Common","HT_BSSCoexistence","Wlan_HTBW40M20M_Coexistence")
  end if
 
  If Request_Form("Is11nMode") = "1" then
    TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
  end IF
  TCWebApi_set("WLan11ac_Common","11nMode","Is11nMode")
  TCWebApi_set("WLan11ac_Common","11acMode","Is11acMode")
  tcWebApi_commit("WLan11ac_Common")
  tcWebApi_commit("WLan11ac_Entry")
  TCWebApi_save()
End If
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>WLAN - Advance Setting</title>
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

  <script>
    HT5GExtCh = new Array(22);
    for(var i = 0; i < 22; i++) {
      HT5GExtCh[i] = (i+1) % 2;
    }
    var dfsChannEnable_flag = "<% tcWebApi_get("WLan11ac_Common","DfsChannEnable","s") %>";
    var true_flag = "<% tcwebApi_get("WebCustom_Entry","isHguTrueSupported","s") %>";
    var trueTxPower_flag = "<% tcWebApi_get("WLan11ac_Common","TrueTxPower","s") %>";

    function isDigit(val) {
      if (val < '0' || val > '9')
        return false;
      return true;
    }
    
    function isDecimalDigit(digit) {
      if ( digit == "" ) {
        return false;
      }
      for ( i = 0; i < digit.length ; i++ ) {
        if ( !isDigit(digit.charAt(i)) ) {
          return false;
        }
      }
      return true;
    }
    
    function doCheckSave()
    {
      var autoChannelTime = $("#autoChannelTime").val();
      if (!isDecimalDigit(autoChannelTime)) 
      {
        alert("Auto Channel Scan Time must be an integer!");
        return false;
      }
      $("input[name='wlanWEPFlag']").val(3);
      $("input[name='wlan_a_flag']").val(0);
      var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
      var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
      if(wirelessModeIndex == 0)
      {
        $("input[name='wlan_a_flag']").val(1);
        $("input[name='Is11nMode']").val(0);
        $("input[name='Is11acMode']").val(0);
      }
      else if(wirelessModeIndex >= 1){
        $("input[name='Is11nMode']").val(1);
        if(wirelessModeIndex >= 2){
          $("input[name='Is11acMode']").val(1);
        }else{
          $("input[name='Is11acMode']").val(0);
        }
        setHTVHTBW();
      }else{
        $("input[name='wlanWEPFlag']").val(1);
        $("input[name='Is11nMode']").val(0);
        $("input[name='Is11acMode']").val(0);
      }
      
      return true;
    }

  /*
  function checkBeacon(value)
  {
    if (!isNumeric(value)) {
      alert("Non-integer value given '" + value + "'");
      return true;
    }
    if (value < 20 || value > 1000) {
      alert("Beacon Interval value must be between 20 and 1000");
      return true;
    }
    return false;
  }

  function checkRTS(value)
  {
    if (!isNumeric(value)) {
      alert("Non-integer value given '" + value + "'");
      return true;
    }
    if (value < 1500 || value > 2347) {
      alert("RTS Threshold value must be between 1500 and 2347");
      return true;
    }
    return false;
  }

  function checkFrag(value)
  {
    if (!isNumeric(value)) {
      alert("Non-integer value given" + value);
      return true;
    }
    if (value < 256 || value > 2346) {
      alert("Fragment Threshold value must be between 256 and 2346");
      return true;
    }
    if (value % 2) {
      alert("Fragment Threshold value must be an even number");
      return true;
    }
    return false;
  }

  function checkDTIM(value) 
  {
    if (!isNumeric(value)) {
      alert("Non-integer value given" + value);    
      return true;
    }
    if (value < 1 || value > 255) {
      alert("DTIM Period value must be between 1 and 255");		
      return true;
    }
    
    return false;
  }
  */

  function doSave(){
    if(!doCheckSave())
    {
      return false;
    }
    else
    {
      var AutoChannelEnable = $("input[name='AutoChannelEnable']:checked").val();
      var ScanTimeValue = document.ConfigForm.autoChannelTime.value;
      if(AutoChannelEnable == "0")
      {
        var Channel = $("#Channel_ID").val();
        if(Channel == "0")
        {
          document.ConfigForm.AutoChannelDisable.value = "0";
          document.ConfigForm.ScanTimeValue.value = ScanTimeValue;
        }
        else
        {
          document.ConfigForm.AutoChannelDisable.value = "1";
        }
      }
      else
      {
        document.ConfigForm.AutoChannelDisable.value = "1";
      }
      document.ConfigForm.SaveAlter_Flag.value = "1";
      document.ConfigForm.submit();
      //showLoading();
    }
  }

  function loadSelectOptions(){
    var index = 0;
    var ctlOption = document.ConfigForm.DataRate;
    var vChannel = ctlOption.value;
    var optionValue = new Array("Auto","1M","2M","5.5M","11M","6M","9M","12M","18M","24M","36M","48M","54M","MSC0","MSC1","MSC2","MSC3","MSC4","MSC5","MSC6","MSC7","MSC8","MSC9","MSC10","MSC11","MSC12","MSC13","MSC14","MSC15");
    
    ctlOption.length = 0;
    
    for(i=0;i<optionValue.length; i++)
    {
      ctlOption.options[index] = new Option(optionValue[i], i);
      index ++;
    }
    
    ctlOption.options[<% tcWebApi_get("WLan11ac_Common","DataRate","s") %>].selected=true;
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

  function doExtChaLockChange() 
  {
    var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
    var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
    if(wirelessModeIndex >= 1)
    {
      <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
      if((WLANChannelBandwidthIndex == 1)||(WLANChannelBandwidthIndex == 2))
      {
      <% else %>
      if(WLANChannelBandwidthIndex == 2)
      {
      <% end if %>
        $("input[name='wlanWEPFlag']").val(1);
      }
      LoadFrame();
    }
    var sel1 = $("#Channel_ID").val();
    var sel2 = $("input[name='AutoChannelEnable']:checked").val();
    if(sel1 == "0")
    {
      $("#ScanPart").show();
      if(sel2 == "0")
      {
        $("#ScanTimePart").show();
      }
      else
      {
        $("#ScanTimePart").hide();
      }
    }
    else
    {
      $("#ScanPart").hide();
      $("#ScanTimePart").hide();
    }
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

function doExtChannChange(){
    if($("select[name='WLANExtensionChannel']").prop("selectedIndex")==0){
      $("input[name='ExtChannFlag']").val(0);
    }else{
      $("input[name='ExtChannFlag']").val(1);
    }
  }

function LoadFrame()
  {
    var dfsEnable = $("input[name='wlDFSEnbl']:checked").val();
    console.log("current dsfEnable: " + dfsEnable);
    RefreshChannPage(dfsEnable);
    
    var wirelessModeIndex = $("select[name='WirelessMode']").prop("selectedIndex");
    console.log("wirelessModeIndex: " + wirelessModeIndex);
    var WLANChannelBandwidthIndex = $("select[name='WLANChannelBandwidth']").prop("selectedIndex");
    if(wirelessModeIndex >= 1)
    {
      $("input[name='Is11nMode']").val(1);
      if(wirelessModeIndex >=2 )
      {
        $("input[name='Is11acMode']").val(1);
      }
      else
      {
        $("input[name='Is11acMode']").val(0);
      }
      <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
      if(WLANChannelBandwidthIndex != 0)
      {
      <% else %>
      if((WLANChannelBandwidthIndex != 0)&&(WLANChannelBandwidthIndex != 1))
      {
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
    }
    else
    {
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
    loadSelectOptions();
    var sel1 = $("#Channel_ID").val();
    var sel2 = $("input[name='AutoChannelEnable']:checked").val();
    if(sel1 == "0")
    {
      $("#ScanPart").show();
      if(sel2 == "0")
      {
        $("#ScanTimePart").show();
      }
      else
      {
        $("#ScanTimePart").hide();
      }
    }
    else
    {
      $("#ScanPart").hide();
      $("#ScanTimePart").hide();
    }

    if(wirelessModeIndex == 0)
    {
       $("input[name='DownloadMUOFDMAEnable']").attr("disabled",true);
       $("input[name='DownloadMUMIMOEnable']").attr("disabled",true);
    }
    else
    {
       $("input[name='DownloadMUOFDMAEnable']").attr("disabled",false);
       $("input[name='DownloadMUMIMOEnable']").attr("disabled",false);
    }
  }

  function ShowScanTime(num)
  {
    if(num == 1)
    {
      $("#ScanTimePart").show();
    }
    else
    {
      $("#ScanTimePart").hide();
    }
  }

  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-0-advance.asp" method="post">
      <div class="title-text">WLAN Advanced Setting</div>
      <div class="title-description-text">These settings are only for more technically advanced users who have a sufficient knowledge about WLAN. These settings should not be changed unless you know what effect the changes will have on your Access Point.</div>
      <input type="HIDDEN" name="wlanWEPFlag" value="0" >
      <input type="HIDDEN" name="wlan_a_flag" value="0" >
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
      <input type="hidden" name="AutoChannelDisable" value="<% tcWebApi_get("WLan11ac_Common", "AutoChannelDisable", "s") %>">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input TYPE="hidden" NAME="ScanTimeValue" VALUE="<% if tcWebApi_get("WLan11ac_Common","AutoChannelTime","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","AutoChannelTime","s") else asp_Write("900") end if %>">
      <div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">Fragment Threshold:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" name="FragmentThreshold" type="text" value='<% If tcWebApi_get("WLan11ac_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","FragThreshold","s") else asp_Write("2346") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(256-2346)</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">RTS Threshold:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" type="text" name="RTSThreshold" value='<% If tcWebApi_get("WLan11ac_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","RTSThreshold","s") else asp_Write("2347") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(1500-2347)</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">Beacon Interval:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" type="text" name="BeaconInterval" value='<% If tcWebApi_get("WLan11ac_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","BeaconPeriod","s") else asp_Write("100") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(20-1000 ms)</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">DTIM Period:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" type="text" name="DTIM" value='<% If tcWebApi_get("WLan11ac_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","DtimPeriod","s") else asp_Write("1") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(1-255)</label>
        </div>
      </div>
      <div id="wlInfo">
        <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">Band:</div>
          </div>
          <div class="col-4">
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
          <div class="col-4" style="position:absolute;right:-3px;top:90px">
            <label class="input-radio" style="color:red;">If the Wi-Fi cannot be found or connected when 802.11ax/Wi-Fi 6 is enabled, upgrade the wireless network adapter driver of the PC to the latest version.</label>
          </div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">MU-OFDMA:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="1" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">MU-MIMO:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="1" name="DownloadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">Country Sideband:</div>
          </div>
          <div class="col-4">
            <select class="form-control input-select">
              <option>THAILAND</option>
            </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">Channel Number:</div>
          </div>
          <div class="col-4">
            <select class="form-control input-select" name="Channel_ID" id="Channel_ID" onChange="doExtChaLockChange()">
            </select>
          </div>
      </div>
      <div class="row p-1" id="HT_BW_1_div" style="display: none;">
          <div class="col-4">
            <div class="title-text-left">Extended Channel:</div>
          </div>
          <div class="col-4">
            <select class="form-control input-select" name="WLANExtensionChannel" onChange="doExtChannChange()">
              <option value="0" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %> >Down propagation channel</option>
              <option value="1" <% if tcWebApi_get("WLan11ac_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %> >Up propagation channel</option>
            </select>
          </div>
      </div>
      <div class="row p-1" id="ScanPart" name="ScanPart">
        <div class="col-4">
          <div class="title-text-left">Auto Channel Scan:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="AutoChannelEnable" onChange="ShowScanTime(1)" <% If tcWebApi_get("WLan11ac_Common","AutoChannelDisable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="AutoChannelEnable" onChange="ShowScanTime(0)" <% If tcWebApi_get("WLan11ac_Common","AutoChannelDisable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div name="ScanTimePart" id="ScanTimePart" class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Auto Channel Scan Time:</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield" type="text" id="autoChannelTime" name="autoChannelTime" value="<% if tcWebApi_get("WLan11ac_Common","AutoChannelTime","h") <> "N/A" then tcWebApi_get("WLan11ac_Common","AutoChannelTime","s") else asp_Write("900") end if %>">
        </div>
      </div>
      <div class="row p-1" id="11nMode_1_div">
        <div class="col-4">
          <div class="title-text-left">Channel Width:</div>
        </div>
        <div class="col-4">
          <select name="WLANChannelBandwidth" class="form-control input-select" onChange="doChannelBandwidthChange();">
            <% if  tcWebApi_get("WLan11ac_Common","WirelessMode","h")="14" Then %>
              <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
              <option value="1" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
              <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >80MHz</option>
              <option value="3" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "3" then asp_Write("selected") end if %> >Auto</option>
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
              <!--<option value="4" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "4" then asp_Write("selected") end if %> >80+80</option>-->
              <option value="5" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "5" then asp_Write("selected") end if %> >Auto</option>
            <% else %>
              <option value="0" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "0" then asp_Write("selected") end if %> >20MHz</option>
              <option value="1" <% If tcWebApi_get("WLan11ac_Common","WL_BW","h") = "1" then asp_Write("selected") end if %> >40MHz</option>
              <option value="2" <% if tcWebApi_get("WLan11ac_Common","WL_BW","h") = "2" then asp_Write("selected") end if %> >Auto</option>
            <% end If %>
          </select>
        </div>
        <div class="col-4 left">
          <label class="input-radio" style="color:red;margin-bottom:0px;">You are advised to set the bandwidth to Auto.</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Data Rate:</div>
        </div>
        <div class="col-4">
          <select class="form-control input-select" NAME="DataRate"></select>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Preamble Type:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="TxPreamble" <% if tcWebApi_get("WLan11ac_Common","TxPreamble","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Long Preamble</label>
          <input type="radio" value="1" name="TxPreamble" <% if tcWebApi_get("WLan11ac_Common","TxPreamble","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Short Preamble</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Broadcast SSID:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="wlHide" <% If tcWebApi_get("WLan11ac_Entry1","HideSSID","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="wlHide" <% If tcWebApi_get("WLan11ac_Entry1","HideSSID","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Relay Blocking:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="enabled" name="radio2" disabled>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="disabled" name="radio2" disabled>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Protection:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="Protection" <% If tcWebApi_get("WLan11ac_Common","BGProtection","h") <> "1" then asp_Write("checked") end if %>><!--0(auto) or 1(on) enable-->
          <label class="input-radio">Enabled</label>
          <input type="radio" value="2" name="Protection" <% If tcWebApi_get("WLan11ac_Common","BGProtection","h") = "2" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Aggregation:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="1" name="PktAggregate" <% If tcWebApi_get("WLan11ac_Common","PktAggregate","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="PktAggregate" <% If tcWebApi_get("WLan11ac_Common","PktAggregate","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Short GI:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="VHT_SGI"
          <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="VHT_SGI"
          <% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "1" then asp_Write("checked") end if %><% if tcWebApi_get("WLan11ac_Common","VHT_SGI","h") = "N/A" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
          </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">TX Beamforming:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="1" name="ITxBfEn" <% If tcWebApi_get("WLan11ac_Common","ITxBfEn","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="ITxBfEn" <% If tcWebApi_get("WLan11ac_Common","ITxBfEn","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <!--
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Download MU-OFDMA:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
    
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Upload MU-OFDMA:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="UploadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaUlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="UploadMUOFDMAEnable" <% If tcWebApi_get("WLan11ac_Common","MuOfdmaUlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
    
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Download MU-MIMO:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="DownloadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
    
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Upload MU-MIMO:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="UploadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoUlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="UploadMUMIMOEnable" <% If tcWebApi_get("WLan11ac_Common","MuMimoUlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      -->
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Multicast to Unicast:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="IgmpSnEnable" <% if tcWebApi_get("WLan11ac_Common","IgmpSnEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="IgmpSnEnable" <% if tcWebApi_get("WLan11ac_Common","IgmpSnEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      
      <div class="row p-1" style="display: none;">
        <div class="col-4">
          <div class="title-text-left">Band Steering:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="enabled" name="radio2" disabled>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="disabled" name="radio2" disabled>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">WMM:</div>
        </div>
        <div class="col-4">
          <input type="radio" name="Wlwmm" value="1" <% If tcWebApi_get("WLan11ac_Entry1","WMM","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" name="Wlwmm" value="0" <% If tcWebApi_get("WLan11ac_Entry1","WMM","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
      <div class="col-4">
        <div class="title-text-left">802.11k Support:</div>
      </div>
      <div class="col-4">
        <input type="radio" name="rRMEnable" value="1" <% If tcWebApi_get("WLan11ac_Common","RRMEnable","h") = "1" then asp_Write("checked") end if %>>
        <label class="input-radio">Enabled</label>
        <input type="radio" name="rRMEnable" value="0" <% If tcWebApi_get("WLan11ac_Common","RRMEnable","h") = "0" then asp_Write("checked") end if %>>
        <label class="input-radio">Disabled</label>
      </div>
      </div>
      
      <!--<div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">Power Mode:</div>
        </div>
        <div class="col-6">
          <input type="radio" name="trueTxPower" value="1" <% If tcWebApi_get("WLan11ac_Common","TrueTxPower","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Power save</label>
          <input type="radio" name="trueTxPower" value="3" <% If tcWebApi_get("WLan11ac_Common","TrueTxPower","h") = "3" then asp_Write("checked") end if %>>
          <label class="input-radio">High performance</label>
        </div>
      </div>-->
      <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">DFS:</div>
          </div>
          <div class="col-4">
            <input type="radio" value="1" name="wlDFSEnbl" id="wlDFSEnbl1">
            <label class="input-radio">Enabled</label>
            <input type="radio" value="0" name="wlDFSEnbl" id="wlDFSEnbl2">
            <label class="input-radio">Disabled</label>
          </div>
      </div>
      <div class="row p-1" id="isHguTrueSupported_tr" style="display:none;">
          <div class="col-4">
            <div class="title-text-left">Radio Power:</div>
          </div>
          <div class="col-4">
            <input id="trueTxPower1" type="radio" name="trueTxPower" value="3">
            <label class="input-radio">Standard</label>
            <input id="trueTxPower2" type="radio" name="trueTxPower" value="2">
            <label class="input-radio">Medium</label>
            <input id="trueTxPower3" type="radio" name="trueTxPower" value="1">
            <label class="input-radio">Low</label>
          </div>
      </div>
    </form>
    <div class="mt-2 center">
      <button class="btn-dashboard" type="button" onclick="doSave()">Apply</button>
    </div>
  </div>
  <!-- content -->
  <script>
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
    });
  </script>
</body>

</html>
