<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>VoIP - Network</title>
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
  <div class="container-full">
      <div class="title-text">DSCP Flag</div>
      <div class="title-description-text">This page is used to configure DSCP Flag of VoIP.</div>
      <br>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SIP DSCP:</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="24">
          </div>
          <div class="col-3 left">
              <label class="input-radio">(0-63)</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">RIP DSCP:</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="46">
          </div>
          <div class="col-3 left">
              <label class="input-radio">(0-63)</label>
          </div>
      </div>

      <div class="mt-2 center">
          <button class="btn-dashboard">Apply</button>
      </div>
  </div>
  <!-- content -->
</body>

</html>