<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - ARP Table</title>
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
<SCRIPT language=JavaScript src="/JS/printtable.js"></SCRIPT>
<SCRIPT language=JavaScript type=text/javascript>
	var aryInfoTemp = "<% tcWebApi_get("Info_Arp","PortIP","s") %>";
	var PortIp = aryInfoTemp.split(',');
	var dhcpnum = PortIp.length - 1;
	aryInfoTemp = "<% tcWebApi_get("Info_Arp","PortMac","s") %>";
	var PortMac = aryInfoTemp.split(',');

	function Refresh()
	{
	   window.location.reload();
	}

</SCRIPT>
  <!-- content -->
  <div class="container-full container-resize-height">
	  <div class="title-text">User List</div>
	  <div class="title-description-text">This table shows a list of learned MAC addresses.</div>
	  <div class="card-table">
		  <table style="width:100%">
			  <tr class="table-header center">
				  <th style="width: 16%;" class="p-1">IP Address</th>
				  <th style="width: 22%;">MAC Address</th>
			  </tr>
			  <SCRIPT language=JavaScript type=text/javascript>
					var z=0;
					for(i = 0; i < dhcpnum; i++)
					{
						if(PortMac[i] != "00:00:00:00:00:00"){
							if(PortIp[i] != "N/A" || PortMac[i] != "N/A")
							{
								var rowCss=z%2==0?"table-content-fist":"table-content-second";
								document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
								document.write('<TD>' + PortIp[i] + '&nbsp;</TD>');
								document.write('<TD>' + PortMac[i] + '&nbsp;</TD>');
								document.write('</TR>');
								z++;
							}	
						}
					}
			  </SCRIPT>
		  </table>
	  </div>
	  <div class="mt-2 center">
		  <button id="btnRefresh" name="btnRefresh" type="button" class="btn-dashboard" onclick="Refresh();">Refresh</button>
	  </div>
  </div>
  <!-- content -->
</body>

</html>