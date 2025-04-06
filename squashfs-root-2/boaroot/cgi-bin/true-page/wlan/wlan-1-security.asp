<%
if Request_Form("wlanWEPFlag")="1" Then
  if Request_Form("WEP_Selection") = "WEP" then
    TCWebApi_set("WLan_Entry","AuthMode","WEP_Selection2")
    TCWebApi_set("WLan_Entry","WEPAuthType","authType")
    tcWebApi_constSet("WLan_Entry","DefaultKeyID","1")
    TCWebApi_set("WLan_Entry","Key1Str","WEP_Key")
  else
    TCWebApi_set("WLan_Entry","AuthMode","WEP_Selection")
    TCWebApi_set("WLan_Entry","WPAPSK","PreSharedKey")
    TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection")
    TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter")
  end if

  TCWebApi_save()
  TCWebApi_commit("WLan_Entry")
end if
if Request_Form("wlanWEPFlag")="2" Then
  TCWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")
  TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Security</title>
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
      <form name=ConfigForm action="/cgi-bin/true-page/wlan/wlan-1-security.asp" method="post" >
      <input type="hidden" name="wlanWEPFlag" value="0" >
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">

      <div class="title-text">WLAN Security Setting</div>
      <div class="title-description-text">This page allows you setup the WLAN security. Turn on WEP or WPA by using Encryption Keys could prevent any unauthorized access to your wireless network.</div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">SSID Index:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" name="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
            <option value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "1" then asp_write("selected") end if %> >SSID1 ( <% TCWebApi_get("WLan_Entry1","SSID","s") %> )</option>
            <option value="2" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "2" then asp_write("selected") end if %> >SSID2 ( <% TCWebApi_get("WLan_Entry2","SSID","s") %> )</option>
            <option value="3" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "3" then asp_write("selected") end if %> >SSID3 ( <% TCWebApi_get("WLan_Entry3","SSID","s") %> )</option>
            <option value="4" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "4" then asp_write("selected") end if %> >SSID4 ( <% TCWebApi_get("WLan_Entry4","SSID","s") %> )</option>
<%if 1 = 1 then%>
            <option value="5" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "5" then asp_write("selected") end if %> >SSID5 ( <% TCWebApi_get("WLan_Entry5","SSID","s") %> )</option>
            <option value="6" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "6" then asp_write("selected") end if %> >SSID6 ( <% TCWebApi_get("WLan_Entry6","SSID","s") %> )</option>
            <option value="7" <% if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "7" then asp_write("selected") end if %> >SSID7 ( <% TCWebApi_get("WLan_Entry7","SSID","s") %> )</option>
