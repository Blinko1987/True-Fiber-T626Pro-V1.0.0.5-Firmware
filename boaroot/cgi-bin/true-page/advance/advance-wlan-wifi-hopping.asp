<%
If Request_Form("SaveFlag") = "1" then
  TCWebApi_set("WebCurSet_Entry","wlan_id", "1")
  TCWebApi_set("WLan_Common","AutoChannelSelect","WLanAutoChannelSelect")
  TCWebApi_set("WLan_Common","Channel","WLanChannelID")
  TCWebApi_set("WLan_Common","AutoChannelDisable","WLanAutoChannelDisable")
  TCWebApi_commit("WLan_Common")
  TCWebApi_commit("WLan_Entry")
  TCWebApi_save()
  TCWebApi_set("WebCurSet_Entry","wlan_ac_id","1")
  TCWebApi_set("WLan11ac_Common","AutoChannelSelect","WLan11acAutoChannelSelect")
  TCWebApi_set("WLan11ac_Common","Channel","WLan11acChannelID")
  TCWebApi_set("WLan11ac_Common","AutoChannelDisable","WLan11acAutoChannelDisable")
  TCWebApi_commit("WLan11ac_Common")
  TCWebApi_commit("WLan11ac_Entry")
  TCWebApi_save()
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - WLAN WiFi Hopping</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-wlan-wifi-hopping.asp" method="post">
    <input type="hidden" name="SaveFlag" value="0">
    <input type="hidden" name="WLanEnable" value="0">
    <input type="hidden" name="WLanAutoChannelSelect" value="<% tcWebApi_get("WLan_Common", "AutoChannelSelect", "s") %>">
    <input type="hidden" name="WLanChannelID" value="<% tcWebApi_get("WLan_Common", "Channel", "s") %>">
    <input type="hidden" name="WLanAutoChannelDisable" value="<% tcWebApi_get("WLan_Common", "AutoChannelDisable", "s") %>">
    <input type="hidden" name="WLan11acEnable" value="0">
    <input type="hidden" name="WLan11acAutoChannelSelect" value="<% tcWebApi_get("WLan11ac_Common", "AutoChannelSelect", "s") %>">
    <input type="hidden" name="WLan11acChannelID" value="<% tcWebApi_get("WLan11ac_Common", "Channel", "s") %>">
    <input type="hidden" name="WLan11acAutoChannelDisable" value="<% tcWebApi_get("WLan11ac_Common", "AutoChannelDisable", "s") %>">
    
    <div class="title-text">WiFi Hopping</div>
    <div class="title-description-text">This Page support Enable and Disable WiFi Channel Hopping Feature.</div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">2.4G WiFi Hopping:</div>
      </div>
      <div class="col-8">
        <input id="WLanEnableBtn" type="checkbox" name="WLanEnableBtn" <% if tcWebApi_get("WLan_Common","AutoChannelSelect","h" ) = "4" then asp_Write("checked") end if %>>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">5G WiFi Hopping:</div>
      </div>
      <div class="col-8">
        <input id="WLan11acEnableBtn" type="checkbox" name="WLan11acEnableBtn" <% if tcWebApi_get("WLan11ac_Common","AutoChannelSelect","h" ) = "4" then asp_Write("checked") end if %>>
      </div>
    </div>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="btnSave()">Apply Changes</button>
    </div>
    </form>
  </div>
  <!-- content -->
  <script>
  function btnSave()
  {
    if(document.getElementById("WLanEnableBtn").checked)
    {
      document.ConfigForm.WLanAutoChannelSelect.value = "4";
      document.ConfigForm.WLanChannelID.value = "0";
      document.ConfigForm.WLanAutoChannelDisable = "0";
    }
    else
    {
      document.ConfigForm.WLanAutoChannelSelect.value = "3";
    }
    if(document.getElementById("WLan11acEnableBtn").checked)
    {
      document.ConfigForm.WLan11acAutoChannelSelect.value = "4";
      document.ConfigForm.WLan11acChannelID.value = "0";
      document.ConfigForm.WLan11acAutoChannelDisable = "0";
    }
    else
    {
      document.ConfigForm.WLan11acAutoChannelSelect.value = "3";
    }
    document.ConfigForm.SaveFlag.value = "1";
    document.ConfigForm.submit();
    showLoading();
  }
  </script>
</body>

</html>