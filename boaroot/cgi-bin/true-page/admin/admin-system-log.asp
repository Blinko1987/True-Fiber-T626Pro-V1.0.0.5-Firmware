<%
If Request_Form("clearSyslogFlag")="1" then 
  TCWebApi_set("SysLog_Entry","clearSyslog","clearSyslogFlag")
  TCWebApi_commit("SysLog_Entry")
  TCWebApi_save()
End If

If Request_Form("save_flag")="1" then 
  TCWebApi_set("SysLog_Entry","LogEnable","SyslogEnable_flag")
  TCWebApi_set("SysLog_Entry","advancedLogEnable","advancedSyslogEnable_flag")
if Request_Form("loglevelchange")="1" then 
  TCWebApi_set("SysLog_Entry","WriteLevel","loglevel")
  TCWebApi_set("SysLog_Entry","moduleType","moduleStr")
  TCWebApi_set("SysLog_Entry","DisplayLevel","LogLevel2")
  TCWebApi_set("SysLog_Entry","remoteSyslogEnable","remoteSyslogEnableflag")
  TCWebApi_set("SysLog_Entry","tftpLogEnabled","tftpLogEnableflag")
if Request_Form("remoteSyslogEnableflag")="1" then 
  TCWebApi_set("SysLog_Entry","remoteHost","remoteHostValue")
end if
if Request_Form("tftpLogEnableflag")="1" then 
  TCWebApi_set("SysLog_Entry","tftpLogServer","tftpLogServerValue")
end if
end if
  TCWebApi_commit("SysLog_Entry")
  TCWebApi_save()
End If

If Request_Form("tftpSaveflag")="1" then 
  TCWebApi_set("SysLog_Entry","tftpLogEnabled","tftpLogEnableflag")
  TCWebApi_set("SysLog_Entry","tftpLogServer","tftpLogServer")
  TCWebApi_set("SysLog_Entry","tftpSave","tftpSaveflag")
  TCWebApi_commit("SysLog_Entry")
  TCWebApi_save()
End If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - System Log</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <link rel="stylesheet" href="/css/ui-dialog.css">
  <LINK rel="stylesheet" href="/css/stylemain_skyw.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script language=javascript src="/scripts/lib/dialog-min.js"></script>
  <SCRIPT language=javascript src="/scripts/utils/util_skyw.js"></SCRIPT>
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
  
 <SCRIPT language=javascript>
function LoadFrame()
{
	var vForm = document.ConfigForm;
	var logEnableV = "<% TCWebApi_get("SysLog_Entry","LogEnable","s") %>";
	var arrayModule = "<% TCWebApi_get("SysLog_Entry","moduleType","s") %>";
	var moduleFlag = arrayModule.split(",");
	var arrayWriteLevel = "<%TCWebApi_get("SysLog_Entry","WriteLevel","s")%>";
	var writeLevelFlag = arrayWriteLevel.split(",");
	var displaylevel = "<%TCWebApi_get("SysLog_Entry","DisplayLevel","s")%>";
	
	if(logEnableV == "No")
	{
		SetLogDisable();
	}
    SettftpEnable();
    SetremoteEnable();
	if(writeLevelFlag[0] != undefined && writeLevelFlag[0] != "" && writeLevelFlag[0] >= 0 && writeLevelFlag[0] <= 6)
	{
		vForm.LogLevel1.value = writeLevelFlag[0];
		if(writeLevelFlag[0] == "4" && writeLevelFlag[1] == "2")
		{
			vForm.LogLevel1.value = "7";
		}
	}
	
	vForm.LogLevel2.value = displaylevel;
}

