<%
if Request_Form("remoteflag")="1" then
  TCWebApi_set("WebCurSet_Entry","nat_pvc","RemoteEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","webacl_ifidx","RemoteEntryCurIndex")
  TCWebApi_commit("WebCurSet_Entry")

  TCWebApi_set("Webacl_Entry","IFName","RemoteInterface")
  TCWebApi_set("Webacl_Entry","Active","EnableRemote_Flag")
  TCWebApi_set("Webacl_Entry","webaclport","RemotePort")
  TCWebApi_set("Webacl_Entry","webacltime","RemoteTime")
  TCWebApi_commit("Webacl_Entry")
if Request_Form("EnableRemote_Flag")="Yes" then
  tcWebApi_constSet("Firewall_Entry","wan_http_enable","1")
else
  tcWebApi_constSet("Firewall_Entry","wan_http_enable","0")
end If
  TCWebApi_commit("Firewall_Entry")
  TCWebApi_save()
end If
if Request_Form("remoteflag")="2" then
  TCWebApi_set("WebCurSet_Entry","nat_pvc","RemoteEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","webacl_ifidx","RemoteEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","nat_ifidx","RemoteEntryCurIndex")
end If

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Remote Management</title>
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
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
  <!-- content -->
<SCRIPT language=JavaScript type=text/javascript>
var IfaceNumber = 0;
var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
var vEntryName = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
var vEntryValue = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
var vEntryIndex = vArrayStr.split(',');

vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
vEntryValue = SortUtil.SortMyArray( vEntryValue );
vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
var SIPProxyPort = "<%if tcWebApi_get("VoIPBasic_Common", "SIPProxyPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPProxyPort", "s") else asp_Write("0") end if %>";
var LocalSIPPort = "<%if tcWebApi_get("VoIPBasic_Common", "LocalSIPPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "LocalSIPPort", "s") else asp_Write("0") end if %>";


var PortMapping = new Array();
var indexPortMapping = 0;
var MAX_VIRSERVER_NUM = 10;
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatActive = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatProtocal = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatSrcIP = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatSTARTPORT = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatENDPORT = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatLOCALIP = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatMapName = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatINPORT = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
var vNatINENDPORT = vArrayStr.split(',');
for (j = 0; j < MAX_VIRSERVER_NUM; j++)
{
  if(vNatActive[j] == "Yes" || vNatActive[j] == "No")
  {
    PortMapping[indexPortMapping] = new stPortMap(j,vNatActive[j],vNatProtocal[j],vNatSrcIP[j],vNatSTARTPORT[j],vNatENDPORT[j],vNatINPORT[j],vNatLOCALIP[j],vNatMapName[j],vNatINENDPORT[j]);
    indexPortMapping++;
  }
}

function stPortMap(domain,ProtMapEnabled,Protocol,RemoteHost,ExPort,ExEndPort,InPort,InClient,Description,InEndPort)
{
  domain = ""+domain;	
  this.domain = domain;
  this.key = this.domain;
  this.ProtMapEnabled = ProtMapEnabled;
  this.Protocol = Protocol;
  this.RemoteHost = RemoteHost;
  this.ExPort = ExPort;
  this.InPort = InPort;
  this.InClient = InClient;
  this.Description = Description;
  if(Protocol == "N/A"){
    this.Protocol = "";
  }else{
    this.Protocol = Protocol;
  }
  if(RemoteHost == "N/A"){
    this.RemoteHost = "";
  }else{
    this.RemoteHost = RemoteHost;
  }
  if(ExPort == "N/A"){
    this.ExPort = "";
  }else{
    this.ExPort = ExPort;
  }
  if(ExEndPort == "N/A"){
    this.ExEndPort = "";
  }else{
    this.ExEndPort = ExEndPort;
  }
  if(InPort == "N/A"){
    this.InPort = "";
  }else{
    this.InPort = InPort;
  }
  if(InEndPort == "N/A"){
    this.InEndPort = "";
  }else{
    this.InEndPort = InEndPort;
  }
  if(InClient == "N/A"){
    this.InClient = "";
  }else{
    this.InClient = InClient;
  }
  if(Description == "N/A"){
    this.Description = "";
  }else{
    this.Description = Description;
  }
  var index = domain.lastIndexOf('PortMapping');
  this.interface = domain.substr(0,index - 1);
  this.interface = domain;
  this.NATEnabled = '';
  this.Enable = '';
}
console.log(PortMapping);

