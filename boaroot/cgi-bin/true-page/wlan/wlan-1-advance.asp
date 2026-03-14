<%
If Request_Form("wlanWEPFlag")="1" Then
  tcWebApi_constSet("WebCurSet_Entry","wlan_ac_id","1")
  'TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
  'TCWebApi_set("WLan_Common","RTSThreshold","RTSThreshold")
  'TCWebApi_set("WLan_Common","FragThreshold","FragmentThreshold")
  'TCWebApi_set("WLan_Common","DtimPeriod","DTIM")

  'TCWebApi_set("WLan_Common","TxPreamble","TxPreamble")
  TCWebApi_set("WLan_Common","BGProtection","Protection")
  'TCWebApi_set("WLan_Common","PktAggregate","PktAggregate")
  'TCWebApi_set("WLan_Common","ITxBfEn","ITxBfEn")
  'TCWebApi_set("WLan_Common","IgmpSnEnable","IgmpSnEnable")
  TCWebApi_set("WLan_Common","DataRate","DataRate")
  TCWebApi_set("WLan_Common","AutoChannelDisable","AutoChannelDisable")
  TCWebApi_set("WLan_Common","AutoChannelTime","ScanTimeValue")
  TCWebApi_set("WLan_Common","MuOfdmaDlEnable","DownloadMUOFDMAEnable")
  'TCWebApi_set("WLan_Common","MuOfdmaUlEnable","UploadMUOFDMAEnable")
  'TCWebApi_set("WLan_Common","HT_GI","HT_GI")
  'TCWebApi_set("WLan_Entry1","HideSSID","wlHide")
  TCWebApi_set("WLan_Entry0","WMM","Wlwmm")
  TCWebApi_set("WLan_Entry1","WMM","Wlwmm")
  'TCWebApi_set("WLan_Common","RRMEnable","rRMEnable")

  TCWebApi_set("WLan_Common","WirelessMode", "hwlgMode")
  TCWebApi_set("WLan_Common","Channel", "wlChannel")
  TCWebApi_set("WLan_Common","HT_BW","bwControlFlag")
  TCWebApi_set("WLan_Common","HT_BSSCoexistence","bwControlhidden")
  if tcwebApi_get("WebCustom_Entry","isHguTrueSupported","h") = "Yes" then
    TCWebApi_set("WLan_Common","TrueTxPower","trueTxPower")
  end if
  tcWebApi_commit("WLan_Common")
  tcWebApi_commit("WLan_Entry")
  TCWebApi_save()
