<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Statistics - PON</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <script>
        function PonStatusInfoClass()
        {
            this.TxFrameCnt			= '<% tcWebApi_get("Info_ponwanstats","TxFrameCnt","s") %>';
            this.TxFrameLen			= '<% tcWebApi_get("Info_ponwanstats","TxFrameLen","s") %>';
            this.TxDropCnt			= '<% tcWebApi_get("Info_ponwanstats","TxDropCnt","s") %>';
            this.TxBroadcastCnt		= '<% tcWebApi_get("Info_ponwanstats","TxBroadcastCnt","s") %>';
            this.TxMulticastCnt		= '<% tcWebApi_get("Info_ponwanstats","TxMulticastCnt","s") %>';
            this.TxUnicaseCnt		= this.TxFrameCnt - this.TxBroadcastCnt - this.TxMulticastCnt;
            
            this.RxFrameCnt			= '<% tcWebApi_get("Info_ponwanstats","RxFrameCnt","s") %>';
            this.RxFrameLen			= '<% tcWebApi_get("Info_ponwanstats","RxFrameLen","s") %>';
            this.RxDropCnt			= '<% tcWebApi_get("Info_ponwanstats","RxDropCnt","s") %>';
            this.RxBroadcastCnt		= '<% tcWebApi_get("Info_ponwanstats","RxBroadcastCnt","s") %>';
            this.RxMulticastCnt		= '<% tcWebApi_get("Info_ponwanstats","RxMulticastCnt","s") %>';
            this.RxHecErrorCnt		= '<% tcWebApi_get("Info_ponwanstats","RxHecErrorCnt","s") %>';
            this.RxFecErrorCnt		= '<% tcWebApi_get("Info_ponwanstats","RxFecErrorCnt","s") %>';
            this.RxUnicaseCnt		= this.RxFrameCnt - this.RxBroadcastCnt - this.RxMulticastCnt;
        }

		var PonStatusInfo = new PonStatusInfoClass();
        console.log(PonStatusInfo,'PonStatusInfo')
        console.log(document.ConfigForm,'document.ConfigForm')
        
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="card-table">
        <div class="title-content">PON Statistics</div>
        <div class="title-description-content">This page shows the packet statistics for transmission and reception regarding to network interface.</div>
        <table style="width:100%">
            <tr class="table-header">
                <th colspan="2" class="p-1">PON Statistics</th>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Byte Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxFrameLen + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">Byte Received</td>
                <SCRIPT language=javascript>
                  document.writeln("<td>" + PonStatusInfo.RxFrameLen + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Packets Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxFrameCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">Packets Received</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxFrameCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Unicast Packets Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxUnicaseCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">Unicast Packets Received</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxUnicaseCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Multicast Packets Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxMulticastCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">Multicast Packets Received</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxMulticastCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Broadcast Packets Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxBroadcastCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">Broadcast Packets Received</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxBroadcastCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">FEC Errors</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxFecErrorCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-second">
                <td class="table-header-content p-1">HEC Errors</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.RxHecErrorCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Packets Droped Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>" + PonStatusInfo.TxDropCnt + "</td>");
                </SCRIPT>
            </tr>
            <tr class="table-content-fist">
                  <td style="width: 50%;" class="table-header-content p-1">Packets Droped Received</td>
                  <SCRIPT language=javascript>
                        document.writeln("<td>" + PonStatusInfo.RxDropCnt + "</td>");
                  </SCRIPT>
            </tr>
            <!--<tr class="table-content-second">
                <td class="table-header-content p-1">Pause Packets Sent</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>NA</td>");
                </SCRIPT>
            </tr>-->
            <!--<tr class="table-content-fist">
                <td style="width: 50%;" class="table-header-content p-1">Pause Packets Received</td>
                <SCRIPT language=javascript>
                      document.writeln("<td>NA</td>");
                </SCRIPT>
            </tr>-->
        </table>
    </div>
  </div>
  <!-- content -->
</body>

</html>