<html> 
<head> 
</head> 
<body> 
result:{
"Software_Version":"<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s")%>",
"Hardware_Version":"<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s")%>",
"Compile_Time":"<%tcWebApi_get("DeviceInfo","CompileTime","s")%>",
"Factory_Mode":"<%If tcWebApi_get("SysInfo_Entry","ResetFlag","h")="1" then asp_Write("FactoryMode") else asp_Write("UserMode") end if%>",
"Telnet_Status":"<%If tcWebApi_get("Account_TelnetEntry","Active","h")="Yes" then asp_Write("Open")  else asp_Write("Close") end if%>",
"MAC":"<%tcWebApi_get("Info_Ether", "mac","s")%>",
"VID":"<%tcWebApi_get("Vid_Common", "skyvid","s")%>",
"WAN_Mode":"<% if tcWebApi_get("Mesh_common", "DeviceRole","h") = "2" then asp_Write("Bridge") else tcWebApi_get("Wan_PVC0_Entry0", "WanMode","s") end if%>",
"Device_Model":"<%tcWebApi_get("DeviceInfo_devParaStatic", "ModelName","s")%>",
"Device_SN":"<%tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s")%>",
"GPON_SN":"<%tcWebApi_get("GPON_ONU","SerialNumber","s")%>",
"TRUE_SN":"<%tcWebApi_get("DeviceInfo_devParaDynamic","CfePwd","s")%>",
"OUI":"<%tcWebApi_get("DeviceInfo_devParaDynamic","ManufacturerOUI","s")%>",
"WEB_User_Name":"<%tcWebApi_get("Account_Entry1","username","s")%>",
"WEB_User_Passwd":"<%tcWebApi_get("Account_Entry1","default_pwd","s")%>",
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
<% if tcWebApi_get("WebCustom_Entry", "isJioSupport","h") = "Yes" then %>
  "Acs_Pre_Password":"<%tcWebApi_get("DeviceInfo_devParaStatic","Acs_Pre_Password","s")%>"
<% end if %> 
}
</body> 
</html> 
