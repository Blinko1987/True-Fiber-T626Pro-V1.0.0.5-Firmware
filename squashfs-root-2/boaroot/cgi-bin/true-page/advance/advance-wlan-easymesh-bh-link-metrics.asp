<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Back-haul Link Metrics at Controller - Easy Mesh</title>
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
    <div class="row p-1" id="get_bh_link_metrics_msg_div">
      <div class="col-12">
        <div class="title-text-left"><label class="text-content"><strong>Retrieving Back-haul Link Metrics at Controller!</strong></label></div>
      </div>
    </div>
    <div class="row p-1" id="bh_link_metrics_err_msg_parent" style="display:none">
      <div class="col-12">
        <div class="title-text-left"><label class="text-content"><strong id="bh_link_metrics_err_msg_div"></strong></label></div>
      </div>
    </div>
    <div id="bh_link_metrics_display" class="card-table"></div>
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
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="Tx Spatial streams" || k=="Rx Spatial streams")
            {
        				continue;
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
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="Tx Spatial streams" || k=="Rx Spatial streams")
            {
        				continue;
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
		        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="Tx Spatial streams" || k=="Rx Spatial streams")
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
		            if(k == "tx packet Errors")
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
                		k="Radio";
                }
		            else if(k == "BSSINFO")
		            {
                		k="BSS";
                }
		            else if(k == "connected sta info")
		            {
                		k="STA Info";
                }
		            else if(k == "backhaul link metrics")
		            {
                		k="Backhaul link metrics";
                }
		            else if(k == "metrics")
		            {
                		k="Metrics";
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
            }
        }
        return tag_dev1905Obj;
	}
    	
		function draw_bh_link_metrics_table(jsTopoInfo)
		{
		    var topoInfoArr = jsTopoInfo['topology information'];
		    if(!(topoInfoArr instanceof Array))
		    {
		        console.log("Incorrect TopologyInfo: Value of topology information is not an Array!");
		        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		        document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Incorrect TopologyInfo: Value of topology information is not an Array!<br /> UI will retry in a short while.";
		        document.getElementById("bh_link_metrics_err_msg_parent").style.display = "";
		        return;
		    }
		    var idx_1905;
		    for(idx_1905=0; idx_1905 < topoInfoArr.length; idx_1905++)
		    {
		        var obj_1905 = topoInfoArr[idx_1905];
		        if(!obj_1905.hasOwnProperty('Device role') ||
		            parseInt(obj_1905['Device role']) != 1)
		        {
		            continue;
		        }
		        if(!obj_1905.hasOwnProperty('AL MAC') || ("00:00:00:00:00:00" == obj_1905['AL MAC']))
		        {
		        		continue;
		        }
		        if(!obj_1905.hasOwnProperty('backhaul link metrics'))
		        {
		            console.log("No backhaul link metrics in Controller's Topology Information! Topology:",obj_1905);
		            document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		            document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "No backhaul link metrics in Controller's Topology Information!<br /> UI will retry in a short while.";
		            document.getElementById("bh_link_metrics_err_msg_parent").style.display = "";
		            return;
		        }
		        obj_1905 = prep_bssinfo(obj_1905);
		        
		        var bhMetricsDb = {};
		        bhMetricsDb['backhaul link metrics'] = obj_1905['backhaul link metrics'];
		        
		        var bh_link_metrics_tbl = document.createElement("TABLE");
		        bh_link_metrics_tbl.setAttribute("style", "width: 100%;");
		        var dev1905div = document.createElement("div");
		        dev1905div.setAttribute("class", "title-content");
		        var dev1905fb = document.createElement("b");
		        var dev1905a = document.createElement("A");
		        var dev1905text = document.createTextNode("Back-haul Link Metrics at Controller with AL-MAC " + obj_1905['AL MAC']);
		        dev1905a.setAttribute("href", "#");
		        dev1905a.appendChild(dev1905text);
		        //dev1905fb.appendChild(dev1905a);
		        dev1905div.appendChild(dev1905a);
		        document.getElementById("bh_link_metrics_display").appendChild(dev1905div);
		        
		        set_max_cellspan(bhMetricsDb);
		        obj_loop(bh_link_metrics_tbl, null, bhMetricsDb);
		        
		        document.getElementById("bh_link_metrics_display").appendChild(bh_link_metrics_tbl);
		        document.getElementById("bh_link_metrics_display").style.display = "";
		        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		        break;
		    }
		    if(idx_1905 == topoInfoArr.length)
		    {
		        console.log("No Controller found in Topology Information!",topoInfoArr);
		        document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		        document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "No Controller found in Topology Information!<br /> UI will retry in a short while.";
		        document.getElementById("bh_link_metrics_err_msg_parent").style.display = "";
		        return;
		    }
		}
		
		function checkWebStatus()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-bh-link-metrics.asp';
		}
		
		function get_run_time_topology()
		{
		    var x_response = JSO_get_runtime_topology();
		    {
		        try
		        {
		            var r = JSON.parse(x_response);
		            if(r.status == "SUCCESS")
		            {
		            		var tmp_jsTopoInfo = r['luaTopologyInfo'];
		        				tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '\"');
		        				tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '\"');
		            		var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
		                draw_bh_link_metrics_table(jsTopoInfo);
		            }
		            else
		            {
		                console.log("Failed to get Topology Info!\nStatus: ",r.status);
		                document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		                document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Failed to get Topology Info!<br />Status: " + r.status + "<br /> UI will retry in a short while.";
		                document.getElementById("bh_link_metrics_err_msg_parent").style.display = "";
		            }
		        }
		        catch(e)
		        {
		            console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
		            document.getElementById("get_bh_link_metrics_msg_div").style.display = "none";
		            document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "Incorrect response! Failed to get Topology Info!<br />" + e.name + " " + e.message + "<br /> UI will retry in a short while.";
		            document.getElementById("bh_link_metrics_err_msg_parent").style.display = "";
		        }
		        finally
		        {
		            //setTimeout(checkWebStatus, 60000);
		        }
		    }
		}
		
		function get_bh_link_metrics()
		{
		    document.getElementById("bh_link_metrics_err_msg_div").innerHTML = "";
		    document.getElementById("bh_link_metrics_err_msg_parent").style.display = "none";
		    document.getElementById("bh_link_metrics_display").style.display = "none";
		    document.getElementById("bh_link_metrics_display").innerHTML = "";
		    document.getElementById("get_bh_link_metrics_msg_div").style.display = "";
		    
		    get_run_time_topology();
		}

		get_bh_link_metrics();
</script>
</body>
</html>