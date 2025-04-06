<%
if Request_Form("WpsActive") = "1" then
    TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
    TCWebApi_commit("WLan11ac_Entry")
    TCWebApi_save()
end if

if Request_Form("WpsActive") = "0" then
    TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeNone")
    TCWebApi_commit("WLan11ac_Entry")
    TCWebApi_save()
end if

If Request_Form("WpsGenerate") = "1" then
    TCWebApi_set("Info_WLan11ac","WPSGenPinCode","WpsGenerate")
    TCWebApi_commit("WLan11ac_Entry")
    TCWebApi_save()
end if

if Request_Form("isWPSSupported") = "1" then
    if Request_Form("hWpsStart") = "1" then 
        TCWebApi_set("WLan11ac_Entry","WPSConfStatus","WPSConfigured")
        TCWebApi_set("Info_WLan11ac","WPSActiveStatus","hWpsStart")
        TCWebApi_set("WLan11ac_Entry","WPSConfMode","WpsConfModeAll")
        TCWebApi_set("WLan11ac_Entry","WPSMode","hWPSMode")
        if Request_form("hWPSMode") = "0" then
            TCWebApi_set("WLan11ac_Entry","enrolleePinCode","pinvalue")
        end if
    TCWebApi_commit("WLan11ac_Entry")
    TCWebApi_save()
    end if
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>WLAN - Wi-Fi Protected Setup</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- style -->

    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
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
    <!-- script -->

    <!-- self sript -->
    <script src="/scripts/utils/util_skyw.js"></script>

    <script language=JavaScript type=text/javascript>
    var wlanSelfPinCode_flag = "<% tcWebApi_get("Info_WLan11ac", "wlanSelfPinCode", "s") %>";

    function stWlan(BeaconType,BasicEncrypt,BasicAuth,WPAEncrypt,WPAAuth)
    {
        this.BeaconType = BeaconType;
        this.BasicAuth = BasicAuth;
        this.BasicEncrypt = BasicEncrypt;
        this.WPAAuth = WPAAuth;
        this.WPAEncrypt = WPAEncrypt;
    }
    var WlanInfo = new stWlan(
    "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>",
    "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>",
    "<% tcWebApi_get("WLan11ac_Entry","WEPAuthType","s") %>",
    "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>",
    "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>",);
    var Auth;

    if (WlanInfo.BeaconType.indexOf('WEP') > -1)
    {
        Auth = "WEP";
    }
    else if(WlanInfo.BeaconType.indexOf('OPEN') > -1)
    {
        Auth = "OPEN";
    }
    else 
    {
        Auth = WlanInfo.WPAEncrypt;
        if(Auth.toUpperCase ()=="WPAPSK"){
            Auth ="WPA-PSK";
        }else if(Auth.toUpperCase ()=="WPA2PSK"){
            Auth="WPA2-PSK";
        }else if(Auth.toUpperCase ()=="WPAPSKWPA2PSK"){
            Auth="WPA-PSK/WPA2-PSK";
        }
    }

    function isvalidpin(val)
    {
        var ret = false;
        var len = val.length;
        var pinSize = 8;
        var pinvalue = new Array();
        if ( len !=  pinSize)
        {
            return false;
        }
        else
        {
            for(i = 0; i < pinSize; i++ )
            {
                pinvalue[i] = parseInt(val.charAt(i),10);
            }
            var accum = 0;
            accum = (pinvalue[0] + pinvalue[2] + pinvalue[4] + pinvalue[6]) * 3 + pinvalue[1] + pinvalue[3] + pinvalue[5] + pinvalue[7];
            if (0 == (accum % 10))
            {
                return true; 
            }
            else
            {
                return false; 
            }
        }
        return ret;
    }

    function doStartWPS(type)
    {
        var vStartSSID = "<% tcWebApi_get("WLan11ac_Entry","StartSSID","s") %>";

        if("0" == vStartSSID)
        {
          alert("Current SSID is disable.Please select the enabled SSID.");
        }
        else
        {
          var pinValue = document.ConfigForm.pinvalue.value;
          if(isSafeStringIn(pinValue,'0123456789') == false)
          {
              alert('PIN code should be numbers!');
              return false;
          }

          if(type == 0) 
          {
              if(pinValue.length != 8)
              {
                  alert('Please input 8 bytes PIN code');
                  return false;
              }

              if(isvalidpin(pinValue) == false)
              {
                  alert('Invalid PIN code.' + pinValue);
                  return false;
              }
              setText('hWPSMode', 0);
          }
          else
          {
          	setText('hWPSMode', 1);
          }

          setText('hWpsStart',1);
          if(getValue('isInWPSing')==0){
              alert("Please start WPS in two minutes!");
          }
          
          document.ConfigForm.submit();
          showLoading();
        }
    }
	
	function ApplyChanges()
	{
	    document.ConfigForm.submit();
	    showLoading();
	}
	
  function Reset()
  {
      var vStartSSID = "<% tcWebApi_get("WLan11ac_Entry","StartSSID","s") %>";
      var vEntry = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";

      if("0" == vStartSSID)
      {
        alert("Current SSID is disable.Please select the enabled SSID.");
      }
      else if(vEntry.indexOf("WEP")>=0)
      {
        alert("WEP not allowed when WPS is enabled! Please disable WEP first.");
      }
      else
      {
        var pinValue = document.ConfigForm.pinvalue.value;
        if(isSafeStringIn(pinValue,'0123456789') == false)
       {
           alert('PIN code should be numbers!');
           return false;
       }
        setText('hWPSMode', 1);
        setText('hWpsStart',1);
    
        document.ConfigForm.submit();
        showLoading();
      }
  }

    function doWPSUseChange() 
    {
        var vEntry = "<% tcWebApi_get("WLan11ac_Entry","AuthMode","s") %>";

        if(vEntry.indexOf("WEP")>=0)
        {
          if(!document.ConfigForm.enableWps.checked)
          {
            alert("WEP not allowed when WPS is enabled! Please disable WEP first.");
            document.ConfigForm.enableWps.checked = true;
          }
        }
        else
        {
          if(document.ConfigForm.enableWps.checked)
          {
              document.ConfigForm.WpsActive.value = "0";
          }
          else
          {
              document.ConfigForm.WpsActive.value = "1";
          }
          document.ConfigForm.SaveAlter_Flag.value = "1";
          document.ConfigForm.submit();
          //showLoading();
        }
    }    

    function doGenerate()
    {
        document.ConfigForm.WpsGenerate.value = "1";
        <%if tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") <> "0" then%>
        document.ConfigForm.submit();
        showLoading();
        <% end if %>
    }

    function load()
    {
        var wpsenable = "<% tcWebApi_get("WLan11ac_Entry","WPSConfMode","s") %>";
        var wlanEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";
        if( wpsenable != '0' && wlanEnbl !='0')
        {
            $("#wpsInfo").show();
            $("#client_pin_number").show();
            $("#tips").hide();
        } 
        else if( (wpsenable == '0' && wlanEnbl =='0') || wpsenable == '0')
        {
            $("#wpsInfo").hide();
            $("#client_pin_number").hide();
            $("#tips").hide();
        }
        else if(wpsenable != '0' && wlanEnbl =='0')
        {
            $("#wpsInfo").hide();
            $("#client_pin_number").hide();
            $("#tips").show();
        }
    }
  </script>
