<%
if Request_Form("Save_Flag") = "1" then
	if Request_Form("SaveAll_Flag") = "1" then
		if Request_Form("MapEnable") = "1" then
			TCWebApi_constSet("Mesh_dat", "MapEnable","1")

			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_2G", "CUOverloadTh_2G");
			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_L", "CUOverloadTh_5G_L")
			TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_H", "CUOverloadTh_5G_L")

			TCWebApi_Set("Mesh_mapdcfg", "APSteerRssiTh", "APSteerRssiTh")

			TCWebApi_commit("Mesh_dat")
			TCWebApi_commit("Mesh_common")
			TCWebApi_commit("Mesh_mapdcfg")
		else
			TCWebApi_constSet("Mesh_dat", "MapEnable","0")

			TCWebApi_commit("Mesh_dat")
		end if
	else
		if Request_Form("Action_Flag") = "1" then			
			if Request_Form("MapEnable") = "1" then
				if Request_Form("apply_channel_utilization_th_Flag") = "1" then
					TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_2G", "CUOverloadTh_2G");
					TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_L", "CUOverloadTh_5G_L")
					TCWebApi_Set("Mesh_steercfg", "CUOverloadTh_5G_H", "CUOverloadTh_5G_L")
					TCWebApi_commit("Mesh_steercfg")
				end if

				if Request_Form("apply_ap_steer_rssi_th_Flag") = "1" then
					TCWebApi_Set("Mesh_mapdcfg", "APSteerRssiTh", "APSteerRssiTh")
					TCWebApi_commit("Mesh_mapdcfg")
				end if
			
			end if
		end if
	end if

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
  <!-- script -->
</head>

