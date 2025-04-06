<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - WLAN Fast Roaming</title>
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
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Fast Roaming</div>
    <div class="title-description-text">This page is used to configure the parameters for Fast Roaming feature of your Access Point.</div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Enable Fast Roaming</div>
        </div>
        <div class="col-6">
          <input type="radio" value="enabled" name="radio" disabled>
          <label class="input-radio">Enabled</label>
          <input type="radio" value="disabled" name="radio" checked>
          <label class="input-radio">Disabled</label>
        </div>
    </div>
    <div class="row p-1" style="display: none;">
        <div class="col-6">
        </div>
        <div class="col-6">
            <div class="row">
                <label for="" class="text-content col-auto mr-1">5GHz RSSI </label>
                <input class="input-textfield-auto col-2" type="text" value="-60" disabled>
                <label for="" class="text-content col-auto"> dBm</label>
            </div>
            <hr>
            <div class="row">
                <label for="" class="text-content col-auto mr-1">Precent of clients on 5GHz radio </label>
                <input class="input-textfield-auto col-2" type="text" value="75" disabled>
                <label for="" class="text-content col-auto"> %</label>
            </div>
            <p class="text-content"><span class="text-danger">NOTE: </span> In Order for Band Steering function to work properly, both 2.4 GHz and 5GHz SSID and Security Settings must be the same</p>
        </div>
        <hr>
    </div>
    <div class="mt-3 mb-3 center">
        <button type="button" onclick="" class="btn-dashboard button-disable-gray" disabled>Apply Changes</button>
    </div>
  </div>
  <!-- content -->
</body>

</html>