else
  tcWebApi_constSet("WebCurSet_Entry","wlan_id","1")
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
    /*
    function doCheckSave(){
      if(checkBeacon(document.ConfigForm.BeaconInterval.value) ||
        checkRTS(document.ConfigForm.RTSThreshold.value) ||
        checkFrag(document.ConfigForm.FragmentThreshold.value) ||
        checkDTIM(document.ConfigForm.DTIM.value)
      ) {
        return false;
      }
      document.ConfigForm.wlanWEPFlag.value = 1;
      return true;
    }

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
    var srt_device = "<% tcWebApi_get("WLan_Common", "rt_device","s") %>";
    var str_trstream = "1";
    if(srt_device != "N/A")
    {
      if(srt_device.substr(3) == "2")
        str_trstream = "2";
    }
    var Wlan = new Array(new stWlan("<% tcWebApi_get("WLan_Entry","SSID","s") %>",
    "<% tcWebApi_get("WLan_Common","WirelessMode","s") %>","<% tcWebApi_get("WLan_Common","Channel","s") %>",
    "<% tcWebApi_get("WLan_Common","HT_BW","s") %>","<% tcWebApi_get("WLan_Common","HT_BSSCoexistence","s") %>"),null);

    var enbl = <% tcWebApi_get("WLan_Common","APOn","s") %>;
    var ssidIdx = 0;
    var state = enbl;
    var band = 2;
    //var wlCorerev = 8;
    var true_flag = "<% tcwebApi_get("WebCustom_Entry","isHguTrueSupported","s") %>";
    var trueTxPower_flag = "<% tcWebApi_get("WLan_Common","TrueTxPower","s") %>";

    function stWlan(ssid,mode,channel,BWControl,bssCoexistenceControl)
    {
      if(ssid == 'N/A')
        this.ssid = '';
      else
        this.ssid = ssid;
      
      var WirelessMode = 'b,g';
      if (mode == '0')
        WirelessMode = 'b,g';
      else if (mode == '1')
        WirelessMode = 'b';
      else if (mode == '4')
        WirelessMode = 'g';
      else if (mode == '6')
        WirelessMode = 'n';
      else if (mode == '7')
        WirelessMode = 'g,n';
      else if (mode == '9')
        WirelessMode = 'b,g,n';
      <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>	
      else if (mode == '16')
        WirelessMode = 'g,n,ax';
      <% end if %>
      else
        WirelessMode = 'b,g';
      this.mode = WirelessMode;
      
      if(channel == 'N/A')
        this.channel = 'Auto';
      else
        this.channel = channel;
    
      this.BWControl = BWControl;
      if(bssCoexistenceControl == '1' && BWControl == '1')
      {  
        this.BWControl = '2';
      }
    }


    function gModeChange()
    {
      with ( document.forms[0] )
      {
        var mode = getValue('wlgMode');
        if ((mode == 'b,g,n') || (mode == 'g,n') || (mode == 'n')
        <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
            || (mode == 'g,n,ax')
        <% end if %>
        ){
          if(mode == Wlan[ssidIdx].mode)
            setText('bwControl', Wlan[ssidIdx].BWControl);
          else
            setText('bwControl', 2);
          setDisplay('11NbwControl',1);
        }else{
          setText('bwControl', 0);
          setDisplay('11NbwControl',0);
        }
      }
    }

    function bwControlChange() {
      var bwControlValue = getSelectVal("bwControl");
      console.log("bwControlValue: " + bwControlValue);
      if(bwControlValue == '2')
      {
        setText('bwControlhidden', 1);
        setText('bwControlFlag', 1);
      }
      else
      {
        setText('bwControlhidden', 0);
        setText('bwControlFlag', bwControlValue);
      }
    }

    function loadChannelList()
    {
      var CountryRegion = <% tcWebApi_get("WLan_Common","CountryRegion","s") %>;
      
      if (band == "2")
      {
        document.forms[0].wlChannel[0] = new Option("Auto", "0");
        if(CountryRegion == "0"){
          document.forms[0].wlChannel[1] = new Option("1", "1");
          document.forms[0].wlChannel[2] = new Option("2", "2");
          document.forms[0].wlChannel[3] = new Option("3", "3");
          document.forms[0].wlChannel[4] = new Option("4", "4");
          document.forms[0].wlChannel[5] = new Option("5", "5");
          document.forms[0].wlChannel[6] = new Option("6", "6");
          document.forms[0].wlChannel[7] = new Option("7", "7");
          document.forms[0].wlChannel[8] = new Option("8", "8");
          document.forms[0].wlChannel[9] = new Option("9", "9");
          document.forms[0].wlChannel[10] = new Option("10", "10");
          document.forms[0].wlChannel[11] = new Option("11", "11");
          document.forms[0].wlChannel[12] = new Option("12", "12");
          document.forms[0].wlChannel[13] = new Option("13", "13");
        }
        else  if (CountryRegion == "2"){
          document.forms[0].wlChannel[1] = new Option("10", "10");
          document.forms[0].wlChannel[2] = new Option("11", "11");
        }
        else  if (CountryRegion == "3"){
          document.forms[0].wlChannel[1] = new Option("10", "10");
          document.forms[0].wlChannel[2] = new Option("11", "11");
          document.forms[0].wlChannel[3] = new Option("12", "12");
          document.forms[0].wlChannel[4] = new Option("13", "13");
        }
        else  if (CountryRegion == "4"){
          document.forms[0].wlChannel[1] = new Option("4", "4");
        }
        else  if (CountryRegion == "5"){
          document.forms[0].wlChannel[1] = new Option("1", "1");
          document.forms[0].wlChannel[2] = new Option("2", "2");
          document.forms[0].wlChannel[3] = new Option("3", "3");
          document.forms[0].wlChannel[4] = new Option("4", "4");
          document.forms[0].wlChannel[5] = new Option("5", "5");
          document.forms[0].wlChannel[6] = new Option("6", "6");
          document.forms[0].wlChannel[7] = new Option("7", "7");
          document.forms[0].wlChannel[8] = new Option("8", "8");
          document.forms[0].wlChannel[9] = new Option("9", "9");
          document.forms[0].wlChannel[10] = new Option("10", "10");
          document.forms[0].wlChannel[11] = new Option("11", "11");
          document.forms[0].wlChannel[12] = new Option("12", "12");
          document.forms[0].wlChannel[13] = new Option("13", "13");
          document.forms[0].wlChannel[14] = new Option("14", "14");
        }
        else  if (CountryRegion == "6"){
          document.forms[0].wlChannel[1] = new Option("3", "3");
          document.forms[0].wlChannel[2] = new Option("4", "4");
          document.forms[0].wlChannel[3] = new Option("5", "5");
          document.forms[0].wlChannel[4] = new Option("6", "6");
          document.forms[0].wlChannel[5] = new Option("7", "7");
          document.forms[0].wlChannel[6] = new Option("8", "8");
          document.forms[0].wlChannel[7] = new Option("9", "9");
        }
        else{//1 or else
          document.forms[0].wlChannel[1] = new Option("1", "1");
          document.forms[0].wlChannel[2] = new Option("2", "2");
          document.forms[0].wlChannel[3] = new Option("3", "3");
          document.forms[0].wlChannel[4] = new Option("4", "4");
          document.forms[0].wlChannel[5] = new Option("5", "5");
          document.forms[0].wlChannel[6] = new Option("6", "6");
          document.forms[0].wlChannel[7] = new Option("7", "7");
          document.forms[0].wlChannel[8] = new Option("8", "8");
          document.forms[0].wlChannel[9] = new Option("9", "9");
          document.forms[0].wlChannel[10] = new Option("10", "10");
          document.forms[0].wlChannel[11] = new Option("11", "11");
          document.forms[0].wlChannel[12] = new Option("12", "12");
          document.forms[0].wlChannel[13] = new Option("13", "13");
        }
      }
      else if (band == "1")
      {
        document.forms[0].wlChannel[0] = new Option("Auto", "0");
      }
      else
      {
        document.forms[0].wlChannel[0] = new Option("Auto", "0")
      }

      setSelect('wlChannel',Wlan[ssidIdx].channel);
    }

    function SetCtlValue()
    {
      with ( document.forms[0])
      {
        var mode = '0';
        WirelessMode = getSelectVal('wlgMode');
        if (WirelessMode == 'b,g')
          mode = '0';
        else if (WirelessMode == 'b')
          mode = '1';
        else if (WirelessMode == 'g')
          mode = '4';
        else if (WirelessMode == 'n')
          mode = '6';
        else if (WirelessMode == 'g,n')
          mode = '7';
        else if (WirelessMode == 'b,g,n')
          mode = '9';
        <% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
        else if (WirelessMode == 'g,n,ax')
          mode = '16';
        <% end if %>
        else
          mode = '0';
        setText('hwlgMode', mode);
        
        var bwControlValue = getSelectVal("bwControl");
        if(bwControlValue == '2')
        {
          setText('bwControlhidden', 1);
          setText('bwControlFlag', 1);
        }
        else
        {
          setText('bwControlhidden', 0);
          setText('bwControlFlag', bwControlValue);
        }
        
        setText('wlanWEPFlag', 1);
        return true;
      }
    }
    
    function isDigit(val) {
      if (val < '0' || val > '9')
        return false;
      return true;
    }

    function changeChannel()
    {
      var sel1 = $("#wlChannel").val();
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
    
    function checkSaveValue()
    {
      var autoChannelTime = $("#autoChannelTime").val();
      if (!isDecimalDigit(autoChannelTime))
      {
        alert("Auto Channel Scan Time must be an integer!");
        return false;
      }
      return true;
    }

    function doCheckSave(){
      if(checkSaveValue())
      {
        SetCtlValue();
        return true;
      }
      return false;
    }

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
          var Channel = $("#wlChannel").val();
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
      
      ctlOption.options[<% tcWebApi_get("WLan_Common","DataRate","s") %>].selected=true;
    }

    function LoadFrame()
    {
      with ( document.forms[0] )
      {
        setSelect('wlgMode',Wlan[ssidIdx].mode);
        console.log("BWControl: "+Wlan[ssidIdx].BWControl);
        setSelect('bwControl',Wlan[ssidIdx].BWControl);
        loadChannelList();
        gModeChange();
        //setText('wlSsid',Wlan[ssidIdx].ssid);
      }
      //setDisable('wlAssociateNum',0);
      if(true_flag == "Yes")
      {
        setDisplay("isHguTrueSupported_tr", 1);
        if(trueTxPower_flag == "3"){
          $("input[name=trueTxPower]:eq(0)").prop("checked",'checked');
        }else if(trueTxPower_flag == "2"){
          $("input[name=trueTxPower]:eq(1)").prop("checked",'checked');
        }else if(trueTxPower_flag == "1" || trueTxPower_flag == "N/A"){
          $("input[name=trueTxPower]:eq(2)").prop("checked",'checked');
        }
      }
      loadSelectOptions();
    }
    
    function init()
    {
      LoadFrame();
      var sel1 = $("#wlChannel").val();
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

<body onload="init()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-1-advance.asp" method="post">
      <div class="title-text">WLAN Advanced Setting</div>
      <div class="title-description-text">These settings are only for more technically advanced users who have a sufficient knowledge about WLAN. These settings should not be changed unless you know what effect the changes will have on your Access Point.</div>
      <input type="HIDDEN" name="wlanWEPFlag" value="0" >
      <input type="hidden" id="bwControlFlag" name="bwControlFlag" value="0">
      <input type="hidden" id="bwControlhidden" name="bwControlhidden" value="0">
      <input type="hidden" name="hwlgMode" value="0">
      <input type="hidden" name="AutoChannelDisable" value="<% tcWebApi_get("WLan_Common", "AutoChannelDisable", "s") %>">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input TYPE="hidden" NAME="ScanTimeValue" VALUE="<% if tcWebApi_get("WLan_Common","AutoChannelTime","h") <> "N/A" then tcWebApi_get("WLan_Common","AutoChannelTime","s") else asp_Write("900") end if %>">
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Fragment Threshold:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" name="FragmentThreshold" type="text"
              value='<% If tcWebApi_get("WLan_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","FragThreshold","s") else asp_Write("2346") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(256-2346)</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">RTS Threshold:</div>
        </div>-->
        <!--<div class="col-3">
          <input class="form-control input-textfield" type="text" name="RTSThreshold"
              value='<% If tcWebApi_get("WLan_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","RTSThreshold","s") else asp_Write("2347") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(1500-2347)</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Beacon Interval:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" type="text" name="BeaconInterval"
              value='<% If tcWebApi_get("WLan_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","BeaconPeriod","s") else asp_Write("100") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(20-1000 ms)</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">DTIM Period:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" type="text" name="DTIM"
              value='<% If tcWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","DtimPeriod","s") else asp_Write("1") end if %>'>
        </div>
        <div class="col-3 left">
          <label class="input-radio">(1-255)</label>
        </div>
      </div>-->
      <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">Band:</div>
          </div>
          <div class="col-4">
            <select class="form-control input-select" name="wlgMode" onChange="gModeChange()">
              <option value="b,g,n" >2.4GHz (B+G+N)</option>
              <option value="b,g" >2.4GHz (B+G)</option>
              <option value="g,n" >2.4GHz (G+N)</option>
              <option value="n" >2.4GHz (N)</option>
              <option value="g" >2.4GHz (G)</option>
              <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
              <option value="g,n,ax">2.4GHz (G+N+AX)</option>
<% end if %>
            </select>
          </div>
          <div class="col-4" style="position:absolute;right:-3px;top:90px">
            <label class="input-radio" style="color:red;">If the Wi-Fi cannot be found or connected when 802.11ax/Wi-Fi 6 is enabled, upgrade the wireless network adapter driver of the PC to the latest version.</label>
          </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">MU-OFDMA:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="1" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
            <div class="title-text-left">Country :</div>
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
            <select class="form-control input-select" name="wlChannel" id="wlChannel" onchange="changeChannel()">
            </select>
          </div>
      </div>
      <div class="row p-1" id="ScanPart" name="ScanPart">
        <div class="col-4">
          <div class="title-text-left">Auto Channel Scan:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="AutoChannelEnable" onChange="ShowScanTime(1)" <% If tcWebApi_get("WLan_Common","AutoChannelDisable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="AutoChannelEnable" onChange="ShowScanTime(0)" <% If tcWebApi_get("WLan_Common","AutoChannelDisable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div id="ScanTimePart" name="ScanTimePart" class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Auto Channel Scan Time:</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield" type="text" id="autoChannelTime" name="autoChannelTime" value="<% if tcWebApi_get("WLan_Common","AutoChannelTime","h") <> "N/A" then tcWebApi_get("WLan_Common","AutoChannelTime","s") else asp_Write("900") end if %>">
        </div>
      </div>
      <div class="row p-1" id="11NbwControl">
          <div class="col-4">
            <div class="title-text-left">Channel Width:</div>
          </div>
          <div class="col-4">
            <select class="form-control input-select" id="bwControl" name="bwControl" onchange="bwControlChange()">
              <option value="0" >20MHz</option>
              <option value="1" >40MHz</option>
              <option value="2" >Auto</option>
            </select>
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
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Preamble Type:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="0" name="TxPreamble" <% if tcWebApi_get("WLan_Common","TxPreamble","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Long Preamble</label>
          <input type="radio" value="1" name="TxPreamble" <% if tcWebApi_get("WLan_Common","TxPreamble","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Short Preamble</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Broadcast SSID:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="0" name="wlHide" <% If tcWebApi_get("WLan_Entry1","HideSSID","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="wlHide" <% If tcWebApi_get("WLan_Entry1","HideSSID","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Relay Blocking:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="enabled" name="radio2" disabled>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="disabled" name="radio2" disabled>
          <label class="input-radio">Disabled</label>
        </div>
      </div>-->
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Protection:</div>
        </div>
        <div class="col-4">
          <input type="radio" value="0" name="Protection" <% If tcWebApi_get("WLan_Common","BGProtection","h") <> "1" then asp_Write("checked") end if %>><!--0(auto) or 1(on) enable-->
          <label class="input-radio">Enabled</label>
          <input type="radio" value="2" name="Protection" <% If tcWebApi_get("WLan_Common","BGProtection","h") = "2" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <!--
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Download MU-OFDMA:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaDlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="DownloadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaDlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Upload MU-OFDMA:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="UploadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaUlEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="UploadMUOFDMAEnable" <% If tcWebApi_get("WLan_Common","MuOfdmaUlEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>
      -->
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
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Aggregation:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="PktAggregate" <% If tcWebApi_get("WLan_Common","PktAggregate","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="PktAggregate" <% If tcWebApi_get("WLan_Common","PktAggregate","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Short GI:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="0" name="HT_GI"
          <% if tcWebApi_get("WLan_Common","HT_GI","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="HT_GI"
          <% if tcWebApi_get("WLan_Common","HT_GI","h") = "1" then asp_Write("checked") end if %><% if tcWebApi_get("WLan_Common","HT_GI","h") = "N/A" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
          </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">TX Beamforming:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="1" name="ITxBfEn" <% If tcWebApi_get("WLan_Common","ITxBfEn","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="0" name="ITxBfEn" <% If tcWebApi_get("WLan_Common","ITxBfEn","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>-->
      <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Multicast to Unicast:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="0" name="IgmpSnEnable" <% if tcWebApi_get("WLan_Common","IgmpSnEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="1" name="IgmpSnEnable" <% if tcWebApi_get("WLan_Common","IgmpSnEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
      </div>-->
    <!--<div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Band Steering:</div>
      </div>
      <div class="col-6">
        <input type="radio" value="enabled" name="radio2" disabled>
        <label class="input-radio">Enabled</label>
        <input type="radio" value="disabled" name="radio2" disabled>
        <label class="input-radio">Disabled</label>
      </div>
    </div>-->
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">WMM:</div>
      </div>
      <div class="col-6">
        <input type="radio" name="Wlwmm" value="1" <% If tcWebApi_get("WLan_Entry1","WMM","h") = "1" then asp_Write("checked") end if %>>
        <label class="input-radio">Enabled</label>
        <input type="radio" name="Wlwmm" value="0" <% If tcWebApi_get("WLan_Entry1","WMM","h") = "0" then asp_Write("checked") end if %>>
        <label class="input-radio">Disabled</label>
      </div>
    </div>
    <!--<div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">802.11k Support:</div>
        </div>
        <div class="col-6">
          <input type="radio" name="rRMEnable" value="1" <% If tcWebApi_get("WLan_Common","RRMEnable","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">Enabled</label>
          <input type="radio" name="rRMEnable" value="0" <% If tcWebApi_get("WLan_Common","RRMEnable","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">Disabled</label>
        </div>
    </div>-->
    </form>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" onclick="doSave()">Apply</button>
      </div>
  </div>
  <!-- content -->
</body>

</html>
