<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>RIP Configuration</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">RIP Configuration</div>
    <div class="title-description-text">Enable the RIP if you are using this device as a RIP-enabled Device to communicate with others using the Routing Information Protocol. This page is used to select the interfaces on your device is that use RIP, and the version of the protocol used.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">RIP:</div>
      </div>
      <div class="col-6">
        <input type="radio" value="Enable" name="radio1">
        <label class="input-radio">Enable</label>
        <input type="radio" value="Disable" name="radio1" checked="checked">
        <label class="input-radio">Disable</label>
        <button type="button" class="btn-dashboard">Apply Changes</button>
      </div>

    </div><br>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Interface:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select">
          <option value="1">br0</option>
          <option value="1">br1</option>
        </select>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Receive Mode:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select">
          <option value="1">NONE</option>
          <option value="1">AP</option>
        </select>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Send Mode:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select">
          <option value="1">NONE</option>
          <option value="1">AP</option>
        </select>
      </div>
    </div>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard">Add</button>
    </div>

    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header left">
          <th class="p-1" colspan="4">RIP Config Table</th>
        </tr>
        <tr class="table-content-fist left">
          <td class="p-1">Select</td>
          <td>Interface</td>
          <td>Receive Mode</td>
          <td>Send Mode</td>
        </tr>
      </table>
    </div>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard">Delete Selected</button>
      <button type="button" class="btn-dashboard">Delete All</button>
    </div>
  </div>
  <!-- content -->
</body>

</html>