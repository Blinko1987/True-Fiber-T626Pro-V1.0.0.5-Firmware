<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Topology - Easy Mesh</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/lib/vis.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text" style="display:none;">Mesh Topology</div>
    <div class="title-description-text" style="display:none;">This page displays the topology of EasyMesh network.</div>
    <div class="row p-1" id="getTopoInfoMsgDiv">
      <div class="col-12">
        <div class="title-text-left"><label class="text-content"><strong>Retrieving EasyMesh Run-time Topology Information!</strong></label></div>
      </div>
    </div>
    <div class="row p-1" style="display:none">
      <div class="col-12">
        <div class="title-text-left"><label class="text-content"><strong id="topoErrMsgDiv"></strong></label></div>
      </div>
    </div>
    <div class="row p-1" style="height:120px">
      <div class="col-10" style="display:flex;">
        <div style="width:90px;height:65px;margin-left:20px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_CONTROLLER.png" style="margin-top:0px;vertical-align:middle; height:65px;width:65px;">
          <div><span>Controller</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_AP.png" style="margin-top:5px;vertical-align:middle; height:60px;width:60px;">
          <div><span>Agent</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_TV.png" style="margin-top:0px;vertical-align:middle; height:65px;width:65px;">
          <div><span>TrueIDTV</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_PHONE.png" style="margin-top:15px;vertical-align:middle;height:50px;width:50px;">
          <div><span>Phone</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_PC.png" style="margin-top:0px;vertical-align:middle; height:65px;width:65px;">
          <div><span>PC</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_CAMERA.png" style="margin-top:15px;vertical-align:middle; height:50px;width:50px;">
          <div><span>Camera</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/MeshTopology_TRUESTANDARD_OTHER.png" style="margin-top:15px;vertical-align:middle; height:50px;width:50px;">
          <div><span>Other</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/WiFi5.0_4v4.png" style="margin-top:15px;vertical-align:middle; height:50px;width:50px;">
          <div><span>5G</span></div>
        </div>
        <div style="width:90px;height:65px;text-align:center;">
          <img src="/image/WiFi2.4_4v2.png" style="margin-top:15px;vertical-align:middle; height:50px;width:50px;">
          <div><span>2.4G</span></div>
        </div>
      </div>
      <div class="col-2">
        <button class="btn-file" type="button" id="refresh_disp_tree_vis_btn" style="margin-top:25px;" onclick="RefreshPage()">Refresh</button>
      </div>
    </div>
    <div id="display_tree_vis" style="display:none"></div>
    <div class="staInfoHoverNode" id="staInfoHoverNode" style="display: none;"></div>
    <hr>
    <div class="row p-1 center">
      <div class="col-4">
        <button class="btn-file" type="button" id="toggle_disp_tree_vis_detail_btn" onclick="toggle_disp_tree_vis_detail()" disabled="disabled">Show Topology in Separate Window</button>
      </div>
      <div class="col-4">
        <button class="btn-file" type="button" id="toggle_all_agent_info_btn" onclick="toggle_disp_agent_table(this)" disabled="disabled">Show All Mesh AP Basic Info</button>
      </div>
      <div class="col-4">
        <button class="btn-file" type="button" id="toggle_all_1905_dev_info_btn" onclick="toggle_disp_dev_table(this)" disabled="disabled">Show All Device Detailed Info</button>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-12">
        <div id="display_all_agent_info_div" class="card-table" style="display:none"></div>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-12">
        <div id="display_all_1905_dev_info_div" class="card-table" style="display:none"></div>
      </div>
    </div>
    <div class="mt-2 center">
      <button class="btn-file" type="button" id="toggle_all_1905_dev_info_btn_hide" onclick="toggle_disp_dev_table(this)" style="display:none;">Hide All Device Detailed Info</button>
    </div>
  </div>
  <!-- content -->
  <SCRIPT language=JavaScript type=text/javascript>
    var staInfo = <% tcWebApi_GetMeshStaList() %>;
    var currentTime = new Date();
    var timeoptions = { timeZone: 'Asia/Bangkok' };
    var gmtTime = '<%tcWebApi_get("DeviceInfo","true_cur_time","s")%>';

    function setAgentList(index,manufacturer,modelName,serialNum,manufacOui,ipAddr,macAddr,deviceRole,deviceName,currentSWVersion)
    {
      this.index = index;
      this.manufacturer = manufacturer;
      this.modelName = modelName;
      this.serialNum = serialNum;
      this.manufacOui = manufacOui;
      this.ipAddr = ipAddr;
      this.macAddr = macAddr;
      this.deviceRole = deviceRole;
      this.deviceName = deviceName;
      this.currentSWVersion = currentSWVersion;
    }

    function getAgentListInfo()
    {
      var ncount = 32;
      var nCurTemp = 0;
      var vcurLinks = new Array(ncount);
      var array1;
      var list1 = new Array(ncount);
      list1[0] = "<% tcWebApi_get("Mesh_apinfo_Entry0","AllInfo","s") %>";
      if(list1[0] != "N/A"){
        list1[1] = "<% tcWebApi_get("Mesh_apinfo_Entry1","AllInfo","s") %>";
        list1[2] = "<% tcWebApi_get("Mesh_apinfo_Entry2","AllInfo","s") %>";
        list1[3] = "<% tcWebApi_get("Mesh_apinfo_Entry3","AllInfo","s") %>";
        list1[4] = "<% tcWebApi_get("Mesh_apinfo_Entry4","AllInfo","s") %>";
        list1[5] = "<% tcWebApi_get("Mesh_apinfo_Entry5","AllInfo","s") %>";
        list1[6] = "<% tcWebApi_get("Mesh_apinfo_Entry6","AllInfo","s") %>";
        list1[7] = "<% tcWebApi_get("Mesh_apinfo_Entry7","AllInfo","s") %>";
        list1[8] = "<% tcWebApi_get("Mesh_apinfo_Entry8","AllInfo","s") %>";
        list1[9] = "<% tcWebApi_get("Mesh_apinfo_Entry9","AllInfo","s") %>";
        list1[10] = "<% tcWebApi_get("Mesh_apinfo_Entry10","AllInfo","s") %>";
        list1[11] = "<% tcWebApi_get("Mesh_apinfo_Entry11","AllInfo","s") %>";
        list1[12] = "<% tcWebApi_get("Mesh_apinfo_Entry12","AllInfo","s") %>";
        list1[13] = "<% tcWebApi_get("Mesh_apinfo_Entry13","AllInfo","s") %>";
        list1[14] = "<% tcWebApi_get("Mesh_apinfo_Entry14","AllInfo","s") %>";
        list1[15] = "<% tcWebApi_get("Mesh_apinfo_Entry15","AllInfo","s") %>";
        list1[16] = "<% tcWebApi_get("Mesh_apinfo_Entry16","AllInfo","s") %>";
        list1[17] = "<% tcWebApi_get("Mesh_apinfo_Entry17","AllInfo","s") %>";
        list1[18] = "<% tcWebApi_get("Mesh_apinfo_Entry18","AllInfo","s") %>";
        list1[19] = "<% tcWebApi_get("Mesh_apinfo_Entry19","AllInfo","s") %>";
        list1[20] = "<% tcWebApi_get("Mesh_apinfo_Entry20","AllInfo","s") %>";
        list1[21] = "<% tcWebApi_get("Mesh_apinfo_Entry21","AllInfo","s") %>";
        list1[22] = "<% tcWebApi_get("Mesh_apinfo_Entry22","AllInfo","s") %>";
        list1[23] = "<% tcWebApi_get("Mesh_apinfo_Entry23","AllInfo","s") %>";
        list1[24] = "<% tcWebApi_get("Mesh_apinfo_Entry24","AllInfo","s") %>";
        list1[25] = "<% tcWebApi_get("Mesh_apinfo_Entry25","AllInfo","s") %>";
        list1[26] = "<% tcWebApi_get("Mesh_apinfo_Entry26","AllInfo","s") %>";
        list1[27] = "<% tcWebApi_get("Mesh_apinfo_Entry27","AllInfo","s") %>";
        list1[28] = "<% tcWebApi_get("Mesh_apinfo_Entry28","AllInfo","s") %>";
        list1[29] = "<% tcWebApi_get("Mesh_apinfo_Entry29","AllInfo","s") %>";
        list1[30] = "<% tcWebApi_get("Mesh_apinfo_Entry30","AllInfo","s") %>";
        list1[31] = "<% tcWebApi_get("Mesh_apinfo_Entry31","AllInfo","s") %>";
      }
      for(var i=0; i<ncount; i++)
      {
        if(list1[i] != "N/A")
        {
          array1 = list1[i].split("|");
          vcurLinks[nCurTemp++] = new setAgentList(i, array1[0], array1[1], array1[2], array1[3], array1[4], array1[5], array1[6], array1[7], array1[8]);
        }
        else
        {
          break;
        }
      }
      var vObjRet = new Array(nCurTemp);
      for(var m=0; m<nCurTemp; m++)
      {
        vObjRet[m] = vcurLinks[m];
      }

      return vObjRet;
    }

    var max_cellspan = 2;
    
    if(typeof String.prototype.startsWith != 'function')
    {
      String.prototype.startsWith = function(prefix)
      {
        return this.slice(0, prefix.length) == prefix;
      }
    }

    function toggle_disp_tree_vis_detail()
    {
      window.open("/cgi-bin/true-page/advance/advance-wlan-easymesh-get-run-time-topology-detail.asp?autoRefresh=15000","runtime_topology_detail","toolbar=no,menubar=no,height=500, width=800,location=0,left=200,top=200");
    }

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
        if (curUserName != sptUserName)
        {
          if(k=="backhaul link metrics")
          {
            continue;
          }
        }
        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="Tx Spatial streams" || k=="Rx Spatial streams")
        {
          continue;
        }
        if(k=="channel")
        {
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
        if (curUserName != sptUserName)
        {
          if(k=="backhaul link metrics")
          {
          continue;
          }
        }
        if(k=="identifier" || k=="BW" || k=="wireless mode" || k=="Tx Spatial streams" || k=="Rx Spatial streams")
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
        if (curUserName != sptUserName)
        {
          if(k=="backhaul link metrics")
          {
            continue;
          }
        }
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
          if(k == "Device role")
          {
            v = get_dev_role_string(v);
          }
          else if(k == "Security")
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
          }else if(k == "SSID")
          {
            var ssid_2g = "<% tcWebApi_get("WLan_Entry0","SSID","s") %>";
            var ssid_5g = "<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>";
            if(ssid_2g == v || ssid_5g == v)
            {
              v = "<" + "<label style=\"font-style:oblique;\">hidden for mesh</label>" + ">";
            } 
          }
          else if(k == "channel")
          {
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
          }
          else if(k == "STA MAC address")
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
            }
            else if(wirelessmode_val == '1')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11b";
            }
            else if(wirelessmode_val == '4')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11g";
            }
            else if(wirelessmode_val == '6')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11n";
            }
            else if(wirelessmode_val == '7')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11g/n";
            }
            else if(wirelessmode_val == '9')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11b/g/n";
            }
            else if(wirelessmode_val == '2')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a";
            }
            else if(wirelessmode_val == '8')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a/n";
            }
            else if(wirelessmode_val == '14')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11a/n/ac";
            }
            else if(wirelessmode_val == '15')
            {
              tag_dev1905Obj['Radio Info'][radIdx]['wireless mode'] = "802.11n/ac";
            }
          }
        }
      }
      return tag_dev1905Obj;
    }
    function draw_topology_table(jsTopoInfo)
    {
      var tree_info = [];
      var tree_info_count = 0;
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
        
        var dev1905tbl = document.createElement("TABLE");
        dev1905tbl.setAttribute("style", "width: 100%;");
        var dev1905fset = document.createElement("div");
        dev1905fset.setAttribute("class", "title-content");
        //var dev1905legend = document.createElement("p");
        var dev1905a = document.createElement("A");
        var dev1905text = document.createTextNode("EasyMesh Device - " + (idx_1905 + 1));
        dev1905a.setAttribute("href", "#");
        dev1905a.appendChild(dev1905text);
        //dev1905legend.appendChild(dev1905a);
        dev1905fset.appendChild(dev1905a);
        document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905fset);
        
        set_max_cellspan(obj_1905);
        obj_loop(dev1905tbl, null, obj_1905);
        tree_info[tree_info_count] = prep_tree_info(obj_1905);
        
        document.getElementById("display_all_1905_dev_info_div").appendChild(dev1905tbl);
        tree_info_count++;
      }
      tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
      disp_topology_vis(tree_info);
      disp_agent_info(tree_info);
    }

    function disp_agent_info(tree_info)
    {
      var agentListInfo = getAgentListInfo();
      var tableHtmlOutput = "";
      var agenttbl = document.createElement("TABLE");
      agenttbl.setAttribute("style", "width: 100%;");
      tableHtmlOutput = "<tr class=\"table-header\">";
      tableHtmlOutput += "<td class=\"p-1 text-center border border-dark\">DeviceName</td>";
      tableHtmlOutput += "<td class=\"p-1 text-center border border-dark\">AL_MAC</td>";
      tableHtmlOutput += "<td class=\"p-1 text-center border border-dark\">Model</td>";
      tableHtmlOutput += "<td class=\"p-1 text-center border border-dark\">SN</td>";
      tableHtmlOutput += "<td class=\"p-1 text-center border border-dark\">IP</td>";
      var num = 0;
      for(var nIdx=0; nIdx < tree_info.length; nIdx++)
      {
        for (i = 0; i < agentListInfo.length; i++)
        {
          if (tree_info[nIdx]['devRole'] == "Agent")
          {
            if(agentListInfo[i].macAddr.toUpperCase() == tree_info[nIdx]['alMac'].toUpperCase())
			{
              if(num % 2 == 0)
			  {
                tableHtmlOutput += '<tr class="table-content-fist center">';
              }
              else
              {
                tableHtmlOutput += '<tr class="table-content-second center">';
              }
              num = num + 1 ;
              tableHtmlOutput += '<td class="text-center border border-dark">' + agentListInfo[i].deviceName + '</td>';
              tableHtmlOutput += '<td class="text-center border border-dark">' + agentListInfo[i].macAddr + '</td>';
              tableHtmlOutput += '<td class="text-center border border-dark">' + agentListInfo[i].modelName + '</td>';
              tableHtmlOutput += '<td class="text-center border border-dark">' + agentListInfo[i].serialNum + '</td>';
              tableHtmlOutput += '<td class="text-center border border-dark"><a href="#" onclick=showAgentWeb("'+ agentListInfo[i].ipAddr +'")>' + agentListInfo[i].ipAddr + '</a></td>';
              tableHtmlOutput += '</tr>';
            }
          }
        }
      }
      agenttbl.innerHTML = tableHtmlOutput;
      document.getElementById("display_all_agent_info_div").appendChild(agenttbl);
    }

    function showAgentWeb(agentIp)
    {
      if(confirm("Warning: You are going to leave the ONT web page and enter the Mesh AP's web page, please confirm.")){
        window.open("http://" + agentIp);
      }
    }

    function prep_tree_info(dev1905Obj)
    {
      var node = {};
      node["devRole"] = get_dev_role_string(dev1905Obj['Device role']);
      node["alMac"] = dev1905Obj['AL MAC'];
      node["hopCount"] = parseInt(dev1905Obj['Distance from controller']);
      node['UplinkAlMac'] = dev1905Obj['Upstream 1905 device'];
      node["wifistaInfo"] = {};
      node["ethstaInfo"] = {};
      node['UplinkRSSI'] = "";
      
      if(node["devRole"] == "Agent")
      {
        if(dev1905Obj.hasOwnProperty('BH Info'))
        {
          if((dev1905Obj['BH Info'].length > 0) && dev1905Obj['BH Info'][0].hasOwnProperty('Backhaul Medium Type'))
          {
            if(dev1905Obj['BH Info'][0]['Backhaul Medium Type'].indexOf("802.11") > -1)
            {
              node['UplinkRSSI'] = dev1905Obj['BH Info'][0]['RSSI'];
            }
          }
        }
      }
      
      for(var radIdx=0; radIdx < dev1905Obj['Radio Info'].length; radIdx++)
      {
        for(var bssIdx=0; bssIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'].length; bssIdx++)
        {
          if(dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx].hasOwnProperty('connected sta info'))
          {
            for(var staIdx=0; staIdx < dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"].length; staIdx++)
            {
              var ssid = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]['SSID'];
              var staMac = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['STA MAC address'];
              var bhsta = dev1905Obj['Radio Info'][radIdx]['BSSINFO'][bssIdx]["connected sta info"][staIdx]['BH STA'];
              if (node["wifistaInfo"].hasOwnProperty(ssid))
              {
                if(bhsta == "No")
                {
                  node["wifistaInfo"][ssid].push(staMac);
                }
              }
              else
              {
                if(bhsta == "No")
                {
                  node["wifistaInfo"][ssid] = Array(staMac);
                }
              }
            }
          }
        }
      }
      
      for(var cliIdex = 0; cliIdex < dev1905Obj['Other Clients Info'].length; cliIdex++)
      {
        if (dev1905Obj['Other Clients Info'][cliIdex].hasOwnProperty('Client Address'))
        {
          var cliAdd = dev1905Obj['Other Clients Info'][cliIdex]['Client Address'];
          var medium = dev1905Obj['Other Clients Info'][cliIdex]['Medium'];
          if (node["ethstaInfo"].hasOwnProperty(medium))
          {
            node["ethstaInfo"][medium].push(cliAdd);
          }
          else
          {
            node["ethstaInfo"][medium] = Array(cliAdd);
          }
        }
      }
      return node;
    }
    
    function get_uplink_tree_info(tree_info, mac)
    {
      for(var nIdx=0; nIdx < tree_info.length; nIdx++)
      {
        if(tree_info[nIdx]['alMac'] == mac)
        {
          return '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"';
        }
      }
      return "";
    }
    
    var ra0_12 = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
    var br0_12 = ['c','d','e','f','0','1','2','3','4','5','6','7','8','9','a','b'];
    var ra0_11 = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
    var br0_11 = ['f','0','1','2','3','4','5','6','7','8','9','a','b','c','d','e'];
    function br0_to_ra0(br0_mac)
    {
      var front_part = br0_mac.slice(0, br0_mac.length - 2);
      var back_part = br0_mac.slice(-2);
      var a = back_part.slice(0, 1);
      var b = back_part.slice(1, 2);
      var flag = 0;
      for(var i = 0; i < br0_12.length; i++){
        if((b == br0_12[i]) && (flag == 0)){
          b = ra0_12[i];
          if((i == 0) || (i == 1) || (i == 2) || (i == 3)){
            for(var j = 0; j < br0_11.length; j++){
              if(a == br0_11[j]){
                a = ra0_11[j];
                flag = 1;
                break;
              }
            }
          }else{
            break;
          }
        }
      }
      var ra0_mac = front_part + a + b;
      return ra0_mac;
    }
    
    function ra0_to_br0(ra0_mac)
    {
      var front_part = ra0_mac.slice(0, ra0_mac.length - 2);
      var back_part = ra0_mac.slice(-2);
      var a = back_part.slice(0, 1);
      var b = back_part.slice(1, 2);
      var flag = 0;
      for(var i = 0; i < ra0_12.length; i++){
        if((b == ra0_12[i]) && (flag == 0)){
          b = br0_12[i];
          if((i == 0) || (i == 1) || (i == 2) || (i == 3)){
            for(var j = 0; j < ra0_11.length; j++){
              if(a == ra0_11[j]){
                a = br0_11[j];
                flag = 1;
                break;
              }
            }
          }else{
            break;
          }
        }
      }
      var br0_mac = front_part + a + b;
      return br0_mac;
    }

    function get_onlinetime(now_time, access_time)
    {
      var currentTime = new Date(now_time);
      var connectTime = new Date(access_time);
      var timeDifference = currentTime - connectTime;

      var hours = Math.floor(timeDifference / (1000 * 60 * 60));
      var minutes = Math.floor((timeDifference % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((timeDifference % (1000 * 60)) / 1000);

      var formattedHours = hours < 100 ? ("0" + hours).slice(-2) : hours.toString();
      var formattedMinutes = ("0" + minutes).slice(-2);
      var formattedSeconds = ("0" + seconds).slice(-2);
      
      var formattedTime = formattedHours + ":" + formattedMinutes + ":" + formattedSeconds;

      return formattedTime;
    }

    // 图像路径数组
    var imagePaths = ['/image/WiFi5.0_4v4.png', '/image/WiFi5.0_3v4.png', '/image/WiFi5.0_2v4.png', '/image/WiFi5.0_1v4.png', '/image/WiFi2.4_4v2.png', '/image/WiFi2.4_3v2.png', '/image/WiFi2.4_1v2.png', '/image/conn_eth.png'];

    var images = [];
    var loadedCount = 0;

    // 加载图像
    function loadImages(callback) {

      // 遍历图像路径数组
      for (let i = 0; i < imagePaths.length; i++) {
        images[i] = new Image();
        images[i].src = imagePaths[i];

        // 监听图像加载完成事件
        images[i].onload = function()
        {
          loadedCount++;
          // 检查是否所有图像都已加载完成
          if (loadedCount === imagePaths.length) {
            callback();
          }
        };
      }
    }

    function getRssiIcon(Info)
    {
      if(Info.access_type == '5G')
      {
        if(Info.RSSI >= -70)
          return images[0];
        else if(Info.RSSI <= -71 && Info.RSSI >= -75)
          return images[1];
        else if(Info.RSSI <= -76 && Info.RSSI >= -79)
          return images[2];
        else if(Info.RSSI <= -80)
          return images[3];
        else
          return images[7];
      }
      else if(Info.access_type == '2.4G')
      {
        if(Info.RSSI >= -60)
          return images[4];
        else if(Info.RSSI <= -61 && Info.RSSI >= -70)
          return images[5];
        else if(Info.RSSI <= -71)
          return images[6];
        else
          return images[7];
      }
      else //Ethernet
      {
          return images[7];
      }
    }

    function addStaIdItem(staInfo)
    {
      var wordlimit = 11;

      var source_str = staInfo.hostName;
      var target_str = "";
      var flag = 0;

      if(source_str.length > wordlimit)
      {
        for (var i = 0; i < source_str.length; i++)
        {
          target_str += source_str[i];
          if ((i + 1) % wordlimit == 0)
          {
            if(flag == 0)
            {
              target_str += "\\n";
              flag = 1;
            }
            else
            {
              target_str = target_str.slice(0, -2) + "...";
              break;
            }
          }
        }
      }
      else
      {
        target_str = source_str;
      }
      this.RssiIcon = getRssiIcon(staInfo);
      this.HostName = target_str;
      this.BreakFlag = flag;
      this.treelevel = staInfo.treelevel;
      this.treegroup = staInfo.treegroup;
      this.maxtreegroup = staInfo.maxtreegroup;
    }

    /* 按照treelevel排入到一个二维数组中 */
    function groupStructByTreeLevel(structArray)
    {
      /* treelevel升序排序 */
      structArray.sort(function(a, b) {
        return a.treelevel - b.treelevel;
      });

      var resultArray = [];

      /* 相同treelevel放入同一个二维数组中 */
      for (var i = 0; i < structArray.length; i++)
      {
        var struct = structArray[i];
        var treelevel = struct.treelevel;
    
        var found = false;
        for (var j = 0; j < resultArray.length; j++)
        {
          if (resultArray[j][0].treelevel === treelevel)
          {
            resultArray[j].push(struct);
            found = true;
            break;
          }
        }
    
        if (!found)
        {
          resultArray.push([struct]);
        }
      }
    
      return resultArray;
    }

    /* 对于每个treelevel数组，再按照father_mac归类到一个新二维数组中 */
    function groupStructByFathermac(structArray)
    {
      var resultArray = [];
    
      for (var i = 0; i < structArray.length; i++)
      {
        var struct = structArray[i];
        var father_mac = struct.father_mac.toLowerCase();
    
        var found = false;
        for (var j = 0; j < resultArray.length; j++)
        {
          if (resultArray[j][0].father_mac.toLowerCase() === father_mac)
          {
            resultArray[j].push(struct);
            found = true;
            break;
          }
        }
    
        if (!found)
        {
          resultArray.push([struct]);
        }
      }
    
      return resultArray;
    }

    /* 数据预处理算法 */
    function groupStructByLevelFathermac(structArray)
    {
      /* 结构体 */
      function GroupRecord(set, sum)
      {
        this.set = set;  /* 记录Fathermacgroup数组的下标 */
        this.sum = sum;  /* 记录相同father_mac数据的数量 */
        this.offset_count = 0;  /* 分布排序过程中进行计数，位于两侧的offset_count要相同 */
      }

      /* 正态分布排序算法 */
      function sortAndSwap(arr) 
      {
        //升序排布
        var sortArr = arr.sort(function(a, b) {
          return a.sum - b.sum;
        });

        var temp_left = [];
        var temp_right = [];
        function normal_distribution_sort(arr)
        {
          for (var i = 0; i < arr.length; i++)
          {
            var eq = sortArr[i];
            if (i % 2 === 0)
            {
              //偶数下标放到右侧头部
              temp_left.push(eq);
            }
            else
            {
              //奇数放到左侧尾部
              temp_right.unshift(eq);
            }
            if (i > 1)
            {
              
              if (temp_left.length === temp_right.length && !total_sum_compare(temp_left, temp_right))
              {
                array_wrap(temp_left, temp_right);
              }
            }
          }
          return temp_left.concat(temp_right);
        }
      
        function total_sum(arr)
        {
          var sum = 0;
          for (var i = 0; i < arr.length; i++)
          {
            sum += arr[i].sum;
          }
          return sum;
        }
      
        function total_sum_compare(arr1, arr2)
        {
          return total_sum(arr1) >= total_sum(arr2);
        }
      
        function array_wrap(l, r)
        {
          var m = r.shift();
          r.unshift(l.pop());
          l.push(m);
        }
      
        return normal_distribution_sort(arr);
      }

      var resultArray = [];

      /* 默认跳过controller的根层级（controller没有father_mac会影响后续执行流程），所以这里通过filter加入根层级数据 */
      var controllerData = structArray.filter(function(item) {
        return item.iscontroller == 1;
      });
      for(var i = 0; i < controllerData.length; i++)
        controllerData[i].treegroup = 0;
      resultArray = resultArray.concat(controllerData);

      /* treelevel分组得出层级二维数组 */
      var Levelgroup = groupStructByTreeLevel(structArray);
      for (var i = 1; i < Levelgroup.length; i++)
      {
        /* 对根层级外的每个层级，将相同father_mac归类，得出同层级同father_mac二维数组 */
        var Fathermacgroup = groupStructByFathermac(Levelgroup[i]);

        /* 统计出每个层级下相同father_mac数量和它们所在二维数组下标，存于结构体中num和set中，形成一个结构体数组 */
        var GroupRecordArray = [];
        for(var j = 0; j < Fathermacgroup.length; j++)
        {
          var obj = new GroupRecord(j, Fathermacgroup[j].length);
          GroupRecordArray.push(obj);
        }
        /* 对上面的结构体数组进行正态分布排序 */
        GroupRecordArray = sortAndSwap(GroupRecordArray);
        /* 遍历正态分布结构体数组，根据结构体的set索引回原二维数组 */
        for(var j = 0; j < GroupRecordArray.length; j++)
        {
          var tmpset = GroupRecordArray[j].set;
          /* 为每个数据结构提供treegroup */
          for(var k = 0; k < Fathermacgroup[tmpset].length; k++)
          {
            Fathermacgroup[tmpset][k].treegroup = j;
            Fathermacgroup[tmpset][k].maxtreegroup = GroupRecordArray.length;
          }
          /* 将目标添加入结果，满足正态分布排序的大需求 */
          resultArray = resultArray.concat(Fathermacgroup[tmpset]);
        }
      }
      
      return resultArray;
    }

    /* 计算每个节点的层级 */
    function calculateNodeLevel(nodes, father_mac)
    {
      for (var i = 0; i < nodes.length; i++)
      {
        if (nodes[i].macAddr.toLowerCase() == father_mac.toLowerCase())
        {
          if(nodes[i].iscontroller == 1)
          {
            return 0;
          }
          else
          {
            var nextNodeLevel = calculateNodeLevel(nodes, nodes[i].father_mac);
            if(nextNodeLevel == -1)
              return -1;
            else
              return nextNodeLevel + 1;
          }
        }
      }

      return -1; // cannot find the parent node
    }

    var levelmatrix = [];
    function addNodeLevel(jsonArray)
    {
      for (var i = 0; i < jsonArray.length; i++)
      {
        var treelevel = 0;
        if(jsonArray[i].iscontroller == 1)
        {
          treelevel = 0;
        }
        else
        {
          var nextNodeLevel = calculateNodeLevel(jsonArray, jsonArray[i].father_mac);
          if(nextNodeLevel == -1)
            treelevel = -1;
          else
            treelevel = nextNodeLevel + 1;
        }
        jsonArray[i].treelevel = treelevel;
        if(!levelmatrix[treelevel])
        {
          levelmatrix[treelevel]=new Array();
          levelmatrix[treelevel].push(i);
        }
        else
        {
          levelmatrix[treelevel].push(i);
        }
      }
      return jsonArray;
    }

    var StaMap = new Map();
    var StaIdMap = new Map();
    //获取mac和id的映射
    function createStaMap()
    {
      var sta_id = 1;

      for(var i=0; i < staInfo.length; i++)
      {
        if(staInfo[i].macAddr != "")
        {
          if (!StaMap.has(staInfo[i].macAddr.toLowerCase()))
          {
            if(staInfo[i].iscontroller == 0)
            {
              StaMap.set(staInfo[i].macAddr.toLowerCase(), 'sta_'+sta_id);
              var StaIdItem = new addStaIdItem(staInfo[i]);
              StaIdMap.set('sta_'+sta_id, StaIdItem);
              sta_id++;
            }
            else
            {
              StaMap.set(staInfo[i].macAddr.toLowerCase(), 'controller');
            }
          }
        }
      }
    }

    function getNodesIcon(Info)
    {
      var icon_path = "";
      if(Info.device_type == "OTHER")
        icon_path='/image/MeshTopology_TRUESTANDARD_OTHER.png';
      else if(Info.device_type == "MESH")
        icon_path='/image/MeshTopology_TRUESTANDARD_AP.png';
      else if(Info.device_type == "AP")
        icon_path='/image/MeshTopology_TRUESTANDARD_AP.png';
      else if(Info.device_type == "PHONE")
        icon_path='/image/MeshTopology_TRUESTANDARD_PHONE.png';
      else if(Info.device_type == "PAD")
        icon_path='/image/MeshTopology_TRUESTANDARD_OTHER.png';
      else if(Info.device_type == "IPTV")
        icon_path='/image/MeshTopology_TRUESTANDARD_TV.png';
      else if(Info.device_type == "CAMERA")
        icon_path='/image/MeshTopology_TRUESTANDARD_CAMERA.png';
      else if(Info.device_type == "PC")
        icon_path='/image/MeshTopology_TRUESTANDARD_PC.png';
      else if(Info.device_type == "TRUEIOT")
        icon_path='/image/MeshTopology_TRUESTANDARD_TRUEIOT.png';
      else
        icon_path='/image/MeshTopology_TRUESTANDARD_OTHER.png';
      return icon_path;
    }

    function getStaNodes(nodes,Info)
    {
      if(Info.iscontroller == 0)
      {
        //非controller如果不符合条件则忽略节点
        if(Info.father_mac != "" && Info.linkSpeed != 0)
        {
          var str = "{id:'"+StaMap.get(Info.macAddr.toLowerCase());
          str += ("', image:'"+getNodesIcon(Info));
          if(Info.access_type.indexOf("Ethernet") > 0)
          {
            str += ("', MAC:'"+Info.macAddr.toLowerCase());
            str += ("', HostName:'"+Info.hostName);
            str += ("', label:'"+StaIdMap.get(StaMap.get(Info.macAddr.toLowerCase())).HostName);
            str += ("', Type:'"+Info.connect_type);
            str += ("', Link_Speed:'"+Info.linkSpeed+'Mbps');
            str += ("', Port:'"+Info.port);
            if(Info.ipAddr == "")
              str += "', IP_address:'static";
            else
              str += ("', IP_address:'"+Info.ipAddr);
            str += ("', Connect_Type:'"+Info.connect_type);
            if(Info.ConnectTime == "" || Info.ConnectTime == "static")
              str += "', ConnectTime:'static";
            else
              str += ("', ConnectTime:'"+get_onlinetime(gmtTime, Info.ConnectTime.replace(/T/g, " ")));
          }
          else
          {
            str += ("', MAC:'"+Info.macAddr.toLowerCase());
            str += ("', HostName:'"+Info.hostName);
            str += ("', label:'"+StaIdMap.get(StaMap.get(Info.macAddr.toLowerCase())).HostName);
            str += ("', Type:'"+Info.connect_type);
            str += ("', RSSI:'"+Info.RSSI+'dBm');
            str += ("', phymode:'"+Info.phyMode);
            str += ("', Link_Speed:'"+Info.linkSpeed+'Mbps');
            str += ("', Security:'"+Info.security);
            str += ("', Port:'"+Info.port);
            if(Info.ipAddr == "")
              str += "', IP_address:'static";
            else
              str += ("', IP_address:'"+Info.ipAddr);
            str += ("', Connect_Type:'"+Info.connect_type);
            if(Info.ConnectTime == "" || Info.ConnectTime == "static")
              str += "', ConnectTime:'static";
            else
              str += ("', ConnectTime:'"+get_onlinetime(gmtTime, Info.ConnectTime.replace(/T/g, " ")));
          }
          if(Info.isMeshDevice == 1)
          {
            str += "', Device_Type:'agent";
          }
          else
          {
            str += "', Device_Type:'sta";
          }
          str += "',size: 30}";
          nodes.add(eval("(" + str + ")"));
        }
      }
      else
      {
        var str = "{id:'"+StaMap.get(Info.macAddr.toLowerCase());
        str += "', image:'/image/MeshTopology_TRUESTANDARD_CONTROLLER.png";
        str += ("', HostName:'"+Info.hostName);
        str += ("', currentSWVersion:'"+Info.currentSWVersion);
        str += ("', MAC:'"+Info.macAddr.toLowerCase());
        str += ("', IP_address:'"+Info.ipAddr);
        str += ("', SSID_2G:'"+Info.SSID_2G);
        str += ("', BSSID_2G:'"+Info.BSSID_2G.toLowerCase());
        str += ("', SSID_5G:'"+Info.SSID_5G);
        str += ("', BSSID_5G:'"+Info.BSSID_5G.toLowerCase());
        str += "', Device_Type:'controller";
        str += "',size: 30}";
        nodes.add(eval("(" + str + ")"));
      }
    }

    function getEdgesRelationships(edges, Info)
    {
      //非controller才有边关系
      if(Info.iscontroller == 0)
      {
        var str = "{ from: '" + StaMap.get(Info.macAddr.toLowerCase()) + "', to: '" + StaMap.get(Info.father_mac.toLowerCase()) + "' }";
        edges.add(eval("(" + str + ")"));
      }
    }

    function createVisArray(nodes, edges)
    {
      // 创建一个空的nodes和edges数组
      var MeshEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
      var local_device_mac = "<% tcWebApi_get("sysinfo_memory","env_mac","s") %>";
      if(local_device_mac == "" || local_device_mac == "N/A")
        local_device_mac = "<% tcWebApi_get("Info_Ether","mac","s") %>";

      for(var i=0; i < staInfo.length; i++)
      {
        if(MeshEnable == "1")
        {
          if((staInfo[i].iscontroller == 1) || (staInfo[i].macAddr != "" && staInfo[i].father_mac != "" && staInfo[i].linkSpeed != 0))
          {
            getStaNodes(nodes, staInfo[i]);
            getEdgesRelationships(edges, staInfo[i]);
          }
        }
        else
        {
          //关闭mesh时立刻隐藏Mesh设备,以及father mac不是当前设备的设备
          if((staInfo[i].iscontroller == 1) || (staInfo[i].macAddr != "" && staInfo[i].father_mac != ""  && staInfo[i].father_mac.toLowerCase() == local_device_mac.toLowerCase() && staInfo[i].isMeshDevice != 1))
          {
            getStaNodes(nodes, staInfo[i]);
            getEdgesRelationships(edges, staInfo[i]);
          }
        }
      }
    }

    //Using the new icons and Straight line to draw a tree-shape topology from top to bottom.(rssi will be displayed as an icon)
    var levelgroupmatrix = [];
    function disp_topology_vis_type3()
    {
      staInfo = addNodeLevel(staInfo);
      staInfo = groupStructByLevelFathermac(staInfo);

      console.log(staInfo);

      var div = document.getElementById("display_tree_vis");
      div.style.display = "";
      var topoErrMsg = document.getElementById("topoErrMsgDiv");
      topoErrMsg.innerHTML = "";

      createStaMap();

      var toponodes = new vis.DataSet();
      var topoedges = new vis.DataSet();
      createVisArray(toponodes, topoedges);

      var agentListInfo = getAgentListInfo();
      console.log(toponodes);
      console.log(topoedges);
      console.log(StaIdMap);

      var data = {
        nodes: toponodes,
        edges: topoedges
      }

      var options = {};

      options.interaction = {
        dragNodes: false,             //如果为true，则可以拖动未被固定的节点
        dragView: true,               //如果为true，则可以拖动视图
        selectConnectedEdges: false,  //如果为true，则在选中节点时，与其连接的边将高亮显示
        hover: true,                  //如果是true，启用悬停，当鼠标移到节点上时触发悬停事件
        hoverConnectedEdges: false,   //如果为true，则当鼠标悬停在节点上时，与其连接的边将高亮显示
        zoomView: true                //如果为true，则允许缩放视图
      }

      options.nodes = {
        shape: 'image'
      }

      options.edges = {
          hidden:true
      }

      options.layout = {
        //根据边的“to”和“from”数据计算层级。A->B，因此B低于A的层级，按照down-up方式进行排列
        hierarchical: {
          enabled: true,
          direction: 'DU',        // UD, DU, LR, RL
          /*
          sortMethod:
          The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
          Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
          Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.
          */
          sortMethod : 'directed',
          nodeSpacing: 200,
          levelSeparation: 200
        }
      }

      // create a network
      var network = new vis.Network(div, data, options);
      network.setSize('800px','600px');

      //绘制从node1到node2的线段
      function draw_Broken_line(ctx,postitions1,postitions2,postitions1_id,postitions2_id,type)
      {
        //线段上缩距
        var up_reduction = 55;
        //线段下缩距
        var down_reduction = 32;
        //线段拐角偏移量
        var angle_offset = -5;
        //开始绘制rssi图标的位置
        var angle_img_start = 25;
        var straight_img_start = 0;
        //rssi图标的大小
        var img_width = 40 * ctx.getTransform().a;
        var img_height = 40 * ctx.getTransform().d;

        if(img_width > 40)
          img_width = 40;
        else if(img_width < 35)
          img_width = 35;
        if(img_height > 40)
          img_height = 40;
        else if(img_height < 35)
          img_height = 35;

        if(type == 1)
        {
          straight_img_start = -25;
          angle_offset = -50;
          up_reduction = 28;
          down_reduction = 32;
        }

        if(postitions1_id != "controller" && StaIdMap.get(postitions1_id).BreakFlag >= 1)
        {
          up_reduction += 14;
        }

        var maxlevelgroup = StaIdMap.get(postitions2_id).maxtreegroup;
        var treegroup = StaIdMap.get(postitions2_id).treegroup;
        var halfmaxlevelgroup = maxlevelgroup / 2;
        if(maxlevelgroup == 1)
        {
          angle_offset -= (halfmaxlevelgroup - treegroup) * 15;
          angle_img_start += (halfmaxlevelgroup - treegroup) * 15;
        }
        else if (maxlevelgroup == 2)
        {
          if ( treegroup < halfmaxlevelgroup)
          {
            angle_offset -= (halfmaxlevelgroup - treegroup) * 15;
            angle_img_start += (halfmaxlevelgroup - treegroup) * 15;
          }
          else
          {
            angle_offset -= (treegroup - halfmaxlevelgroup) * 15;
            angle_img_start += (treegroup - halfmaxlevelgroup) * 15;
          }
        }
        else if (maxlevelgroup == 3)
        {
          if ( treegroup < halfmaxlevelgroup - 1)
          {
            angle_offset -= (halfmaxlevelgroup - treegroup) * 10;
            angle_img_start += (halfmaxlevelgroup - treegroup) * 10;
          }
          else
          {
            angle_offset -= (treegroup - halfmaxlevelgroup) * 10;
            angle_img_start += (treegroup - halfmaxlevelgroup) * 10;
          }
        }
        else if (maxlevelgroup == 4)
        {
          if ( treegroup < halfmaxlevelgroup - 1)
          {
            angle_offset -= (halfmaxlevelgroup - treegroup) * 10;
            angle_img_start += (halfmaxlevelgroup - treegroup) * 10;
          }
          else
          {
            angle_offset -= (treegroup - halfmaxlevelgroup) * 10;
            angle_img_start += (treegroup - halfmaxlevelgroup) * 10;
          }
        }

        ctx.strokeStyle = '#5D646E'; // 设置线条颜色
        ctx.lineWidth = 2; // 设置线条宽度为2像素
        ctx.beginPath();
        if(postitions1.x == postitions2.x)
        {
          //如果x轴相同，则绘制直线线段
          ctx.moveTo(postitions1.x, postitions1.y + up_reduction);
          ctx.lineTo(postitions2.x, (postitions2.y + postitions1.y) /2 + straight_img_start);
          ctx.drawImage(StaIdMap.get(postitions2_id).RssiIcon, postitions2.x - img_height/2, (postitions2.y + postitions1.y)/2 + straight_img_start, img_width, img_height);
          ctx.moveTo(postitions2.x, (postitions2.y + postitions1.y)/2 + img_height + straight_img_start);
          ctx.lineTo(postitions2.x, postitions2.y - down_reduction);
        }
        else 
        {
          //x轴不相同时，绘制折线段
          ctx.moveTo(postitions1.x, postitions1.y + up_reduction);
          ctx.lineTo(postitions1.x, (postitions1.y+postitions2.y)/2 + angle_offset);
          ctx.moveTo(postitions1.x, (postitions1.y+postitions2.y)/2 + angle_offset);
          ctx.lineTo(postitions2.x, (postitions1.y+postitions2.y)/2 + angle_offset);
          ctx.moveTo(postitions2.x, (postitions1.y+postitions2.y)/2 + angle_offset);
          ctx.lineTo(postitions2.x, (postitions1.y+postitions2.y)/2 + angle_img_start + angle_offset);
          ctx.drawImage(StaIdMap.get(postitions2_id).RssiIcon, postitions2.x - img_height/2, (postitions1.y+postitions2.y)/2 + angle_img_start + angle_offset, img_width, img_height);
          ctx.moveTo(postitions2.x, (postitions1.y+postitions2.y)/2 + angle_img_start + img_height + angle_offset);
          ctx.lineTo(postitions2.x, postitions2.y - down_reduction);
        }
        ctx.closePath();
        ctx.stroke();
      }

      network.on('afterDrawing', function()
      {
        // 绘制线条
        var nodeIds = data.nodes.map(function(node) {
          return node.id;
        });
        var positions = network.getPositions(nodeIds);
        
        var canvasElement = network.canvas.frame.canvas;
        var ctx = canvasElement.getContext('2d');

        data.edges.forEach(function (edge) {
          var fromNode = edge.from;
          var toNode = edge.to;
          //不同的连接线段需要作出相应的数值调整
          if(fromNode.indexOf("sta") != -1 && toNode.indexOf("controller") != -1)
            draw_Broken_line(ctx,positions[toNode],positions[fromNode],toNode,fromNode,1);
          else
            draw_Broken_line(ctx,positions[toNode],positions[fromNode],toNode,fromNode,0);
        });
      });

      function mousePosition(e){
        if(e.pageX || pageY){  //ff,chrome等浏览器
          return{x:e.pageX ,y:e.pageY};
        }else{
          return{  //ie浏览器
            x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
            y:ev.clientY + document.body.scrollTop - document.body.clientTop
          };
        }
      }

      function getTopoNode(item_id) 
      {
        if (data.nodes._data[item_id] != undefined)
        {
            return data.nodes._data[item_id];
        }
      }

      //https://ame.cool/pages/2a4abd/
      //鼠标悬停在节点时显示
      network.on('hoverNode',function(properties)
      {
        var nodeInfo = getTopoNode(properties.node);
        if(nodeInfo['Device_Type'] == "sta")
        {
          if(nodeInfo['Connect_Type'] == "Wired")
          {
            //eth station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP_address'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link_Speed'] + "</li>"
            +"<li>Port: "+ nodeInfo['Port'] + "</li>"
            +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
            +"</ul>";
          }
          else
          {
            //wifi station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP_address'] + "</li>"
            +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
            +"<li>802.11 mode: "+ nodeInfo['phymode'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link_Speed'] + "</li>"
            +"<li>Security: "+ nodeInfo['Security'] + "</li>"
            +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
            +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
            +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo['Device_Type'] == "agent")
        {
          if(nodeInfo['Connect_Type'] == "Wired")
          {
            //Medium: Ethernet
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP_address'] + "</span></li>"
              +"<li>Link Speed: "+ nodeInfo['Link_Speed'] + "</li>"
              +"<li>Port: "+ nodeInfo['Port'] + "</li>"
              +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
              +"</ul>";
          }
          else
          {
            //Medium: Wifi
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP_address'] + "</span></li>"
              +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
              +"<li>Link Speed: "+ nodeInfo['Link_Speed'] + "</li>"
              +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
              +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
              +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          //火狐浏览器不支持window.event，通过arguments[0].event获取事件
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo['Device_Type'] == "controller")
        {
          var $ul = "<ul>"
            +"<li>SW Version: "+ nodeInfo['currentSWVersion'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP_address'] + "</span></li>"
            +"<li>2.4G SSID: " + nodeInfo['SSID_2G'] + "</li>"
            +"<li>2.4G BSSID: " + nodeInfo['BSSID_2G'] + "</li>"
            +"<li>5G SSID: " + nodeInfo['SSID_5G'] + "</li>"
            +"<li>5G BSSID: " + nodeInfo['BSSID_5G'] + "</li>"
            +"</ul>";

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          var e = window.event || arguments[0].event;
          $('#staInfoHoverNode').css({
              'display': 'block',
              'z-index': 1,
              'left': mousePosition(e).x + 1,
              'top' : mousePosition(e).y + 1
          });
        }
      });
      
      //鼠标离开节点时隐藏
      network.on('blurNode',function(){
        $("#staInfoHoverNode").hide();
        $("#staInfoHoverNode").empty();
      });
    }

    //Using the new icons and curves to draw a tree-shape topology from top to bottom.
    function disp_topology_vis_type2()
    {
      var currentTime = new Date();
      var options = { timeZone: 'Asia/Bangkok' };
      var gmtTime = currentTime.toLocaleString('en-US', options);

      var div = document.getElementById("display_tree_vis");
      div.style.display = "";
      //document.getElementById("refresh_disp_tree_vis_btn").style.display = "";
      var topoErrMsg = document.getElementById("topoErrMsgDiv");
      topoErrMsg.innerHTML = "";

      //构造用于绘图的字符串
      var str = "";

      var local_device_mac = "<% tcWebApi_get("Info_Ether","mac","s") %>";
      var MeshEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";

      for(var i=0; i < staInfo.length; i++)
      {
        if(staInfo[i].iscontroller == 0)
        {
          if(MeshEnable == "1")
          {
            if(staInfo[i].macAddr != "" && staInfo[i].father_mac != "" && staInfo[i].linkSpeed != 0)
            {
              str += '"' + staInfo[i].macAddr.toLowerCase() + '"' + '->' + '"' + staInfo[i].father_mac.toLowerCase() + '"' + " ";
            }
          }
          else
          {
            //关闭mesh时，只显示直接连接到当前网关设备的非mesh设备，即立刻隐藏无关设备
            if(staInfo[i].macAddr != "" && staInfo[i].father_mac.toLowerCase() == local_device_mac.toLowerCase() && staInfo[i].isMeshDevice != 1)
            {
              str += '"' + staInfo[i].macAddr.toLowerCase() + '"' + '->' + '"' + staInfo[i].father_mac.toLowerCase() + '"' + " ";
            }
          }
        }
      }

      //进行拓扑关系绘制
      var NewDOTstring = "dinetwork{"+str+"}";
      console.log(NewDOTstring);
      var agentListInfo = getAgentListInfo();
      var parsedData = vis.network.convertDot(NewDOTstring);
      for(var count=0;count<parsedData.edges.length;count++)
      {
        parsedData.edges[count].arrows = "";
      }
      for(var count=0;count<parsedData.nodes.length;count++)
      {
        //console.log("NODE LABEL = ", parsedData.nodes[count].label);
        for(var i=0; i < staInfo.length; i++)
        {
          var MACToLower = staInfo[i].macAddr.toLowerCase();

          const macRegex = /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/g;
          var labelstr = parsedData.nodes[count].label;
          var br0macAddress = labelstr.match(macRegex)[0];
          if(br0macAddress == MACToLower)
          {
            /* controller */
            if(staInfo[i].iscontroller == 1)
            {
              parsedData.nodes[count].image='/image/MeshTopology_CONTROL.png';
              parsedData.nodes[count]['HostName'] = staInfo[i].hostName;
              parsedData.nodes[count]['currentSWVersion'] = staInfo[i].currentSWVersion;
              parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
              parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
              parsedData.nodes[count]['SSID_2G'] = staInfo[i].SSID_2G;
              parsedData.nodes[count]['BSSID_2G'] = staInfo[i].BSSID_2G.toLowerCase();
              parsedData.nodes[count]['SSID_5G'] = staInfo[i].SSID_5G;
              parsedData.nodes[count]['BSSID_5G'] = staInfo[i].BSSID_5G.toLowerCase();
              parsedData.nodes[count]['Device Type'] = "controller";
            }
            else
            {
              /* display icons according to device type */
              if(staInfo[i].device_type == "OTHER")
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }
              else if(staInfo[i].device_type == "MESH")
              {
                parsedData.nodes[count].image='/image/MeshTopology_AP.png';
              }
              else if(staInfo[i].device_type == "AP")
              {
                parsedData.nodes[count].image='/image/MeshTopology_AP.png';
              }
              else if(staInfo[i].device_type == "PHONE")
              {
                parsedData.nodes[count].image='/image/MeshTopology_PHONE.png';
              }
              else if(staInfo[i].device_type == "PAD")
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }
              else if(staInfo[i].device_type == "IPTV")
              {
                parsedData.nodes[count].image='/image/MeshTopology_IPTV.png';
              }
              else if(staInfo[i].device_type == "CAMERA")
              {
                parsedData.nodes[count].image='/image/MeshTopology_CAMERA.png';
              }
              else if(staInfo[i].device_type == "PC")
              {
                parsedData.nodes[count].image='/image/MeshTopology_PC.png';
              }
              else
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }

              /* display information according to access type */
              if(staInfo[i].access_type.indexOf("Ethernet") > 0)
              {
                parsedData.nodes[count]['HostName'] = staInfo[i].hostName;
                parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
                parsedData.nodes[count]['Type'] = staInfo[i].connect_type;
                parsedData.nodes[count]['Link Speed'] = staInfo[i].linkSpeed + "Mbps";
                parsedData.nodes[count]['Port'] = staInfo[i].port;
                parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
                parsedData.nodes[count]['Connect Type'] = staInfo[i].connect_type;
                if(staInfo[i].ConnectTime == "" || staInfo[i].ConnectTime == "static")
                  parsedData.nodes[count]['ConnectTime'] = "static";
                else
                  parsedData.nodes[count]['ConnectTime'] = get_onlinetime(gmtTime, staInfo[i].ConnectTime.replace(/T/g, " "));
              }
              else
              {
                parsedData.nodes[count]['HostName'] = staInfo[i].hostName;
                parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
                parsedData.nodes[count]['Type'] = staInfo[i].connect_type;
                parsedData.nodes[count]['RSSI'] = staInfo[i].RSSI + "dBm";
                parsedData.nodes[count]['802.11 mode'] = staInfo[i].phyMode;
                parsedData.nodes[count]['Link Speed'] = staInfo[i].linkSpeed + "Mbps";
                parsedData.nodes[count]['Security'] = staInfo[i].security;
                parsedData.nodes[count]['Port'] = staInfo[i].port;
                parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
                parsedData.nodes[count]['Connect Type'] = staInfo[i].connect_type;
                if(staInfo[i].ConnectTime == "" || staInfo[i].ConnectTime == "static")
                  parsedData.nodes[count]['ConnectTime'] = "static";
                else
                  parsedData.nodes[count]['ConnectTime'] = get_onlinetime(gmtTime, staInfo[i].ConnectTime.replace(/T/g, " "));
              }
              if(staInfo[i].isMeshDevice == 1)
              {
                parsedData.nodes[count]['Device Type'] = "agent";
              }
              else
              {
                parsedData.nodes[count]['Device Type'] = "sta";
              }
            }
            break;
          }
          else
          {
            parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
          }
        }
        parsedData.nodes[count].shape = "image";
        parsedData.nodes[count].label = "";
        //parsedData.nodes[count].label = parsedData.nodes[count]['HostName'];
      }
      
      var data = {
        nodes: parsedData.nodes,
        edges: parsedData.edges
      }
      var options = parsedData.options;
      options.interaction = {
        dragNodes: false,             //如果为true，则可以拖动未被固定的节点
        dragView: false,              //如果为true，则可以拖动视图
        selectConnectedEdges: false,  //如果为true，则在选中节点时，与其连接的边将高亮显示
        hover: true,                  //如果是true，启用悬停，当鼠标移到节点上时触发悬停事件
        hoverConnectedEdges: false,   //如果为true，则当鼠标悬停在节点上时，与其连接的边将高亮显示
        zoomView: false               //如果为true，则允许缩放视图
      }
      options.nodes = {
        shape: 'image'
      }
      options.edges = {
        smooth: {
          enabled: true,              //When true, the edge is drawn as a dynamic quadratic bezier curve
          type: "cubicBezier",
          forceDirection: "vertical", 
          roundness: 1
        },
        color: {
          color: '#5d646e',           //未选中或悬停在边上时的颜色
          //highlight: '#5d646e',     //选中边时的颜色
          hover: '#5d646e'            //鼠标悬停在边缘上时的颜色
        },
        hoverWidth: 0,                //鼠标悬停在边上时边的宽度
        selectionWidth: 0.5           //选择边时边的宽度
      }
      options.layout = {
        //根据边的“to”和“from”数据计算层级。A->B，因此B低于A的层级，按照down-up方式进行排列
        hierarchical: {
          enabled: true,
          direction: 'DU',        // UD, DU, LR, RL
          /*
          sortMethod:
          The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
          Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
          Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.
          */
          sortMethod : 'directed',
          nodeSpacing: 150,
          levelSeparation: 100
        }
      }
      
      // create a network
      var network = new vis.Network(div, data, options);
      network.setSize('780px','450px');

      function mousePosition(e){
        if(e.pageX || pageY){  //ff,chrome等浏览器
          return{x:e.pageX ,y:e.pageY};
        }else{
          return{  //ie浏览器
            x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
            y:ev.clientY + document.body.scrollTop - document.body.clientTop
          };
        }
      }

      function getTopoNode(option) {
        for (var i = 0;i < parsedData.nodes.length;i++){
            if (option == parsedData.nodes[i].id){
                return parsedData.nodes[i];
            }
        }
      }

      //https://ame.cool/pages/2a4abd/
      //鼠标悬停在节点时显示
      network.on('hoverNode',function(properties)
      {
        var nodeInfo = getTopoNode(properties.node);
        //console.log(nodeInfo);
        if(nodeInfo['Device Type'] == "sta")
        {
          if(nodeInfo['Connect Type'] == "Wired")
          {
            //eth station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP address'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
            +"<li>Port: "+ nodeInfo['Port'] + "</li>"
            +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
            +"</ul>";
          }
          else
          {
            //wifi station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP address'] + "</li>"
            +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
            +"<li>802.11 mode: "+ nodeInfo['802.11 mode'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
            +"<li>Security: "+ nodeInfo['Security'] + "</li>"
            +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
            +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
            +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo['Device Type'] == "agent")
        {
          if(nodeInfo['Connect Type'] == "Wired")
          {
            //Medium: Ethernet
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
              +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
              +"<li>Port: "+ nodeInfo['Port'] + "</li>"
              +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
              +"</ul>";
          }
          else
          {
            //Medium: Wifi
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
              +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
              +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
              +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
              +"<li>Online Time: "+ nodeInfo['ConnectTime'] + "</li>"
              +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          //火狐浏览器不支持window.event，通过arguments[0].event获取事件
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo['Device Type'] == "controller")
        {
          var $ul = "<ul>"
            +"<li>SW Version: "+ nodeInfo['currentSWVersion'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
            +"<li>2.4G SSID: " + nodeInfo['SSID_2G'] + "</li>"
            +"<li>2.4G BSSID: " + nodeInfo['BSSID_2G'] + "</li>"
            +"<li>5G SSID: " + nodeInfo['SSID_5G'] + "</li>"
            +"<li>5G BSSID: " + nodeInfo['BSSID_5G'] + "</li>"
            +"</ul>";

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          var e = window.event || arguments[0].event;
          $('#staInfoHoverNode').css({
              'display': 'block',
              'z-index': 1,
              'left': mousePosition(e).x + 1,
              'top' : mousePosition(e).y + 1
          });
        }
      });
      
      //鼠标离开节点时隐藏
      network.on('blurNode',function(){
        $("#staInfoHoverNode").hide();
        $("#staInfoHoverNode").empty();
      });

      /*
      //开始拖动节点时隐藏弹窗
      network.on('dragStart',function(properties){
        //var clickNodeInfo = getTopoNode(properties.nodes[0]);
        $("#staInfoHoverNode").hide();
        $("#staInfoHoverNode").empty();
      });
      */
    }

    //Irregular Mesh Topology provided by the original manufacturer.
    function disp_topology_vis_type1(tree_info)
    {
      var div = document.getElementById("display_tree_vis");
      div.style.display = "";
      //document.getElementById("refresh_disp_tree_vis_btn").style.display = "";
      var topoErrMsg = document.getElementById("topoErrMsgDiv");
      topoErrMsg.innerHTML = "";
      var str = "";

      //构造用于绘图的字符串
      var numStaPerDev = 0;
      for(var nIdx=0; nIdx < tree_info.length; nIdx++)
      {
        if (tree_info[nIdx]['devRole'] == "Agent")
        {
          var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
          if(upLinkNodeStr != "")
          {
            str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
            for(var i=0; i < staInfo.length; i++)
            {
              var staMACToLower = staInfo[i].macAddr.toLowerCase();
              if(staMACToLower == tree_info[nIdx]['alMac'])
              {
                staInfo[i].RSSI = tree_info[nIdx]['UplinkRSSI'];
                break;
              }
            }
          }
          else
          {
            console.log("INFO: AGENT WITH NO UP-LINK MAC = ",tree_info[nIdx]['alMac']);
            topoErrMsg.innerHTML += "<br />ERROR: Agent with AL-MAC " + tree_info[nIdx]['alMac'] +" has no upstream 1905 device!";
            topoErrMsg.style.display = "";
          }
        }
        for(var ssid in tree_info[nIdx]['wifistaInfo'])
        {
          var staIdx;
          for(var staIdx=0; staIdx < tree_info[nIdx]['wifistaInfo'][ssid].length; staIdx++)
          {
            var mac1stOctet = parseInt(tree_info[nIdx]['wifistaInfo'][ssid][staIdx].substring(0,2),16);
            /*if(mac1stOctet & 0x02)
            {
                continue;
            }*/
            str += '"STA\nMAC - ' + tree_info[nIdx]['wifistaInfo'][ssid][staIdx] + '\nSSID - ' + ssid + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
            numStaPerDev += 1;
          }
        }
        
        for(var medium in tree_info[nIdx]['ethstaInfo'])
        {
          var ethstaIdx;
          for(var ethstaIdx=0; ethstaIdx < tree_info[nIdx]['ethstaInfo'][medium].length; ethstaIdx++)
          {
            var mac1stOctet = parseInt(tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx].substring(0,2),16);
            /*if(mac1stOctet & 0x02)
            {
                continue;
            }*/
            str += '"STA\nMAC - ' + tree_info[nIdx]['ethstaInfo'][medium][ethstaIdx] + '\nMedium - ' + medium + '"' + '->' + '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
            numStaPerDev += 1;
          }
        }
        
        if (numStaPerDev == 0 && tree_info.length == 1 &&
          (tree_info[nIdx]['devRole'] == "Controller" ||
          tree_info[nIdx]['devRole'] == "Agent"))
        {
          str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
        }
      }
      if(str == ""){
        for(var nIdx=0; nIdx < tree_info.length; nIdx++)
        {
          if (tree_info[nIdx]['devRole'] == "Controller")
          {
            str += '"' + tree_info[nIdx]['devRole'] + '\n' + 'AL_MAC' + ' - ' + tree_info[nIdx]['alMac'] + '"' + " ";
            break;
          }
        }
      }

      //进行拓扑关系绘制
      var NewDOTstring = "dinetwork{"+str+"}";
      var agentListInfo = getAgentListInfo();
      var parsedData = vis.network.convertDot(NewDOTstring);
      for(var count=0;count<parsedData.edges.length;count++)
      {
        parsedData.edges[count].arrows = "";
      }
      for(var count=0;count<parsedData.nodes.length;count++)
      {
        //console.log("NODE LABEL = ", parsedData.nodes[count].label);
        for(var i=0; i < staInfo.length; i++)
        {
          var MACToLower = staInfo[i].macAddr.toLowerCase();

          const macRegex = /([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})/g;
          var labelstr = parsedData.nodes[count].label;
          var br0macAddress;
          if(parsedData.nodes[count].label.startsWith('Agent') || parsedData.nodes[count].label.startsWith('Controller'))
          {
            br0macAddress = ra0_to_br0(labelstr.match(macRegex)[0]);
          }
          else
          {
            br0macAddress = labelstr.match(macRegex)[0];
          }

          if(br0macAddress == MACToLower)
          {
            /* controller */
            if(staInfo[i].iscontroller == 1)
            {
              parsedData.nodes[count].image='/image/MeshTopology_CONTROL.png';
              parsedData.nodes[count]['currentSWVersion'] = staInfo[i].currentSWVersion;
              parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
              parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
              parsedData.nodes[count]['SSID_2G'] = staInfo[i].SSID_2G;
              parsedData.nodes[count]['BSSID_2G'] = staInfo[i].BSSID_2G.toLowerCase();
              parsedData.nodes[count]['SSID_5G'] = staInfo[i].SSID_5G;
              parsedData.nodes[count]['BSSID_5G'] = staInfo[i].BSSID_5G.toLowerCase();
            }
            else
            {
              /* display icons according to device type */
              if(staInfo[i].device_type == "OTHER")
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }
              else if(staInfo[i].device_type == "MESH")
              {
                parsedData.nodes[count].image='/image/MeshTopology_AP.png';
              }
              else if(staInfo[i].device_type == "AP")
              {
                parsedData.nodes[count].image='/image/MeshTopology_AP.png';
              }
              else if(staInfo[i].device_type == "PHONE")
              {
                parsedData.nodes[count].image='/image/MeshTopology_PHONE.png';
              }
              else if(staInfo[i].device_type == "PAD")
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }
              else if(staInfo[i].device_type == "IPTV")
              {
                parsedData.nodes[count].image='/image/MeshTopology_IPTV.png';
              }
              else if(staInfo[i].device_type == "CAMERA")
              {
                parsedData.nodes[count].image='/image/MeshTopology_CAMERA.png';
              }
              else if(staInfo[i].device_type == "PC")
              {
                parsedData.nodes[count].image='/image/MeshTopology_PC.png';
              }
              else
              {
                parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
              }

              /* display information according to access type */
              if(staInfo[i].access_type.indexOf("Ethernet") > 0)
              {
                parsedData.nodes[count]['HostName'] = staInfo[i].hostName;
                parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
                parsedData.nodes[count]['Type'] = staInfo[i].connect_type;
                parsedData.nodes[count]['Link Speed'] = staInfo[i].linkSpeed + "Mbps";
                parsedData.nodes[count]['Port'] = staInfo[i].port;
                parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
              }
              else
              {
                parsedData.nodes[count]['HostName'] = staInfo[i].hostName;
                parsedData.nodes[count]['MAC'] = staInfo[i].macAddr;
                parsedData.nodes[count]['Type'] = staInfo[i].connect_type;
                parsedData.nodes[count]['RSSI'] = staInfo[i].RSSI + "dBm";
                parsedData.nodes[count]['802.11 mode'] = staInfo[i].phyMode;
                parsedData.nodes[count]['Link Speed'] = staInfo[i].linkSpeed + "Mbps";
                parsedData.nodes[count]['Security'] = staInfo[i].security;
                parsedData.nodes[count]['Port'] = staInfo[i].port;
                parsedData.nodes[count]['IP address'] = staInfo[i].ipAddr;
                parsedData.nodes[count]['Realtime bandwidth'] = staInfo[i].rxRate + "Mbps";
              }
            }
            break;
          }
          else
          {
            parsedData.nodes[count].image='/image/MeshTopology_OTHER.png';
          }
        }
        parsedData.nodes[count].shape = "image";
        parsedData.nodes[count].label = "";
      }
      
      var data = {
        nodes: parsedData.nodes,
        edges: parsedData.edges
      }
      var options = parsedData.options;
      options.interaction = {
        dragNodes: false,             //如果为true，则可以拖动未被固定的节点
        dragView: false,              //如果为true，则可以拖动视图
        selectConnectedEdges: false,  //如果为true，则在选中节点时，与其连接的边将高亮显示
        hover: true,                  //如果是true，启用悬停，当鼠标移到节点上时触发悬停事件
        hoverConnectedEdges: false,   //如果为true，则当鼠标悬停在节点上时，与其连接的边将高亮显示
        zoomView: false               //如果为true，则允许缩放视图
      }
      options.nodes = {
        shape: 'image'
      }
      options.edges = {
        smooth: {
          enabled: true,              //When true, the edge is drawn as a dynamic quadratic bezier curve
          type: "cubicBezier",
          forceDirection: "vertical", 
          roundness: 1
        },
        color: {
          color: '#5d646e',           //未选中或悬停在边上时的颜色
          //highlight: '#5d646e',     //选中边时的颜色
          hover: '#5d646e'            //鼠标悬停在边缘上时的颜色
        },
        hoverWidth: 0,                //鼠标悬停在边上时边的宽度
        selectionWidth: 0.5           //选择边时边的宽度
      }
      options.layout = {
        //根据边的“to”和“from”数据计算层级。A->B，因此B低于A的层级，按照down-up方式进行排列
        hierarchical: {
          enabled: true,
          direction: 'DU',        // UD, DU, LR, RL
          /*
          sortMethod:
          The algorithm used to ascertain the levels of the nodes based on the data. The possible options are: hubsize, directed.
          Hubsize takes the nodes with the most edges and puts them at the top. From that the rest of the hierarchy is evaluated.
          Directed adheres to the to and from data of the edges. A --> B so B is a level lower than A.
          */
          sortMethod : 'directed',
          nodeSpacing: 150,
          levelSeparation: 100
        }
      }
      
      // create a network
      var network = new vis.Network(div, data, options);
      network.setSize('780px','450px');

      function mousePosition(e){
        if(e.pageX || pageY){  //ff,chrome等浏览器
          return{x:e.pageX ,y:e.pageY};
        }else{
          return{  //ie浏览器
            x:ev.clientX + document.body.scrollLeft - document.body.clientLeft,
            y:ev.clientY + document.body.scrollTop - document.body.clientTop
          };
        }
      }

      function getTopoNode(option) {
        for (var i = 0;i < parsedData.nodes.length;i++){
            if (option == parsedData.nodes[i].id){
                return parsedData.nodes[i];
            }
        }
      }

      //https://ame.cool/pages/2a4abd/
      //鼠标悬停在节点时显示
      network.on('hoverNode',function(properties){
        var nodeInfo = getTopoNode(properties.node);
        //console.log(nodeInfo);
        if(nodeInfo.id.startsWith('STA') && nodeInfo.hasOwnProperty('MAC')){
          if(nodeInfo.id.indexOf('Medium - Ethernet') > 0){
            //eth station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP address'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
            +"<li>Port: "+ nodeInfo['Port'] + "</li>"
            +"</ul>";
          }else{
            //wifi station
            var $ul = "<ul>"
            +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>Type: " + nodeInfo['Type'] + "</li>"
            +"<li>IP address: "+ nodeInfo['IP address'] + "</li>"
            +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
            +"<li>802.11 mode: "+ nodeInfo['802.11 mode'] + "</li>"
            +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
            +"<li>Security: "+ nodeInfo['Security'] + "</li>"
            +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
            +"<li>Realtime bandwidth: "+ nodeInfo['Realtime bandwidth'] + "</li>"
            +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                //'left': properties.x + 650,
                //'top' : properties.y + 150
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo.id.startsWith('Agent') && nodeInfo.hasOwnProperty('Port')){
          if(nodeInfo['Type'].indexOf('Wired') >= 0){
            //Medium: Ethernet
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
              +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
              +"<li>Port: "+ nodeInfo['Port'] + "</li>"
              +"</ul>";
          }else{
            //Medium: Wifi
            var $ul = "<ul>"
              +"<li>HostName: "+ nodeInfo['HostName'] + "</li>"
              +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
              +"<li>Type: " + nodeInfo['Type'] + "</li>"
              +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
              +"<li>RSSI: "+ nodeInfo['RSSI'] + "</li>"
              +"<li>Link Speed: "+ nodeInfo['Link Speed'] + "</li>"
              +"<li>Frequency: "+ nodeInfo['Port'] + "</li>"
              +"</ul>";
          }

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          //火狐浏览器不支持window.event，通过arguments[0].event获取事件
          var e = window.event || arguments[0].event;
          if(mousePosition(e).x > 650){
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x - $("#staInfoHoverNode").width() - 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }else{
            $('#staInfoHoverNode').css({
                'display': 'block',
                'z-index': 1,
                'left': mousePosition(e).x + 1,
                'top' : mousePosition(e).y - $("#staInfoHoverNode").height() - 1
            });
          }
        }

        if(nodeInfo.id.startsWith('Controller')){
          var $ul = "<ul>"
            +"<li>SW Version: "+ nodeInfo['currentSWVersion'] + "</li>"
            +"<li>MAC: "+ nodeInfo['MAC'] + "</li>"
            +"<li>IP address: <span onclick='jumpToOther(this)'>"+ nodeInfo['IP address'] + "</span></li>"
            +"<li>2.4G SSID: " + nodeInfo['SSID_2G'] + "</li>"
            +"<li>2.4G BSSID: " + nodeInfo['BSSID_2G'] + "</li>"
            +"<li>5G SSID: " + nodeInfo['SSID_5G'] + "</li>"
            +"<li>5G BSSID: " + nodeInfo['BSSID_5G'] + "</li>"
            +"</ul>";

          $("#staInfoHoverNode").empty();
          $("#staInfoHoverNode").append($ul);

          var e = window.event || arguments[0].event;
          $('#staInfoHoverNode').css({
              'display': 'block',
              'z-index': 1,
              'left': mousePosition(e).x + 1,
              'top' : mousePosition(e).y + 1
          });
        }
      });
      
      //鼠标离开节点时隐藏
      network.on('blurNode',function(){
        $("#staInfoHoverNode").hide();
        $("#staInfoHoverNode").empty();
      });

      /*
      //开始拖动节点时隐藏弹窗
      network.on('dragStart',function(properties){
        //var clickNodeInfo = getTopoNode(properties.nodes[0]);
        $("#staInfoHoverNode").hide();
        $("#staInfoHoverNode").empty();
      });
      */
    }

    function jumpToOther(obj) {
      window.open("http://" + obj.innerText);
    }
    
    function toggle_disp_agent_table(btn)
    {
      var div = document.getElementById("display_all_agent_info_div");
      var btn_str = btn.innerHTML;
      if(btn_str.startsWith('Show'))
      {
        btn.innerHTML = 'Hide All Mesh AP Basic Info';
        div.style.display = "";
        if(div.children.length == 0)
        {
          div.innerHTML = "";
          var b = document.createElement("label");
          b.setAttribute("class", "text-content");
          var s = document.createElement("STRONG");
          var t = document.createTextNode("Run-time topology information has not been received yet! Please wait.");
          s.appendChild(t);
          b.appendChild(s);
          div.appendChild(b);
        }
      }
      else
      {
        btn.innerHTML = 'Show All Mesh AP Basic Info';
        div.style.display = "none";
      }
    }

    function toggle_disp_dev_table(btn)
    {
      var div = document.getElementById("display_all_1905_dev_info_div");
      var btn_str = btn.innerHTML;
      if(btn_str.startsWith('Show'))
      {
        document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = 'Hide All Device Detailed Info';
        
        document.getElementById("toggle_all_1905_dev_info_btn_hide").style.display = "";
        if(div.children.length == 0)
        {
          div.innerHTML = "";
          var b = document.createElement("label");
          b.setAttribute("class", "text-content");
          var s = document.createElement("STRONG");
          var t = document.createTextNode("Run-time topology information has not been received yet! Please wait.");
          s.appendChild(t);
          b.appendChild(s);
          div.appendChild(b);
        }
        
        // 父框架监听iframe内容变化需要，div展示需要放到最后面
        div.style.display = "";
        setTimeout(function(){
          parent.refreshFrame();
        },20);
      }
      else
      {
        document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = 'Show All Device Detailed Info';
        document.getElementById("toggle_all_1905_dev_info_btn_hide").style.display = "none";

        // 父框架监听iframe内容变化需要，div展示需要放到最后面
        div.style.display = "none";
        setTimeout(function(){
          parent.refreshFrame();
        },20);
      }
    }
    
    function get_dev_role_string(devRole)
    {
      switch(parseInt(devRole))
      {
        case 1:
          return 'Controller';
        case 2:
          return 'Agent';
        default:
          return 'Not Configured';
      }
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
    function get_run_time_topology_submit()
    {
      location.href = '/cgi-bin/true-page/advance/new-advance-wlan-easymesh-runtime-topology.asp';
    }
    
    function get_run_time_topology_cb(rsp)
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
          document.getElementById("display_all_1905_dev_info_div").innerHTML = "";
          document.getElementById("display_all_agent_info_div").innerHTML = "";
          document.getElementById("display_tree_vis").innerHTML = "";
          draw_topology_table(jsTopoInfo);
        }
        else
        {
          console.log("Failed to get Topology Info!\nStatus: ",r.status);
        }
        //setTimeout(get_run_time_topology_submit, 15000);
      }
      catch(e)
      {
        console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
        //setTimeout(get_run_time_topology_submit, 15000);
      }
    }

    function true_get_run_time_topology()
    {
      document.getElementById("topoErrMsgDiv").style.display = "none";
      document.getElementById("display_all_1905_dev_info_div").style.display = "none";
      document.getElementById("display_all_agent_info_div").style.display = "none";
      document.getElementById("display_tree_vis").style.display = "none";
      //document.getElementById("refresh_disp_tree_vis_btn").style.display = "none";
      document.getElementById("toggle_disp_tree_vis_detail_btn").style.display = "none";
      document.getElementById("toggle_all_agent_info_btn").style.display = "none";
      document.getElementById("toggle_all_1905_dev_info_btn").style.display = "none";
      document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = 'Show All Device Detailed Info';
      document.getElementById('getTopoInfoMsgDiv').style.display = 'none';

      loadImages(function() {
        disp_topology_vis_type3();
      });

      //disp_topology_vis_type3();
    }

    function get_run_time_topology()
    {
      document.getElementById("topoErrMsgDiv").style.display = "none";
      document.getElementById("display_all_1905_dev_info_div").style.display = "none";
      document.getElementById("display_all_agent_info_div").style.display = "none";
      document.getElementById("display_tree_vis").style.display = "none";
      //document.getElementById("refresh_disp_tree_vis_btn").style.display = "none";
      document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = true;
      document.getElementById("toggle_all_agent_info_btn").disabled = true;
      document.getElementById("toggle_all_1905_dev_info_btn").disabled = true;
      document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = 'Show All Device Detailed Info';
      document.getElementById("getTopoInfoMsgDiv").style.display = "";

      var x_response = JSO_get_runtime_topology();
      document.getElementById('getTopoInfoMsgDiv').style.display = 'none';
      get_run_time_topology_cb(x_response);
      document.getElementById("toggle_disp_tree_vis_detail_btn").disabled = false;
      document.getElementById("toggle_all_agent_info_btn").disabled = false;
      document.getElementById("toggle_all_1905_dev_info_btn").disabled = false;
    }

    true_get_run_time_topology();
    //get_run_time_topology();

  </SCRIPT>
</body>
</html>
