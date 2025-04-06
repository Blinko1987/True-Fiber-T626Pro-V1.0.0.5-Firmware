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
  var aryInfoTemp = "<% tcWebApi_get("Info_Showroutes","Destination","s") %>";
  var Destination = aryInfoTemp.split(',');
  
  var num = Destination.length - 1;
  aryInfoTemp = "<% tcWebApi_get("Info_Showroutes","Genmask","s") %>";
  var SubnetMask = aryInfoTemp.split(',');
  
  aryInfoTemp = "<% tcWebApi_get("Info_Showroutes","Gateway","s") %>";
  var NextHop = aryInfoTemp.split(',');
  
  aryInfoTemp = "<% tcWebApi_get("Info_Showroutes","Metric","s") %>";
  var Metric = aryInfoTemp.split(',');
  
  aryInfoTemp = "<% tcWebApi_get("Info_Showroutes","UseIface","s") %>";
  var Interface = aryInfoTemp.split(',');

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
    <div class="title-text">IP Route Table</div>
    <div id="BindVlanRow" class="row p-1">
      <div class="col-12">
      <span style="font-size: 10px; color: #888888; padding-top: 5px; padding-left: 5px;">
        This table shows a list of destination routes commonly accessed by you network.<br/>
      </span>
      </div>
    </div>
    <div class="card-table">
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 20%;" class="p-1">Destination</th>
          <th style="width: 20%;">Subnet Mask</th>
          <th style="width: 20%;">Next Hop</th>
          <th style="width: 20%;">Metric</th>
          <th style="width: 20%;">Interface</th>
        </tr>
        <SCRIPT language=JavaScript type=text/javascript>
          var z=0;
          for(i = 0; i < num; i++)
          {
            if(Destination[i] != "N/A" || Interface[i] != "N/A")
            {
              var rowCss=z%2==0?"table-content-fist":"table-content-second";
              document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
              document.write('<TD>' + Destination[i] + '&nbsp;</TD>');
              document.write('<TD>' + SubnetMask[i] + '&nbsp;</TD>');
              document.write('<TD>' + NextHop[i] + '&nbsp;</TD>');
              document.write('<TD>' + Metric[i] + '&nbsp;</TD>');
              document.write('<TD>' + Interface[i] + '&nbsp;</TD>');
              document.write('</TR>');
              z++;
            }
          }
        </SCRIPT>
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