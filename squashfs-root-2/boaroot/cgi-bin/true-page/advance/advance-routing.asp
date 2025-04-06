<%
if Request_Form("SaveFlag") = "1" then
	TCWebApi_set("WebCurSet_Entry","route_id","add_num")
	TCWebApi_set("Route_Entry","DST_IP","DestIPAddress")
	TCWebApi_set("Route_Entry","Sub_mask","DestSubnetMask")
	if Request_Form("gwflag") = "Yes" then
		TCWebApi_set("Route_Entry","Gateway","GatewayIPAddress")
	end if
	if Request_Form("ifflag") = "Yes" then
		TCWebApi_set("Route_Entry","Device","WanInterfaceFlag")
	end if
	TCWebApi_set("Route_Entry","metric","metricFlag")
	TCWebApi_set("Route_Entry","Active","ActiveFlag")
	TCWebApi_commit("Route_Entry")
	TCWebApi_save() 
elseif Request_Form("SaveFlag") = "2" then
		TCWebApi_set("WebCurSet_Entry","wan_pvc","Interface")
end if

if Request_Form("delFlag") = "1" then

	if Request_Form("hSrouteFlag0") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag0")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag1") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag1")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag2") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag2")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag3") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag3")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag4") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag4")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag5") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag5")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag6") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag6")
		TCWebApi_unset("Route_Entry")
	end if
	if Request_Form("hSrouteFlag7") <> "33" then 
		TCWebApi_set("WebCurSet_Entry","route_id","hSrouteFlag7")
		TCWebApi_unset("Route_Entry")
	end if
	TCWebApi_commit("WebCurSet_Entry")
	TCWebApi_commit("Route_Entry")
	TCWebApi_save("Route_Entry")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - Routing</title>
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
</head>

<body onLoad="if(getElById('ConfigForm') != null)LoadFrame()">
<script language="JavaScript" type="text/javascript">

	var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
	// num 0
	var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
	var vEntryName = vArrayStr.split(',');
	// num 1
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
	var vEntryValue = vArrayStr.split(',');
	// num 2~5
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP4","s") %>";
  var Wan_IP4 = vArrayStr.split(',');
	// num 6
	vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
	var Wan_IPVERSION = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_NetMask4","s") %>";
  var Wan_NetMask4 = vArrayStr.split(',');
	
	vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
	vEntryValue = SortUtil.SortMyArray( vEntryValue );
	Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
  Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
  Wan_NetMask4 = SortUtil.SortMyArray( Wan_NetMask4 );
	
var host = [["InternetGatewayDevice.LANDevice.1.LANHostConfigManagement.IPInterface.1","192.168.1.1","255.255.255.0"],null];
var IpAddress = host[0][1];
var SubnetMask = host[0][2];
function stWan(domain,wanName,CntType)
{
	this.domain = domain;
	var list = domain.split('.');
	this.key = 	list[4];
	this.wanName = wanName;
	this.CntType = CntType;
	this.LinkType = '';
}

function stDsl(domain,LinkType)
{
	this.domain = domain;
	var list = domain.split('.');
	this.key = 	list[4];
	this.LinkType = LinkType;
}
var WanPPP = new Array(new stWan("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANPPPConnection.2","1_TR069_INTERNET_R_0_35","IP_Routed"),null);
var WanIP = new Array(null);
var CntPvc = new Array(new stDsl("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","EoA"),null);
if (WanPPP.length > 1)
AssociateParam('WanPPP','CntPvc','LinkType');
if (WanIP.length > 1)
AssociateParam('WanIP','CntPvc','LinkType');
var Wan = new Array();
for (i = 0; i < WanIP.length-1; i++)
{
	Wan[i] = WanIP[i];
}
for (j = 0; j < WanPPP.length-1; i++,j++)
{
	Wan[i] =  WanPPP[j];
}

