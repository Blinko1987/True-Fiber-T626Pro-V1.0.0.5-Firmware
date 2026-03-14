<%
if Request_Form("Save_Flag") = "1" then
	if Request_Form("Action_Flag") = "1" then
		if Request_Form("MapEnable") = "1" then
			if Request_Form("trigger_mandate_steering_on_agent_Flag") = "1" then
				TCWebApi_Set("Mesh_actionpara", "mandate_steer_sta_mac", "sta_mac_inp")
				TCWebApi_Set("Mesh_actionpara", "mandate_steer_target_bssid", "target_bssid_inp")

				TCWebApi_constSet("Mesh_action", "trigger_mandate_steering", "1")
				TCWebApi_commit("Mesh_action")
			end if
			
			if Request_Form("trigger_back_haul_steering_on_agent_Flag") = "1" then
				TCWebApi_Set("Mesh_actionpara", "steer_back_haul_mac", "back_haul_mac_inp")
				TCWebApi_Set("Mesh_actionpara", "steer_back_haul_target_bssid", "back_haul_target_bssid_inp")
				
				TCWebApi_constSet("Mesh_action", "trigger_backhaul_steering", "1")
				TCWebApi_commit("Mesh_action")
			end if
			
			if Request_Form("trigger_wps_fh_agent_Flag") = "1" then
				TCWebApi_Set("Mesh_actionpara", "wps_front_haul_mac", "fh_mac_inp")
				
				TCWebApi_constSet("Mesh_action", "trigger_wps_fh_agent", "1")
				TCWebApi_commit("Mesh_action")
			end if
		end if
	end if
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Action - Easy Mesh</title>
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
  <!-- script -->
</head>

<body onload="LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
  	<input type="hidden" name="__activeTab" id="__activeTab" value="action">
  	<form method="post" name="cbi" action="/cgi-bin/true-page/advance/advance-wlan-easymesh-action.asp" autocomplete="off">
    <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat","MapEnable","s") %>" />
	<input type="hidden" name="SaveAll_Flag" value="0" />
	<input type="hidden" name="Save_Flag" value="0" />
	<input type="hidden" name="Action_Flag" value="0" />
	<input type="hidden" name="trigger_mandate_steering_on_agent_Flag" value="0" />
	<input type="hidden" name="trigger_back_haul_steering_on_agent_Flag" value="0" />
	<input type="hidden" name="trigger_wps_fh_agent_Flag" value="0" />
      <div class="title-text">Mandate Steering on Agent</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">STA MAC:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" id="mandate-steering-agent-sta-mac" name="sta_mac_inp">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Target BSSID:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" id="mandate-steering-agent-target-bssid" name="target_bssid_inp">
          </div>
      </div>
      <div class="mt-2 center">
          <button class="btn-dashboard btn-dashboard-auto" type="button" id="mandate-steering-agent-apply" onClick="triggerMandateSteeringOnAgent()">Trigger Mandate Steering on Agent</button>
      </div>
      <div class="title-text">Back-haul Steering</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Back-haul MAC:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" id="back-haul-steering-mac" name="back_haul_mac_inp">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Target BSSID:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" id="back-haul-steering-target-bssid" name="back_haul_target_bssid_inp">
          </div>
      </div>
      <div class="mt-2 center">
          <button class="btn-dashboard btn-dashboard-auto" type="button" id="back-haul-steering-apply" onClick="triggerBackHaulSteering()">Trigger Back-haul Steering</button>
      </div>
      <div class="title-text">Trigger WPS at front-haul BSS</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Front-haul BSS-MAC:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" id="trigger-wps-fh-agent-al-mac" name="fh_mac_inp">
          </div>
      </div>
      <div class="mt-2 center">
          <button class="btn-dashboard btn-dashboard-auto" type="button" id="trigger-wps-fh-agent-apply" onClick="triggerWpsFhAgent()">Trigger WPS at Front-haul BSS</button>
      </div>
    </form>
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
		var mapDevRole = "<% tcWebApi_get("Mesh_common","DeviceRole","s") %>";
<% if mapDevRole <> "N/A" then %>
		ret = '{ ';
		ret = ret +	'"mapDevRole": "' + mapDevRole + '"';
		ret = ret + ' }';
<% end if %>
		return ret;
	}
	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
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
	function triggerMandateSteeringOnAgent()
	{
	    var sta_mac_inp = document.getElementById("mandate-steering-agent-sta-mac");
	    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
	    if (!mac_reg_exp.test(sta_mac_inp.value)) 
	    {
	        alert("Please fill MAC Address of STA in Mandate Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
	        sta_mac_inp.focus();
	        sta_mac_inp.select();
	        return;
	    }
	    var target_bssid_inp = document.getElementById("mandate-steering-agent-target-bssid");
	    if (!mac_reg_exp.test(target_bssid_inp.value)) 
	    {
	        alert("Please fill Target BSSID of Mandate Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
	        target_bssid_inp.focus();
	        target_bssid_inp.select();
	        return;
	    }
	    
	    setText('trigger_mandate_steering_on_agent_Flag', 1);
		setText('Action_Flag', 1);
	    formSubmit(0);
	}
	
	function triggerBackHaulSteering()
	{
	    var back_haul_mac_inp = document.getElementById("back-haul-steering-mac");
	    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
	    if (!mac_reg_exp.test(back_haul_mac_inp.value)) 
	    {
	        alert("Please fill MAC Address of Back-haul Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
	        back_haul_mac_inp.focus();
	        back_haul_mac_inp.select();
	        return;
	    }
	    var back_haul_target_bssid_inp = document.getElementById("back-haul-steering-target-bssid");
	    if (!mac_reg_exp.test(back_haul_target_bssid_inp.value)) 
	    {
	        alert("Please fill Target BSSID of Back-haul Steering Settings in correct format! (XX:XX:XX:XX:XX:XX)");
	        back_haul_target_bssid_inp.focus();
	        back_haul_target_bssid_inp.select();
	        return;
	    }
	    
	    setText('trigger_back_haul_steering_on_agent_Flag', 1);
		setText('Action_Flag', 1);
	    formSubmit(0);
	}
	
	function triggerWpsFhAgent()
	{
	    var fh_mac_inp = document.getElementById("trigger-wps-fh-agent-al-mac");
	    var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
	    if (!mac_reg_exp.test(fh_mac_inp.value)) 
	    {
	        alert("Please fill AL-MAC of an Agent in correct format! (XX:XX:XX:XX:XX:XX)");
	        fh_mac_inp.focus();
	        fh_mac_inp.select();
	        return;
	    }
	    
	    setText('trigger_wps_fh_agent_Flag', 1);
		setText('Action_Flag', 1);
	    formSubmit(0);
	}

	<% end if %>
	function checkWebStatus()
	{
		location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-action.asp';
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
  	function LoadFrame ()
	{
<% if tcWebApi_get("WLan_Common", "MultiSSIDConfigEnable", "h") = "Yes" then %>
<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") <> "N/A" then %>
		LoadMapFrame();
<% end if %>
<% end if %>
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
			setText('Save_Flag', 1);
			document.cbi.submit();
		}
	}
  </SCRIPT>
</body>
</html>