function SubmitChange(num)
{
  if(document.ConfigForm.Enable.checked)
  {
    if(document.ConfigForm.remoteSyslogEnable.checked)
    {
      if(!isAbcIpAddress(document.ConfigForm.remoteHost.value))
      {
        alert("Invalid Log Server IP Address.");
        return false;
      }
      if(document.ConfigForm.remoteHost.value == "" )
      {
        alert("Invalid TFTP Server IP Address.");
        return false;
      }
      document.ConfigForm.remoteSyslogEnableflag.value = "1";
      document.ConfigForm.remoteHostValue.value = document.ConfigForm.remoteHost.value;
    }
    if(document.ConfigForm.tftpLogEnabled.checked)
    {
      if(!isAbcIpAddress(document.ConfigForm.tftpLogServer.value))
      {
        alert("Invalid TFTP Server IP Address.");
        return false;
      }
      if(document.ConfigForm.tftpLogServer.value == "" )
      {
        alert("Invalid TFTP Server IP Address.");
        return false;
      }
      document.ConfigForm.tftpLogEnableflag.value = "1";
      document.ConfigForm.tftpLogServerValue.value = document.ConfigForm.tftpLogServer.value;
      if(num == 2)
      {
        document.ConfigForm.tftpSaveflag.value = "1";
      }
    }
  
    var levelFlag;
    var moduleFlag;
    document.ConfigForm.loglevelchange.value = "1";
    levelFlag = document.ConfigForm.LogLevel1.value;
    if(levelFlag == "3")
    {
      document.ConfigForm.loglevel.value = "3" + ",0" + ",1" + ",1" + ",1";
    }else if(levelFlag == "4")
    {
      document.ConfigForm.loglevel.value = "4" + ",1" + ",1" + ",1" + ",1";
    }else if(levelFlag == "5")
    {
      document.ConfigForm.loglevel.value = "5" + ",3" + ",3" + ",3" + ",3";
    }else if(levelFlag == "6")
    {
      document.ConfigForm.loglevel.value = "6" + ",4" + ",4" + ",1" + ",1";
    }else if(levelFlag == "7")
    {
      document.ConfigForm.loglevel.value = "4" + ",2" + ",3" + ",4" + ",4";
    }else
    {
      document.ConfigForm.loglevel.value = levelFlag + "," + levelFlag + "," + levelFlag + "," + levelFlag + "," + levelFlag;
    }
    
    if(levelFlag == "0")
    {
      moduleFlag = "1" + ",0" + ",1" + ",1" + ",1";
    }
    else
    {
      moduleFlag = "1" + ",1" + ",1" + ",1" + ",1";
    }
    document.ConfigForm.moduleStr.value = moduleFlag;
  }
  document.ConfigForm.save_flag.value="1";
  document.ConfigForm.SaveAlter_Flag.value = "1";
  document.ConfigForm.submit();
  //showLoading();
}

function Back_Syslog()
{
	var cfg = '/syslog.txt';
	var code ;
	var SyslogEnable = "<% TCWebApi_get("SysLog_Entry","LogEnable","s") %>";
	if (SyslogEnable == "Yes")
	{
		code = 'location.assign("'+cfg+'")';
		eval(code);
	}
}
function Clear_Syslog()
{
	document.SaveClearForm.clearSyslogFlag.value = "1";
	document.SaveClearForm.submit();
	showLoading();
}

function SettftpEnable()
{
    if(document.ConfigForm.tftpLogEnabled.checked)
      setDisplay("tftpinput",1);
    else
      setDisplay("tftpinput",0);
}

function SetremoteEnable()
{
    if(document.ConfigForm.remoteSyslogEnable.checked)
      setDisplay("remoteinput",1);
    else
      setDisplay("remoteinput",0);
}