var routecount = 32;
function stStaticRoute(domain,DestIPAddress)
{
	this.domain = domain;
	this.DestIPAddress = DestIPAddress;
}
function getStaticRouteInfo()
{
	var	nCurTemp = 0;
	var	vDestIPAddress = new Array(routecount);
	var	vcurLinks = new Array(routecount);
	
	vDestIPAddress[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
	vDestIPAddress[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
	vDestIPAddress[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
	vDestIPAddress[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
	vDestIPAddress[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
	vDestIPAddress[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
	vDestIPAddress[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
	vDestIPAddress[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";
	vDestIPAddress[8] = "<% tcWebApi_get("Route_Entry8","DST_IP","s") %>";
	vDestIPAddress[9] = "<% tcWebApi_get("Route_Entry9","DST_IP","s") %>";
	vDestIPAddress[10] = "<% tcWebApi_get("Route_Entry10","DST_IP","s") %>";
	vDestIPAddress[11] = "<% tcWebApi_get("Route_Entry11","DST_IP","s") %>";
	vDestIPAddress[12] = "<% tcWebApi_get("Route_Entry12","DST_IP","s") %>";
	vDestIPAddress[13] = "<% tcWebApi_get("Route_Entry13","DST_IP","s") %>";
	vDestIPAddress[14] = "<% tcWebApi_get("Route_Entry14","DST_IP","s") %>";
	vDestIPAddress[15] = "<% tcWebApi_get("Route_Entry15","DST_IP","s") %>";
	vDestIPAddress[16] = "<% tcWebApi_get("Route_Entry16","DST_IP","s") %>";
	vDestIPAddress[17] = "<% tcWebApi_get("Route_Entry17","DST_IP","s") %>";
	vDestIPAddress[18] = "<% tcWebApi_get("Route_Entry18","DST_IP","s") %>";
	vDestIPAddress[19] = "<% tcWebApi_get("Route_Entry19","DST_IP","s") %>";
	vDestIPAddress[20] = "<% tcWebApi_get("Route_Entry20","DST_IP","s") %>";
	vDestIPAddress[21] = "<% tcWebApi_get("Route_Entry21","DST_IP","s") %>";
	vDestIPAddress[22] = "<% tcWebApi_get("Route_Entry22","DST_IP","s") %>";
	vDestIPAddress[23] = "<% tcWebApi_get("Route_Entry23","DST_IP","s") %>";
	vDestIPAddress[24] = "<% tcWebApi_get("Route_Entry24","DST_IP","s") %>";
	vDestIPAddress[25] = "<% tcWebApi_get("Route_Entry25","DST_IP","s") %>";
	vDestIPAddress[26] = "<% tcWebApi_get("Route_Entry26","DST_IP","s") %>";
	vDestIPAddress[27] = "<% tcWebApi_get("Route_Entry27","DST_IP","s") %>";
	vDestIPAddress[28] = "<% tcWebApi_get("Route_Entry28","DST_IP","s") %>";
	vDestIPAddress[29] = "<% tcWebApi_get("Route_Entry29","DST_IP","s") %>";
	vDestIPAddress[30] = "<% tcWebApi_get("Route_Entry30","DST_IP","s") %>";
	vDestIPAddress[31] = "<% tcWebApi_get("Route_Entry31","DST_IP","s") %>";
	
	for(var i=0; i<routecount; i++)
	{
		if(vDestIPAddress[i] != "N/A")
			vcurLinks[nCurTemp++] = new stStaticRoute(i, vDestIPAddress[i]);
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
var StaticRouteInfo = getStaticRouteInfo();

function btnClear()
{
	with ( document.forms[0] )
	{
	DestIPAddress.value = '';
	DestSubnetMask.value = '';
	GatewayIPAddress.value = '';
	}
}

function LoadFrame()
{
	document.ConfigForm.SaveFlag.value = "0";
}

function getMostRightPosOf1(str)
{
	for (i = str.length - 1; i >= 0; i--)
	{
		if (str.charAt(i) == '1')
		{
			break;
		}
	}
	return i;
}

function getBinaryString(str)
{
	var numArr = [128, 64, 32, 16, 8, 4, 2, 1];
	var addrParts = str.split('.');
	if (addrParts.length < 3)
	{
		return "00000000000000000000000000000000";
	}
	var binstr = '';
	for (i = 0; i < 4; i++)
	{
		var num = parseInt(addrParts[i])
		for ( j = 0; j < numArr.length; j++ )
		{
			if ( (num & numArr[j]) != 0 )
			{
				binstr += '1';
			}
			else
			{
				binstr += '0';
			}
		}
	}
	return binstr;
}

function isMatchedIpAndMask(ip, mask)
{
	var locIp = getBinaryString(ip);
	var locMask = getBinaryString(mask);
	if (locIp.length != locMask.length)
	{
		return false;
	}
	var most_right_pos_1 = getMostRightPosOf1(locMask);
	if (most_right_pos_1 == -1)
	{
		if (loaIp == '00000000000000000000000000000000')
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	for (i = most_right_pos_1 + 1; i < locIp.length; i++)
	{
		if (locIp.charAt(i) != '0')
		{
			return false;
		}
	}
	return true;
}

function CheckForm(Form)
{
	for (i = 0; i < StaticRouteInfo.length - 1; i++)
	{
		if (StaticRouteInfo[i].DestIPAddress == getValue('DestIPAddress'))
		{
			alert('Destination IP is same with others.');
			return false;
		}
	}
	with ( document.forms[0] )
{
	var DestIp = DestIPAddress.value;
	var index1 = IpAddress.lastIndexOf('.');
	var index2 = DestIp.lastIndexOf('.');
	if ( isValidIpAddress(DestIp) == false
	|| isDeIpAddress(DestIp) == true
	|| isBroadcastIpAddress(DestIp) == true
	|| isLoopIpAddress(DestIp) == true )
	{
		alert('Destination "' + DestIPAddress.value + '" is invalid IP address.');
		return false;
	}
	if (IpAddress == DestIp
	|| ((DestIp.substr(index2 + 1) == '0') && (DestSubnetMask.value == "255.255.255.255")))
	{
		alert('Destination IP is invalid.');
		return false;
	}
//Form.addParameter('DestIPAddress',DestIPAddress.value);
	if ( isValidSubnetMask(DestSubnetMask.value) == false &&  DestSubnetMask.value != '255.255.255.255')
	{
		alert('Subnet "' + DestSubnetMask.value + '" is invalid.');
		return false;
	}
//Form.addParameter('DestSubnetMask',DestSubnetMask.value);
	if (isMatchedIpAndMask(DestIPAddress.value, DestSubnetMask.value) == false)
	{
		alert('Destination "' + DestIPAddress.value + '" is not match with subnet "' + DestSubnetMask.value + '"');
		return false;
	}
	if (gwStr.checked == false && ifStr.checked == false)
	{
		alert('Invalid gateway or interface.');
		return false;
	}
	if (gwStr.checked == true)
	{
		if (( isAbcIpAddress(GatewayIPAddress.value) == false )
      || (isBroadcastIpAddress(GatewayIPAddress.value) == true)
      || (isNtwkSgmtIpAddress(GatewayIPAddress.value) == true))
		{
			alert('Gateway "' + GatewayIPAddress.value + '" is invalid.');
			return false;
		}
//Form.addParameter('GatewayIPAddress',GatewayIPAddress.value);
	}
	else
	{
//Form.addParameter('GatewayIPAddress','0.0.0.0');
	}
	
	if (ifStr.checked == true)
	{
		var idx = Interface.selectedIndex;
		var WANId = Interface.options[idx].id;
		if ((idx != Interface.length - 1) && (Interface.value.indexOf('nas') > -1) && (gwStr.checked == false))
		{
			alert('Gateway must be set with IPoE connection.');
			return false;
		}
    //console.log(Interface.value);
    var gateways = GatewayIPAddress.value.split('.');
    //console.log(GatewayIPAddress.value);
    if( Interface.value.indexOf('br0') > -1){
      var lanip  =  "<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>";
      var lanNetmask  =  "<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>";
      if(lanip == "")
      {
        lanip = "192.168.1.1";
      }
      if(lanNetmask == "255.255.255.255" || lanNetmask == "")
      {
        lanNetmask = "255.255.255.0";
      }
      console.log("lanip: " + lanip + " ; lanNetmask: " + lanNetmask);
      if (isEqualSegment(GatewayIPAddress.value,lanip,lanNetmask))
      {
        alert("Gateway and LAN IP should be at the same network segment!");
        return false;
      }
    }else{
      var wanip = Interface.options[idx].getAttribute("ipAddress");
      var wanNetmask = Interface.options[idx].getAttribute("wanNetMask");
      console.log("wanip: " + wanip + " ; wanNetmask: " + wanNetmask);
      if(wanNetmask == "255.255.255.255" || wanNetmask == "")
      {
        wanNetmask = "255.255.255.0";
      }
      if(wanip == "N/A")
      {
        alert("The IPv4 address is not obtained using the interface!");
      GatewayIPAddress.focus();
        return false;
      }
      if (isEqualSegment(GatewayIPAddress.value,wanip,wanNetmask))
      {
        alert("Default Gateway and Wan IP should be at the same network segment!");
    GatewayIPAddress.focus();
        return false;
      }
    }
//Form.addParameter('Interface',getSelectVal('Interface'));
	}
	else
	{
	}
}
//Form.endPrefix();
return true;
}

function SubmitForm()
{
	//var Form = new webSubmitForm();
	if (true == CheckForm(document.ConfigForm))
	{
		var vForm = document.ConfigForm;
		if(vForm.user_def_num.value >= 8)
		{
			alert("The number of static route must be less than 8.");
			return;
		}
		
		if(vForm.ActiveState.checked)
		{
			vForm.ActiveFlag.value = "Yes";
		}
		else
		{
			vForm.ActiveFlag.value = "No";
		}

		if(vForm.gwStr.checked)
			vForm.gwflag.value = "Yes";
		else vForm.gwflag.value = "No";
		
		if(vForm.ifStr.checked)
			vForm.ifflag.value = "Yes";
		else vForm.ifflag.value = "No";
		
		vForm.WanInterfaceFlag.value = vForm.Interface.value;
		vForm.metricFlag.value = vForm.MetricValue.value;
		vForm.SaveFlag.value = "1";
		vForm.submit();
		showLoading();
	}
}

function Cancle()
{
location.replace("/cgi-bin/true-page/advance/advance-routing.asp");
}

var nCount = 8;
var	vActiveState =[];// new Array(nCount);
var	vDestIP = new Array(nCount);
var	vSub_mask = new Array(nCount);
var	vGatewayIPAddress = new Array(nCount);
var	vMetric =  new Array(nCount);
var	vInterface = new Array(nCount);

function ShowRouteTable()
{
	vActiveState[0] = "<% tcWebApi_get("Route_Entry0","Active","s") %>";
	vActiveState[1] = "<% tcWebApi_get("Route_Entry1","Active","s") %>";
	vActiveState[2] = "<% tcWebApi_get("Route_Entry2","Active","s") %>";
	vActiveState[3] = "<% tcWebApi_get("Route_Entry3","Active","s") %>";
	vActiveState[4] = "<% tcWebApi_get("Route_Entry4","Active","s") %>";
	vActiveState[5] = "<% tcWebApi_get("Route_Entry5","Active","s") %>";
	vActiveState[6] = "<% tcWebApi_get("Route_Entry6","Active","s") %>";
	vActiveState[7] = "<% tcWebApi_get("Route_Entry7","Active","s") %>";

	vDestIP[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
	vDestIP[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
	vDestIP[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
	vDestIP[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
	vDestIP[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
	vDestIP[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
	vDestIP[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
	vDestIP[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";

	vSub_mask[0] = "<% tcWebApi_get("Route_Entry0","Sub_mask","s") %>";
	vSub_mask[1] = "<% tcWebApi_get("Route_Entry1","Sub_mask","s") %>";
	vSub_mask[2] = "<% tcWebApi_get("Route_Entry2","Sub_mask","s") %>";
	vSub_mask[3] = "<% tcWebApi_get("Route_Entry3","Sub_mask","s") %>";
	vSub_mask[4] = "<% tcWebApi_get("Route_Entry4","Sub_mask","s") %>";
	vSub_mask[5] = "<% tcWebApi_get("Route_Entry5","Sub_mask","s") %>";
	vSub_mask[6] = "<% tcWebApi_get("Route_Entry6","Sub_mask","s") %>";
	vSub_mask[7] = "<% tcWebApi_get("Route_Entry7","Sub_mask","s") %>";

	vGatewayIPAddress[0] = "<% tcWebApi_get("Route_Entry0","Gateway","s") %>";
	vGatewayIPAddress[1] = "<% tcWebApi_get("Route_Entry1","Gateway","s") %>";
	vGatewayIPAddress[2] = "<% tcWebApi_get("Route_Entry2","Gateway","s") %>";
	vGatewayIPAddress[3] = "<% tcWebApi_get("Route_Entry3","Gateway","s") %>";
	vGatewayIPAddress[4] = "<% tcWebApi_get("Route_Entry4","Gateway","s") %>";
	vGatewayIPAddress[5] = "<% tcWebApi_get("Route_Entry5","Gateway","s") %>";
	vGatewayIPAddress[6] = "<% tcWebApi_get("Route_Entry6","Gateway","s") %>";
	vGatewayIPAddress[7] = "<% tcWebApi_get("Route_Entry7","Gateway","s") %>";
	
	vMetric[0] = "<% tcWebApi_get("Route_Entry0","metric","s") %>";
	vMetric[1] = "<% tcWebApi_get("Route_Entry1","metric","s") %>";
	vMetric[2] = "<% tcWebApi_get("Route_Entry2","metric","s") %>";
	vMetric[3] = "<% tcWebApi_get("Route_Entry3","metric","s") %>";
	vMetric[4] = "<% tcWebApi_get("Route_Entry4","metric","s") %>";
	vMetric[5] = "<% tcWebApi_get("Route_Entry5","metric","s") %>";
	vMetric[6] = "<% tcWebApi_get("Route_Entry6","metric","s") %>";
	vMetric[7] = "<% tcWebApi_get("Route_Entry7","metric","s") %>";

	vInterface[0] = "<% tcWebApi_get("Route_Entry0","Device","s") %>";
	vInterface[1] = "<% tcWebApi_get("Route_Entry1","Device","s") %>";
	vInterface[2] = "<% tcWebApi_get("Route_Entry2","Device","s") %>";
	vInterface[3] = "<% tcWebApi_get("Route_Entry3","Device","s") %>";
	vInterface[4] = "<% tcWebApi_get("Route_Entry4","Device","s") %>";
	vInterface[5] = "<% tcWebApi_get("Route_Entry5","Device","s") %>";
	vInterface[6] = "<% tcWebApi_get("Route_Entry6","Device","s") %>";
	vInterface[7] = "<% tcWebApi_get("Route_Entry7","Device","s") %>";

}

function doDel(id)
{
	var temp = "hSrouteFlag" + id;
	var checkbox = getElById("StaticRoute_" + id);
	if(true == checkbox.checked)
	{
		getElById(temp).value = id;
	}
	else
	{
		getElById(temp).value = 33;
	}
}

function webClickRemove()
{
	var form = document.StaticRouteForm;
	form.delFlag.value = "1";
	form.submit();
}
</script>

<!-- content -->
  <div class="container-full container-resize-height">
	  <div class="title-text">Routing Configuration</div>
	  <div class="title-description-text">This page is used to configure the routing information. Here you can add/delete IP routes.</div>
	  <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-routing.asp" method="post">
	  <input type="hidden" name="add_num" value="<% tcWebApi_get("Route","add_num","s") %>">
	  <input type="hidden" name="user_def_num" value="<% tcWebApi_get("Route","User_def_num","s") %>">
	  <input type="hidden" name="WanInterfaceFlag" value="PVC0">
	  <input type="hidden" name="metricFlag" value="0">
	  <input type="hidden" name="gwflag" value="No">
	  <input type="hidden" name="ifflag" value="No">
	  <input type="hidden" name="SaveFlag" value="0">
	  <input type="hidden" name="ActiveFlag" value="0">
	  
<script language="JavaScript" type="text/JavaScript">
function WriteWanNameSelected()
{
	for (var i = 0; i < nEntryNum; i++)
	{
		if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)
		|| 'IPv6' == Wan_IPVERSION[i] )
				continue;

		document.write('<option value=' + vEntryValue[i] + ' ipAddress=' + Wan_IP4[i] + ' wanNetMask=' + Wan_NetMask4[i] + '>' + vEntryValue[i] + '</option>');
	}
}
function ChangeInterface()
{
	//document.ConfigForm.SaveFlag.value = "2";
	//document.ConfigForm.submit();
}
</script>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">Enable:</div>
		  </div>
		  <div class="col-6">
			  <input type="checkbox" value="1" name="ActiveState">
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">Destination:</div>
		  </div>
		  <div class="col-6">
			  <input class="input-textfield" type="text" name="DestIPAddress">
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">Subnet Mask:</div>
		  </div>
		  <div class="col-6">
			  <input class="input-textfield" type="text" name="DestSubnetMask">
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <input type="checkbox" name='gwStr' checked style="display:none;">
			  <div class="title-text-left">Next Hop:</div>
		  </div>
		  <div class="col-6">
			  <input class="input-textfield" type="text" name="GatewayIPAddress">
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <div class="title-text-left">Metric:</div>
		  </div>
		  <div class="col-6">
			  <input class="input-textfield" type="text" name="MetricValue">
		  </div>
	  </div>
	  <div class="row p-1">
		  <div class="col-6">
			  <input type="checkbox" name='ifStr' checked style="display:none;">
			  <div class="title-text-left">Interface:</div>
		  </div>
		  <div class="col-6">
			  <select class="form-control input-select" name='Interface'  id="select" onChange="ChangeInterface()">
				<script language="javascript">
				WriteWanNameSelected();
				document.writeln("  <option value='br0'> LAN/br0");
				</script>
			  </select>
		  </div>
	  </div>
	  </form>
	  <div class="mt-2 center">
		  <button id="btnOK" type="button" class="btn-dashboard" onclick="SubmitForm();">Add Route</button>
		  <button type="button" onclick="toClick()" class="btn-dashboard">Show Routes</button>
	  </div>
	  <hr>
	  <div class="card-table-content">
		<div class="table-header">Static Route Table</div>
		<FORM id="StaticRouteForm" name="StaticRouteForm" action="/cgi-bin/true-page/advance/advance-routing.asp" method="post">
		<input type="hidden" id="hSrouteFlag0" name="hSrouteFlag0" value="33">
		<input type="hidden" id="hSrouteFlag1" name="hSrouteFlag1" value="33">
		<input type="hidden" id="hSrouteFlag2" name="hSrouteFlag2" value="33">
		<input type="hidden" id="hSrouteFlag3" name="hSrouteFlag3" value="33">
		<input type="hidden" id="hSrouteFlag4" name="hSrouteFlag4" value="33">
		<input type="hidden" id="hSrouteFlag5" name="hSrouteFlag5" value="33">
		<input type="hidden" id="hSrouteFlag6" name="hSrouteFlag6" value="33">
		<input type="hidden" id="hSrouteFlag7" name="hSrouteFlag7" value="33">
		
		<input type="hidden" name="delFlag" value="0">
		  <table style="width:100%">
			  <tr class="table-header center">
				  <th style="width: 10%;" class="p-1">Select</th>
				  <th style="width: 10%;">state</th>
				  <th style="width: 20%;">Destination</th>
				  <th style="width: 20%;">Subnet Mask</th>
				  <th style="width: 20%;">Next Hop</th>
				  <th style="width: 20%;">Metric</th>
				  <th style="width: 20%;">Interface</th>
			  </tr>
			  <SCRIPT language=JavaScript type=text/javascript>
			    ShowRouteTable();
				var z=0;
				for(i = 0; i < nCount; i++)
				{
					if(vDestIP[i] != "N/A")
					{  
						var rowCss=z%2==0?"table-content-fist":"table-content-second";
						document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
						document.write('<TD><INPUT type=\"checkbox\" id=\"StaticRoute_' + i + '\" onclick=\"doDel(' + i + ');\"></TD>');
						document.write('<TD>' + vActiveState[i] + '&nbsp;</TD>');
						document.write('<TD>' + vDestIP[i] + '&nbsp;</TD>');
						document.write('<TD>' + vSub_mask[i] + '&nbsp;</TD>');
						document.write('<TD>' + vGatewayIPAddress[i] + '&nbsp;</TD>');
						document.write('<TD>' + vMetric[i] + '&nbsp;</TD>');
						document.write('<TD>' + vInterface[i] + '&nbsp;</TD>');
						document.write('</TR>');
						z++;
					}						
				}
			  </SCRIPT>
		  </table>
		</FORM>
	  </div>
	  <div class="mt-2 center">
		<button id="btnOK" type="button" class="btn-dashboard" onclick="webClickRemove();">Delete Selected</button>
	  </div>
  </div>

<!-- content -->
<script language=JavaScript type=text/javascript>
	function toClick()
	{
		window.location.href='/cgi-bin/true-page/advance/advance-route-shows.asp';
	}
</script>
</body>

</html>