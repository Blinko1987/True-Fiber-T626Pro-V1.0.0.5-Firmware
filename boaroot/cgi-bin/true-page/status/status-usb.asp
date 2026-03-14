<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - USB</title>
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
          <div class="title-content">USB Status</div>
          <div class="title-description-content">This page shows the status of USB device.</div>
          <table style="width:100%">
              <tr class="table-header">
                  <th colspan="2" class="p-1">USB Status</th>
              </tr>
              <tr class="table-content-fist">
                  <td style="width: 50%;" class="table-header-content p-1">USB 2.0</td>
                  <td id="USBstatus" style="width: 50%;"></td>
              </tr>
          </table>
      </div>
  </div>
</body>
<script>
  function InitUSBstatus()
  {
    document.getElementById("USBstatus").innerHTML = '<%tcWebApi_get("USB_Common","status","s") %>';
  }

  InitUSBstatus();
</script>

</html>
