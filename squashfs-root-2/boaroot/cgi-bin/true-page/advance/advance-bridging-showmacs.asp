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
	var aryInfoTemp = "<% tcWebApi_get("Info_Showmacs","port","s") %>";
	var Port = aryInfoTemp.split(',');
	var num = Port.length - 1;
	aryInfoTemp = "<% tcWebApi_get("Info_Showmacs","mac","s") %>";
	var PortMac = aryInfoTemp.split(',');
	aryInfoTemp = "<% tcWebApi_get("Info_Showmacs","is_local","s") %>";
	var Islocal = aryInfoTemp.split(',');
	aryInfoTemp = "<% tcWebApi_get("Info_Showmacs","ageing_timer","s") %>";
	var Ageingtimer = aryInfoTemp.split(',');

	function Refresh()
	{
	   window.location.reload();
	}
	
	function goBack()
	{
		window.history.go(-1);
	}

</SCRIPT>
  <!-- content -->
  <div class="container-full container-resize-height">
	  <div class="title-text">Bridge Forwarding Database</div>
	  <div class="row p-1">
	    <div class="col-md-6 col-sx-12 pl60">
			<label class="input-radio">This table shows a list of learned MAC addresses.</label>
		</div>
	  </div>
	  <div class="card-table">
		  <table style="width:100%">
			  <tr class="table-header center">
				  <th style="width: 16%;" class="p-1">Port</th>
				  <th style="width: 22%;">MAC Address</th>
				  <th style="width: 22%;">Is Local?</th>
				  <th style="width: 22%;">Ageing Timer</th>
			  </tr>
			  <script language=JavaScript type=text/javascript>
					var z=0;
					for(i = 0; i < num; i++)
					{
						if(Port[i] != "N/A" || PortMac[i] != "N/A")
						{
							var rowCss=z%2==0?"table-content-fist":"table-content-second";
							document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
							document.write('<TD>' + Port[i] + '&nbsp;</TD>');
							document.write('<TD>' + PortMac[i] + '&nbsp;</TD>');
							document.write('<TD>' + Islocal[i] + '&nbsp;</TD>');
							document.write('<TD>' + Ageingtimer[i] + '&nbsp;</TD>');
							document.write('</TR>');
							z++;
						}						
					}
			  </script>
		  </table>
		</div>
		<div class="mt-2 center">
			<button id="btnRefresh" name="btnRefresh" type="button" class="btn-dashboard" onclick="Refresh();">Refresh</button>
			<button id="goback" name="goback" type="button" class="btn-dashboard" onclick="goBack();">Close</button>
		</div>
	</div>
	<!-- content -->
</body>

</html>