<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Client Capabilities - Easy Mesh</title>
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
    <div id="cli_db_display" class="card-table" style="overflow-x: scroll;"></div>
  </div>
  <!-- content -->
  <script type="text/javascript">
		function JSO_get_client_capabilities()
		{
				var ret = "<% tcWebApi_MeshJsonHook("mesh_get_client_capabilities") %>";
				return ret;
		}
		
		function draw_cli_db_table(g_cli_db)
		{
		    var disp_cli_idx = 1;
		    var cli_db = g_cli_db['cli_db'];
		    var cdb_tbl = document.createElement("TABLE");
		    cdb_tbl.setAttribute("style", "width: 100%;");
		    var row, cell, th, th_txt;
		    row = cdb_tbl.insertRow(-1);
		    row.setAttribute("class", "table-header");
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("No.");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("MAC");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("BSSID");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Capability");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Phy Mode");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Max. BW 0");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Max. BW 1");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Spatial Streams");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Supported Bands");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    
		    th = document.createElement("TH");
		    th.setAttribute("class", "p-1 text-center border border-dark");
		    th_txt = document.createTextNode("Supported Channels");
		    th.appendChild(th_txt);
		    row.appendChild(th);
		    var num = 0;
		    for(var cli_idx = 0; cli_idx < parseInt(g_cli_db['num_clis']); cli_idx++)
		    {
		        if(cli_db[cli_idx]['BSSID'] == '00:00:00:00:00:00')
		        {
		            continue;
		        }
		        row = cdb_tbl.insertRow(-1);
		        if(num % 2 == 0){
							row.setAttribute("class", "table-content-fist center");
						}else{
							row.setAttribute("class", "table-content-second center");
						}
						num = num + 1 ;
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = disp_cli_idx++;
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['MAC'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['BSSID'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        var str=cli_db[cli_idx]['Capability'];
		        str=str.replace(/DOT11K_SUPPORTED/g, '11k');
		        str=str.replace(/DOT11V_SUPPORTED/g, '11v');
		        str=str.replace(/DOT11R_SUPPORTED/g, '11r');
		        cell.innerHTML = str;
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Phy Mode'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Max. Bandwidth 0'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Max. Bandwidth 1'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Spatial Stream'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Known Band'];
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.innerHTML = cli_db[cli_idx]['Known Channels'];
		    }
		    if(cdb_tbl.rows.length == 1)
		    {
		        row = cdb_tbl.insertRow(-1);
		        row.setAttribute("class", "table-content-fist center");
		        cell = row.insertCell(-1);
		        cell.setAttribute("class", "text-center border border-dark");
		        cell.colSpan = cdb_tbl.rows[0].cells.length;
		        cell.innerHTML = "Client DB is empty!";
		    }
		    document.getElementById("cli_db_display").appendChild(cdb_tbl);
		}
		
		function checkWebStatus()
		{
				location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-client-capabilities.asp';
		}
		
		function get_client_db_cb(rsp)
		{
		    try
		    {
		        var r = JSON.parse(rsp);
		        if(r.status == "SUCCESS")
		        {
		            document.getElementById("cli_db_display").innerHTML = "";
		            draw_cli_db_table(r);
		        }
		        else
		        {
		            console.log("Failed to get Client DB!\nStatus: ",r.status);
		        }
		        //setTimeout(checkWebStatus, 10000);
		    }
		    catch(e)
		    {
		        console.log("Incorrect response! Failed to get Client DB!",e.name,e.message);
		        //setTimeout(checkWebStatus, 10000);
		    }
		}
		
		function get_client_db()
		{
				document.getElementById("cli_db_display").innerHTML = "";
		    var x_response = JSO_get_client_capabilities();
		    get_client_db_cb(x_response);
		}

		get_client_db();
</script>
</body>
</html>