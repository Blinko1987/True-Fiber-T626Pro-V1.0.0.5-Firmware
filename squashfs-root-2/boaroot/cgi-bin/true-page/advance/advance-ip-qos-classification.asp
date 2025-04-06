<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - Classification</title>
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
    <div class="title-text">QoS Classification</div>
    <div class="title-description-text">This page is used to add or delete classicification rule.(After add a new rule, please click 'Apply Changes' to take effect.)</div>
    <div class="card-table">
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 5%;"></th>
          <th style="width: 5%;"></th>
          <th style="width: 10%;"></th>
          <th style="width: 10%;">Mark</th>
          <th style="width: 10%;"></th>
          <th style="width: 10%;"></th>
          <th style="width: 10%;"></th>
          <th style="width: 22%;">Classification Rules</th>
          <th style="width: 10%;"></th>
          <th style="width: 10%;"></th>
        </tr>
        <tr class="table-header center">
          <th style="width: 5%;">ID</th>
          <th style="width: 5%;">Name</th>
          <th style="width: 10%;">Order</th>
          <th style="width: 10%;">DSCP Mark</th>
          <th style="width: 10%;">802.1p</th>
          <th style="width: 10%;">Queue</th>
          <th style="width: 10%;">Wanlf</th>
          <th style="width: 22%;">Rule Detail</th>
          <th style="width: 10%;">Delete</th>
          <th style="width: 10%;">Edit</th>
        </tr>
        <tr class="table-content-fist center">
        </tr>
      </table>
    </div>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard button-disable-gray" disabled>Add</button>
      <button type="button" class="btn-dashboard button-disable-gray" disabled>Apply Changes</button>
    </div>
  </div>
  <!-- content -->
</body>

</html>