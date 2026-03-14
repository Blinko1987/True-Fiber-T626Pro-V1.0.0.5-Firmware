<%
if Request_Form("alg_Flag") = "1" then
	TCWebApi_set("ALGSwitch_Entry","FTPSW","FtpEnable")
	TCWebApi_set("ALGSwitch_Entry","H323SW","H323Enable")	
	TCWebApi_set("ALGSwitch_Entry","RTSPSW","RtspEnable")	
	TCWebApi_set("ALGSwitch_Entry","L2TPSW","L2tpEnable")
	TCWebApi_set("ALGSwitch_Entry","IPSECSW","IpsecEnable")
	TCWebApi_set("ALGSwitch_Entry","SIPSW","SipEnable")	
	TCWebApi_set("ALGSwitch_Entry","PPTPSW","PPTPEnable")
	TCWebApi_commit("ALGSwitch_Entry")	
	tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>ALG Type</title>
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
	document.ConfigForm.SaveAlter_Flag.value = "1";
	vForm.alg_Flag.value = "1";
	vForm.submit();
	//showLoading();
}

</SCRIPT>
</head>

<body>
<!-- content -->
  <div class="container-full container-resize-height">
	  <div class="title-text">ALG Type</div>
	  <div class="title-description-text">This page is used to enable/disable ALG services.</div>
	  <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/ALG-Type.asp" method="post">
	  <INPUT TYPE="HIDDEN" NAME="alg_Flag" VALUE="0">
	  <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">ftp</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="FtpEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","FTPSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="FtpEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","FTPSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">h323</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="H323Enable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","H323SW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="H323Enable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","H323SW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">rtsp</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="RtspEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","RTSPSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="RtspEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","RTSPSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">l2tp</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="L2tpEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","L2TPSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="L2tpEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","L2TPSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">ipsec</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="IpsecEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","IPSECSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="IpsecEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","IPSECSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">sip</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="SipEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","SIPSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="SipEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","SIPSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">pptp</div>
		  </div>
		  <div class="col-6">
			  <input type="radio" name="PPTPEnable" value="on" <% If tcWebApi_get("ALGSwitch_Entry","PPTPSW","h") = "on" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enabled</label>
			  <input type="radio" name="PPTPEnable" value="off" <% If tcWebApi_get("ALGSwitch_Entry","PPTPSW","h") = "off" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disabled</label>
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