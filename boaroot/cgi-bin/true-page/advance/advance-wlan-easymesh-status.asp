<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - Easy Mesh</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
</head>

<body onload="LoadFrame()">
	<!-- content -->
    <div class="container-full container-resize-height">
    	<input type="hidden" name="__activeTab" id="__activeTab" value="status">
    	<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
        <div class="card-table">
            <table style="width:100%" id="map-cfg-status">
            		<tr class="table-header">
                    <th colspan="2" class="p-1">EasyMesh Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">AL_MAC</td>
                    <td style="width: 50%;"><span id="al_mac"></span></td>
                </tr>
                <tr class="table-content-second" id="ap-bh-inf-list-tr">
                    <td class="table-header-content p-1">AP Back-haul Interface List</td>
                    <td><ul id="ap-bh-inf-list-ul"></ul></td>
                </tr>
                <tr class="table-content-fist" id="ap-fh-inf-list-tr">
                    <td class="table-header-content p-1">AP Front-haul Interface List</td>
                    <td><ul id="ap-fh-inf-list-ul"></ul></td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">Runtime Topology</td>
                    <td><button class="btn-file" type="button" id="display-runtime-topology-btn" onClick="displayRuntimeTopology()">Display EasyMesh Topology</button></td>
                </tr>
                <tr class="table-content-fist" id="ap-db-tr">
                    <td class="table-header-content p-1">AP Capabilities</td>
                    <td><button class="btn-file" type="button" id="ap-db-btn" onClick="displayApCapabilities()">Display AP Capabilities</button></td>
                </tr>
                <tr class="table-content-second" id="client-db-tr">
                    <td class="table-header-content p-1">Client Capabilities</td>
                    <td><button class="btn-file" type="button" id="client-db-btn" onClick="displayClientCapabilities()">Display Client Capabilities</button></td>
                </tr>
                <tr class="table-content-fist" id="disp-fh-status-bss-tr">
                    <td class="table-header-content p-1">BSS Status</td>
                    <td><button class="btn-file" type="button" id="disp-fh-status-bss" onClick="dispFhStatusBss()">Display BSS Status</button></td>
                </tr>
                <tr class="table-content-second" id="disp-bh-link-metrics-ctrler-tr">
                    <td class="table-header-content p-1">Back-haul Link Metrics at Controller</td>
                    <td><button class="btn-file" type="button" id="disp-bh-link-metrics-ctrler" onClick="dispBhLinkMetricsCtrler()">Display Back-haul Link Metrics at Controller</button></td>
                </tr>
            </table>
        </div>
      <% end if %>
    </div>
  <!-- content -->
  <SCRIPT language=JavaScript type=text/javascript>
		<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		var get_device_role_timer_id;
		var get_al_mac_timer_id;
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
			
		function JSO_get_al_mac()
		{
				var ret = '';
				var al_mac = '';
				al_mac = "<% tcWebApi_get("Mesh_mapcfg","AL-MAC","s") %>";
			<% if al_mac <> "N/A" then %>
				ret = ' { ';
				ret = ret + '"status": "SUCCESS",';
				ret = ret + '"al_mac": "' + al_mac + '"';
				ret = ret + ' } ';
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
								case "get_al_mac":
									X_Res = JSO_get_al_mac();
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
			
		<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
		function clearAllTimers()
		{
		    clearTimeout(get_device_role_timer_id);
		    get_device_role_timer_id = null;
		    clearTimeout(get_al_mac_timer_id);
		    get_al_mac_timer_id = null;
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
		
		function getAlMac()
		{
		    var XHR_type = 'get_al_mac';
		    var x_response = getX_Response(XHR_type);
		    {
		        try
		        {
		            var r = JSON.parse(x_response);
		            var mac_reg_exp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		            if (r['status'] == "SUCCESS" && mac_reg_exp.test(r['al_mac'])) 
		            {
		                document.getElementById("al_mac").innerHTML = r['al_mac'];
		            }
		            else
		            {
		                console.log("Incorrect AL-MAC received!",r['status'],r['al_mac']);
		                if(document.getElementById("__activeTab").value == "adv")
		                {
		                    get_al_mac_timer_id = setTimeout(getAlMac,1000);
		                }
		            }
		        }
		        catch(e)
		        {
		            console.log("Incorrect response received for get AL-MAC request!");
		            if(document.getElementById("__activeTab").value == "adv")
		            {
		                get_al_mac_timer_id = setTimeout(getAlMac,1000);
		            }
		        }
		    }
		}
		
		function displayRuntimeTopology()
		{
				var dev_role = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
				if(dev_role != "0" && dev_role != "1")
				{
						alert("Device Role is not configured yet!\nPlease configure the Device Role.");
						return;
				}
				//location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-runtime-topology.asp';
				$('#thirdMenuMeshTopology', parent.document).click();
		}

		function dispFhStatusBss()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-bssinfo.asp';
		}

		function dispBhLinkMetricsCtrler()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-bh-link-metrics.asp';
		}

		function displayClientCapabilities()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-client-capabilities.asp';
		}

		function displayApCapabilities()
		{
			location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-ap-capabilities.asp';
		}

		function get_ap_bh_inf_list()
		{
				var apBhInfList = document.getElementById("ap-bh-inf-list-ul");
				apBhInfList.innerHTML = "";
				
				var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_bh_inf_list") %>";
				{
						try
						{
								var rsp = JSON.parse(x_response);
								if(rsp.status == "SUCCESS")
								{
										var ap_bh_inf_list_arr = rsp.apBhInfListStr.split(";");
										for(var idx=0; idx < ap_bh_inf_list_arr.length; idx++)
										{
												if(ap_bh_inf_list_arr[idx] == "")
												{
														continue;
												}
												var l = document.createElement("LI");
												var t = document.createTextNode(ap_bh_inf_list_arr[idx]);
												l.appendChild(t);
												apBhInfList.appendChild(l);
										}
								}
								else
								{
										console.log("Failed to get AP BH Interface list!\nStatus: ",rsp.status);
										if(document.getElementById("__activeTab").value == "status")
										{
												setTimeout(checkWebStatus, 5000);
										}
								}
						}
						catch(e)
						{
								console.log("Incorrect response!\nFailed to get AP BH Interface list!");
								if(document.getElementById("__activeTab").value == "status")
								{
										setTimeout(checkWebStatus, 5000);
								}
						}
				}
		}
		
		function get_ap_fh_inf_list()
		{
		    var apFhInfList = document.getElementById("ap-fh-inf-list-ul");
		    apFhInfList.innerHTML = "";
		    
		    var x_response = "<% tcWebApi_MeshJsonHook("mesh_get_ap_fh_inf_list") %>";
		    {
		        try
		        {
		            var rsp = JSON.parse(x_response);
		            if(rsp.status == "SUCCESS")
		            {
		                var ap_fh_inf_list_arr = rsp.apFhInfListStr.split(";");
		                for(var idx=0; idx < ap_fh_inf_list_arr.length; idx++)
		                {
		                    if(ap_fh_inf_list_arr[idx] == "")
		                    {
		                        continue;
		                    }
		                    var l = document.createElement("LI");
		                    var t = document.createTextNode(ap_fh_inf_list_arr[idx]);
		                    l.appendChild(t);
		                    apFhInfList.appendChild(l);
		                }
		            }
		            else
		            {
		                console.log("Failed to get AP FH Interface list!\nStatus: ",rsp.status);
		                if(document.getElementById("__activeTab").value == "status")
		                {
		                    setTimeout(checkWebStatus, 5000);
		                }
		            }
		        }
		        catch(e)
		        {
		            console.log("Incorrect response!\nFailed to get AP FH Interface list!");
		            if(document.getElementById("__activeTab").value == "status")
		            {
		            		setTimeout(checkWebStatus, 5000);
		            }
		        }
		    }
		}
		<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
		
		function hi_status()
		{
			<% if tcWebApi_get("Mesh_dat", "MapEnable", "h") = "1" then %>
				clearAllTimers();
				getAlMac();
				get_ap_bh_inf_list();
				get_ap_fh_inf_list();
			<% end if %>/* Mesh_mapdcfg.MapEnable=1 */
		}
		
		function checkWebStatus()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-status.asp';
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
				hi_status();
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
  </SCRIPT>
</body>
</html>