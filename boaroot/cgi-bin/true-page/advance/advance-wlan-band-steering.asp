<%
if Request_Form("Save_Flag") = "1" then
  if Request_Form("BS20Enable") = "1" then
    TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","1")
    TCWebApi_constSet("Mesh_common", "SteerEnable", "1")
  else
    TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","0")
    TCWebApi_constSet("Mesh_common", "SteerEnable", "0")
  end if
  TCWebApi_set("mesh_steercfg","RSSIThreshold_DG","RSSI_DG")
  TCWebApi_set("mesh_steercfg","RSSIThreshold_UG","RSSI_UG")
  TCWebApi_commit("Mesh_dat")
  TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - WLAN Band Steering</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
<%if Request_Form("SaveAlter_Flag") = "1" then %>
  <script language=JavaScript type="text/javascript">
    var Tips = applyAlert({
      "content": "submit successful.",
      "buttons":{
      },
      "autoClose": 2
    });
  </script>
<% end if %>
  <!-- script -->
</head>

<body onload="LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Band Steering</div>
    <div class="title-description-text">This page is used to configure the parameters for band steering.</div>
    <form method="post" name="cbi" action="/cgi-bin/true-page/advance/advance-wlan-band-steering.asp" autocomplete="off">
      <input type="hidden" name="Save_Flag" value="0" />
      <input type="hidden" name="BS20Enable" value="0" />
      <input type="hidden" name="MeshEnable" value="0" />
      <input type="hidden" name="threshold_DG" value="-80" />
      <input type="hidden" name="threshold_UG" value="-58" />
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Band Steering</div>
        </div>
        <div class="col-8">
          <input id="bandSteeringEnable" type="checkbox" name="bandSteeringEnable" onclick="bandSteeringEnableClick()" checked="">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">2.4G Transition Threshold</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield" id="RSSI_UG" type="text" maxLength=4 size=15 name="RSSI_UG" value="<%if tcWebApi_get("mesh_steercfg","RSSIThreshold_UG","h") <> "N/A" then tcWebApi_get("mesh_steercfg","RSSIThreshold_UG","s") end if%>">
        </div>
        <div class="col-4 title-text-right">
          [-40dBm ~ -65dBm]
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">5G Transition Threshold</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield" id="RSSI_DG" type="text" maxLength=4 size=15 name="RSSI_DG" value="<%if tcWebApi_get("mesh_steercfg","RSSIThreshold_DG","h") <> "N/A" then tcWebApi_get("mesh_steercfg","RSSIThreshold_DG","s") end if%>">
        </div>
        <div class="col-4 title-text-right">
          [-70dBm ~ -100dBm]
        </div>
      </div>
    </form>
    <div class="mt-3 mb-3 center">
        <button type="button" onclick="btnSave()" class="btn-dashboard">Apply Changes</button>
    </div>
  </div>
  <script>
    var HT_BW_2G = <% tcWebApi_get("wlan_common","HT_BW","s") %>;
    var HT_BW_5G = <% tcWebApi_get("wlan11ac_common","HT_BW","s") %>;
    var VHT_BW_5G = <% tcWebApi_get("wlan11ac_common","VHT_BW","s") %>;
    var bandWidth_2g = 0;//20M
    var bandWidth_5g = 2;//80M
    
    if (HT_BW_2G == 1) {
      bandWidth_2g = 1;//40M
    } else {
      bandWidth_2g = 0;//20M
    }
    
    if (HT_BW_5G == 0) {
        bandWidth_5g = 0;//20M
    } else if (HT_BW_5G == 1) {
      if (VHT_BW_5G == 0) {
        bandWidth_5g = 1;//40M
      } else if(VHT_BW_5G == 1) {
        bandWidth_5g = 2;//80M
      } else if(VHT_BW_5G == 2) {
        bandWidth_5g = 3;//160M
      } else {
        bandWidth_5g = 2;//80M
      }
    } else {
      bandWidth_5g = 2;//80M
    }
    
    var noise_offset = [-94, -91, -91, -85];
    var rssi_offset_DG = [
      [11, 12, 11, 12],
      [9,  10,  9, 10],
    ];
    var rssi_offset_UG = [
      [-11, -12, -11, -12],
      [-9,  -10,  -9, -10],
    ];
    
    function LoadFrame() {
      var bandSteeringEnable = "<% tcWebApi_get("Mesh_EnableConf","BandSteeringEnable","s") %>";
      var meshEnable = "<% tcWebApi_get("Mesh_EnableConf","EasyMeshEnable","s") %>";
      
      if (meshEnable == "1") {
        $("#bandSteeringEnable").attr("checked",true).prop("checked",true);
        $("#bandSteeringEnable").attr("disabled", true).prop("disabled", true);
        setText('MeshEnable', 1);
        setText('BS20Enable', 0);
      }else {
        if (bandSteeringEnable == "1") {
          $("#bandSteeringEnable").attr("checked",true).prop("checked",true);
          setText('BS20Enable', 1);
        }else {
          $("#bandSteeringEnable").attr("checked",false).prop("checked",false);
          setText('BS20Enable', 0);
        }
      }
    }

    function bandSteeringEnableClick() {
      if ($('#bandSteeringEnable').prop('checked')) {
        setText('BS20Enable', 1);
      }else {
        setText('BS20Enable', 0);
      }
    }
    
    function isDigit(val) {
      if (val < '0' || val > '9')
        return false;
      return true;
    }
    
    function isDecimalDigit(digit) {
      if ( digit == "" ) {
        return false;
      }
      var i = 0;
      if (digit.charAt(0) == '-')
        i = 1;
      for ( i; i < digit.length ; i++ ) {
        if ( !isDigit(digit.charAt(i)) ) {
          return false;
        }
      }
      return true;
    }
    
    function thresholdCheck() {
      var RSSI_UG = $("#RSSI_UG").val();
      var RSSI_DG = $("#RSSI_DG").val();
      
      if (!isDecimalDigit(RSSI_UG)) {
        alert("2.4G Transition Threshold must be a negative integer!");
        return false;
      }
      
      if (!isDecimalDigit(RSSI_DG)) {
        alert("5G Transition Threshold must be a negative integer!");
        return false;
      }
      
      if (parseInt(RSSI_UG) < -65 || parseInt(RSSI_UG) > -40) {
        alert("2.4G Transition Threshold must be greater than -40 and less than -65");
        return false;
      }
      if (parseInt(RSSI_DG) < -100 || parseInt(RSSI_DG) > -70) {
        alert("5G Transition Threshold must be greater than -70 and less than -100");
        return false;
      }
      return true;
    }
    
    function ThresholdToRSSI() {
      var threshold_UG = <% tcWebApi_get("mesh_steercfg","RSSISteeringEdge_UG","s") %>;
      var threshold_DG = <% tcWebApi_get("mesh_steercfg","RSSISteeringEdge_DG","s") %>;
      
      var RSSI_UG = threshold_UG + noise_offset[bandWidth_5g] - rssi_offset_UG[bandWidth_2g][bandWidth_5g];
      var RSSI_DG = threshold_DG + noise_offset[bandWidth_2g] - rssi_offset_DG[bandWidth_2g][bandWidth_5g];
      $("#RSSI_UG").val(RSSI_UG);
      $("#RSSI_DG").val(RSSI_DG);
    }
    
    function RSSIToThreshold() {
      var RSSI_UG = parseInt($("#RSSI_UG").val());
      var RSSI_DG = parseInt($("#RSSI_DG").val());
      var threshold_UG = RSSI_UG + rssi_offset_UG[bandWidth_2g][bandWidth_5g] - noise_offset[bandWidth_5g];
      var threshold_DG = RSSI_DG + rssi_offset_DG[bandWidth_2g][bandWidth_5g] - noise_offset[bandWidth_2g];
      $("input[name='threshold_UG']").val(threshold_UG);
      $("input[name='threshold_DG']").val(threshold_DG);
    }

    function btnSave() {
      if(document.cbi != null)
      {
        if (thresholdCheck()) {
          $("input[name='Save_Flag']").val(1);
          document.cbi.SaveAlter_Flag.value = "1";
          document.cbi.submit();
        }
      }
    }

  </script>
</body>

</html>
