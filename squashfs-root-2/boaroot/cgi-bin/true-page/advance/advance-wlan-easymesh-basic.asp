<%
if Request_Form("Save_Flag") = "1" then
  if Request_Form("SaveAll_Flag") = "1" then
    TCWebApi_Set("WLan_Entry0", "EnableSSID", "MapEnable")
    TCWebApi_Set("WLan11ac_Entry0", "EnableSSID", "MapEnable")
    if Request_Form("MapEnable") = "1" then
      TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","1")
      TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","0")
      TCWebApi_constSet("Mesh_dat", "MapEnable","1")
      TCWebApi_Set("Mesh_common", "SteerEnable", "SteerEnable")
      TCWebApi_Set("MeshInfo_Entry0", "DeviceName", "DeviceName")
      TCWebApi_commit("Mesh_dat")
    else
      TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","0")
      TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","1")
      TCWebApi_constSet("Mesh_dat", "MapEnable","0")
	  
	  if tcwebApi_get("Vid_Common","skyvid","h") <> "10" then
		if tcwebApi_get("MeshRoleExchange_Entry","MeshRole","h") = "0" then
			TCWebApi_constSet("MeshRoleExchange_Entry", "MeshRole", "1")
			TCWebApi_constSet("Mesh_common", "DeviceRole", "1")
			TCWebApi_constSet("Account_Entry0","display_mask","FF FF FF FF FF BF FF FF FF")
            TCWebApi_constSet("Account_Entry1","display_mask","BF 00 0F CC FF 87 17 00 01")
			if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then
			  TCWebApi_constSet("Account_Entry0","Logged","0")
			  TCWebApi_constSet("Account_Entry0","Logoff","1")
			else
			  TCWebApi_constSet("Account_Entry1","Logged","0")
			  TCWebApi_constSet("Account_Entry1","Logoff","1")
			end if
			TCWebApi_commit("Account")
			TCWebApi_commit("MeshRoleExchange_Entry")
        end if
      end if
      TCWebApi_commit("Mesh_dat")
    end if

  else
    if Request_Form("Action_Flag") = "1" then

      if Request_Form("resetToDefaultEasyMesh_Flag") = "1" then
        TCWebApi_constSet("Mesh_action", "load_default_setting", "1")
        TCWebApi_commit("Mesh_action")
      end if
      
      if Request_Form("MapEnable") = "1" then
        if Request_Form("wifi_trigger_onboarding_Flag") = "1" then
          if Request_Form("ether_trigger_onboarding_Flag") = "0" then
            TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "1")
            TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "0")
            TCWebApi_commit("Mesh_action")
          end if
        end if
        if Request_Form("wifi_trigger_onboarding_Flag") = "0" then
          if Request_Form("ether_trigger_onboarding_Flag") = "1" then
            TCWebApi_constSet("Mesh_action", "wifi_trigger_onboarding", "0")
            TCWebApi_constSet("Mesh_action", "ether_trigger_onboarding", "1")
            TCWebApi_commit("Mesh_action")
          end if
        end if
      end if

    end if
  end if

  TCWebApi_save()
end if

if Request_Form("backhaul_flag") = "1" then
TCWebApi_Set("Mesh_mapdcfg", "BhPriority2G", "BhPriority2G")
TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GL", "BhPriority5GL")
TCWebApi_Set("Mesh_mapdcfg", "BhPriority5GH", "BhPriority5GL")
TCWebApi_commit("Mesh_mapdcfg")
TCWebApi_commit("Mesh_dat")
TCWebApi_save()
end if

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - Easy Mesh</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
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
  <%if Request_Form("backhaul_flag") = "1" then %>
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
  <script src="/scripts/lib/require.js"></script>
</head>

