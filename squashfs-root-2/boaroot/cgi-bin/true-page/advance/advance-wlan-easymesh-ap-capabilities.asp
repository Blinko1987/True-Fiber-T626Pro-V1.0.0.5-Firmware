<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>AP Capabilities - Easy Mesh</title>
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

<body>
  <!-- content -->
    <div class="container-full container-resize-height">
      <div id="ap_db_display" class="card-table"></div>
    </div>
  <!-- content -->
  <script type="text/javascript">
										
		var max_cellspan = 2;
		function JSO_get_runtime_topology()
		{
				var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
				ret = ret.replace(/\'/g,'\\\\u0022');
				ret = ret.replace(/\\\\u0022Pass-phrase\\\\u0022:/g,'\\\\u0022WPAPSK\\\\u0022:');
				return ret;
		}
		
		function set_max_cellspan(o)
		{
		    for(var k in o)
		    {
		        var v = o[k];
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="connected sta info" || k=="Other Clients Info"
		        || k=="Security" || k=="Encryption" || k=="WPAPSK" || k=="Hidden")
	        	{
	    					continue;
	    			}
						if(k=="channel"){
	        			max_cellspan++;
	        	}
		        if (v instanceof Array)
		        {
		            max_cellspan++;
		            for(var a_idx=0; a_idx < v.length; a_idx++)
		            {
		                if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
		                {
		                    set_max_cellspan(v[a_idx]);
		                }
		                else
		                {
		                    console.log("set_max_cellspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
		                }
		            }
		        }
		        else if(((typeof v) == "object") && v != null)
		        {
		            set_max_cellspan(v);
		        }
		    }
		}
		
		function set_rowspan(o)
		{
		    var rowspan = 0;
		    for(var k in o)
		    {
		        var v = o[k];
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="connected sta info" || k=="Other Clients Info"
		        || k=="Security" || k=="Encryption" || k=="WPAPSK" || k=="Hidden")
	        	{
	    					continue;
	    			}
        		if(k=="channel"){
        				rowspan++;
        		}
		        if (v instanceof Array)
		        {
		            for(var a_idx=0; a_idx < v.length; a_idx++)
		            {
		                if(((typeof v[a_idx]) == "object") && v[a_idx] != null)
		                {
		                    rowspan = rowspan + set_rowspan(v[a_idx]);
		                }
		                else
		                {
		                    console.log("set_rowspan: Incorrect Topology: Array element is not an object!",v[a_idx]);
		                }
		            }
		        }
		        else if(((typeof v) == "object") && v != null)
		        {
		            rowspan = rowspan + set_rowspan(v);
		        }
		        else
		        {
		            rowspan++;
		        }
		    }
		    return rowspan;
		}
		
		function obj_loop(table_id, row, o)
		{
		    var cell;
		    for(var k in o)
		    {
		        var v = o[k];
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="connected sta info" || k=="Other Clients Info"
		        || k=="Security" || k=="Encryption" || k=="WPAPSK" || k=="Hidden")
	        	{
	    					continue;
	    			}
		        if (v instanceof Array)
		        {
		            arr_loop(table_id, k, v);
		        }
		        else if(((typeof v) == "object") && v != null)
		        {
		            obj_loop(table_id, row, v);
		        }
		        else
		        {
		            if(row == null)
		            {
		                row = table_id.insertRow(-1);
		                row.setAttribute("class", "table-content-fist center");
		            }
		            if(k == "Security")
		            {
		                v = get_auth_mode_str(v);
		            }
		            else if(k == "Encryption")
		            {
		                v = get_encryption_str(v);
		            }
		            else if(k == "WPAPSK")
		            {
		            		v = "********";
		            }
		            else if(k == "SSID")
		            {
										var ssid_2g = "<% tcWebApi_get("WLan_Entry0","SSID","s") %>";
					    			var ssid_5g = "<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>";
								    if(ssid_2g == v || ssid_5g == v){
								    		v = "<" + "<label style=\"font-style:oblique;\">hidden for mesh</label>" + ">";
								    } 
								}
		            else if(k=="Tx Spatial streams")
		            {
										k = "<strong>Tx Spatial streams</strong>";
								    if(parseInt(v) != 0){
								    		v = `${parseInt(v)}*${parseInt(v)}`;
								    }
								}else if(k=="Rx Spatial streams"){
										k = "<strong>Rx Spatial streams</strong>";
								    if(parseInt(v) != 0){
								    		v = `${parseInt(v)}*${parseInt(v)}`;
								    }
								}else if(k == "channel"){
										cell = row.insertCell(-1);
										cell.setAttribute("class", "text-center border border-dark");
		                cell.innerHTML = "<strong>Channel</strong>";
		                cell = row.insertCell(-1);
		                cell.setAttribute("class", "text-center border border-dark");
		                cell.colSpan = max_cellspan - row.cells.length + 1;
		                cell.innerHTML = v;
		                row = table_id.insertRow(-1);
		                row.setAttribute("class", "table-content-fist center");
		                k="<strong>Band</strong>";
		                if(parseInt(v) < 30){
		                		v = "2.4G";
		                }else{
		                		v = "5G";
		                }
								}else if(k == "STA MAC address")
								{
										k = "STA MAC";
								}
								else if(k == "tx packet Errors")
								{
										k = "TX Packet Errors";
								}
								else if(k == "transmittedPackets")
								{
										k = "TX Packets";
								}
								else if(k == "rx packet Errors")
								{
										k = "RX Packet Errors";
								}
								else if(k == "Packets Received")
								{
										k = "RX Packets";
								}
								else if(k == "RSSI")
								{
										k = "RSSI (dBm)";
								}
								var upperK = k.substring(0, 1).toUpperCase() + k.substring(1);																
		            cell = row.insertCell(-1);
		            cell.setAttribute("class", "text-center border border-dark");
		            cell.innerHTML = upperK;
		            cell = row.insertCell(-1);
		            cell.setAttribute("class", "text-center border border-dark");
		            cell.colSpan = max_cellspan - row.cells.length + 1;
		            cell.innerHTML = v;
		            row = null;
					  }
		    }
		}
		
		function arr_loop(table_id, k, a)
		{
		    var row, cell;
		    for(var a_idx=0; a_idx < a.length; a_idx++)
		    {
		        var v = a[a_idx];
		        if(((typeof v) == "object") && v != null)
		        {
		            row = table_id.insertRow(-1);
		            row.setAttribute("class", "table-content-fist center");
		            cell = row.insertCell(-1);
		            cell.setAttribute("class", "text-center border border-dark");
		            cell.rowSpan = set_rowspan(v);
		            cell.style.verticalAlign  = "middle";
		            if(k == "Radio Info")
		            {
            				k = "Radio";
                }
		            else if(k == "BSSINFO")
		            {
                		k = "BSS";
                }
		            else if(k == "connected sta info")
                {
                		k = "STA Info";
                }
                else if(k == "backhaul link metrics")
                {
            				k = "Backhaul link metrics";
            		}
                else if(k == "metrics")
                {
            				k = "Metrics";
            		}
            		var upperK = k.substring(0, 1).toUpperCase() + k.substring(1);
		            cell.innerHTML = "<strong>" + upperK + ' - ' + (a_idx + 1) + "</strong>";
		            obj_loop(table_id, row, v);
		        }
		        else
		        {
		            console.log("Incorrect Topology: Array element is not an object!",a);
		        }
		    }
		}
		
		function prep_bssinfo(dev1905Obj)
	{
			var tag_dev1905Obj = dev1905Obj;
    	for(var radIdx=0; radIdx < tag_dev1905Obj['Radio Info'].length; radIdx++)
    	{
    	    for(var bssIdx=0; bssIdx < tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
    	    {
    	    		var Security_val = '';
    	    		if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Security'))
    	    		{
    	    				Security_val = tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Security'];
    	    				if(Security_val == '0001')
    	    				{
    	    						if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Encryption'))
    	    						{
    	    								tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Encryption'] = '0001';
    	    						}
    	    						if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('WPAPSK'))
        							{
        									tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['WPAPSK'] = '';
        							}
    	    				}
    	    		}
    	    		var Hidden_val = '';
	        		if(tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('Hidden'))
	        		{
	        				Hidden_val = tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Hidden'];
	        				if(Hidden_val == '1')
	        				{
	        						tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Hidden']="Yes";
	        				}else{
	        						tag_dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['Hidden']="No";
	        				}
	        		}
    	    		var wirelessmode_val = '';
	        		if(tag_dev1905Obj['Radio Info'][radIdx].hasOwnProperty('wireless mode'))
	        		{
	        				wirelessmode_val = tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'];
	        				if(wirelessmode_val == '0')
	        				{
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11b/g";
	        				}else if(wirelessmode_val == '1'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11b";
	        				}else if(wirelessmode_val == '4'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11g";
	        				}else if(wirelessmode_val == '6'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11n";
	        				}else if(wirelessmode_val == '7'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11g/n";
	        				}else if(wirelessmode_val == '9'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11b/g/n";
	        				}else if(wirelessmode_val == '2'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a";
	        				}else if(wirelessmode_val == '8'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a/n";
	        				}else if(wirelessmode_val == '14'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a/n/ac";
	        				}else if(wirelessmode_val == '15'){
	        						tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11n/ac";
	        				}
	        		}
    	    }
    	}
    	return tag_dev1905Obj;
	}

		function draw_ap_db_table(jsTopoInfo)
		{
		    var topoInfoArr = jsTopoInfo['topology information'];
		    if(!(topoInfoArr instanceof Array))
		    {
		        console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
		        return;
		    }
		    
		    for(var idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
		    {
		    		var obj_1905 = topoInfoArr[idx_1905];
		      	if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']))
		      	{
		      			continue;
		      	}
		      	obj_1905 = prep_bssinfo(obj_1905);
		      	
		      	var ap_db_tbl = document.createElement("TABLE");
		        ap_db_tbl.setAttribute("style", "width: 100%;");
		        var ap_db = {};
		        ap_db["Radio Info"] = topoInfoArr[idx_1905]['Radio Info'];
		        
		        var dev1905div = document.createElement("div");
		        dev1905div.setAttribute("class", "title-content");
		        var dev1905fb = document.createElement("b");
		        var dev1905a = document.createElement("A");
		        var dev1905text = document.createTextNode("Radio Info of EasyMesh Device - " + (idx_1905 + 1));
		        dev1905a.setAttribute("href", "#");
		        dev1905a.appendChild(dev1905text);
		        //dev1905fb.appendChild(dev1905a);
		        dev1905div.appendChild(dev1905a);
		        document.getElementById("ap_db_display").appendChild(dev1905div);
		        
		        set_max_cellspan(ap_db);
		        obj_loop(ap_db_tbl, null, ap_db);
		        
		        document.getElementById("ap_db_display").appendChild(ap_db_tbl);
		    }
		}
		
		function checkWebStatus()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-ap-capabilities.asp';
		}
		
		function get_ap_db_cb(rsp)
		{
		    try
		    {
		        var r = JSON.parse(rsp);
		        if(r.status == "SUCCESS")
		        {
		        		var tmp_jsTopoInfo = r.luaTopologyInfo;
		      			tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
		      			tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
		          	var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
		            document.getElementById("ap_db_display").innerHTML = "";
		            draw_ap_db_table(jsTopoInfo);
		        }
		        else
		        {
		            console.log("Failed to get AP DB!\nStatus: ",r.status);
		        }
		        //setTimeout(checkWebStatus, 10000);
		    }
		    catch(e)
		    {
		        console.log("Incorrect response! Failed to get AP DB!",e.name,e.message);
		        //setTimeout(checkWebStatus, 10000);
		    }
		}
		
		function get_ap_db()
		{
		  	document.getElementById("ap_db_display").innerHTML = "";
		  	var x_response = JSO_get_runtime_topology();
		  	get_ap_db_cb(x_response);
		}
		function get_encryption_str(encryptionCode)
		{
				switch(encryptionCode)
				{
						case "0001"://NONE
						    return "NONE";
						case "0008"://AES
						    return "AES";
						case "0004"://TKIP
						    return "TKIP";
						case "000c"://TKIPAES
						    return "TKIP/AES";
						default:
						    return "";
				}
		}
		function get_auth_mode_str(authModeCode)
		{
		    switch(authModeCode)
		    {
		        case "0001"://OPEN
						    return "OPEN";
						case "0020"://WPA2 - Personal
						    return "WPA2-PSK";
						case "0002"://WPA1 - Personal
						    return "WPA-PSK";
						case "0022"://WPA1WPA2
						    return "WPA-PSK/WPA2-PSK";
						default:
						    return "";
		    }
		}	
		get_ap_db();
	</script>
</body>
</html>