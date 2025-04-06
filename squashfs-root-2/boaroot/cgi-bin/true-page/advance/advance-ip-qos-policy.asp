<%
If Request_Form("SaveFlag") = "1" then
	TCWebApi_set("QoS_Common","Active","QosFlag")
	TCWebApi_commit("QoS_Common")
	TCWebApi_save()
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - Policy</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-policy.asp" method="post">
    <input type="hidden" name="SaveFlag" value="0">
    <div class="title-text">IP QoS Configuration</div>
    <div class="title-description-text">This page is used to configure the routing information. Here you can add/delete IP routes.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">IP QoS:</div>
      </div>
      <div class="col-6">
        <input type="radio" value="1" id="Enable"1 name="Enable" <% if tcWebApi_get("QoS_Common","Active","h") = "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Enabled</label>
        <input type="radio" value="0" id="Enable"2 name="Enable" <% if tcWebApi_get("QoS_Common","Active","h") <> "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Disabled</label>
          <input type="hidden" name="QosFlag" value="Yes">
      </div>
    </div>
    </form>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="btnSave()">Apply Changes</button>
    </div>
  </div>
  <!-- content -->
  <script>
    $(document).ready(function(){
      var QoSEnable = $("input[name='Enable']:checked").val();
      if(1 == QoSEnable){
        document.ConfigForm.QosFlag.value = "Yes";
      }else{
        document.ConfigForm.QosFlag.value = "No";
      }
    });

    $('input[type=radio][name=Enable]').change(function() {
      var QoSEnable = $("input[name='Enable']:checked").val();
      if(1 == QoSEnable){
        document.ConfigForm.QosFlag.value = "Yes";
      }else{
        document.ConfigForm.QosFlag.value = "No";
      }
    });

    function btnSave()
    {
      document.ConfigForm.SaveFlag.value = "1";
      document.ConfigForm.submit();
      showLoading();
    }
  </script>
</body>

</html>