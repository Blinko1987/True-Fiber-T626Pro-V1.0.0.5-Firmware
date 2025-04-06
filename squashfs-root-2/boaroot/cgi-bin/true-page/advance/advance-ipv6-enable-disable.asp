<%
  TCWebApi_set("Dhcp6s_Entry","Enable","dhcpv6SrvType")
  TCWebApi_set("Radvd_Entry","Enable","dhcpv6SrvType")
  TCWebApi_commit("Radvd_Entry")
  TCWebApi_commit("Dhcp6s_Entry")
  TCWebApi_save("Radvd_Entry")
  TCWebApi_save("Dhcp6s_Entry")
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 Configuration</title>
    <!-- style -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- style -->
    
    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
    <!-- script -->
    
    <!-- self sript -->
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
</head>

<body>
<!-- content -->
<form name="advanceForm" method="post" action="/cgi-bin/true-page/advance/advance-ipv6-enable-disable.asp">
  <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
  <div class="container-full container-resize-height">
    <div class="title-text">IPv6 Configuration</div>
    <div class="title-description-text">This page be used to configure IPv6 enable/disable</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">IPv6:</div>
      </div>
      
      <div class="col-6">
        <input type="radio" value="1" id="dhcpv6SrvType" name="dhcpv6SrvType"
          <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%>
		  <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>
        <label class="input-radio">Enabled</label>
        <input type="radio" value="0" id="dhcpv6SrvType" name="dhcpv6SrvType" 
          <%if tcWebApi_get("Dhcp6s_Entry","Enable","h") = "0" then 
		    if tcWebApi_get("Radvd_Entry","Enable","h") = "0" then
			asp_Write("checked") end if 
			end if %>>
        <label class="input-radio">Disabled</label>
      </div>
    </div>
    <div class="mt-3 mb-3 center">
      <button type="button" id="btnv6" onclick="v6Click()" class="btn-dashboard">Apply Changes</button>
    </div>
  </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
  function v6Click()
  {
    document.advanceForm.SaveAlter_Flag.value = "1";
    document.advanceForm.submit();
    //showLoading();
  }
</script>
</body>

</html>