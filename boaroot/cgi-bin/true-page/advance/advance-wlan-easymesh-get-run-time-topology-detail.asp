<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/lib/vis.js"></script>
  <!-- script -->
</head>

<body>
  <!-- content -->
  <div class="col-md-12 col-sm-12">
    <div class="container-full">
      <div id="display_tree_vis" style="width:100%;height:90%;display:none"></div>
      <div style="margin:0px 0px 50px 50px;">
        <select class="form-control input-select" style="width: 180px;" size="1" id="autoUpdateTime" onchange="autoUpdateTimeChange(this.value)">
          <option value="15000">Auto Update Every 15s</option>
          <option value="30000">Auto Update Every 30s</option>
          <option value="60000">Auto Update Every 60s</option>
      </select>
      </div>
    </div>
  </div>
  <!-- content -->

<SCRIPT language=JavaScript type=text/javascript>
  var autoUpdateTime = 15000;
  function autoUpdateTimeChange(value){
  location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-get-run-time-topology-detail.asp?autoRefresh='+value;
  }
  function getAutoUpdateTime(){
    var url = location.search;
    if (url.indexOf("?") != -1){
      var str = url.substr(1);
      strs = str.split("=");
        autoUpdateTime = strs[1];
        if(isNaN(autoUpdateTime)){
         autoUpdateTime = 15000;
         }
        if(autoUpdateTime < 3000){
            autoUpdateTime = 3000;
        }
      return;
    }
    autoUpdateTime = 15000;
    return;
  } 
  if(typeof String.prototype.startsWith != 'function')
  {
    String.prototype.startsWith = function(prefix)
    {
      return this.slice(0, prefix.length) == prefix;
    }
  }
  
  function JSO_get_runtime_topology()
  {
      var ret = "<% tcWebApi_MeshJsonHook("mesh_get_run_time_topology") %>";
      ret = ret.replace(/\'/g,'\\\\u0022');
      return ret;
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
      tree_info[tree_info_count] = prep_tree_info(obj_1905);
      tree_info_count++;
    }
    tree_info.sort(function(a, b){return a.hopCount - b.hopCount});
    disp_topology_vis(tree_info);
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
    var network = new vis.Network(div, data, options);
    network.setSize('100%','100%');
  }
  function get_run_time_topology_submit()
  {
    location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-get-run-time-topology-detail.asp?autoRefresh='+autoUpdateTime;
  }
  function get_run_time_topology_cb(rsp)
  {
    try
    {
      var r = JSON.parse(rsp);
      if(r.status == "SUCCESS")
      {
        var tmp_jsTopoInfo = r.luaTopologyInfo;
        tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\u0022/g, '"');
        tmp_jsTopoInfo = tmp_jsTopoInfo.replace(/\\\\u0022/g, '"');
        var jsTopoInfo = JSON.parse(tmp_jsTopoInfo);
        document.getElementById("display_tree_vis").innerHTML = "";
        draw_topology_table(jsTopoInfo);
      }
      else
      {
        console.log("Failed to get Topology Info!\nStatus: ",r.status);
      }
      setTimeout(get_run_time_topology_submit, autoUpdateTime);
    }
    catch(e)
    {
      console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
      setTimeout(get_run_time_topology_submit, autoUpdateTime);
    }
  }
  
  function checkLoadRuntimeTopology()
  {
      getAutoUpdateTime();
      if(autoUpdateTime == 15000){
        document.getElementById('autoUpdateTime').selectedIndex = 0;
      }else if(autoUpdateTime == 30000){
        document.getElementById('autoUpdateTime').selectedIndex = 1;
      }else if(autoUpdateTime == 60000){
        document.getElementById('autoUpdateTime').selectedIndex = 2;
      }
      document.getElementById("display_tree_vis").style.display = "none";
      var x_response = JSO_get_runtime_topology();
      get_run_time_topology_cb(x_response);
  }
  
  checkLoadRuntimeTopology();
  </SCRIPT>
</body>
</html>