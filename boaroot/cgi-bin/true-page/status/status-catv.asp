<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - CATV</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/lib/JsBarcode.all.min.js"></script>
  <!-- script -->

</head>

<body>
	<!-- content -->
    <div class="container-full container-resize-height">
        <div class="card-table">
            <div class="title-content">CATV Status</div>
            <div class="title-description-content">This page shows the current system status of CATV.</div>
            <table style="width:100%">
                <tr class="table-header">
                    <th colspan="2" class="p-1">CATV Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">CATV RX Power</td>
                    <td style="width: 50%;"><%tcWebApi_get("CatvInfo_Entry", "CATV_VPD", "s")%></td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">CATV Out Power</td>
                    <td><%tcWebApi_get("CatvInfo_Entry", "CATV_RF", "s")%></td>
                </tr>
            </table>
        </div>

    </div>
</body>

</html>