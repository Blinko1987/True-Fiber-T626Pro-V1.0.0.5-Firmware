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
    <div class="title-text">Topology</div>
    <div class="title-description-text">This page displays the topology of EasyMesh network.</div>
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
    <div class="row p-1">
      <div class="col-10">
      </div>
      <div class="col-2">
        <button class="btn-file" type="button" id="refresh_disp_tree_vis_btn" onclick="RefreshPage()">Refresh</button>
      </div>
    </div>
    <div id="display_tree_vis" style="display:none"></div>
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
    function setAgentList(index,manufacturer,modelName,serialNum,manufacOui,ipAddr,macAddr,deviceRole,deviceName)
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
    }
    function getAgentListInfo()
    {
      var ncount = 32;
      var	nCurTemp = 0;		
      var	vcurLinks = new Array(ncount);
      var array1;
      var	list1 = new Array(ncount);
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
          vcurLinks[nCurTemp++] = new setAgentList(i, array1[0], array1[1], array1[2], array1[3], array1[4], array1[5], array1[6], array1[7]);
        }
        else
        {
          break;
        }
      }
      var	vObjRet = new Array(nCurTemp+1);
      for(var m=0; m<nCurTemp; m++)
      {
        vObjRet[m] = vcurLinks[m];
      }
      vObjRet[nCurTemp] = null;
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
          }else if(k == "Security")
          {
            v = get_auth_mode_str(v);
          }else if(k == "Encryption")
          {
            v = get_encryption_str(v);
          }else if(k == "WPAPSK"){
            v = "********";
          }else if(k == "SSID"){
            var ssid_2g = "<% tcWebApi_get("WLan_Entry0","SSID","s") %>";
            var ssid_5g = "<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>";
            if(ssid_2g == v || ssid_5g == v){
              v = "<" + "<label style=\"font-style:oblique;\">hidden for mesh</label>" + ">";
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
          }else if(k == "STA MAC address"){
            k = "STA MAC";
          }else if(k == "tx packet Errors"){
            k = "TX Packet Errors";
          }else if(k == "transmittedPackets"){
            k = "TX Packets";
          }else if(k == "rx packet Errors"){
            k = "RX Packet Errors";
          }else if(k == "Packets Received"){
            k = "RX Packets";
          }else if(k == "RSSI"){
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
          if(k == "Radio Info"){
            k="Radio";
          }else if(k == "BSSINFO"){
            k="BSS";
          }else if(k == "connected sta info"){
            k="STA Info";
          }else if(k == "backhaul link metrics"){
            k="Backhaul link metrics";
          }else if(k == "metrics"){
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
        for (i = 0; i < agentListInfo.length-1; i++)
        {
          if (tree_info[nIdx]['devRole'] == "Agent")
          {
            if(agentListInfo[i].macAddr.toUpperCase() == tree_info[nIdx]['alMac'].toUpperCase()){
              if(num % 2 == 0){
                tableHtmlOutput += '<tr class="table-content-fist center">';
              }else{
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
    function showAgentWeb(agentIp){
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
                if(bhsta == "No"){
                  node["wifistaInfo"][ssid].push(staMac);
                }
              }
              else
              {
                if(bhsta == "No"){
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
    
    function disp_topology_vis(tree_info)
    {
      var div = document.getElementById("display_tree_vis");
      div.style.display = "";
      document.getElementById("refresh_disp_tree_vis_btn").style.display = "";
      var topoErrMsg = document.getElementById("topoErrMsgDiv");
      topoErrMsg.innerHTML = "";
      var str = "";
      var numStaPerDev = 0;
      console.log("TREE INFO VIS = ",tree_info);
      for(var nIdx=0; nIdx < tree_info.length; nIdx++)
      {
        if (tree_info[nIdx]['devRole'] == "Agent")
        {
          var upLinkNodeStr = get_uplink_tree_info(tree_info, tree_info[nIdx]['UplinkAlMac']);
          if(upLinkNodeStr != "")
          {
            str += '"' + tree_info[nIdx]['devRole'] + '\n' + "AL_MAC" + ' - ' + tree_info[nIdx]['alMac'] + '"' + '->' + upLinkNodeStr + " ";
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
      console.log("TREE INFO str = ",str);
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

      var NewDOTstring = "dinetwork{"+str+"}";
      var parsedData = vis.network.convertDot(NewDOTstring);
      for(var count=0;count<parsedData.nodes.length;count++)
      {
          console.log("NODE LABEL = ",parsedData.nodes[count].label);
          if(parsedData.nodes[count].label.startsWith('Agent'))
          {
              parsedData.nodes[count].color='Orange';
          }
          else if(parsedData.nodes[count].label.startsWith('STA'))
          {
              parsedData.nodes[count].color='Green';
          }
          else
          {
              parsedData.nodes[count].shape='box';
          }
      }
      
      var data = {
          nodes: parsedData.nodes,
          edges: parsedData.edges
      }
      var options = parsedData.options;
      
      // create a network
      var network = new vis.Network(div, data, options);
      network.setSize('750px','300px');
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
      }
      else
      {
        document.getElementById("toggle_all_1905_dev_info_btn").innerHTML = 'Show All Device Detailed Info';
        document.getElementById("toggle_all_1905_dev_info_btn_hide").style.display = "none";

        // 父框架监听iframe内容变化需要，div展示需要放到最后面
        div.style.display = "none";
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
      location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-runtime-topology.asp';
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
    
    function get_run_time_topology()
    {
      document.getElementById("topoErrMsgDiv").style.display = "none";
      document.getElementById("display_all_1905_dev_info_div").style.display = "none";
      document.getElementById("display_all_agent_info_div").style.display = "none";
      document.getElementById("display_tree_vis").style.display = "none";
      document.getElementById("refresh_disp_tree_vis_btn").style.display = "none";
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
    get_run_time_topology();
  </SCRIPT>
</body>
</html>