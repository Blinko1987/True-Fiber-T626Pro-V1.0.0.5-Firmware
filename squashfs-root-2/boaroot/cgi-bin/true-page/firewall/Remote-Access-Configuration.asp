<%
if Request_Form("Fire_WAN_Flag") = "1" then 

	TCWebApi_unset("Firewall_Entry")
	TCWebApi_set("Firewall_Entry","wan_http_enable","wan_http_Flag")
	TCWebApi_set("Firewall_Entry","wan_ping_enable","wan_ping_Flag")
	'TCWebApi_set("Firewall_Entry","wan_telnet_enable","wan_telnet_Flag")
	TCWebApi_set("Firewall_Entry","wan_ftp_enable","wan_ftp_Flag")
	TCWebApi_set("Firewall_Entry","wan_https_enable","wan_https_Flag")
	TCWebApi_set("Firewall_Entry","wan_snmp_enable","wan_snmp_Flag")
	TCWebApi_set("Firewall_Entry","wan_tftp_enable","wan_tftp_Flag")
	TCWebApi_commit("Firewall_Entry")
	TCWebApi_save()
end if

if Request_Form("Fire_LAN_Flag") = "1" then 

	TCWebApi_unset("Firewall_Entry")
	TCWebApi_set("Firewall_Entry","lan_http_enable","lan_http_Flag")
	TCWebApi_set("Firewall_Entry","lan_ping_enable","lan_ping_Flag")
	'TCWebApi_set("Firewall_Entry","lan_telnet_enable","lan_telnet_Flag")
	TCWebApi_set("Firewall_Entry","lan_ftp_enable","lan_ftp_Flag")
	TCWebApi_set("Firewall_Entry","lan_https_enable","lan_https_Flag")
	TCWebApi_set("Firewall_Entry","lan_snmp_enable","lan_snmp_Flag")
	TCWebApi_set("Firewall_Entry","lan_tftp_enable","lan_tftp_Flag")
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
  <title>Remote Access Configuration</title>
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
  <script data-main="/scripts/app/app" src="/scripts/lib/require.js"></script>
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

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
<SCRIPT language=JavaScript type=text/javascript>