<body onload="LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
  	<input type="hidden" name="__activeTab" id="__activeTab" value="adv">
	<form method="post" name="cbi" action="/cgi-bin/true-page/advance/advance-wlan-easymesh-advanced.asp" onsubmit="return validate_all()" autocomplete="off">
    <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>" />
	<input type="hidden" name="SaveAll_Flag" value="0" />
	<input type="hidden" name="Save_Flag" value="0" />
	<input type="hidden" name="Action_Flag" value="0" />
	<input type="hidden" name="apply_channel_utilization_th_Flag" value="0" />
	<input type="hidden" name="apply_ap_steer_rssi_th_Flag" value="0" />
	<input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <div class="title-text">BSS Configurations Renew</div>
      <div class="mt-2 center">
          <button class="btn-dashboard" type="button" onClick="configBss()">Configure BSS</button>
      </div>
      <div class="title-text">Channel Utilization Threshold</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">2G:</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" id="CUOverloadTh_2G" name="CUOverloadTh_2G" value="<%if tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_2G","s") end if %>" >
          </div>
          <div class="col-3 left">
              <label class="input-radio">Range: 0 to 100 Unit: Percentage</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">5G:</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" id="CUOverloadTh_5G_L" name="CUOverloadTh_5G_L" value="<%if tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_L","s") end if %>" >
          </div>
          <div class="col-3 left">
              <label class="input-radio">Range: 0 to 100 Unit: Percentage</label>
              <input type="hidden" id="CUOverloadTh_5G_H" name="CUOverloadTh_5G_H" value="<%if tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_H","h" ) <> "N/A" then tcWebApi_get("Mesh_steercfg","CUOverloadTh_5G_H","s") end if %>" />
          </div>
      </div>
      <div class="mt-2 center">
          <button class="btn-dashboard btn-dashboard-auto" type="button" id="apply-channel-utilization-th-btn" onClick="applyChannelUtilizationTh()">Apply Channel Utilization Threshold</button>
      </div>
      <div class="title-text">AP Steering RSSI Threshold</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left"></div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" id="APSteerRssiTh" name="APSteerRssiTh" value="<%if tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","h" ) <> "N/A" then tcWebApi_get("Mesh_mapdcfg","APSteerRssiTh","s") end if %>" >
          </div>
          <div class="col-3 left">
              <label class="input-radio">Range: -90 to 0 Unit: dBm</label>
          </div>
      </div>
      <div class="mt-2 center">
          <button class="btn-dashboard" type="button" id="apply-rssi-th-btn" onClick="applyRssiTh()">Apply RSSI Threshold</button>
      </div>
      <!--<div class="mt-2 center">
          <button class="btn-dashboard" type="button" onclick="btnSave()">Apply</button>
          <button class="btn-dashboard" type="button" onclick="Undo()">Refresh</button>
      </div>-->
  </div>
  <!-- content -->
  <SCRIPT language=JavaScript type=text/javascript>
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
	var get_device_role_timer_id;
	var get_al_mac_timer_id;
	var get_sta_steering_progress_timer_id;
	var get_bh_connection_status_timer_id;
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
		var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
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
	
	function validate_all()
	{
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		var curDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
		curDevRole = parseInt(curDevRole);

		switch(curDevRole)
		{
			case 1: // Controller
				break;
			case 2: // Agent
				break;
			default:
				return false;
		}

		if(curDevRole == 1)
		{
			if(!validateControllerSettings())
			{
				return false;
			}
		}
	<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
	    return true;
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
	    var apSteerRssiTh = document.getElementById("APSteerRssiTh").value;
	    if (apSteerRssiTh == "" ||
	        isNaN(apSteerRssiTh) ||
	        !/^(0|-[1-9]|-[1-9][0-9])$/.test(apSteerRssiTh) ||
	        parseInt(apSteerRssiTh) > 0 ||
	        parseInt(apSteerRssiTh) < -90)
	    {
	        alert("RSSI Threshold is incorrect!\nPlease enter an integer number between 0 to -90 inclusive.");
	        document.getElementById("APSteerRssiTh").focus();
	        document.getElementById("APSteerRssiTh").select();
	        return false;
	    }
	    return true;
	}
	
	function validateChannelUtilizationTh()
	{
	    var channelUtilTh2G = document.getElementById("CUOverloadTh_2G").value;
	    var channelUtilTh5GL = document.getElementById("CUOverloadTh_5G_L").value;
	    var channelUtilTh5GH = channelUtilTh5GL;
	    
	    if (channelUtilTh2G == "" ||
	        isNaN(channelUtilTh2G) ||
	        !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh2G) ||
	        parseInt(channelUtilTh2G) < 0 ||
	        parseInt(channelUtilTh2G) > 100)
	    {
	        alert("2G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
	        document.getElementById("CUOverloadTh_2G").focus();
	        document.getElementById("CUOverloadTh_2G").select();
	        return false;
	    }
	    if (channelUtilTh5GL == "" ||
	        isNaN(channelUtilTh5GL) ||
	        !/^(0|[1-9]|[1-9][0-9]|100)$/.test(channelUtilTh5GL) ||
	        parseInt(channelUtilTh5GL) < 0 ||
	        parseInt(channelUtilTh5GL) > 100)
	    {
	        alert("5G Channel Utilization Threshold is incorrect!\nPlease enter an integer number between 0 to 100 inclusive.");
	        document.getElementById("CUOverloadTh_5G_L").focus();
	        document.getElementById("CUOverloadTh_5G_L").select();
	        return false;
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
	                    clearTimeout(get_device_role_timer_id);
	                    get_device_role_timer_id = null;
	                    if(document.getElementById("__activeTab").value == "basic")
	                    {
	                        get_device_role_timer_id = setTimeout(getDeviceRole, 1000);
	                    }
	                	break;
	                case 1: // Controller
	                	break;
	                case 2: // Agent
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
	
	function applyChannelUtilizationTh()
	{
	    if(!validateChannelUtilizationTh())
	    {
	        return;
	    }
	    setText('apply_channel_utilization_th_Flag', 1);
	    setText('Action_Flag', 1);
	    formSubmit(0);
	}
	
	function applyRssiTh()
	{
	    if(!validateApSteerRssiTh())
	    {
	        return;
	    }
	    setText('apply_ap_steer_rssi_th_Flag', 1);
	    setText('Action_Flag', 1);
	    formSubmit(0);
	}
	
	function configBss()
	{
	    location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-bss-cfg-renew.asp';
	}
	<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
	
	function checkWebStatus()
	{
		location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-advanced.asp';
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
	    		deviceRole = "0";
	    }
	    
	    if(deviceRole != "0")
	    {
	    	getDeviceRole();
	    }
	<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
	}
  	function Undo()
  	{
		location.reload() 
  	}
  	function formSubmit(saveAll)
	{
		if(document.cbi != null)
		{
			if(saveAll)
			{
				setText('SaveAll_Flag', 1);
			}
			else
			{
				setText('SaveAll_Flag', 0);
			}
			document.cbi.SaveAlter_Flag.value = "1";
			setText('Save_Flag', 1);
			document.cbi.submit();
		}
	}
	
	function btnSave()
	{
		if(document.cbi != null)
		{
			if(!validateChannelUtilizationTh())
		    {
		        return;
		    }
		    if(!validateApSteerRssiTh())
		    {
		        return;
		    }
			formSubmit(1);
		}
	}
	function LoadFrame ()
	{
<% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then %>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
		LoadMapFrame();
<% end if %>
<% end if %>
	}
  </SCRIPT>
</body>
</html>