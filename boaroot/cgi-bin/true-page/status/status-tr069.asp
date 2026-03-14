<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - TR069</title>
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
        <div class="card-table">
            <div class="title-content">TR069 Status</div>
            <div class="title-description-content">This page show the status of TR069.</div>
            <table style="width:100%">
                <tr class="table-header">
                    <th colspan="2" class="p-1">ACS Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">Inform Status</td>
                    <td style="width: 50%;">
                    	<SCRIPT language=javascript>
											var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
											switch(result)
											{
												case "0":
													document.writeln("Not reported(E home terminal is starting)");
													break;
												case "1":
													document.writeln("Not reported(No remote management WAN connection)");
													break;
												case "2":
													document.writeln("Not reported(Remote management WAN connection is not effective)");
													break;
												case "3":
													document.writeln("Not reported(No management access DNS information)");
													break;
												case "4":
													document.writeln("Not reported(Non-ACS configuration parameter)");
													break;
												case "5":
													document.writeln("Not reported(ACS DNS failure)");
													break;
												case "6":
													document.writeln("No response reported");
													break;
												case "7":
													document.writeln("Reporting process is interrupted"); 
													break;
												case "8":
													document.writeln("Reported successful");
													break;
												//added by zhujunjie, 2019.5.27
												case "9":
													document.writeln("Authentication failed");
													break;
												default:
													document.writeln("N/A");
													break;			
											}						
											</SCRIPT>
                    </td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">Connection request from ACS</td>
                    <td>
                    	<SCRIPT language=javascript>
											var result = "<%TCWebApi_get("Cwmp_Entry","AcsConnStatus","s")%>";
											switch(result)
											{
												case "0":
													document.writeln("Not receive a remote connection request");
													break;
												case "1":
													document.writeln("ACS initiated the process of remote connections interrupt");
													break;
												case "2":
													document.writeln("ACS successfully initiated the process of remote connections");
													break;
												 default:
													document.writeln("Not receive a remote connection request");
													break;			
											}						
											</SCRIPT>
                    </td>
                </tr>
            </table>
        </div>

        <div class="card-table">
            <table style="width:100%">
                <tr class="table-header">
                    <th colspan="2" class="p-1">Configuration Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">Configuration Download Status</td>
                    <td style="width: 50%;">
                    	<SCRIPT language=javascript>
											var rstatus = "<%tcWebApi_get("deviceAccount_Entry","registerStatus","s") %>";
											var rresult = "<%tcWebApi_get("deviceAccount_Entry","registerResult","s") %>";
											if(rstatus=="0" && rresult == "99")
											{
												document.write('Not receive configuration from ACS.');
											}
											else if(rstatus=="0" && rresult == "0")
											{
												document.write('Start receive configuration from ACS.');
											}
											else if(rstatus=="0" && rresult == "1")
											{
												document.write('Load configuration from ACS successfully.');
											}
											else if(rstatus=="5" && rresult == "0")
											{
												document.write('Load configuration from ACS successfully.');
											}
											else if(rstatus=="0" && rresult == "2")
											{
												document.write('Load configuration from ACS failure.');
											}
											else
											{
												document.write('Not receive configuration from ACS.');
											}
											</SCRIPT>
                    </td>
                </tr>
            </table>
        </div>
    	</div>
</body>

</html>