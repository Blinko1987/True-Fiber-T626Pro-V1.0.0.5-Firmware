<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Mesh Info - Easy Mesh</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <SCRIPT language=JavaScript type=text/javascript>
    function get_mesh_info()
    {
      var ret = "<% tcWebApi_GetMeshStaList() %>";
      // var ret = "[{\"macAddr\":\"08:26:ae:3b:4e:21\",\"hostName\":\"08:26:ae:3b:4e:21\",\"port\":\"LAN2\",\"connect_type\":\"Wired\",\"RSSI\":0,\"rxRate\":0,\"txRate\":1000,\"SNR\":0,\"access_type\":\"Ethernet\",\"father_type\":\"RouterType\",\"ConnectTime\":\"\",\"father_mac\":\"64:20:E1:33:3E:B2\",\"device_type\":\"\",\"phyMode\":\"\",\"security\":\"\",\"ipAddr\":\"static\",\"linkSpeed\":1000},{\"macAddr\":\"fc:7a:58:cd:61:89\",\"hostName\":\"Agent\",\"port\":\"5G\",\"connect_type\":\"Wireless\",\"RSSI\":-22,\"rxRate\":1,\"txRate\":1201,\"SNR\":74,\"access_type\":\"5G\",\"father_type\":\"MeshType\",\"ConnectTime\":\"1970-01-01T00:01:59\",\"father_mac\":\"64:20:e1:33:3e:b2\",\"device_type\":\"MESH\",\"phyMode\":\"802.11ax\",\"security\":\"\",\"ipAddr\":\"192.168.1.33\",\"linkSpeed\":1201},{\"macAddr\":\"fc:7a:58:cd:61:88\",\"hostName\":\"Agent\",\"port\":\"5G\",\"connect_type\":\"Wired\",\"RSSI\":0,\"rxRate\":1,\"txRate\":1000,\"SNR\":74,\"access_type\":\"5G\",\"father_type\":\"MeshType\",\"ConnectTime\":\"1970-01-01T00:01:59\",\"father_mac\":\"64:20:e1:33:3e:b2\",\"device_type\":\"MESH\",\"phyMode\":\"802.11ax\",\"security\":\"\",\"ipAddr\":\"192.168.1.36\",\"linkSpeed\":1000}]"
      ret = ret.replace(/'/g, "\"");
      try
      {
        var r = JSON.parse(ret);
        return r;
      }
      catch(e)
      {
        console.log("Incorrect response! Failed to get Topology Info!",e.name,e.message);
      }
    }
    var mesh_info = get_mesh_info();
    function postReboot(btnID) {
      if(confirm("Are you sure to reboot the agent?") == false)
      {
        return false;
      }
      var index = btnID.split('_')[1];
      url = "/webapi/AgentReboot";
      $.ajax({
        url: url, 
        type: 'post',
        data:
        {
          "mac":mesh_info[index].macAddr + ';',
        },
        success: function(data){
          alert(data.msg);
          // console.log(data);
        },
        error:function()
        {
          console.log("Error!");
        }
      });
    }

    function showAgentWeb(agentIp)
    {
        if(confirm("Warning: You are going to leave the ONT web page and enter the Mesh AP's web page, please confirm."))
        {
            window.open("http://" + agentIp);
        }
    }
  </SCRIPT>
</head>

<body>
  <!-- content -->
  <div class="card-table-content">
    <div class="table-header">Mesh Networking Information</div>
    <table style="width:100%">
        <tr class="table-header center">
            <th style="width: 10%;" class="p-1">List</th>
            <th style="width: 15%;">MAC Address</th>
            <th style="width: 15%;">IP Address</th>
            <th style="width: 10%;">Type</th>
            <th style="width: 15%;">Link Rate(Mbps)</th>
            <th style="width: 10%;">RSSI</th>
            <th style="width: 10%;">Status</th>
            <th style="width: 10%;">Operation</th>
        </tr>
        <SCRIPT language=JavaScript type=text/javascript>
          var z=0;
          var status;
          var status_class;
          var controllerMAC="<% tcWebApi_get("Info_Ether","mac","s" ) %>";
          var controllerIP="<% tcWebApi_get("Info_Ether","ip","s" ) %>";
          var controllerName="<% tcWebApi_get("meshinfo_Entry0", "DeviceName", "s") %>";
          for(i = 0; i < mesh_info.length; i++)
          {
            var rowCss=z%2==0?"table-content-second":"table-content-fist";
            if(i == 0)
            {
              document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
              document.write('<TD>' + controllerName + '&nbsp;</TD>');
              document.write('<TD>' + controllerMAC + '&nbsp;</TD>');
              document.write('<TD>' + controllerIP + '&nbsp;</TD>');
              document.write('<TD>' + '--' + '&nbsp;</TD>');
              document.write('<TD>' + '--' + '&nbsp;</TD>');
              document.write('<TD>' + '--' + '&nbsp;</TD>');
              document.write('<TD>' + '--' + '&nbsp;</TD>');
              document.write('<TD>' + '--' + '&nbsp;</TD>');
              document.write('</TR>');
              z++;
            }
            if(mesh_info[i].device_type == "MESH")
            {
              document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
              document.write('<TD>' + mesh_info[i].hostName + '&nbsp;</TD>');
              document.write('<TD>' + mesh_info[i].macAddr + '&nbsp;</TD>');
              document.write('<TD><a href=\"#\" onclick=showAgentWeb(\''+ mesh_info[i].ipAddr +'\')>' + mesh_info[i].ipAddr + '&nbsp;</a></TD>');
              document.write('<TD>' + mesh_info[i].connect_type + '&nbsp;</TD>');
              if(mesh_info[i].connect_type == "Wireless")
              {
                if(mesh_info[i].RSSI >= -34)
                {
                  status = "Bad(Near)";
                  status_class = "mesh_status_near_bad";
                }
                else if(mesh_info[i].RSSI >= -54 && mesh_info[i].RSSI <= -35)
                {
                  status = "Poor(Near)";
                  status_class = "mesh_status_near_poor";
                }
                else if(mesh_info[i].RSSI >= -59 && mesh_info[i].RSSI <= -55)
                {
                  status = "Fair(Near)";
                  status_class = "mesh_status_near_fair";
                }
                else if(mesh_info[i].RSSI >= -70 && mesh_info[i].RSSI <= -60)
                {
                  status = "Good";
                  status_class = "mesh_status_good";
                }
                else if(mesh_info[i].RSSI >= -75 && mesh_info[i].RSSI <= -71)
                {
                  status = "Fair(Far)";
                  status_class = "mesh_status_far_fair";
                }
                else if(mesh_info[i].RSSI >= -85 && mesh_info[i].RSSI <= -76)
                {
                  status = "Poor(Far)";
                  status_class = "mesh_status_far_poor";
                }
                else if(mesh_info[i].RSSI <= -86)
                {
                  status = "Bad(Far)";
                  status_class = "mesh_status_far_bad";
                }
              }
              else
              {
                status = "Good";
                status_class = "mesh_status_good";
              }
              document.write('<TD>' + mesh_info[i].linkSpeed + '&nbsp;</TD>');
              document.write('<TD>' + mesh_info[i].RSSI + '&nbsp;</TD>');
              document.write('<TD class="' + status_class + '" style="color: black;font-weight: bold;">' + status + '&nbsp;</TD>');
              document.write('<TD><button type="button" id="btnReboot_'+ i +'" class="btn-reboot" onclick="postReboot(this.id)" name="btnReboot">Reboot</button></TD>');
              document.write('</TR>');
              z++;
            }
          }
        </SCRIPT>
    </table>
</div>
  <!-- content -->
</body>

</html>