<%
if Request_Form("firewall_flag") = "1" then 

	TCWebApi_unset("Firewall_Entry")
	TCWebApi_set("Firewall_Entry","firewall_status","FirewallEnable")
	TCWebApi_set("Firewall_Entry","firewall_level","FirewallLevel")
	TCWebApi_set("Firewall_Entry","spi_status","SPIEnable")		
	TCWebApi_commit("Firewall_Entry")
	TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Firewall Enable</title>
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
var curUser = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";

function SubmitChange(){
	var	vForm = document.ConfigForm;
	
	vForm.firewall_flag.value = "1";
    document.ConfigForm.SaveAlter_Flag.value = "1";
	vForm.submit();
	//showLoading();
}

</SCRIPT>
</head>

<body>
  <!-- content -->
    <div class="container-full container-resize-height">
	  <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/Filewall-Enable.asp" method="post">
		  <INPUT TYPE="HIDDEN" NAME="firewall_flag" VALUE="0">
		  <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
          <div class="title-text">Firewall Enable</div>
          <div class="title-description-text">This page is used to enable/disable Firewall services.</div>
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">Filewall:</div>
              </div>
              <div class="col-6">
				  <input type="radio" name="FirewallEnable" value="1" <% If tcWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_Write("checked") end if %> >
				  <label class="input-radio">Enable</label>
				  <input type="radio" name="FirewallEnable" value="0" <% If tcWebApi_get("Firewall_Entry","firewall_status","h") = "0" then asp_Write("checked") end if %> >
				  <label class="input-radio">Disable</label>
              </div>
          </div>
          <div id="SpiFirewall" class="row p-1">
<SCRIPT language=JavaScript type=text/javascript>
if (curUser != "0")
{
    getElById("SpiFirewall").style.display = "none";
}
</SCRIPT>
              <div class="col-6">
                  <div class="title-text-left">SPI:</div>
              </div>
              <div class="col-6">
				  <input type="radio" name="SPIEnable" value="1" <% If tcWebApi_get("Firewall_Entry","spi_status","h") = "1" then asp_Write("checked") end if %> >
				  <label class="input-radio">Enable</label>
				  <input type="radio" name="SPIEnable" value="0" <% If tcWebApi_get("Firewall_Entry","spi_status","h") = "0" then asp_Write("checked") end if %> >
				  <label class="input-radio">Disable</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">Level:</div>
              </div>
              <div class="col-6">  
				  <input type="radio" name="FirewallLevel" value="high" <% If tcWebApi_get("Firewall_Entry","firewall_level","h") = "high" then asp_Write("checked") end if %> >
				  <label class="input-radio">High</label>
				  <input type="radio" name="FirewallLevel" value="medium" <% If tcWebApi_get("Firewall_Entry","firewall_level","h") = "medium" then asp_Write("checked") end if %> >
				  <label class="input-radio">Medium</label>
				  <input type="radio" name="FirewallLevel" value="low" <% If tcWebApi_get("Firewall_Entry","firewall_level","h") = "low" then asp_Write("checked") end if %> >
				  <label class="input-radio">Low</label>
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