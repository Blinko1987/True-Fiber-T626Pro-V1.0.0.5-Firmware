<%
if Request_Form("DMZ_Flag") = "1" then
	TCWebApi_set("WebCurSet_Entry","nat_pvc","DMZEntryCurIndex")
	TCWebApi_set("WebCurSet_Entry","dmz_ifidx","DMZEntryCurIndex")
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_set("Dmz_Entry","IFName","DMZInterface")
	TCWebApi_set("Dmz_Entry","Active","DMZEnable")
	TCWebApi_set("Dmz_Entry","DMZ_IP","DMZHostIPAddress")
	TCWebApi_commit("Dmz_Entry")
	tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>DMZ Configuration</title>
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
<SCRIPT language=javascript>
var DmzState = "<% tcWebApi_get("Dmz_Entry","Active","s") %>";

var WanInfo = new Array();
var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
var vEntryName = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
var vEntryValue = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_VidPRI","s") %>";
var vEntryVlan = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
var vEntryIndex = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Actives","s") %>";
var vActive = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
var vNATENABLE = vArrayStr.split(',');

//sort
vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
vEntryValue = SortUtil.SortMyArray( vEntryValue );
vEntryVlan = SortUtil.SortMyArray( vEntryVlan );
vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
vActive = SortUtil.SortMyArray( vActive );
vNATENABLE = SortUtil.SortMyArray( vNATENABLE );

nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
var vDMZActive = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","DmzCycleValue","s") %>";
var vDMZIP = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","AutoDMZ_Flag","s") %>";
var vDMZAuto = vArrayStr.split(',');

//sort
vDMZActive = SortUtil.SortMyArray( vDMZActive );
vDMZIP = SortUtil.SortMyArray( vDMZIP );
vDMZAuto = SortUtil.SortMyArray( vDMZAuto );
	
vArrayStr = "<% tcWebApi_get("WanInfo_Common","NatLoopbackCycleValue","s") %>";
var vNatLoopbackActive = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","NatLoopbackCycleValue","s") %>";
var vNatLoopbackIP = vArrayStr.split(',');
var natloopbackEnable="<% tcWebApi_get("NatLoopback_Common","Enable","s") %>";
//sort
vNatLoopbackActive = SortUtil.SortMyArray( vNatLoopbackActive );
vNatLoopbackIP = SortUtil.SortMyArray( vNatLoopbackIP );

for (i = 0; i < nEntryNum; i++)
{
	WanInfo[i] = new stWanInfo(vEntryValue[i],vEntryName[i],vActive[i],vNATENABLE[i],vEntryName[i],vEntryName[i],vDMZActive[i],vDMZIP[i],vDMZAuto[i],vNatLoopbackActive[i],vNatLoopbackIP[i]);
}

function stWanInfo(domain,Name,Enable,NATEnabled,ConnectionType,ServiceList,DMZEnable,DMZIP,DMZAuto,NatLoopbackEnable,NatLoopbackIP)
{
	this.domain = domain;
	this.key = this.domain;
	this.Name = Name;
	this.ConnectionType = ConnectionType;
	this.ServiceList = ServiceList;
	if(DMZAuto == "1")
		this.AutoDMZ_Flag = 1;
	else
		this.AutoDMZ_Flag = 0;
	if(DMZEnable == "Yes")
		this.DMZEnable = 1;
	else
		this.DMZEnable = 0;
	if(DMZIP == "N/A"){
		this.DMZIP = "";
	}else{
		this.DMZIP = DMZIP;
	}
	if(Enable == "Yes")
		this.Enable = 1;
	else
		this.Enable = 0;
	if(NATEnabled == "Enable")
		this.NATEnabled = 1;
	else
		this.NATEnabled = 0;		
	if(NatLoopbackEnable == "Yes")
		this.NatLoopbackEnable = 1;
	else
		this.NatLoopbackEnable = 0;
	if(NatLoopbackIP == "N/A"){
		this.NatLoopbackIP = "";
	}else{
		this.NatLoopbackIP = NatLoopbackIP;
	}
	
	this.CntStatus = '';
}

function ShowDMZ()
{
	var	Form = document.ConfigForm;
	var Interface = getElById('DMZInterface');
	var index = Interface.selectedIndex;
  var DmzEnable = getElById("DMZEnable");
  
	if (DmzEnable[0].checked == true)
	{
		getElement('DmzInfo').style.display = "";
	}
	else if (DmzEnable[1].checked == true)
	{
		getElement('DmzInfo').style.display = "none";
  }
  
	if (index >=0)
	{
		var DMZId = Interface.options[index].id;
		index = DMZId.substr(DMZId.indexOf('_') + 1);
		if ((index < 0) || (index >= WanInfo.length))
		{
			return;
		}
		setCheck('DMZEnable',WanInfo[index].DMZEnable);
		setText('DMZHostIPAddress',WanInfo[index].DMZIP);
		if (WanInfo[index].Enable == 0 || WanInfo[index].NATEnabled == 0)
		{
			setDisable('DMZEnable',1);
			setDisable('DMZHostIPAddress',1);	
		}
		else
		{
			setDisable('DMZEnable',0);
			setDisable('DMZHostIPAddress',0);		
		}
	}
}

function LoadFrame()
{
	ShowDMZ();
}