<body onload="LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">EasyMesh</div>
    <div class="title-description-text">This page is used to configure the parameters for EasyMesh feature of your Access Point.</div>
    <input type="hidden" name="__activeTab" id="__activeTab" value="basic">
    <form method="post" name="cbi" action="/cgi-bin/true-page/advance/advance-wlan-easymesh-basic.asp" onsubmit="return validate_all()" autocomplete="off">
    <input type="hidden" name="SaveAll_Flag" value="0" />
    <input type="hidden" name="Save_Flag" value="0" />
    <input type="hidden" name="Action_Flag" value="0" />
    <input type="hidden" name="backhaul_flag" value="0" />
    <input type="hidden" name="resetToDefaultEasyMesh_Flag" value="0" />
    <input type="hidden" name="wifi_trigger_onboarding_Flag" value="0" />
    <input type="hidden" name="ether_trigger_onboarding_Flag" value="0" />
    <input type="hidden" name="isBhBssSupported" id="add_bss_bh_hid_inp" value="0" />
    <input type="hidden" name="isFhBssSupported" id="add_bss_fh_hid_inp" value="1" />
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
    <div class="row p-1" id="map-cfg-basic-meshenable-setting">
      <div class="col-6">
        <div class="title-text-left">EasyMesh</div>
      </div>
      <div class="col-6">
        <input type="radio" name="MapEnable" id="MapEnableOn" value="1" onchange="MapEnableClick(1)" onClick="this.blur();" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %> checked="checked"<% end if %> >
        <label class="input-radio">Enabled</label>
        <input type="radio" name="MapEnable" id="MapEnableOff" value="0" onchange="MapEnableClick(0)" onClick="this.blur();" <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "0" then %> checked="checked"<% end if %>>
        <label class="input-radio">Disabled</label>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-devicerole-setting" style="display:none">
      <div class="col-6">
        <div class="title-text-left">Set Device Role as:</div>
      </div>
      <div class="col-6 left">
        <select class="form-control input-select" name="DeviceRole" id="DeviceRole" onchange="deviceRoleOnChange(this.value)">
          <option value="0">Auto</option>
          <option value="1">Controller</option>
          <option value="2">Agent</option>
        </select>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-detail-setting-role" style="display:none">
      <div class="col-6">
        <div class="title-text-left">Current Device Role:</div>
      </div>
      <div class="col-6 left">
        <% if tcWebApi_get("meshroleexchange_entry", "MeshRole", "h") = "0" then %>
        <label class="input-radio"><strong id="current-dev-role">Not configured</strong></label>
		<% elseif tcWebApi_get("meshroleexchange_entry", "MeshRole", "h") = "1" then%>
		<label class="input-radio"><strong id="current-dev-role">Controller</strong></label>
		<% else %>
		<label class="input-radio"><strong id="current-dev-role">Agent</strong></label>
		<% end if %>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-detail-setting-name" style="display:none">
      <div class="col-6">
        <div class="title-text-left">Device Name:</div>
      </div>
      <div class="col-6 left">
        <!-- <input class="form-control input-textfield" type="text" name="DeviceName" id="add_device_name_inp_text" maxlength="64" value="<% if tcWebApi_get("meshinfo_Entry0", "DeviceName", "h") <> "N/A" Then tcWebApi_get("meshinfo_Entry0", "DeviceName", "s") else asp_write("Controller") end if %>"/> -->
        <input class="form-control input-textfield" type="text" name="DeviceName" id="add_device_name_inp_text" maxlength="64" value="<% tcWebApi_get("meshinfo_Entry0", "DeviceName", "s") %>"/>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-detail-setting-reset" style="display:none">
      <% if tcWebApi_get("meshroleexchange_entry", "MeshRole", "h") <> "1" then %>
      <div class="col-6">
        <div class="title-text-left">Reset EasyMesh Settings to default:</div>
      </div>
      <div class="col-6 left">
        <button class="btn-file" type="button" id="resetMap" onClick="resetToDefaultEasyMesh()">Load Default Settings</button>
      </div>
      <% end if %>
    </div>
    <div class="row p-1" id="map-cfg-basic-detail-setting-onboarding" style="display:none">
      <div class="col-6">
        <div class="title-text-left">EasyMesh On-boarding:</div>
      </div>
      <div class="col-6 left">
        <button class="btn-file" type="button" id="multi-ap-on-board-btn" onClick="triggerMultiApOnBoarding()">Trigger Wi-Fi On-boarding</button>
        <br/><label class="text-content">(Wi-Fi will select the back-haul band automatically)</label>
      </div>
    </div>
    <div class="row p-1" id="current-dev-role-during-not-configured-msg">
      <div class="col-12">
        <div class="title-text-left"><label class="text-content"><strong>Other EasyMesh related settings will be displayed once Device Role is configured.</label></strong></div>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-dev-role-configured-settings" style="display:none">
      <div class="col-6">
        <div class="title-text-left">Steering:</div>
      </div>
      <div class="col-6">
        <input type="radio" name="SteerEnable" id="SteerEnableOn" value="1" <% if tcWebApi_get("Mesh_common", "SteerEnable", "h") = "1" then %> checked="checked"<% end if %> >
        <label class="input-radio">Enabled</label>
        <input type="radio" name="SteerEnable" id="SteerEnableOff" value="0" <% if tcWebApi_get("Mesh_common", "SteerEnable", "h") <> "1" then %> checked="checked"<% end if %> >
        <label class="input-radio">Disabled</label>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-wireless-bh-preference-2" style="display:none;">
      <div class="col-6">
        <div class="title-text-left">Wireless Back-haul Preference 2G:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select" name="BhPriority2G">
                <option value="0" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "0" then %> selected="selected" <% end if %>>Disable</option>
                <option value="1" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "1" then %> selected="selected" <% end if %>>High</option>
                <option value="2" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "2" then %> selected="selected" <% end if %>>Medium</option>
                <option value="3" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority2G", "h") = "3" then %> selected="selected" <% end if %>>Low</option>
              </select>
      </div>
    </div>
    <div class="row p-1" id="map-cfg-basic-wireless-bh-preference-5" style="display:none;">
      <div class="col-6">
        <div class="title-text-left">Wireless Back-haul Preference 5G:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select" name="BhPriority5GL">
                <option value="0" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "0" then %> selected="selected" <% end if %>>Disable</option>
                <option value="1" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "1" then %> selected="selected" <% end if %>>High</option>
                <option value="2" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "2" then %> selected="selected" <% end if %>>Medium</option>
                <option value="3" <% if tcWebApi_get("Mesh_mapdcfg", "BhPriority5GL", "h") = "3" then %> selected="selected" <% end if %>>Low</option>
              </select>
      </div>
    </div>
    </form>
    <div class="mt-2 center" id="map-cfg-basic-wireless-bh-preference-0" style="display:none;">
          <button class="btn-dashboard" type="button" id="apply-bh-priority-btn" onClick="backhaul_submit()">Apply Wireless Back-haul Priority</button>
      </div>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" onclick="formSubmit(1)">Apply</button>
        <button class="btn-dashboard" type="button" onclick="RefreshPage()">Reset</button>
      </div>
  </div>
  <!-- content -->
  <SCRIPT language=JavaScript type=text/javascript>
    <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
    var get_device_role_timer_id;
    <% end if %>
    
    function JSO_Only_Status(staType)
    {
      var ret = ' { ' + 
        '"status": "' + staType + '"' + 
        ' } ';
      return ret;
    }
    
    function JSO_get_apply_status()
    {
      var staType = 'DONE';
      var webstate = "<% tcWebApi_get("Mesh_action","map_action_complete","s") %>";
      
      if(1 == webstate)
      {
        staType = 'ON_PROGRESS';
      }
      else
      {
        staType = 'DONE';
      }
      
      var ret = JSO_Only_Status(staType);
      return ret;
    }
    
    function JSO_get_device_role()
    {
      var ret = '';
      var mapDevRole = "<% tcWebApi_get("MeshRoleExchange_Entry","MeshRole","s") %>";
    <% if mapDevRole <> "N/A" then %>
      ret = '{ ';
      ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
      ret = ret + ' }';
    <% end if %>
      return ret;
    }
    
    function getX_Response(type)
    {
      var X_Res='';
      try
      {
        switch(type)
        {
          case "get_apply_status":
            X_Res = JSO_get_apply_status();
            break;
          case "get_device_role":
            X_Res = JSO_get_device_role();
            break;
          case "trigger_multi_ap_on_boarding":
            X_Res = JSO_trigger_multi_ap_on_boarding();
            break;
          default:
            break;
        }
      }
      catch(e)
      {
        X_Res='';
      }
      
      return X_Res;
    }
    
    function MapEnableClick(_val)
    {
      var mapEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
      if(_val)
      {
        document.getElementById("map-cfg-basic-detail-setting-role").style.display = "";
        document.getElementById("map-cfg-basic-detail-setting-name").style.display = "";
        document.getElementById("map-cfg-basic-detail-setting-reset").style.display = "";
        document.getElementById("map-cfg-basic-detail-setting-onboarding").style.display = "";
        var devRole = document.getElementById("current-dev-role").innerHTML;
        switch(devRole)
        {
          case "Not Configured": // Auto
            //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
            break;
          case "Controller": // Controller
            //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
            document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
            break;
          case "Agent": // Agent
            //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
            document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
            document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
            break;
          default:
            break;
        }
      }
      else
      {
        document.getElementById("map-cfg-basic-detail-setting-role").style.display = "none";
        document.getElementById("map-cfg-basic-detail-setting-name").style.display = "none";
        document.getElementById("map-cfg-basic-detail-setting-reset").style.display = "none";
        document.getElementById("map-cfg-basic-detail-setting-onboarding").style.display = "none";
        
        //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
        document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
        document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
        document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
      }
    }
    
    function validate_all()
    {
      var devRole = document.getElementById("DeviceRole");
      var mapEnableRadio = document.getElementById("MapEnableOn");
      if(devRole.type == "radio" && (!(mapEnableRadio.checked)))
      {
        alert("Please click on Enable radio button of EasyMesh.");
        return false;
      }
        
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
      if(devRole.type != "select-one")
      {
        alert("Unknown Device Role Type!");
        return false;
      }
      var curDevRole = document.getElementById("current-dev-role").innerHTML;
      if (devRole.selectedIndex == 0)
      {
        if (curDevRole == "Not configured")
        {
          alert("Device role is not confirmed yet!\n" +
                "Please wait for the device to figure out the device role.\n" +
                "Otherwise, select the device role manually.");
          return false;
        }
        if(curDevRole == "Controller")
        {
          devRole.selectedIndex = 1;
        }
        else if(curDevRole == "Agent")
        {
          devRole.selectedIndex = 2;
        }
        else
        {
          alert("Invalid Device role!\n");
          return false;
        }
      }
      if(curDevRole == "Controller")
      {
        if(!validateControllerSettings())
        {
          return false;
        }
      }
      <% end if %>/* Mesh_mapdcfg.MapEnable=1 */
      return true;
    }
    
    function resetToDefaultEasyMesh()
    {
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
      clearAllTimers();
      <% end if %>
      setText('resetToDefaultEasyMesh_Flag', 1);
      setText('Action_Flag', 1);
      formSubmit(0);
    }
    
    <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
    function validateControllerSettings()
    {
      if (!validateApSteerRssiTh() ||
          !validateChannelUtilizationTh())
      {
        return false;
      }
      return true;
    }
    
    function validateApSteerRssiTh()
    {
      var apSteerRssiTh = "<% tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") %>";
      if (apSteerRssiTh == "" ||
          isNaN(apSteerRssiTh) ||
          !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
          parseInt(apSteerRssiTh) > 0 ||
          parseInt(apSteerRssiTh) < -90)
      {
        alert("RSSI Threshold is incorrect!\nPlease enter an integer number between 0 to -90 inclusive.");
      }
      return true;
    }
    
    function validateChannelUtilizationTh()
    {
      var channelUtilTh2G = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") %>";
      var channelUtilTh5GL = "<% tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") %>";
      var channelUtilTh5GH = channelUtilTh5GL;
      
      if (channelUtilTh2G == "" ||
          isNaN(channelUtilTh2G) ||
          !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
          parseInt(channelUtilTh2G) < 0 ||
          parseInt(channelUtilTh2G) > 100)
      {
        alert("2G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
      }
      if (channelUtilTh5GL == "" ||
          isNaN(channelUtilTh5GL) ||
          !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
          parseInt(channelUtilTh5GL) < 0 ||
          parseInt(channelUtilTh5GL) > 100)
      {
        alert("5G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
      }
      return true;
    }
    
    function clearAllTimers()
    {
        clearTimeout(get_device_role_timer_id);
        get_device_role_timer_id = null;
        clearTimeout(get_apply_status);
    }
    
    function getDeviceRole()
    {
      var XHR_type = 'get_device_role';
      var mapEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
      var x_response = getX_Response(XHR_type);	
      {
        try
        {
          var devRoleObj = JSON.parse(x_response);
          var devRole = parseInt(devRoleObj.mapDevRole);
          if(isNaN(devRole))
          {
            console.log("Incorrect Device Role",devRole);
            devRole = 0;
          }
          switch(devRole)
          {
            case 0: // Auto
              //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "none";
              document.getElementById("current-dev-role-during-not-configured-msg").style.display = "";
              document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
              document.getElementById("current-dev-role").innerHTML = "Not Configured";
              clearTimeout(get_device_role_timer_id);
              get_device_role_timer_id = null;
              if(document.getElementById("__activeTab").value == "basic")
              {
                get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
              }
              break;
            case 1: // Controller
              //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
              document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
              document.getElementById("current-dev-role").innerHTML = "Controller";
              break;
            case 2: // Agent
              //document.getElementById("map-cfg-basic-dev-role-configured-settings").style.display = "";
              document.getElementById("current-dev-role-during-not-configured-msg").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-2").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-5").style.display = "none";
              document.getElementById("map-cfg-basic-wireless-bh-preference-0").style.display = "none";
              document.getElementById("current-dev-role").innerHTML = "Agent";
              break;
            default:
              console.log("Invalid device role received: ",devRole);
              break;
          }
        }
        catch(e)
        {
            console.log("Incorrect response received for get device role request!");
            clearTimeout(get_device_role_timer_id);
            get_device_role_timer_id = null;
            if(document.getElementById("__activeTab").value == "basic")
            {
                get_device_role_timer_id = setTimeout(getDeviceRole, 5000);
            }
        }
      }
    }
    
    function deviceRoleOnChange(devRole)
    {
      devRole = parseInt(devRole);
      switch(devRole)
      {
        case 0: // Auto
          document.getElementById("DeviceRole").selectedIndex = devRole;
          clearTimeout(get_device_role_timer_id);
          get_device_role_timer_id = null;
          get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
          break;
        case 1: // Controller
          document.getElementById("DeviceRole").selectedIndex = devRole;
          clearTimeout(get_device_role_timer_id);
          get_device_role_timer_id = null;
          break;
        case 2: // Agent
          document.getElementById("DeviceRole").selectedIndex = devRole;
          clearTimeout(get_device_role_timer_id);
          get_device_role_timer_id = null;
          break;
        default:
          console.log("Invalid device role selected: ",devRole);
          break;
      }
    }
    
    function triggerMultiApOnBoarding()
    {
      /*Only Wi-Fi On-boarding*/
        var bh_val = 1;
        if(0 == bh_val)
        {
          setText('wifi_trigger_onboarding_Flag', 0);
          setText('ether_trigger_onboarding_Flag', 1);
        }
        else
        {
          setText('wifi_trigger_onboarding_Flag', 1);
          setText('ether_trigger_onboarding_Flag', 0);
        }
        setText('Action_Flag', 1);
        formSubmit(0);
    }
    <% end if %>/* Mesh_mapdcfg.MapEnable=1 */
    
    function checkWebStatus()
    {
        
      location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-basic.asp';
    }
    
    function get_apply_status_cb(rsp)
    {
      clearTimeout(checkWebStatus);
        try
        {
            var r = JSON.parse(rsp);
        }
        catch(e)
        {
            return;
        }
        if(r.status == "ON_PROGRESS")
        {
            var altmsg ="Device is applying the saved settings now!\n" +
                "It is recommended to wait until all the saved settings are applied.\n";
            //alert(altmsg);
            setTimeout(checkWebStatus, 5000);
        }
    }
    
    function get_apply_status()
    {
      var XHR_type = 'get_apply_status';
      var x_response = getX_Response(XHR_type);
      {
        get_apply_status_cb(x_response);
      }
    }
    
    function LoadMapFrame ()
    {
    <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
      var deviceRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
        if(deviceRole == "")
        {
          deviceRoleOnChange("0");
        }
        else
        {
          deviceRoleOnChange(deviceRole);
          if(deviceRole != "0")
          {
            getDeviceRole();
          }
        }
    <% end if %>/* Mesh_mapdcfg.MapEnable=1 */
    }
    function formSubmit(saveAll)
    {
      if(document.cbi != null)
      {
        if(saveAll)
        {
          setText('SaveAll_Flag', 1);
          document.cbi.SaveAlter_Flag.value = "1";
        }
        else
        {
          setText('SaveAll_Flag', 0);
        }
        setText('Save_Flag', 1);
        document.cbi.submit();
      }
    }

    function backhaul_submit(saveAll)
    {
      var bh_2g = "<% tcWebApi_get("Mesh_mapdcfg","BhPriority2G","s") %>";
      var bh_5gh = "<% tcWebApi_get("Mesh_mapdcfg","BhPriority5GH","s") %>";
      var bh_5gl = "<% tcWebApi_get("Mesh_mapdcfg","BhPriority5GL","s") %>";

      if(document.cbi.BhPriority2G.value == bh_2g && document.cbi.BhPriority5GL.value == bh_5gh && document.cbi.BhPriority5GL.value == bh_5gl)
      {
        return;
      }

      setText('backhaul_flag', 1);
      document.cbi.submit();
    }

    function RefreshPage()
    {
      location.reload();
    }
    
    function LoadFrame ()
    {
      showHideMeshMenu();
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
      var mapEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
      if(mapEnable == "1"){
        MapEnableClick(1);
      }else{
        MapEnableClick(0);
      }
      <% end if %>
      <% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then %>
      <% if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
        LoadMapFrame();
      <% end if %>
      <% end if %>
    }
     
    function showHideMeshMenu() {
      var meshEnable = '<%tcWebApi_get("Mesh_dat","MapEnable","s")%>';
      if(meshEnable == "0"){
        $('#thirdMenuMeshAdvanced', parent.document).removeClass('element-show').addClass('element-hide');
        /*
        $('#thirdMenuMeshAction', parent.document).removeClass('element-show').addClass('element-hide');
        */
        $('#thirdMenuMeshStatus', parent.document).removeClass('element-show').addClass('element-hide');
        /*
        $('#thirdMenuMeshTopology', parent.document).removeClass('element-show').addClass('element-hide');
        */
        $('#thirdMenuMeshInfo', parent.document).removeClass('element-show').addClass('element-hide');
      }else{
        $('#thirdMenuMeshAdvanced', parent.document).removeClass('element-hide').addClass('element-show');
        /*
        $('#thirdMenuMeshAction', parent.document).removeClass('element-hide').addClass('element-show');
        */
        $('#thirdMenuMeshStatus', parent.document).removeClass('element-hide').addClass('element-show');
        /*
        $('#thirdMenuMeshTopology', parent.document).removeClass('element-hide').addClass('element-show');
        */
        $('#thirdMenuMeshInfo', parent.document).removeClass('element-hide').addClass('element-show');
      }
      /*
      require(['/scripts/lib/jquery.js', '/scripts/utils/utils.js'],function(jquery, utils){
        console.log(utils.moduleName);
      });
      */
    }
  </SCRIPT>
</body>
</html>