function LoadFrame()
{
	if (curUserName != sptUserName)
    {
      var notChange = false;
      <%if TCWebApi_get("Account_Entry1","default_pwd","h" ) = "" then%>
        <%if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then%>
          notChange = true;
        <% end if %>
      <%elseif TCWebApi_get("Account_Entry1","default_pwd","h" ) = "N/A" then%>
        <%if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then%>
          notChange = true;
        <% end if %>
      <%else%>
        <%if TCWebApi_get("Info_Ether","passwd_equ","h" ) = "1" then%>
          notChange = true;
        <% end if %>
      <% end if %>

      if(notChange)
      {
        with ( document.ConfigForm )
        {
          setDisable('wanHttpsEnable',1);
          setDisable('wanFtpEnable',1);
          setDisable('wanTftpEnable',1);
          setDisable('wanPingEnable',1);
          setDisable('wanSnmpEnable',1);
        }
      }
	}
    setDisable('lanTelnetEnable',1);
    setDisable('wanTelnetEnable',1);
}
function btnSubmit(index)
{	
	var Form = document.ConfigForm;
	if(Form.wanHttpEnable.checked)
	{
		Form.wan_http_Flag.value = "1";
	}
	if(Form.wanHttpsEnable.checked)
	{
		Form.wan_https_Flag.value = "1";
	}
	if(Form.wanFtpEnable.checked)
	{
		Form.wan_ftp_Flag.value = "1";
	}
	if(Form.wanTftpEnable.checked)
	{
		Form.wan_tftp_Flag.value = "1";
	}
	if(Form.wanPingEnable.checked)
	{
		Form.wan_ping_Flag.value = "1";
	}
	if(Form.wanTelnetEnable.checked)
	{
		Form.wan_telnet_Flag.value = "1";
	}
	if(Form.wanSnmpEnable.checked)
	{
		Form.wan_snmp_Flag.value = "1";
	}
	Form.Fire_WAN_Flag.value = "1";

	if(Form.lanHttpEnable.checked)
	{
		Form.lan_http_Flag.value = "1";
	}
	if(Form.lanHttpsEnable.checked)
	{
		Form.lan_https_Flag.value = "1";
	}
	if(Form.lanFtpEnable.checked)
	{
		Form.lan_ftp_Flag.value = "1";
	}
	if(Form.lanTftpEnable.checked)
	{
		Form.lan_tftp_Flag.value = "1";
	}
	if(Form.lanPingEnable.checked)
	{
		Form.lan_ping_Flag.value = "1";
	}
	if(Form.lanTelnetEnable.checked)
	{
		Form.lan_telnet_Flag.value = "1";
	}
	if(Form.lanSnmpEnable.checked)
	{
		Form.lan_snmp_Flag.value = "1";
	}
	
	Form.Fire_LAN_Flag.value = "1";
    document.ConfigForm.SaveAlter_Flag.value = "1";
	Form.submit();
	//showLoading(); 
}
function RemoteEnableClick(aclEnable)
{
	if(aclEnable.checked)
	{
		var curUser = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
		var notAllow = false;
		if(curUser == "0")
		{
			<%if TCWebApi_get("Account_Entry0","web_passwd","h" ) = "$!%^w0r)(D4m9T$" then%>
				notAllow = true;
			<% end if %>
		}
		else if(curUser == "1")
		{
			<%if TCWebApi_get("Account_Entry1","default_pwd","h" ) = "" then%>
				<%if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then%>
					notAllow = true;
				<% end if %>
			<%elseif TCWebApi_get("Account_Entry1","default_pwd","h" ) = "N/A" then%>
				<%if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then%>
					notAllow = true;
				<% end if %>
			<%else%>
				<%if TCWebApi_get("Info_Ether","passwd_equ","h" ) = "1" then%>
					notAllow = true;
				<% end if %>
			<% end if %>
		}
		if(notAllow)
		{
			alert("Sorry,  please change your web login password before enable remote WAN access.");
			aclEnable.checked = false;
			return false;
		}
	}
}
</SCRIPT>
<!-- content -->
  <div class="container-full container-resize-height">
    <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/Remote-Access-Configuration.asp" method="post">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
	<input type="hidden" name="wan_http_Flag" value="0">
	<input type="hidden" name="wan_ping_Flag" value="0">
	<input type="hidden" name="wan_telnet_Flag" value="0">
	<input type="hidden" name="wan_https_Flag" value="0">
	<input type="hidden" name="wan_ftp_Flag" value="0">
	<input type="hidden" name="wan_tftp_Flag" value="0">
	<input type="hidden" name="wan_snmp_Flag" value="0">
	<input type="hidden" name="Fire_WAN_Flag" value="0"> 
	
	<input type="hidden" name="lan_http_Flag" value="0">
	<input type="hidden" name="lan_ping_Flag" value="0">
	<input type="hidden" name="lan_telnet_Flag" value="0">
	<input type="hidden" name="lan_https_Flag" value="0">
	<input type="hidden" name="lan_ftp_Flag" value="0">
	<input type="hidden" name="lan_tftp_Flag" value="0">
	<input type="hidden" name="lan_snmp_Flag" value="0">
	<input type="hidden" name="Fire_LAN_Flag" value="0">   
	  <div class="title-text">Remote Access Configuration</div>
	  <div class="title-description-text" style="padding-bottom: 0!important;">This page is used to enable/disable management services for the LAN and WAN.</div>
	  <div class="title-description-text">Note:Remote access to this GUI availavle only if password changed and HTTP-wan enabled.</div>
	  <div class="card-table-content">
		  <table style="width:100%">
			  <tr class="table-header center">
				  <th style="width: 30%;">ServiceName</th>
				  <th style="width: 35%;">LAN</th>
				  <th style="width: 35%;">WAN</th>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">TELNET</td>
				  <td><input class="form chackbox" type="checkbox" name="lanTelnetEnable" <%if tcWebApi_get("Firewall_Entry","lan_telnet_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanTelnetEnable" onclick="RemoteEnableClick(this)" <%if tcWebApi_get("Firewall_Entry","wan_telnet_enable","h") = "1" then asp_Write("checked") end if%>></td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">FTP</td>
				  <td><input class="form chackbox" type="checkbox" name="lanFtpEnable" <%if tcWebApi_get("Firewall_Entry","lan_ftp_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanFtpEnable" onclick="RemoteEnableClick(this)" <%if tcWebApi_get("Firewall_Entry","wan_ftp_enable","h") = "1" then asp_Write("checked") end if%>></td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">TFTP</td>
				  <td><input class="form chackbox" type="checkbox" name="lanTftpEnable" <%if tcWebApi_get("Firewall_Entry","lan_tftp_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanTftpEnable" onclick="RemoteEnableClick(this)" <%if tcWebApi_get("Firewall_Entry","wan_tftp_enable","h") = "1" then asp_Write("checked") end if%>></td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">HTTP</td>
				  <td><input class="form chackbox" type="checkbox" name="lanHttpEnable" <%if tcWebApi_get("Firewall_Entry","lan_http_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanHttpEnable" onclick="RemoteEnableClick(this)" disabled <%if tcWebApi_get("Firewall_Entry","wan_http_enable","h") = "1" then asp_Write("checked") end if%>></td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">HTTPS</td>
				  <td><input class="form chackbox" type="checkbox" name="lanHttpsEnable" <%if tcWebApi_get("Firewall_Entry","lan_https_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanHttpsEnable" onclick="RemoteEnableClick(this)" <%if tcWebApi_get("Firewall_Entry","wan_https_enable","h") = "1" then asp_Write("checked") end if%>></td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">SNMP</td>
				  <td><input class="form chackbox" type="checkbox" name="lanSnmpEnable" <%if tcWebApi_get("Firewall_Entry","lan_snmp_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanSnmpEnable" onclick="RemoteEnableClick(this)" <%if tcWebApi_get("Firewall_Entry","wan_snmp_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  </td>
			  </tr>
			  <tr class="center">
				  <td class=" p-1 text-content">Ping</td>
				  <td><input class="form chackbox" type="checkbox" name="lanPingEnable" <%if tcWebApi_get("Firewall_Entry","lan_ping_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  <td><input class="form chackbox" type="checkbox" name="wanPingEnable" <%if tcWebApi_get("Firewall_Entry","wan_ping_enable","h") = "1" then asp_Write("checked") end if%>></td>
				  </td>
			  </tr>
		  </table>
	  </div>
	  <div class="mt-2 center">
		  <button id="apply" type="button" name="apply" class="btn-dashboard" onclick="btnSubmit();">Apply Changes</button>
	  </div>
    </form>
  </div>
<!-- content -->
</body>

</html>