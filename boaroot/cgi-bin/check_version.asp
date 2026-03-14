<html> 
<head> 
</head> 
<body>
result:{
"PON_MAC":"<%tcWebApi_get("Info_Ether", "mac","s")%>",
"PON_MODE":"<%If tcWebApi_get("XPON_LinkCfg", "Mode","h")="0" then asp_Write("AUTO") elseif tcWebApi_get("XPON_LinkCfg", "Mode","h")="1" then asp_Write("GPON") elseif tcWebApi_get("XPON_LinkCfg", "Mode","h")="2" then asp_Write("EPON") end if%>",
"GPON_SN":"<%tcWebApi_get("GPON_ONU","SerialNumber","s")%>",
"VID":"<%tcWebApi_get("Vid_Common", "skyvid","s")%>",
"OUI":"<%tcWebApi_get("DeviceInfo_devParaDynamic","ManufacturerOUI","s")%>",
"Device_SN":"<%tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s")%>",
"TRUE_SN":"<%tcWebApi_get("DeviceInfo_devParaDynamic","CfePwd","s")%>",
<% if tcWebApi_get("WebCustom_Entry", "isWLanSupported","h") = "Yes" then %>
"2.4G_WiFi_SSID1":"<%tcWebApi_get("WLan_Entry1","SSID","s")%>",
<% if tcWebApi_get("WLan_Entry1", "AuthMode","h") = "OPEN" then %>
"2.4G_WiFi_Password1":"",
<% else %> 
"2.4G_WiFi_Password1":"<%tcWebApi_get("WLan_Entry1","WPAPSK","s")%>",
<% end if %> 	
<% end if %> 
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
"5G_WiFi_SSID1":"<%tcWebApi_get("WLan11ac_Entry1","SSID","s")%>",
<% if tcWebApi_get("WLan11ac_Entry1", "AuthMode","h") = "OPEN" then %>
"5G_WiFi_Password1":"",
<% else %> 
"5G_WiFi_Password1":"<%tcWebApi_get("WLan11ac_Entry1","WPAPSK","s")%>",
<% end if %> 
<% end if %> 
"WEB_User_Name":"<%tcWebApi_get("Account_Entry1","username","s")%>",
"WEB_User_Password":"<%tcWebApi_get("Account_Entry1","default_pwd","s")%>",
"WAN_ServiceName":"<%tcWebApi_get("WanInfo_Common","WanName","s")%>",
"Software_Version":"<%tcWebApi_get("Buildinfo_FactoryInfoEntry","internl_version","s")%>",
"Exter_Software_Version":"<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s")%>",
"Hardware_Version":"<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s")%>",
"Compile_Time":"<%tcWebApi_get("DeviceInfo","CompileTime","s")%>",
"Telnet_Status":"<%If tcWebApi_get("Account_TelnetEntry","Active","h")="Yes" then asp_Write("Open")  else asp_Write("Close") end if%>",
"BOB_MD5":"<%tcWebApi_get("Buildinfo_FactoryInfoEntry","bob_md5","s")%>",
"WiFi_MD5":"<%tcWebApi_get("Buildinfo_FactoryInfoEntry","wifi_md5","s")%>",
"Factory_Mode":"<%If tcWebApi_get("SysInfo_Entry","ResetFlag","h")="1" then asp_Write("FactoryMode") else asp_Write("UserMode") end if%>",
"Device_Model":"<%tcWebApi_get("DeviceInfo_devParaStatic", "ModelName","s")%>",
"Auto Complie":"<%tcWebApi_get("SysInfo_Entry", "AutoComplieFlag","s")%>"
<% if tcWebApi_get("WebCustom_Entry", "isJioSupport","h") = "Yes" then %>
,"Acs_Pre_Password":"<%tcWebApi_get("DeviceInfo_devParaStatic","Acs_Pre_Password","s")%>"
<% end if %> 
}
</body> 
</html> 
