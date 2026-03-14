<%
If Request_Form("Save_Flag")="1" Then
  TCWebApi_set("WLan_Common", "APOn", "hwlEnbl")
  'TCWebApi_set("WLan_Common","WirelessMode", "hwlgMode")
  'TCWebApi_set("WLan_Common","Channel", "wlChannel")
  'TCWebApi_set("WLan_Common","HT_BW","bwControlFlag")
  'TCWebApi_set("WLan_Common","HT_BSSCoexistence","bwControlhidden")
  if tcwebApi_get("WebCustom_Entry","isHguTrueSupported","h") = "Yes" then
    'TCWebApi_set("WLan_Common","TrueTxPower","trueTxPower")
  end if
  TCWebApi_set("WLan_Entry","SSID", "wlSsid")
  if tcwebApi_get("WebCustom_Entry","isMaxStaNumSupported","h" ) = "Yes" then
    TCWebApi_set("WLan_Entry","MaxStaNum", "wlAssociateNum")
  end if

  TCWebApi_set("WLan_Entry1","HideSSID","wlHide")

  TCWebApi_commit("WLan_Entry")
  tcWebApi_save()
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
  <div class="container-full">
    <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-1-basic.asp" method="post">
      <input type="hidden" name="Save_Flag" value="0">
      <input type="hidden" id="bwControlFlag" name="bwControlFlag" value="0">
      <input type="hidden" id="bwControlhidden" name="bwControlhidden" value="0">
      <input type="hidden" name="hwlEnbl" value="0">
      <input type="hidden" name="hwlgMode" value="0">
      <input TYPE="hidden" name="maxStaNum" value="<% tcWebApi_get("Info_WLan","maxStaNumSupported","s") %>" >
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <div class="title-text">WLAN Basic Setting</div>
      <div class="title-description-text">This page is used to configure the parameters for WLAN clients which may connect to your Access Point. Here you may change wireless encryption settings as well as wireless network parameters.</div>
      <div class="row p-1">
        <div class="col-md-6 col-sx-12 pl60">
          <input onclick=wlClickEnble(this) type="checkbox" value="1" name="wlEnbl" <% if tcWebApi_get("WLan_Common","APOn","h") = "0" then asp_Write("checked") end if %> >
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
            <select class="form-control input-select" name="wlgMode" onChange="gModeChange()">
              <option value="b,g,n" >2.4GHz (B+G+N)</option>
              <option value="b,g" >2.4GHz (B+G)</option>
              <option value="g,n" >2.4GHz (G+N)</option>
              <option value="n" >2.4GHz (N)</option>
              <option value="g" >2.4GHz (G)</option>
              <option value="b" >2.4GHz (B)</option>