function SetLogEnable()
{
    var vForm = document.ConfigForm;
    if(vForm.Enable.checked)
    {
      vForm.SyslogEnable_flag.value="Yes";
      vForm.advancedSyslogEnable_flag.value="1";
      vForm.Disable.checked=false;
      setDisplay("divtftplog",1);
      setDisplay("divremotelog",1);
      setDisplay("divlogLevel",1);
      setDisplay("divDisplayLevel",1);
	}
}
function SetLogDisable()
{
    var vForm = document.ConfigForm;
    if(vForm.Disable.checked)
    {
      vForm.SyslogEnable_flag.value="No";
      vForm.advancedSyslogEnable_flag.value="0";
      vForm.Enable.checked=false;
      setDisplay("divtftplog",0);
      setDisplay("divremotelog",0);
      setDisplay("divlogLevel",0);
      setDisplay("divDisplayLevel",0);
	}
}
function RefreshPage()
{
	location.href = document.location.href;
}
</SCRIPT>
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
<!-- content -->
  <div class="container-full container-resize-height">
    <FORM name="ConfigForm" action="/cgi-bin/true-page/admin/admin-system-log.asp" method="post" >
      <INPUT TYPE="HIDDEN" NAME="advancedSyslogEnable_flag" VALUE="<% TCWebApi_get("SysLog_Entry","advancedLogEnable","s") %>">
      <INPUT TYPE="HIDDEN" NAME="loglevel" VALUE="<%TCWebApi_get("SysLog_Entry","WriteLevel","s")%>">
      <INPUT TYPE="HIDDEN" NAME="moduleStr" VALUE="<% TCWebApi_get("SysLog_Entry","moduleType","s") %>">
      <INPUT TYPE="HIDDEN" NAME="loglevelchange" VALUE="0">
      <INPUT TYPE="HIDDEN" NAME="tftpLogEnableflag" VALUE="0">
      <INPUT TYPE="HIDDEN" NAME="tftpSaveflag" VALUE="0">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <INPUT TYPE="HIDDEN" NAME="up_flag" value="0">
      <INPUT TYPE="HIDDEN" NAME="remoteSyslogEnableflag" VALUE="0">
      <INPUT TYPE="HIDDEN" NAME="remoteHostValue" VALUE="<%if TCWebApi_get("SysLog_Entry","remoteHost","h") <> "N/A" then TCWebApi_get("SysLog_Entry","remoteHost","s") end if %>">
      <INPUT TYPE="HIDDEN" NAME="tftpLogServerValue" VALUE="<%if TCWebApi_get("SysLog_Entry","tftpLogServer","h") <> "N/A" then TCWebApi_get("SysLog_Entry","tftpLogServer","s") end if %>">
      <INPUT TYPE="HIDDEN" NAME="save_flag" value="0">
      <div class="title-text">System Log</div>
      <div class="title-description-text">This page is used to monitor activities of your system.</div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">System Log:</div>
        </div>
        <div class="col-6">
          <input type="radio" onclick="SetLogEnable()" name="Enable" <% if TCWebApi_get("SysLog_Entry","LogEnable","h") = "Yes" then asp_Write("checked") end if %> >
          <label class="input-radio">Enabled</label>
          <input type="radio" onclick="SetLogDisable()" name="Disable" <% if TCWebApi_get("SysLog_Entry","LogEnable","h") = "No" then asp_Write("checked") end if %> >
          <label class="input-radio">Disabled</label>
          <input TYPE="HIDDEN" NAME="SyslogEnable_flag" VALUE="<% TCWebApi_get("SysLog_Entry","LogEnable","s") %>">
        </div>
      </div>
      <div id="divremotelog">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Enable Remote Log:</div>
          </div>
          <div class="col-6">
            <input type="checkbox" onclick="SetremoteEnable()" name="remoteSyslogEnable" <% If TCWebApi_get("SysLog_Entry","remoteSyslogEnable","h") = "1" then asp_Write("checked") end if %>>
          </div>
        </div>
        <div id="remoteinput" class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Log Server IP Address:</div>
          </div>
          <div class="col-4">
            <input type="text" class="form-control input-textfield" name="remoteHost" value="<%if TCWebApi_get("SysLog_Entry","remoteHost","h") <> "N/A" then TCWebApi_get("SysLog_Entry","remoteHost","s") end if %>" size="13" maxlength="16">
          </div>
        </div>
      </div>
      <div id="divtftplog">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Enable TFTP:</div>
          </div>
          <div class="col-6">
            <input type="checkbox" onclick="SettftpEnable()" name="tftpLogEnabled" <% If TCWebApi_get("SysLog_Entry","tftpLogEnabled","h") = "1" then asp_Write("checked") end if %>>
          </div>
        </div>
        <div id="tftpinput" class="row p-1">
          <div class="col-6">
            <div class="title-text-left">TFTP Server IP Address:</div>
          </div>
          <div class="col-4">
            <input type="text" class="form-control input-textfield" name="tftpLogServer" value="<%if TCWebApi_get("SysLog_Entry","tftpLogServer","h") <> "N/A" then TCWebApi_get("SysLog_Entry","tftpLogServer","s") end if %>" size="13" maxlength="16">
          </div>
          <div>
            <input class="btn-file" onclick="SubmitChange(2)" type="button" value="Upload" name="buttonUpload">
          </div>
        </div>
      </div>
      <div id="divlogLevel" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Log Level:</div>
        </div>
        <div class="col-6">
          <select id="LogLevel1" name="LogLevel1" class="form-control input-select">
            <option value="0">No Message</option>
            <option value="1">Error</option>
            <option value="2">Warning</option>
            <option value="3" selected>Emergency</option>
            <option value="4">Notice</option>
            <option value="5">Trace</option>
            <option value="6">Debugging</option>
            <option value="7">Informational</option>
          </select>
        </div>
      </div>
	  <div id="divDisplayLevel" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Display Level:</div>
        </div>
        <div class="col-6">
          <select id="LogLevel2" name="LogLevel2" class="form-control input-select">
            <option value="0">Emergency</option>
            <option value="1">Alert</option>
            <option value="2">Critical</option>
            <option value="3" selected>Error</option>
            <option value="4">Warning</option>
            <option value="5">Notice</option>
            <option value="6">Informational</option>
            <option value="7">Debugging</option>
          </select>
        </div>
      </div>
          <div class="mb-3 center">
        <button id="apply" type="button" name="apply" class="btn-dashboard" onclick="SubmitChange(1);">Apply</button>
      </div>
    </FORM>
    <hr>
    <FORM id="SaveClearForm" name="SaveClearForm" action="/cgi-bin/true-page/admin/admin-system-log.asp" method="post">
      <input type="hidden" name="clearSyslogFlag" value="0"> 
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Save Log to File:</div>
        </div>
        <div class="col-6 left">
          <button id="SysLogSave" name="SysLogSave" type="button" class="btn-file" onClick="Back_Syslog()">Save</button>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Clear Log:</div>
        </div>
        <div class="col-6 left">
          <button id="SysLogClear" name="SysLogClear" type="button" class="btn-file" onClick="Clear_Syslog()">Reset</button>
        </div>
      </div>
    </FORM>
    <hr>
    <div class="card-table-content" style="height:360px;">
      <table style="width:100%">
        <tr class="table-header left">
          <th class="p-1" colspan="3">System Log</th>
        </tr>
        <tr class="table-content-fist left">
          <td style="width: 15%;">Date/Time</td>
          <td style="width: 15%;">Level</td>
          <td style="width: 70%;">Message</td>
        </tr>
        <tbody>
          <tr>
            <td colspan="3">
              <TEXTAREA style="width:100%; height:308px;" id="syslogWrite"></TEXTAREA>
            </td>
          </tr>
        </tbody>
      </table>
      <iframe src="/cgi-bin/true-page/admin/syslog.cgi" frameborder="0" scrolling="no" width="10" height="10" align=left></iframe>
    </div>
    <div class="mt-3 mb-3 center">
      <button id="SysLogRefresh" name="SysLogRefresh" class="btn-dashboard" onclick="RefreshPage()">Refresh</button>
    </div>
  </div>
<!-- content -->
</body>
</html>