<% end if %>
          </select>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Encryption:</div>
        </div>
        <div class="col-6">
          <select name="WEP_Selection" onChange="doWEPChange()" class="form-control input-select">
            <option value="OPEN" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>>OPEN</option>
            <option value="WEP" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-64Bits" then asp_Write("selected") end if if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-128Bits" then asp_Write("selected") end if %>>WEP</option>
            <option value="WPAPSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>>WPA-PSK</option>
            <option value="WPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>>WPA2-PSK</option>
            <option value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %>>WPA-PSK/WPA2-PSK</option>
            <% if tcWebApi_get("WebCustom_Entry","isWPA3ModeSupported","h") = "Yes" then %>
            <option value="WPA3PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA3PSK" then asp_Write("selected") end if %>>WPA3-PSK</option>
            <option value="WPA2PSKWPA3PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA2PSKWPA3PSK" then asp_Write("selected") end if %>>WPA2-PSK/WPA3-PSK</option>
            <% end if %>
          </select>
        </div>
      </div>
      <div id="Authx" class="element-hide" hidden="hidden">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">802.1x Authentication:</div>
          </div>
          <div class="col-6">
            <input type="checkbox" value="checkbox" name="checkbox" disabled>
          </div>
        </div>
      </div>
    
      <div id="upTime" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Group Key Update Timer:</div>
        </div>
        <div class="col-6"> 
          <input class="form-control input-textfield" type="text" id="WPARekeyInter" NAME="WPARekeyInter" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)" value="<% If tcWebApi_get("WLan_Entry","RekeyInterval","h") <> "N/A" then tcWebApi_get("WLan_Entry","RekeyInterval","s") end if %>" >
        </div>
      </div>
      <div id="WPA_div" class="element-hide">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Encryption Mode:</div>
          </div>
          <div class="col-6">
            <select name="TKIP_Selection" onChange="doEncryptionChange(this)" class="form-control input-select">
              <option value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>>AES</option>
              <option value="TKIP" <% If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> >TKIP</option>
              <option value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>>TKIP/AES</option>
            </select>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Pre-Shared Key:</div>
          </div>
          <div class="col-4">
            <input class="form-control input-textfield" type="password" id="PreSharedKey" name="PreSharedKey" maxlength="64" onBlur="wpapskCheck(this)" 
            value="<% If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if %>">
          </div>
          <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="changePwdVisible()">
          </div>
        </div>
      </div>

      <div id="WEP_div" class="element-hide">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Authentication:</div>
          </div>
          <div class="col-6">
            <INPUT type=radio value="OpenSystem" name="authType" <%if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("checked") end if %>>
            <label class="input-radio">Open System</label>
            <INPUT type=radio value="SharedKey" name="authType" <%if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("checked") end if %>>
            <label class="input-radio">Shared Key</label>
            <INPUT type=radio value="WEPAuto" name="authType" <%if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("checked") elseif tcWebApi_get("WLan_Entry","WEPAuthType","h") = "N/A" then asp_Write("checked") end if %>>
            <label class="input-radio">Auto</label>
          </div>
        </div>
        
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Key Length:</div>
          </div>
          <div class="col-6">
            <select name="WEP_Selection2" onChange="doWEPChange()" class="form-control input-select">
              <option value="WEP-64Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-64Bits" then asp_Write("selected") end if %>>WEP-64 Bits</option>
              <option value="WEP-128Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-128Bits" then asp_Write("selected") end if %>>WEP-128 Bits</option>
            </select>
          </div>
        </div>

        <div class="row p-1" style="display: none">
          <div class="col-6">
            <div class="title-text-left">Key Format:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" disabled>
              <option value="1">ASCII(5 charactor)</option>
            </select>
          </div>
        </div>
      
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Key:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" name="WEP_Key" maxlength="26" value="<% If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if %>" >
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
          </div>
          <div class="col-6">
            <span id="WEP64_tips"  class="element-hide" style="font-size: 10px; color: #888888; padding-top: 5px;">Note: Please input 5 characters or 10 hexadecimals.</span>
            <span id="WEP128_tips" class="element-hide" style="font-size: 10px; color: #888888; padding-top: 5px;">Note: Please input 13 characters or 26 hexadecimals.</span>
          </div>
        </div>
      </div>
    </form>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" onclick="doSave()">Apply</button>
    </div>
  </div>
  <!-- content -->
  <script>
    var WEPSelectIndex;
    var wepidx;
    var wepidx2;

    $(document).ready(function(){
      LoadFrame();
    });

    function LoadFrame()
    {
      wepidx = $("select[name='WEP_Selection']").prop("selectedIndex");
      wepidx2 = $("select[name='WEP_Selection2']").prop("selectedIndex");

      if(wepidx == 0 && wepidx2 == 0)
      {
        $("#WPA_div").hide();
        $("#WEP_div").hide();
        $("#Authx").show();
        $("#upTime").hide();
      }else if(wepidx > 1){
        $("#WPA_div").show();
        $("#WEP_div").hide();
        $("#upTime").show();
        $("#Authx").hide();
        if(wepidx > 4){
          $("select[name='TKIP_Selection']").attr('style','pointer-events: none;background-color: #EEEEEE;');
        }else{
          $("select[name='TKIP_Selection']").attr('style','');
        }
      }

      if(wepidx == 1 && wepidx2 == 1){
        $("#WPA_div").hide();
        $("#WEP_div").show();
        $("#WEP64_tips").hide();
        $("#WEP128_tips").show();
        $("#Authx").show();
        $("#upTime").hide();
      }
      else if(wepidx == 1 && wepidx2 == 0){
        $("#WPA_div").hide();
        $("#WEP_div").show();
        $("#WEP64_tips").show();
        $("#WEP128_tips").hide();
        $("#Authx").show();
        $("#upTime").hide();
      }
    }

    function checkWps()
    {
      WEPSelectIndex = $("select[name='WEP_Selection']").prop("selectedIndex");
      WEPSelectIndex2 = $("select[name='WEP_Selection2']").prop("selectedIndex");
      <% if tcWebApi_get("WLan11ac_Entry1","WscV2Support","h") <> "1"  then %>
        <% If tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "0" then %>
          if(WEPSelectIndex == 1)
          {
            alert("WEP not allowed when WPS is enabled! Please disable WPS first.");
            $("select[name='WEP_Selection']").get(0).selectedIndex = wepidx;
            $("select[name='WEP_Selection2']").get(0).selectedIndex = wepidx2;
            return false;
          }
        <% end if %>
      <% end if %>
      
      return true;
    }

    function doWEPChange(){
      WEPSelectIndex = $("select[name='WEP_Selection']").prop("selectedIndex");
      WEPSelectIndex2 = $("select[name='WEP_Selection2']").prop("selectedIndex");

      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
        var indexValue = $("select[name='SSID_INDEX']").val();
        if(WEPSelectIndex == 1)
        {
          alert("WEP not allowed when MESH is enabled!");
          $("select[name='WEP_Selection']").get(0).selectedIndex = wepidx;
        }
      <% end if %>

      checkWps();

      if(WEPSelectIndex == 0)
      {
        var rv = confirm("Your network will be set to OPEN without security setting, we strongly suggest you choose WPA-PSK or WPA2-PSK encryption!!");
        if (rv == false)
        {
          $("select[name='WEP_Selection']").get(0).selectedIndex = wepidx;
        }else{
          $("#WPA_div").hide();
          $("#WEP_div").hide();
          $("#Authx").show();
          $("#upTime").hide();
        }
        $("select[name='TKIP_Selection']").attr('style','');
      }else if(WEPSelectIndex > 1){
        //console.log("wepidx: " + wepidx);
        $("#WPA_div").show();
        $("#WEP_div").hide();
        $("#Authx").hide();
        $("#upTime").show();
        if(WEPSelectIndex == 2){
          $("select[name='TKIP_Selection']").get(0).selectedIndex = 1;
          $("select[name='TKIP_Selection']").attr('style','');
        }else if(WEPSelectIndex == 3){
          $("select[name='TKIP_Selection']").get(0).selectedIndex = 0;
          $("select[name='TKIP_Selection']").attr('style','');
        }else if(WEPSelectIndex == 4){
          $("select[name='TKIP_Selection']").get(0).selectedIndex = 2;
          $("select[name='TKIP_Selection']").attr('style','');
        }else if(WEPSelectIndex > 4){
          $("select[name='TKIP_Selection']").get(0).selectedIndex = 0;
          $("select[name='TKIP_Selection']").attr('style','pointer-events: none;background-color: #EEEEEE;');
        }
      }
      
      if(WEPSelectIndex == 1 && WEPSelectIndex2 == 1){//WEP-128Bits
        $("#WPA_div").hide();
        $("#WEP_div").show();
        $("#WEP64_tips").hide();
        $("#WEP128_tips").show();
        $("#Authx").show();
        $("#upTime").hide();
      }else if(WEPSelectIndex == 1 && WEPSelectIndex2 == 0){//WEP-64Bits
        $("#WPA_div").hide();
        $("#WEP_div").show();
        $("#WEP64_tips").show();
        $("#WEP128_tips").hide();
        $("#Authx").show();
        $("#upTime").hide();
      }
      $("input[name='wlanWEPFlag']").val(1);
      LoadFrame();
    }

    function doSSIDChange(){
      $("input[name='wlanWEPFlag']").val(2);
      document.ConfigForm.submit();
      showLoading();
    }
    
    function doEncryptionChange(object){
      //check if WscV2Supported
      <% if tcWebApi_get("WLan11ac_Entry1","WscV2Support","h") <> "1"  then %>
        <% If tcWebApi_get("WLan_Entry","WPSConfMode","h") = "1" then %>
          if((WEPSelectIndex == 1)
          {
            alert("TKIP not allowed when WPS is enabled! Please disable WPS first.");
            object.value="AES";
          }
        <% end if %>
      <% end if %>
    }

    function wpapskCheck(object) {
      var keyvalue=object.value;
      var wpapsklen=object.value.length;
      if(wpapsklen >= 8 && wpapsklen < 64){
        if(keyvalue.match(/[^\x00-\xff]/g))
        {
          alert("Pre-Shared Key should be between 8 and 63 ASCII characters or 64 Hex string.");
          return true;
        }
        else 
        {
          for (i = 0; i < wpapsklen; i++){
            if (keyvalue.charAt(i) == ',' || keyvalue.charAt(i) == '\"' || keyvalue.charAt(i) == '\''){
              break;
            }
          }
          if ( i == wpapsklen)
          {
            return false;
          }
          else if (keyvalue.charAt(i) == ',')
          {
            alert("Pre-Shared Key cannot contain commas!");
            return true;
          }
          else if (keyvalue.charAt(i) == '\"')
          {
            alert("Pre-Shared Key cannot contain double quotation marks!");
            return true;
          }
          else if (keyvalue.charAt(i) == '\'')
          {
            alert("Pre-Shared Key cannot contain single quotation marks!");
            return true;
          }
        }
      }else if(wpapsklen==64){
        for(i=0;i<64;i++){
          var c=keyvalue.charAt(i);
          if(doHexCheck(c)<0){
            alert("Pre-Shared Key Hex value error!");
            return true;
          }
        }
      }else {
        alert("Pre-Shared Key should be between 8 and 63 characters!");
        return true;
      }
      return false;
    }

    function changePwdVisible() {
      if($("#PreSharedKey").prop("type") == "password"){
        $('#PreSharedKey').prop('type','text');
      }else{
        $('#PreSharedKey').prop('type','password');
      };
    }

    function doSave(){
      if(!doCheckSave())
      {
        return false;
      }
      else
      {
        $("input[name='wlanWEPFlag']").val(1);
        document.ConfigForm.SaveAlter_Flag.value = "1";
        document.ConfigForm.submit();
        //showLoading();
      }
    }

    function doCheckSave() {
      if(!checkWps())
      {
        return false;
      }
      if((wepidx == 1) && ((wepidx2 == 1) || (wepidx2 == 0))){
        if((!doKEYcheck(document.ConfigForm.WEP_Key))){
          return false;
        }
      }

      if((wepidx == 2) || (wepidx == 3) || (wepidx == 4)){ 
        if (wpapskCheck(document.ConfigForm.PreSharedKey)){
          return false;
        }
        
        if(quotationCheck(document.ConfigForm.PreSharedKey, 385)){
          return false;
        }
      }

      return true;
    }

    function doKEYcheck(object)
    {
      /**index的作用是什么？
       * var index = object.value.indexOf("0x");
       */
      len=object.value.length;
      
      /**这里为什么要return true？
      *if(len == 0){
      * return true;
      }
      */

      if((wepidx == 1) && wepidx2==0)
      {
        if(len==5)/*wep 64*/
        {
          return true;
        }
        else if(len==10)/*wep 64*/
        {
          for(i=0;i<len;i++)
          {
            var c = object.value.charAt(i);	
            if(doHexCheck(c)==-1)
            {
              alert("Secret key must be 5 characters or 10 hexadecimals.");
              return false;
            }
          }
        }
        else
        {
          alert("Secret key must be 5 characters or 10 hexadecimals.");
          return false;
        }
      }
      else if((wepidx == 1) && wepidx2==1)
      {
        if(len==13)/*wep 128*/
        {
          return true;
        }
        else if(len==26)/*wep 128*/
        {
          for(i=0;i<len;i++)
          {
            var c = object.value.charAt(i);	
            if(doHexCheck(c)==-1)
            {
              alert("Secret key must be 13 characters or 26 hexadecimals.");
              return false;
            }
          }
        }
        else
        {
          alert("Secret key must be 13 characters or 26 hexadecimals.");
          return false;
        }
      }
      return true;
    }

    function doHexCheck(c)
    {
      if ((c >= "0")&&(c <= "9"))
      {
        return 1;
      }
      else if ((c >= "A")&&(c <= "F"))
      {
        return 1;
      }
      else if ((c >= "a")&&(c <= "f"))
      {
        return 1;
      }

      return -1;
    }

    function quotationCheck(object, limit_len) {
      var len = object.value.length;
      var c;
      var i, j = 0;
      for (i = 0; i < len; i++)
      {
        var c = object.value.charAt(i);
        if (c == '"')
        {
          j += 6;
        }
        else
          j++;
      }
      if (j > limit_len-1)
      {
        alert('Secret key contains too many quotation marks!');
        return true;
      }
      return false;
    }

    function checkRekeyinteral(value, flag)
    {
      if (!isNumeric(value)) {
        if(flag == 1){
          alert("WPA Group Rekey Interval : Non-integer value given"); 
        }else{
          alert("WPA Re-Authentication : Non-integer value given");
        }
        return true;
      }
      if (value < 60 || value > 86400) {
        if(flag == 1){
          alert("WPA Group Rekey Interval must be between 60 and 86400");
        }else{
          alert("WPA Re-Authentication must be between 60 and 86400");
        }
        return true;
      }
      return false;
    }

  </script>
</body>

</html>