<% if tcWebApi_get("WebCustom_Entry","is11AXModeSupported","h") = "Yes" then %>
              <option value="g,n,ax">802.11g/n/ax Mixed</option>
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
              <option value="1">AP</option>
              <option value="2">AC</option>
            </select>
          </div>
          <div class="col-3 left">
            <a class="btn-file btn-a" href="./wlan-1-multiple-aps.asp">Multiple AP</a>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">SSID:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" name="wlSsid" maxlength="32" value="">
          </div>
        </div>
        <!--<div class="row p-1" id="11NbwControl">
          <div class="col-6">
            <div class="title-text-left">Channel Width:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" id="bwControl" name="bwControl" onchange="bwControlChange()">
              <option value="0" >20MHz</option>
              <option value="1" >40MHz</option>
              <option value="2" >Auto</option>
            </select>
          </div>
        </div>-->
        <!--<div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Channel Number:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name="wlChannel">
            </select>
          </div>
        </div>-->
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Associate Number:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" id="wlAssociateNum" name="wlAssociateNum" value="<% if tcWebApi_get("WLan_Entry","MaxStaNum","h") <> "N/A" then tcWebApi_get("WLan_Entry","MaxStaNum","s") else asp_Write("64") end if %>" MAXLENGTH="2" onblur="checkwlAssociateNumValue();">
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Broadcast SSID:</div>
          </div>
          <div class="col-6">
            <input type="radio" value="0" name="wlHide" <% If tcWebApi_get("WLan_Entry1","HideSSID","h") = "0" then asp_Write("checked") end if %>>
            <label class="input-radio">Enabled</label>
            <input type="radio" value="1" name="wlHide" <% If tcWebApi_get("WLan_Entry1","HideSSID","h") = "1" then asp_Write("checked") end if %>>
            <label class="input-radio">Disabled</label>
          </div>
        </div>
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
            <a class="btn-file btn-a" href="./wlan-1-client.asp">Show Active WLAN Client</a>
          </div>
        </div>
        -->
      </div>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" id=btnOK onclick=SubmitForm()>Apply</button>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
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
    var wlCorerev = 8;
    var true_flag = "<% tcwebApi_get("WebCustom_Entry","isHguTrueSupported","s") %>";
    var trueTxPower_flag = "<% tcWebApi_get("WLan_Common","TrueTxPower","s") %>";
    
    $(document).ready(function(){
      LoadFrame();
    });

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

    function wlClickEnble(wlEnbleCl)
    {   
      if (wlEnbleCl.checked == true)
      {
        $("#wlInfo").hide();
      }
      else
      {
        if (state == 1){
          $("#wlInfo").show();
        }
      }
    }

    function LoadFrame()
    {
      with ( document.forms[0] )
      {
        if(enbl == 1){
          setCheck('wlEnbl', 0);
        }else{
          setCheck('wlEnbl', 1);
        }
        wlClickEnble(getElById('wlEnbl'));
        //setSelect('wlgMode',Wlan[ssidIdx].mode);

        //console.log("BWControl: "+Wlan[ssidIdx].BWControl);
        //setSelect('bwControl',Wlan[ssidIdx].BWControl);
        //loadChannelList();
        //gModeChange();
        setText('wlSsid',Wlan[ssidIdx].ssid);
      }
      setDisable('wlAssociateNum',0);
      /*if(true_flag == "Yes")
      {
        setDisplay("isHguTrueSupported_tr", 1);
        if(trueTxPower_flag == "3"){
          $("input[name=trueTxPower]:eq(0)").prop("checked",'checked');
        }else if(trueTxPower_flag == "2"){
          $("input[name=trueTxPower]:eq(1)").prop("checked",'checked');
        }else if(trueTxPower_flag == "1" || trueTxPower_flag == "N/A"){
          $("input[name=trueTxPower]:eq(2)").prop("checked",'checked');
        }
      }*/
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
      else  if (band == "1")
      {
        document.forms[0].wlChannel[0] = new Option("Auto", "0");
      }
      else
      {
        document.forms[0].wlChannel[0] = new Option("Auto", "0")
      }

      setSelect('wlChannel',Wlan[ssidIdx].channel);
    }

    function strwlSsidCheck(str)
    {
      if(str.value.length <= 0)
      {
        alert("SSID is empty");
        return false;
      }
      if(str.value.match(/[^\x00-\xff]/g))
      {
        alert("Invalid SSID Input!");
        return false;
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
        return false;
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

      return true;
    } 
    
    function SubmitForm()
    {
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
        if(checkStationNum($("input[name='wlAssociateNum']").val(), $("input[name='maxStaNum']").val())){
          return false;
        }
      <% End If %>
      
      if(!strwlSsidCheck(document.ConfigForm.wlSsid)){
        return false;
      }
      
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
        if($("input[name='wlEnbl']").prop("checked")){
          alert("WLAN Interface cannot be disbale when mesh is enable.");
          return false;
        }
      <% end if %>
      
      return true;
    }

    function SetCtlValue()
    {
      with ( document.forms[0])
      {
        var enable = getCheckVal('wlEnbl');
        if(enable == 1)
          setText('hwlEnbl', 0);
        else
          setText('hwlEnbl', 1);
        /*
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
        */
        setText('Save_Flag', 1);
        return true;
      }
    }

    function checkwlAssociateNumValue()
    {
        var value = document.getElementById("wlAssociateNum").value;
        var limit = $("input[name='maxStaNum']").val();
        if(false == isNumeric(value))
        {
            alert("Associate Number value must be between 1 and " + limit);
            document.getElementById("wlAssociateNum").value = '64';
        }
    }
  </script>
</body>

</html>