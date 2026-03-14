// JavaScript Document
var curUserName = parent.curUser;
if (typeof(curUserName) == "undefined")
	curUserName = '0';
var vPageMap =  parent.pageMap;
if (typeof(vPageMap) == "undefined")
	top.window.location.href="/cgi-bin/content.asp";
var sysUserName = '1';
var sptUserName = '0';
var ctcqdUserName = 'ctcqd';
var bandRegName = 'regAcc';
var usrUserName = 0;
var iCount = 0;
var MenuArray = new Array();

//QS->0
//Sta->1
if(vPageMap[1][0] == '1'){
	if(vPageMap[1][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-device.asp", "");
	else if(vPageMap[1][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-network.asp", "");
	else if(vPageMap[1][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-user.asp", "");
	else if(vPageMap[1][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-wlan.asp", "");
	else if(vPageMap[1][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-VoIP.asp", "");
	else if(vPageMap[1][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Status", "/cgi-bin/sta-acs.asp", "");							
}
if(vPageMap[1][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Device Info", "/cgi-bin/sta-device.asp", "");
if(vPageMap[1][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN Info", "/cgi-bin/sta-network.asp", "");
if(vPageMap[1][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "LAN Info", "/cgi-bin/sta-user.asp", "");
if(vPageMap[1][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN Info", "/cgi-bin/sta-wlan.asp", "");
if(vPageMap[1][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP Info", "/cgi-bin/sta-VoIP.asp", "");
if(vPageMap[1][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "TR-069 Client Status", "/cgi-bin/sta-acs.asp", "");
//Net->2
if(vPageMap[2][0] == '1'){
	if(vPageMap[2][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-wanset.asp", "");
	else if(vPageMap[2][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-binding.asp", "");
	else if(vPageMap[2][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-dhcp.asp", "");
	else if(vPageMap[2][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-wlan.asp", "");
	else if(vPageMap[2][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-tr069.asp", "");
	else if(vPageMap[2][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-phoneapp.asp", "");
	else if(vPageMap[2][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-qos.asp", "");
	else if(vPageMap[2][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-time.asp", "");
	else if(vPageMap[2][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Network", "/cgi-bin/net-routeset.asp", "");										
}
if(vPageMap[2][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN", "/cgi-bin/net-wanset.asp", "");
if(vPageMap[2][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Mapping", "/cgi-bin/net-binding.asp", "");
if(vPageMap[2][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "LAN", "/cgi-bin/net-dhcp.asp", "");
if(vPageMap[2][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 2.4G", "/cgi-bin/net-wlan.asp", "");
if(vPageMap[2][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WLAN 5G", "/cgi-bin/net-wlan11ac.asp", "");
if(vPageMap[2][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "TR-069", "/cgi-bin/net-tr069.asp", "");
if(vPageMap[2][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Cell Phone", "/cgi-bin/net-phoneapp.asp", "");
if(vPageMap[2][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "QoS", "/cgi-bin/net-qos.asp", "");
if(vPageMap[2][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "SNTP", "/cgi-bin/net-time.asp", "");
if(vPageMap[2][8] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Routing", "/cgi-bin/net-routeset.asp", "");
//Sec->3
if(vPageMap[3][0] == '1'){
	if(vPageMap[3][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/app-remotemanagement.asp", "");
	else if(vPageMap[3][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-firewall.asp", "");
	else if(vPageMap[3][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-urlfilter.asp", "");
	else if(vPageMap[3][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-macfilter.asp", "");
	else if(vPageMap[3][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-portfilter.asp", "");				
	else if(vPageMap[3][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-protocolfilter.asp", "");
	else if(vPageMap[3][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Security", "/cgi-bin/sec-acl.asp", "");
}
if(vPageMap[3][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN Access", "/cgi-bin/app-remotemanagement.asp", "");
if(vPageMap[3][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Firewall", "/cgi-bin/sec-firewall.asp", "");
if(vPageMap[3][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "URL Filter", "/cgi-bin/sec-urlfilter.asp", "");
if(vPageMap[3][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "MAC Filter", "/cgi-bin/sec-macfilter.asp", "");
if(vPageMap[3][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Port Filter", "/cgi-bin/sec-portfilter.asp", "");
if(vPageMap[3][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Protocol Filter", "/cgi-bin/sec-protocolfilter.asp", "");
if(vPageMap[3][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "ACL", "/cgi-bin/sec-acl.asp", "");
		
//App->4
if(vPageMap[4][0] == '1'){
	if(vPageMap[4][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-ddns.asp", "");
	else if(vPageMap[4][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-natset.asp", "");
	else if(vPageMap[4][11] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-staticIP.asp", "");
	else if(vPageMap[4][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-upnp.asp", "");
	else if(vPageMap[4][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-VoIP.asp", "");
	else if(vPageMap[4][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-igmpset.asp", "");
	else if(vPageMap[4][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-daily.asp", "");	
	else if(vPageMap[4][7] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-snmp.asp", "");
	else if(vPageMap[4][8] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-gponconfig.asp", "");
	else if(vPageMap[4][9] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/app-catv.asp", "");
	else if(vPageMap[4][10] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Application", "/cgi-bin/wifi_multi_ap_basic.asp", "");
}
if(vPageMap[4][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "DDNS", "/cgi-bin/app-ddns.asp", "");
if(vPageMap[4][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "NAT", "/cgi-bin/app-natset.asp", "");
if(vPageMap[4][11] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Static IP", "/cgi-bin/app-staticIP.asp", "");
if(vPageMap[4][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "UPNP", "/cgi-bin/app-upnp.asp", "");
if(vPageMap[4][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "VoIP", "/cgi-bin/app-VoIP.asp", "");
if(vPageMap[4][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "IGMP/MLD", "/cgi-bin/app-igmpset.asp", "");
if(vPageMap[4][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Daily Use", "/cgi-bin/app-daily.asp", "");
if(vPageMap[4][7] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "SNMP", "/cgi-bin/app-snmp.asp", "");
if(vPageMap[4][8] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "GPON", "/cgi-bin/app-gponconfig.asp", "");
if(vPageMap[4][9] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "CATV", "/cgi-bin/app-catv.asp", "");
if(vPageMap[4][10] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "EasyMesh", "/cgi-bin/wifi_multi_ap_basic.asp", "");
//Mag->5
if(vPageMap[5][0] == '1'){
	if(vPageMap[5][1] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/mag-account.asp", "");
	else if(vPageMap[5][2] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/mag-reset.asp", "");
	else if(vPageMap[5][3] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/mag-syslogmanage.asp", "");		
/*	else if(vPageMap[5][4] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/app-remotemanagement.asp", "");*/	
	else if(vPageMap[5][6] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/upgrade", "");
	else if(vPageMap[5][5] == '1')
		MenuArray[iCount++] = new MenuNodeConstruction(1, "Management", "/cgi-bin/backup_restore", "");
}
if(vPageMap[5][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "User Management", "/cgi-bin/mag-account.asp", "");
if(vPageMap[5][2] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Restore Default", "/cgi-bin/mag-reset.asp", "");
if(vPageMap[5][3] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Log Management", "/cgi-bin/mag-syslogmanage.asp", "");
/*if(vPageMap[5][4] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "WAN Access", "/cgi-bin/app-remotemanagement.asp", "");*/
if(vPageMap[5][6] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Upgrade", "/cgi-bin/upgrade.asp", "");
if(vPageMap[5][5] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Backup & Restore", "/cgi-bin/backup_restore.asp", "");
//Diag->6
if(vPageMap[6][0] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(1, "Diagnostic", "/cgi-bin/diag-quickdiagnose.asp", "");
if(vPageMap[6][1] == '1')
	MenuArray[iCount++] = new MenuNodeConstruction(2, "Network Diagnostic", "/cgi-bin/diag-quickdiagnose.asp", "");
//Help->7
//if(vPageMap[7][0] == '1')
//	MenuArray[iCount++] = new MenuNodeConstruction(1, "Help", "/cgi-bin/help.asp", "");
//if(vPageMap[7][1] == '1')
//	MenuArray[iCount++] = new MenuNodeConstruction(2, "Help Use", "/cgi-bin/help.asp", "");

MenuArray[iCount++] = new MenuNodeConstruction(0, "", "", "");

function MenuNodeConstruction(Level, Text, Link, Target)
{
    this.Level = Level;
    this.Text = Text;
    this.Link = Link;
    this.Target = Target;
}

function MakeMenu(Selected_Menu)
{
	var Menu = Selected_Menu.split("->");
	MakeMenu_L2(Menu[1], MakeMenu_L1(Menu[0]));
}

function MakeMenu_L1(Menu_Text)
{
	var Menu_L2_Start;
	var Code = '<table border="0" cellpadding="0" cellspacing="0" height="40px">';
	
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
	//			Code += '<td height="15px"><img src="/img/back_button.jpg"></td>';
			}
			else
			{
				Menu_L2_Start = iCount + 1;
	//			Code += '<td height="15px"><img src="/img/selected_button.jpg"></td>';
			}
		}
	}
	Code += '<tr>';
	for (iCount = 0; MenuArray[iCount].Level != 0; iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 1)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{
				Code += '<td bgcolor="#d8d8d8" height="40px" width="90px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L1_Link"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
			else
			{
				Code += '<td bgcolor="#FFC000" height="40px" width="90px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L1_Active"><p align="center">' + MenuArray[iCount].Text + '</p></a></td>';
			}
		}
	}
	Code += '</tr></table>';
	getElement('MenuArea_L1').innerHTML = Code;
	return Menu_L2_Start;
}

function LoadPage(strIndex)
{
	var index = parseInt(strIndex);
	location = MenuArray[index].Link;
}

function MakeMenu_L2(Menu_Text, Start)
{
	var Code = '<table border="0" cellpadding="0" cellspacing="0" height="60px"><tr><td width="10px"><td width="7px" class="Menu_L2_Link"><p>|</p></td>';
	for (var iCount = Start; (MenuArray[iCount].Level != 0) && (MenuArray[iCount].Level != 1); iCount++)
	{
		var str = 'LoadPage(\'' + iCount + '\')';
		if (MenuArray[iCount].Level == 2)
		{
			if (MenuArray[iCount].Text != Menu_Text)
			{				
				Code += '<td height="60px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L2_Link"><p align="center"> ' + MenuArray[iCount].Text + ' </p></a></td>';
			}
			else
			{
				Code += '<td height="60px"><a href="javascript:' + str + '" target="' + MenuArray[iCount].Target + '" class="Menu_L2_Active"><p align="center"> ' + MenuArray[iCount].Text + ' </p></a></td>';
			}
			Code += '<td width="7px" class="Menu_L2_Link"><p>|</p></td>';
		}
	}
	Code += '</tr></table>';
	getElement('MenuArea_L2').innerHTML = Code;
}
 
function DisplayLocation(Selected_Menu)
{
	var Menu = Selected_Menu.split("->");
	var imgPng;
	if(Menu[0] == "Status"){
		imgPng = '<img src="/img/status.png" width="70" height="70" border="0">';
	}else if(Menu[0] == "Network"){
		imgPng = '<img src="/img/network.png" width="70" height="70" border="0">';
	}else if(Menu[0] == "Security"){
		imgPng = '<img src="/img/security.png" width="70" height="70" border="0">';
	}else if(Menu[0] == "Application"){
		imgPng = '<img src="/img/application.png" width="70" height="70" border="0">';
	}else if(Menu[0] == "Management"){
		imgPng = '<img src="/img/management.png" width="70" height="70" border="0">';
	}else if(Menu[0] == "Diagnostic"){
		imgPng = '<img src="/img/diagnostic.png" width="70" height="70" border="0">';
	}else{
		imgPng = '<img src="" width="70" height="70" border="0">';
	}
	getElement('LocationDisplay').innerHTML = imgPng; 
}