function LoadFrame()
{
  var CurInterface_index = "<% tcWebApi_get("WebCurSet_Entry","webacl_ifidx","s") %>";
  var remoteEnable = "<% tcWebApi_get("Webacl_Entry","Active","s") %>";
  var flag = false;
  var num = 0;
  var first_index = 0;
  var LanIP = "<%tcWebApi_get("Lan_Entry","IP","s")%>";
  var Ipv6LanIP = "<%tCWebApi_get("Lan_Entry", "IP6", "s")%>";
  var Ipv6LanIP_distribute = "<%tCWebApi_get("WanInfo_WanIF", "TrueBr0Addr", "s")%>";
  var AccessIP = "<%tcWebApi_get("WebCurSet_Entry","AccessIp","s")%>";
  var index = Ipv6LanIP_distribute.indexOf("/");
  var Ipv6LanIP_distribute_temp = Ipv6LanIP_distribute.substring(0,index);

  if((LanIP != AccessIP) && (Ipv6LanIP != AccessIP) && (Ipv6LanIP_distribute_temp != AccessIP))	
  {
     $("input[name='RemoteManageEnable']").attr("disabled","disabled");
  }
  for (i = 0; i < nEntryNum; i++)
  {
    if( ( vEntryName[i].indexOf('_INTERNET_') >= 0 || vEntryName[i].indexOf('OTHER') >= 0 )
      && vEntryName[i].indexOf('_B_') < 0 )
    {
      if(num == 0)
      {
        first_index = vEntryIndex[i];
      }
      if(vEntryIndex[i] == CurInterface_index)
      {
        flag = true;
      }
      num++;
    }
  }
  if(num > 0 && flag == false)
  {
    document.ConfigForm.remoteflag.value = "2";
    document.ConfigForm.RemoteEntryCurIndex.value = first_index;
    document.ConfigForm.submit();
  }
  
  if(remoteEnable == "Yes"){
    $("#RemoteManageContent").show();
  }else{
    $("#RemoteManageContent").hide();
  }
}
function getEntryIndex(ctl)
{
  for (i = 0; i < nEntryNum; i++)
  {
    if (getSelectVal(ctl) == vEntryValue[i])
      return vEntryIndex[i];
  }
  return 999;
}
function getEntryValue(idx)
{
  for (i = 0; i < nEntryNum; i++)
  {
    if (idx == vEntryIndex[i])
      return vEntryValue[i];
  }
  return 999;
}
function WriteWanName()
{
  var selObj = getElById("RemoteInterface");
  var CurInterface_index = document.ConfigForm.RemoteEntryCurIndex.value;

  for (i = 0; i < nEntryNum; i++)
  {
    if( ( vEntryName[i].indexOf('_INTERNET_') >= 0 || vEntryName[i].indexOf('OTHER') >= 0 )
      && vEntryName[i].indexOf('_B_') < 0 )
    {
      IfaceNumber ++;
      if(vEntryIndex[i] == CurInterface_index)
      {
        document.writeln("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +" selected>" + vEntryValue[i] + "</option>");
      }
      else
      {
        document.writeln("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +">" + vEntryValue[i] + "</option>");
      }
    }
  }
}
function WriteWanNameSelected()
{
  document.ConfigForm.remoteflag.value = "2";
  document.ConfigForm.RemoteEntryCurIndex.value = getEntryIndex('RemoteInterface');
  document.ConfigForm.submit();
  showLoading();
}

function OnOK()
{
  if(IfaceNumber==0){
    alert("No Wan configuration!");
    return false;
  }

  var remotePort = document.ConfigForm.RemotePort.value;
  var remoteTime = document.ConfigForm.RemoteTime.value;
  if (isValidPort(remotePort) == false)
  {
    alert("Port "+remotePort + ' is invalid.');
    return false;
  }
  if((parseInt(remotePort) < 1024) && (parseInt(remotePort) != 80))
  {
    alert("Port "+remotePort + ' can not be less than 1024.');
    return false;
  }
  if((parseInt(remoteTime) < 1) || (parseInt(remoteTime) > 1440))
  {
    alert("Time value ranges from 1 to 1440 minutes.");
    return false;
  }
  if(parseInt(remotePort) == parseInt(SIPProxyPort)
    || parseInt(remotePort) == parseInt(LocalSIPPort))
  {
    alert("Port "+remotePort + ' can not be SIP Port.');
    return false;
  }

  for (i = 0; i < PortMapping.length; i++)
  {
    var exPort = PortMapping[i].ExPort;
    var ExEndPort = PortMapping[i].ExEndPort;
    var msg = "Sorry, port " + remotePort + " is configured in Port-Forwarding already.";
    if(ExEndPort != ""){
      if( (parseInt(remotePort) >= parseInt(exPort)) && (parseInt(remotePort) <= parseInt(ExEndPort)) ){
        alert(msg);
        return false;
      }
    }else{
      if( parseInt(remotePort) == parseInt(exPort) ){
        alert(msg);
        return false;
      }
    }
  }

  if(document.ConfigForm.RemoteManageEnable.checked)
    document.ConfigForm.EnableRemote_Flag.value = "Yes";
  else
    document.ConfigForm.EnableRemote_Flag.value = "No";
  document.ConfigForm.RemoteEntryCurIndex.value = getEntryIndex('RemoteInterface');
  document.ConfigForm.remoteflag.value = "1";
  document.ConfigForm.SaveAlter_Flag.value = "1";
  document.ConfigForm.submit();
  //showLoading();
}
  
function RemoteEnableClick()
{
  if(document.ConfigForm.RemoteManageEnable.checked)
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
      alert("Sorry,  please change your web login password before enable remote Web access.");
      document.ConfigForm.RemoteManageEnable.checked = false;
      return false;
    }else{
      $("#RemoteManageContent").show();
    }
  }else{
    $("#RemoteManageContent").hide();
  }
}
</SCRIPT>
  <div class="container-full container-resize-height">
    <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/Remote-Management.asp" method="post">
    <INPUT TYPE="HIDDEN" NAME="remoteflag" VALUE="0">
    <input type="hidden" name="EnableRemote_Flag" value="<% tcWebApi_get("Webacl_Entry","Active","s") %>">
    <input type="hidden" name="RemoteEntryCurIndex" value="<% tcWebApi_get("WebCurSet_Entry","webacl_ifidx","s") %>">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
    <div class="title-text">Remote Management</div>
    <div class="title-description-text">This page is used to enable/disable Remote Management services.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left" >HTTP Enable:</div>
      </div>
      <div class="col-6">
        <input type="checkbox" value="checkbox" name="RemoteManageEnable" onclick="RemoteEnableClick()" <%if tcWebApi_get("Webacl_Entry","Active","h") = "Yes" then asp_Write("checked") end if%>>
      </div>
    </div>

    <div id="RemoteManageContent" style="display: none;">
      <div class="row p-1">
        <div class="col-6">
        <input type="checkbox" name='ifStr' checked style="display:none;">
        <div class="title-text-left">Interface:</div>
        </div>
        <div class="col-6">
        <select class="form-control input-select" name="RemoteInterface" id="RemoteInterface" onChange="WriteWanNameSelected();">
        <script language="javascript">
        WriteWanName();
        </script>
        </select>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">HTTP WAN Port:</div>
        </div>
        <div class="col-6">
          <input class="form-control input-textfield " type="text" maxLength=63 name="RemotePort" value="<%if TCWebApi_get("Webacl_Entry","webaclport","h" ) <> "N/A" then TCWebApi_get("Webacl_Entry","webaclport","s" ) else asp_Write("80") end if %>">
        </div>
      </div>
      
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Session Timeout:</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield " type="text" maxLength=63 name="RemoteTime" value="<%if TCWebApi_get("Webacl_Entry","webacltime","h" ) <> "N/A" then TCWebApi_get("Webacl_Entry","webacltime","s" ) else asp_Write("5") end if %>">
        </div>
        	<div class="title-text-right">1~1440 Minutes</div>
      </div>
    </div>

    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" id="btnOK" onclick="OnOK()">Apply Changes</button>
    </div>
  </form>
  </div>
  <!-- content -->
</body>

</html>