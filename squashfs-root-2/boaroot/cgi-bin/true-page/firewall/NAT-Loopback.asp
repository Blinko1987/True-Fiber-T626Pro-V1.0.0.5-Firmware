<%
if Request_Form("NatLoopback_Flag") = "1" then
	TCWebApi_set("NatLoopback_Common","Enable","NatLoopEnable")	
	TCWebApi_commit("NatLoopback_Common")
	TCWebApi_commit("Dmz")
	TCWebApi_commit("VirServer")
	tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>NAT Loopback</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
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
  
<SCRIPT language=javascript>
function SubmitChange(){
	var	vForm = document.ConfigForm;
	vForm.NatLoopback_Flag.value = "1";
    document.ConfigForm.SaveAlter_Flag.value = "1";
	vForm.submit();
	showLoading();
}

</SCRIPT>
</head>

<body>
  <!-- content -->
    <div class="container-full container-resize-height">
	  <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/NAT-Loopback.asp" method="post">
		<input type="hidden" name="EnableNatLoopback_Flag" value="0">
		<input type="hidden" name="NatLoopback_Flag" value="0">
        <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
		<div class="title-text">NAT Loopback</div>
		<div class="title-description-text">This page is used to configure NAT Loopback.</div>
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">Enable:</div>
              </div>
              <div class="col-6">
				  <input type="radio" name="NatLoopEnable" value="Yes" <% If tcWebApi_get("NatLoopback_Common","Enable","h") = "Yes" then asp_Write("checked") end if %> >
				  <label class="input-radio">Enable</label>
				  <input type="radio" name="NatLoopEnable" value="No" <% If tcWebApi_get("NatLoopback_Common","Enable","h") = "No" then asp_Write("checked") end if %> >
				  <label class="input-radio">Disable</label>
              </div>
          </div>
          <div class="mt-2 center">
              <button id="apply" type="button" name="apply" class="btn-dashboard" onclick="SubmitChange();">Apply Changes</button>
          </div>
	  </form>
    </div>
  <!-- content -->
</body>
</html>