function SetEnable()
{
	var	Form = document.ConfigForm;
	var DmzEnable = getElById("DMZEnable");
	if (DmzEnable[0].checked == true)
	{
		getElement('DmzInfo').style.display = "";
	}
	else if (DmzEnable[1].checked == true)
	{
		getElement('DmzInfo').style.display = "none";
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

function CheckDMZ()
{
	var i = 0;
	var bWANinterface = false;
	var lanip  =  "<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>";
	var lanNetmask  =  "<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>";

	for (i = 0; i < WanInfo.length; i++)
	{
		if((WanInfo[i].ServiceList.indexOf('_TR069_')<0) || (WanInfo[i].ServiceList.indexOf('_INTERNET_')>-1))
		{
			bWANinterface = true;
		}
	}
	if (bWANinterface == false)
	{
		alert('No WAN interface for DMZ, please add WAN interface and configuration!');
		return false;
	}
	with (getElById('ConfigForm'))
	{
		if (getCheckVal('DMZEnable') == 1)
		{
			if (getValue('DMZHostIPAddress') == "")
			{
				alert('DMZ host must not be null.');
				return false;
			}
			else if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
			||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
			{
				alert('Invalid DMZ host.');
				return false;
			}
		}
		else if (getCheckVal('DMZEnable') == 0 && getValue('DMZHostIPAddress') != "")
		{
			if ((isAbcIpAddress(getValue('DMZHostIPAddress'))== false)||(isBroadcastIpAddress(getValue('DMZHostIPAddress'))==true)
			||(isNtwkSgmtIpAddress(getValue('DMZHostIPAddress'))==true))
			{
				alert('Invalid DMZ host.');
				return false;
			}
		}
	}

	if(isEqualSegment(getValue('DMZHostIPAddress'),lanip,lanNetmask))
	{
		alert("DMZ host and LAN IP should be at the same network segment!");
		return false;
	}
	
	return true;
}

function SubmitChange()
{
	var	Form = document.ConfigForm;
	if(CheckDMZ() == false)
	{
		return;
	}
	Form.DMZ_Flag.value = "1";
	Form.DMZEntryCurIndex.value = getEntryIndex('DMZInterface');
    document.ConfigForm.SaveAlter_Flag.value = "1";
	Form.submit();
	showLoading();
}

</SCRIPT>
<!-- content -->
  <div class="container-full container-resize-height">
    <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/DMZ-Configuration.asp" method="post">
	  <input type="hidden" name="EnableDMZ_Flag" value="0">
	  <input type="hidden" name="DMZ_Flag" value="0">
	  <input type="hidden" name="DMZEntryCurIndex" value="0">
	  <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
	  <div class="title-text">DMZ Configuration</div>
	  <div class="title-description-text">A Demilitarized Zone is used to provide Internet services without sacrificing unauthorized access to its local private network. Typically, the DMZ host contains devices accessible to Internet traffic, such as Web (HTTP) servers, FTP servers, SMTP (e-mail) servers and DNS servers.</div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">DMZ Host:</div>
		  </div>
		  <div class="col-6">
			  <input id="DMZEnable" onclick="SetEnable()" type="radio" value="Yes" name="DMZEnable" <% If tcWebApi_get("Dmz_Entry","Active","h") = "Yes" then asp_Write("checked") end if %> >
			  <label class="input-radio">Enable</label>
			  <input id="DMZEnable" onclick="SetEnable()" type="radio" value="No" name="DMZEnable" <% If tcWebApi_get("Dmz_Entry","Active","h") <> "Yes" then asp_Write("checked") end if %> >
			  <label class="input-radio">Disable</label>
		  </div>
	  </div>
	  <div id="DmzInfo">
<SCRIPT language=JavaScript type=text/javascript>
if (DmzState == "No")
{
	getElement('DmzInfo').style.display = "none";
}
</SCRIPT>
	    <div class="row p-1">
		  <div class="col-6">
			  <input type="checkbox" name='ifStr' checked style="display:none;">
			  <div class="title-text-left">Interface:</div>
		  </div>
		  <div class="col-6">
			  <select class="form-control input-select" name="DMZInterface" id="DMZInterface" onChange="ShowDMZ()" maxlength="15">
				<script language="javascript">
				var dmzidx = <% tcWebApi_get("WebCurSet_Entry","dmz_ifidx","s") %>;
				var sel = '';
				for (i = 0; i < nEntryNum; i++)
				{
					if ( i == 0 && dmzidx == 999 )
						sel = 'selected';
					else
						sel = ( dmzidx == vEntryIndex[i] ) ? 'selected' : '';

					if((vEntryName[i].indexOf('_TR069_')<0) || (vEntryName[i].indexOf('_INTERNET_')>-1))
					{
					  if(vEntryVlan[i].indexOf("293") >= 0)
              document.write('<option value=' + vEntryValue[i] + ' id=dmz_' + i + '  ' + sel + '>'
						+ "THSI" + '</option>');
            else
						  document.write('<option value=' + vEntryValue[i] + ' id=dmz_' + i + '  ' + sel + '>'
						+ vEntryValue[i] + '</option>');
					}
				}
				</script>
			  </select>
		  </div>
	    </div>
	    <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">DMZ Host IP Address:</div>
		  </div>
		  <div class="col-6">
			  <input class="form-control input-textfield col-9" type='text' name="DMZHostIPAddress"  maxlength='15' />
		  </div>
	    </div>
	  </div>
	</form>
	<div class="mt-2 center">
		<button id="btnApply" type="button" name="btnApply" class="btn-dashboard" onclick="SubmitChange();">Apply Changes</button>
	</div>
  </div>
<!-- content -->
</body>

</html>