</head>

<body onload="load()">
<!-- content -->
    <form name=ConfigForm method="post" action="/cgi-bin/true-page/wlan/wlan-0-wps.asp">
    <input type="hidden" name="WpsActive" value="2">
    <input type="hidden" name="WpsConfModeAll" value="7">
    <input type="hidden" name="WpsConfModeNone" value="0">
    <input type="hidden" name="WpsGenerate" value="0" >
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">

    <% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
    <input type="hidden" name="isWPSSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>" >
    <INPUT TYPE="HIDDEN" NAME="WPSConfigured" value="2" >
    <% if tcwebApi_get("WebCustom_Entry","isMultiSupported","h") = "Yes" then %>
    <input type="hidden" name="isInWPSing" value="<%tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning_1","s")%>">
    <% else %>
    <input type="hidden" name="isInWPSing" value="<%tcWebApi_get("Info_WLan11ac","wlanWPStimerRunning","s")%>">
    <% end if %>
    <input type="hidden" name="hWpsStart" value="0">
    <input type="hidden" name="hWPSMode" value="0">
    <% end if %>

    <div class="container-full container-resize-height">
      <div class="title-text">Wi-Fi Protected Setup</div>
      <div class="title-description-text">This page allows you to change the setting for WPS (Wi-Fi Protected Setup). Using this feature could let your WLAN client automically syncronize its setting and connect to the Access Point in a minute without any hassle.</div>
      <div class="row p-1">
        <div class="col-6 pl60">
          <input type="checkbox" value="1" name="enableWps" 
          <% If tcWebApi_get("WLan11ac_Entry","WPSConfMode","h") = "0" then asp_Write("checked") end if %> onclick="">
          <label class="input-radio">Disable WPS</label>
          <label class="input-radio" id='tips' style="display: none">
            <a href="/cgi-bin/true-page/wlan/wlan-0-basic.asp">
              <strong><font color='#FF0000' size='-1'>Please enable 5g wifi</font></strong>
            </a>
          </label>
        </div>
      </div>
      <hr>
      <div id="wpsInfo">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">WPS Status:</div>
        </div>
        <div class="col-6">
          <input type="radio" value="configured" name="radio" disabled>
          <label class="input-radio">Configured</label>
          <input type="radio" value="unconfigured" name="radio" disabled>
          <label class="input-radio">Unconfigured</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Auto lock-down state:</div>
        </div>
        <div class="col-3">
          <div class="title-text-right">Unlocked</div>
        </div>
        <div class="col-3 left">
          <button class="btn-file" disabled>Unlock</button>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Self-PIN Number:</div>
        </div>
        <div class="col-3">
          <script language=JavaScript type=text/javascript>
            document.writeln(' <input class="form-control input-textfield" type="text" value="' + wlanSelfPinCode_flag + '">');
          </script>
        </div>
        <div class="col-3 left">
          <button type="button" id="pin_generate" name="pin_generate" onclick="doGenerate()" class="btn-file">Regenarate PIN</button>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">WPS PBC:</div>
        </div>
        <div class="col-3 left">
          <button type="button" name="btnStartWPS" onclick="doStartWPS(1)" class="btn-file">Start PBC</button>
        </div>
      </div>
      </div>
	  <div class="mt-2 center">
		  <button class="btn-dashboard" type="button" name="btnStartWPS" onclick="doWPSUseChange()">Apply Changes</button>
		  <button class="btn-dashboard" type="button" name="btnStartWPS" onclick="Reset()">Reset</button>
	  </div>
      <hr>
      <div id='wifiinfo'>
      <div class="card-table-content">
        <div class="table-header">Current Key Info</div>
        <table style="width:100%">
          <tr class="table-header center">
            <th style="width: 20%;" class="p-1">SSID</th>
            <th style="width: 20%;">Authentication</th>
            <th style="width: 20%;">Encryption</th>
            <th style="width: 20%;">Key</th>
            <th style="width: 20%;">Enable</th>
          </tr>
          <tr class="table-content-fist center">
            <td><% tcWebApi_get("WLan11ac_Entry","SSID","s") %></td>
            <script language="JavaScript" type="text/JavaScript">
            document.writeln('<td class="p-1">' + Auth + '</td>');
            if("OPEN" == Auth)
            {
              document.writeln('<td>-</td>');
              document.writeln('<td>-</td>');
            }
            else if("WEP" == Auth)
            {
              document.writeln('<td>RC4</td>');
              var WEPkey = "<%if tcWebApi_get("WLan11ac_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","Key1Str","s") end if%>";
              document.writeln('<td>' + WEPkey + '</td>');
            }
            else
            {
              var encryptype = "<% tcWebApi_get("WLan11ac_Entry","EncrypType","s") %>";
              if("AES" == encryptype)
                  document.writeln('<td>AES</td>');
              if("TKIP" == encryptype)
                  document.writeln('<td>TKIP</td>');
              if("TKIPAES" == encryptype)
                  document.writeln('<td>TKIP/AES</td>');
              var WPAPSK = "<%if tcWebApi_get("WLan11ac_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan11ac_Entry","WPAPSK","s") end if%>";
              document.writeln('<td>' + WPAPSK + '</td>');
            }
            </script>
            <td><%if tcWebApi_get("WLan11ac_Entry","StartSSID","h") <> "1" then %>
                  No
                <%else%>
                  Yes
                <%end if%>
            </td>
          </tr>
        </table>
      </div>
      </div>
      <hr>
      <div id='client_pin_number'>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Client PIN Number:</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" name=pinvalue
                value="<% If tcWebApi_get("WLan11ac_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("WLan11ac_Entry","enrolleePinCode","s") end if %>">
          </div>
          <div class="col-3 left">
              <button type="button" name="btnStartWPS" onclick="doStartWPS(0)" class="btn-file">Start PIN</button>
          </div>
      </div>
    </div>
  </form>
<!-- content -->
</body>

</html>