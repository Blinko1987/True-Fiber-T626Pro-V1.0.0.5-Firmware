//该文件用于配置主页、菜单等信息，如一级、二级、三级菜单目录增删改查
define(function(require){
  var config = {};
  
  //主菜单
  const mainMenuList = [
    {
      modules: "mainMenuList",
      menuName: "Home",
      menuId: "mainMenuHome",
      href: "/cgi-bin/true-page/dashboard.asp",
      subMenuName: "",
    },
    {
      modules: "mainMenuList",
      menuName: "Status",
      menuId: "mainMenuStatus",
      href: "/cgi-bin/true-page/status/status-device.asp",
      subMenuName: "subMenuList_status",
    },
    {
      modules: "mainMenuList",
      menuName: "LAN",
      menuId: "mainMenuLAN",
      href: "/cgi-bin/true-page/lan/lan-interface.asp",
      subMenuName: "subMenuList_LAN",
    },
    {
      modules: "mainMenuList",
      menuName: "WLAN",
      menuId: "mainMenuWLAN",
      href: "/cgi-bin/true-page/wlan/wlan-0-basic.asp",
      subMenuName: "subMenuList_WLAN",
    },
    {
      modules: "mainMenuList",
      menuName: "WAN",
      menuId: "mainMenuWAN",
      href: "/cgi-bin/true-page/wlan/wan/wan.asp",
      subMenuName: "subMenuList_WAN",
<% if tcWebApi_get("Mesh_dat", "MapEnable","h") = "1" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% else %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    },
    {
      modules: "mainMenuList",
      menuName: "Service",
      menuId: "mainMenuService",
      href: "/cgi-bin/true-page/service/service-dhcp.asp",
      subMenuName: "subMenuList_service",
    },
    {
      modules: "mainMenuList",
      menuName: "VoIP",
      menuId: "mainMenuVoIP",
      href: "/cgi-bin/true-page/vo-ip/port1.asp",
      subMenuName: "subMenuList_VoIP",
<% if tcWebApi_get("WebCustom_Entry", "isVOIPSupported","h") = "Yes" then %>
      whoInvisible: 1,
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "mainMenuList",
      menuName: "Firewall",
      menuId: "mainMenuFirewall",
      href: "/cgi-bin/true-page/firewall/ALG-Type.asp",
      subMenuName: "subMenuList_firewall",
    },
    {
      modules: "mainMenuList",
      menuName: "Advance",
      menuId: "mainMenuAdvance",
      href: "/cgi-bin/advance/advance-arp-table.asp",
      subMenuName: "subMenuList_advance",
    },
    {
      modules: "mainMenuList",
      menuName: "Diagnostics",
      menuId: "mainMenuDiagnostics",
      href: "/cgi-bin/true-page/diagnostics/ping.asp",
      subMenuName: "subMenuList_diagnostics",
      whoInvisible: 1,
    },
    {
      modules: "mainMenuList",
      menuName: "Admin",
      menuId: "mainMenuAdmin",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      href: "/cgi-bin/true-page/admin/admin-multicast.asp",
<% else %>
      href: "/cgi-bin/true-page/admin/admin-gpon.asp",
<% end if %>
      subMenuName: "subMenuList_admin",
    },
    {
      modules: "mainMenuList",
      menuName: "Statistics",
      menuId: "mainMenuStatistics",
      href: "/cgi-bin/true-page/static/statistics-interface.asp",
      subMenuName: "subMenuList_statistics",
    },
    {
      modules: "mainMenuList",
      menuName: "Operation Mode",
      menuId: "mainMenuOperationMode",
      href: "/cgi-bin/true-page/other/OperationMode.asp",
      subMenuName: "subMenuList_OperationMode",
    }
  ];
  
  const subMenuList_status = [
    {
      modules: "subMenuList_status",
      menuName: "Device",
      menuId: "subMenuStatus_device",
      href: "/cgi-bin/true-page/status/status-device.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_status",
      menuName: "WAN",
      menuId: "subMenuStatus_IPv6",
      href: "/cgi-bin/true-page/status/status-ipv6.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    },
    {
      modules: "subMenuList_status",
      menuName: "PON",
      menuId: "subMenuStatus_PON",
      href: "/cgi-bin/true-page/status/status-pon.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_status",
      menuName: "LAN",
      menuId: "subMenuStatus_LAN",
      href: "/cgi-bin/true-page/status/new-status-lan.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_status",
      menuName: "WLAN",
      menuId: "subMenuStatus_WLAN",
      href: "/cgi-bin/true-page/status/status-wlan.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") = "10" then %>
<% if tcWebApi_get("Mesh_dat","MapEnable","h") = "0" then %>
      whoInvisible: 1,
<% end if %>
<% end if %>
    },
<% if tcWebApi_get("vid_common","skyvid","h") = "38" then %>
    {
      modules: "subMenuList_status",
      menuName: "USB",
      menuId: "subMenuStatus_USB",
      href: "/cgi-bin/true-page/status/status-usb.asp",
      subMenuName: "",
    },
<% end if %>
    {
      modules: "subMenuList_status",
      menuName: "VoIP",
      menuId: "subMenuStatus_VoIP",
      href: "/cgi-bin/true-page/status/status-voip.asp",
      subMenuName: "",
<% if tcWebApi_get("WebCustom_Entry", "isVOIPSupported","h") = "Yes" then %>
      whoInvisible: 1,
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_status",
      menuName: "TR069",
      menuId: "subMenuStatus_TR069",
      href: "/cgi-bin/true-page/status/status-tr069.asp",
      subMenuName: "",
    }
  ];
  
  const subMenuList_LAN = [
    {
      modules: "subMenuList_LAN",
      menuName: "LAN Interface Setting",
      menuId: "subMenuLAN_interface",
      href: "/cgi-bin/true-page/lan/lan-interface.asp",
      subMenuName: "thirdMenuList_LAN",
    },
    {
      modules: "subMenuList_LAN",
      menuName: "VLAN Mapping",
      menuId: "subMenuLAN_map",
      href: "/cgi-bin/true-page/lan/lan-map.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    }
  ];
  
  const subMenuList_WLAN = [
    {
      modules: "subMenuList_WLAN",
      menuName: "WLAN 5GHz",
      menuId: "subMenuWLAN_5g",
      href: "/cgi-bin/true-page/wlan/wlan-0-basic.asp",
      subMenuName: "thirdMenuList_WLAN0",
    },
    {
      modules: "subMenuList_WLAN",
      menuName: "WLAN 2.4GHz",
      menuId: "subMenuWLAN_2g",
      href: "/cgi-bin/true-page/wlan/wlan-1-basic.asp",
      subMenuName: "thirdMenuList_WLAN1",
    }
  ];
  
  const subMenuList_WAN = [
    {
      modules: "subMenuList_WAN",
      menuName: "WAN",
      menuId: "subMenuWAN",
      href: "/cgi-bin/true-page/wan/wan.asp",
      subMenuName: "",
    }
  ];
  
  const subMenuList_service = [
    {
      modules: "subMenuList_service",
      menuName: "Dynamic DNS",
      menuId: "subMenuServiceDDNS",
      href: "/cgi-bin/true-page/service/Dynamic-DNS-Configuration.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_service",
      menuName: "IGMP Proxy",
      menuId: "subMenuServiceIGMP",
      href: "/cgi-bin/true-page/service/IGMP-Proxy-Configuration.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
      whoInvisible: 1,
<% end if %>
    },
    {
      modules: "subMenuList_service",
      menuName: "UPnP",
      menuId: "subMenuServiceUPnP",
      href: "/cgi-bin/true-page/service/UPnP-Cinfiguration.asp",
      subMenuName: "",
    }/*,
    {
      modules: "subMenuList_service",
      menuName: "SNMP",
      menuId: "subMenuServiceSNMP",
      href: "/cgi-bin/true-page/service/SNMP-Configuration.asp",
      subMenuName: "",
      whoInvisible: 1,
    },
    {
      modules: "subMenuList_service",
      menuName: "RIP",
      menuId: "subMenuServiceRIP",
      href: "/cgi-bin/true-page/service/RIP-Configuration.asp",
      subMenuName: "",
      diableClick: true,
    },
    {
      modules: "subMenuList_service",
      menuName: "Samba",
      menuId: "subMenuServiceSamba",
      href: "/cgi-bin/true-page/service/Samba.asp",
      subMenuName: "",
      diableClick: true,
    }*/
  ];
  
  const subMenuList_VoIP = [
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
    {
      modules: "subMenuList_VoIP",
      menuName: "Port1",
      menuId: "subMenuVoIPPort1",
      href: "/cgi-bin/true-page/vo-ip/port1.asp",
      subMenuName: "",
    },
<% else %>
    {
      modules: "subMenuList_VoIP",
      menuName: "Basic Setup",
      menuId: "subMenuVoIPPort1",
      href: "/cgi-bin/true-page/vo-ip/port2.asp",
      subMenuName: "",
    },
<% end if %>
<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
    {
      modules: "subMenuList_VoIP",
      menuName: "Port2",
      menuId: "subMenuVoIPPort2",
      href: "/cgi-bin/true-page/vo-ip/port2.asp",
      subMenuName: "",
    },
<% end if %>
    {
      modules: "subMenuList_VoIP",
      menuName: "Advance Setup",
      menuId: "subMenuVoIPAdvance",
      href: "/cgi-bin/true-page/vo-ip/advance.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_VoIP",
      menuName: "Tone Setup",
      menuId: "subMenuVoIPTone",
      href: "/cgi-bin/true-page/vo-ip/tone.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_VoIP",
      menuName: "Other Setup",
      menuId: "subMenuVoIPOther",
      href: "/cgi-bin/true-page/vo-ip/other.asp",
      subMenuName: "",
    }
    /*
    {
      modules: "subMenuList_VoIP",
      menuName: "Network",
      menuId: "subMenuVoIPNetwork",
      href: "/cgi-bin/true-page/vo-ip/network.asp",
      subMenuName: "",
      diableClick: true,
    },
    {
      modules: "subMenuList_VoIP",
      menuName: "Call History",
      menuId: "subMenuVoIPHistory",
      href: "/cgi-bin/true-page/vo-ip/call-history.asp",
      subMenuName: "",
      diableClick: true,
    }
    */
  ];
  
  const subMenuList_firewall = [
    {
      modules: "subMenuList_firewall",
      menuName: "Firewall Enable",
      menuId: "subMenuFilewallEnable",
      href: "/cgi-bin/true-page/firewall/Filewall-Enable.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "ALG",
      menuId: "subMenuFilewallALG",
      href: "/cgi-bin/true-page/firewall/ALG-Type.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "IP/Port Filtering",
      menuId: "subMenuFilewallIP",
      href: "/cgi-bin/true-page/firewall/IP-Port-Filtering.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "MAC Filtering",
      menuId: "subMenuFilewallMAC",
      href: "/cgi-bin/true-page/firewall/Firewall-MAC-Filtering.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "Port Forwarding",
      menuId: "subMenuFilewallForwarding",
      href: "/cgi-bin/true-page/firewall/Port-Forwarding.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "URL Filtering",
      menuId: "subMenuFilewallURL",
      href: "/cgi-bin/true-page/firewall/URL-Filtering.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "DMZ",
      menuId: "subMenuFilewallDMZ",
      href: "/cgi-bin/true-page/firewall/DMZ-Configuration.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "NAT Loopback",
      menuId: "subMenuFilewallNAT",
      href: "/cgi-bin/true-page/firewall/NAT-Loopback.asp",//需要添加页面
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_firewall",
      menuName: "Remote Management",
      menuId: "subMenuFilewallRemoteManagement",
      href: "/cgi-bin/true-page/firewall/Remote-Management.asp",//WAN ACCESS
      subMenuName: "",
    },
    {
      modules: "subMenuList_firewall",
      menuName: "Remote Access",
      menuId: "subMenuFilewallRemote",
      href: "/cgi-bin/true-page/firewall/Remote-Access-Configuration.asp",
      subMenuName: "",
    }
  ];
  
  const subMenuList_advance = [
    {
      modules: "subMenuList_advance",
      menuName: "Advance",
      menuId: "subMenuAdvance",
      href: "/cgi-bin/true-page/advance/advance-arp-table.asp",
      subMenuName: "thirdMenuList_advance",
    },
    {
      modules: "subMenuList_advance",
      menuName: "IP QoS",
      menuId: "subMenuAdvanceQoS",
      href: "/cgi-bin/true-page/advance/advance-ip-qos-basic.asp",
      subMenuName: "thirdMenuList_QoS",
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
    },
    {
      modules: "subMenuList_advance",
      menuName: "IPv6",
      menuId: "subMenuAdvanceIPv6",
      href: "/cgi-bin/true-page/advance/advance-ipv6-enable-disable.asp",
      subMenuName: "thirdMenuList_IPv6",
    },
    {
      modules: "subMenuList_advance",
      menuName: "WLAN",
      menuId: "subMenuAdvanceWLAN",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-basic.asp",
      subMenuName: "thirdMenuList_advance_WLAN",
    }
  ];
  
  const subMenuList_diagnostics = [
    {
      modules: "subMenuList_diagnostics",
      menuName: "Ping",
      menuId: "subMenuDiagnosticsPing",
      href: "/cgi-bin/true-page/diagnostics/ping.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_diagnostics",
      menuName: "Ping6",
      menuId: "subMenuDiagnosticsPing6",
      href: "/cgi-bin/true-page/diagnostics/ping-6.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_diagnostics",
      menuName: "Tracert",
      menuId: "subMenuDiagnosticsTracert",
      href: "/cgi-bin/true-page/diagnostics/tracert.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_diagnostics",
      menuName: "Tracert6",
      menuId: "subMenuDiagnosticsTracert6",
      href: "/cgi-bin/true-page/diagnostics/tracert-6.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_diagnostics",
      menuName: "TR069 INFORM",
      menuId: "subMenuDiagnosticsTR069",
      href: "/cgi-bin/true-page/diagnostics/tr069-inform.asp",//需要添加页面
      subMenuName: "",
    }
  ];
  
  const subMenuList_admin = [
    {
      modules: "subMenuList_admin",
      menuName: "GPON Setting",
      menuId: "subMenuAdminGPON",
      href: "/cgi-bin/true-page/admin/admin-gpon.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% elseif  tcWebApi_get("xpon_common", "Firstlogin","h") = "1" then %>
      whoInvisible: 1,
<% elseif  tcWebApi_get("xpon_common", "trafficStatus","h") = "up" then %>
      whoInvisible: 1,
<% end if %>
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "Multicast Vlan",
      menuId: "subMenuAdminMultVlan",
      href: "/cgi-bin/true-page/admin/admin-multicast.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "OMCI Information",
      menuId: "subMenuAdminOMCI",
      href: "/cgi-bin/true-page/admin/admin-omci.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "Commit/Reboot",
      menuId: "subMenuAdminCommit",
      href: "/cgi-bin/true-page/admin/admin-commit.asp",
      subMenuName: "",
    },
	{
      modules: "subMenuList_admin",
      menuName: "Schedule Reboot",
      menuId: "subMenuAdminReboot",
      href: "/cgi-bin/true-page/admin/admin-new-rebootschedule.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_admin",
      menuName: "Backup/Restore",
      menuId: "subMenuAdminBackup",
      href: "/cgi-bin/true-page/admin/admin-backup.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_admin",
      menuName: "System Log",
      menuId: "subMenuAdminLog",
      href: "/cgi-bin/true-page/admin/admin-system-log.asp",
      subMenuName: "",
    },
    {
      modules: "Port_mirror",
      menuName: "Port Mirror",
      menuId: "subMenuAdminPortMirror",
      href: "/cgi-bin/true-page/admin/admin-portmirror.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% else %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "DOS",
      menuId: "subMenuAdminDOS",
      href: "/cgi-bin/true-page/admin/admin-dos.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "Password",
      menuId: "subMenuAdminPassword",
      href: "/cgi-bin/true-page/admin/admin-password.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_admin",
      menuName: "Firmware Upgrade",
      menuId: "subMenuAdminUpgrade",
      href: "/cgi-bin/true-page/admin/admin-Firmware-Upgrade.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_admin",
      menuName: "Timezone",
      menuId: "subMenuAdminTimezone",
      href: "/cgi-bin/true-page/admin/admin-timezone.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_admin",
      menuName: "TR-069",
      menuId: "subMenuAdminTR-069",
      href: "/cgi-bin/true-page/admin/admin-TR-069.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% else %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "1" then %>
      whoInvisible: 1,
<% end if %>
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "Stun",
      menuId: "subMenuAdminStun",
      href: "/cgi-bin/true-page/admin/admin-Stun.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% elseif tcWebApi_get("mesh_common", "DeviceRole","h") = "1" then %>
<% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
      whoInvisible: 1,
<% else %>
      whoInvisible: 2,
<% end if %>
<% end if %>
    },
    {
      modules: "subMenuList_admin",
      menuName: "Logout",
      menuId: "subMenuAdminLogout",
      href: "/cgi-bin/true-page/admin/admin-logout.asp",
      subMenuName: "",
    }
  ];
  
  const subMenuList_statistics  = [
    {
      modules: "subMenuList_statistics",
      menuName: "Interface ",
      menuId: "subMenuStatisticsInterface",
      href: "/cgi-bin/true-page/static/statistics-interface.asp",
      subMenuName: "",
    },
    {
      modules: "subMenuList_statistics",
      menuName: "PON Statistics",
      menuId: "subMenuStatisticsPon",
      href: "/cgi-bin/true-page/static/statistics-pon.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
    whoInvisible: 2,
<% end if %>
    }
  ];

  const subMenuList_OperationMode  = [
    {
      modules: "subMenuList_OperationMode",
      menuName: "Operation Mode",
      menuId: "subMenuOperationModeIndex",
      href: "/cgi-bin/true-page/other/OperationMode.asp",
      subMenuName: "",
    }
  ];

  const thirdMenuList_LAN = [
    {
      modules: "thirdMenuList_LAN",
      menuName: "LAN Interface Setting",
      menuId: "thirdMenuLANIFSet",
      href: "/cgi-bin/true-page/lan/lan-interface.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_LAN",
      menuName: "DHCP",
      menuId: "thirdMenuLANDHCP",
      href: "/cgi-bin/true-page/lan/lan-dhcp.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    }
  ];
  
  const thirdMenuList_WLAN0 = [
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Basic Setting",
      menuId: "thirdMenuWLAN_basic0",
      href: "/cgi-bin/true-page/wlan/wlan-0-basic.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Advanced Setting",
      menuId: "thirdMenuWLAN_advance0",
      href: "/cgi-bin/true-page/wlan/wlan-0-advance.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Security",
      menuId: "thirdMenuWLAN_security0",
      href: "/cgi-bin/true-page/wlan/wlan-0-security.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Access Control",
      menuId: "thirdMenuWLAN_access0",
      href: "/cgi-bin/true-page/wlan/wlan-0-access.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Neighbors AP",
      menuId: "thirdMenuWLAN_site0",
      href: "/cgi-bin/true-page/wlan/wlan-0-site.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Associated Client",
      menuId: "thirdMenuWLAN_associated0",
      href: "/cgi-bin/true-page/wlan/wlan-0-client.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "WPS",
      menuId: "thirdMenuWLAN_wps0",
      href: "/cgi-bin/true-page/wlan/wlan-0-wps.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Status",
      menuId: "thirdMenuWLAN_status0",
      href: "/cgi-bin/true-page/wlan/wlan-0-status.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    }
  ];
  
  const thirdMenuList_WLAN1 = [
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Basic Setting",
      menuId: "thirdMenuWLAN_basic1",
      href: "/cgi-bin/true-page/wlan/wlan-1-basic.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Advanced Setting",
      menuId: "thirdMenuWLAN_advance1",
      href: "/cgi-bin/true-page/wlan/wlan-1-advance.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Security",
      menuId: "thirdMenuWLAN_security1",
      href: "/cgi-bin/true-page/wlan/wlan-1-security.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Access Control",
      menuId: "thirdMenuWLAN_access1",
      href: "/cgi-bin/true-page/wlan/wlan-1-access.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Neighbors AP",
      menuId: "thirdMenuWLAN_site1",
      href: "/cgi-bin/true-page/wlan/wlan-1-site.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Associated Client",
      menuId: "thirdMenuWLAN_associated1",
      href: "/cgi-bin/true-page/wlan/wlan-1-client.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "WPS",
      menuId: "thirdMenuWLAN_wps1",
      href: "/cgi-bin/true-page/wlan/wlan-1-wps.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Status",
      menuId: "thirdMenuWLAN_status1",
      href: "/cgi-bin/true-page/wlan/wlan-1-status.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Smart Antenna",
      menuId: "thirdMenuWLAN_SmartAntenna",
      href: "/cgi-bin/true-page/wlan/wlan-1-smart-antenna.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
      whoInvisible: 2,
<% end if %>
    }
  ];

/* Add by wenxudong for Wlan page only neighbors AP when agent role, 2023.3.15 */
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
  thirdMenuList_WLAN0.splice(0,thirdMenuList_WLAN0.length);
  thirdMenuList_WLAN0.push(
    {
      modules: "thirdMenuList_WLAN0",
      menuName: "Neighbors AP",
      menuId: "thirdMenuWLAN_site0",
      href: "/cgi-bin/true-page/wlan/wlan-0-site.asp",
      subMenuName: "",
    }
  );

  thirdMenuList_WLAN1.splice(0,thirdMenuList_WLAN1.length);
  thirdMenuList_WLAN1.push(
    {
      modules: "thirdMenuList_WLAN1",
      menuName: "Neighbors AP",
      menuId: "thirdMenuWLAN_site1",
      href: "/cgi-bin/true-page/wlan/wlan-1-site.asp",
      subMenuName: "",
    }
  );
<% end if %>
/* Add end */
  
  const thirdMenuList_advance = [
    {
      modules: "thirdMenuList_advance",
      menuName: "ARP Table",
      menuId: "thirdMenuAdvanceARP",
      href: "/cgi-bin/true-page/advance/advance-arp-table.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_advance",
      menuName: "Bridging",
      menuId: "thirdMenuAdvanceBridging",
      href: "/cgi-bin/true-page/advance/advance-bridging.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_advance",
      menuName: "IPv4 Routing",
      menuId: "thirdMenuAdvanceRouting",
      href: "/cgi-bin/true-page/advance/advance-routing.asp",
      subMenuName: "",
    }
  ];
  
  const thirdMenuList_QoS = [
    {
      modules: "thirdMenuList_QoS",
      menuName: "QoS Basic",
      menuId: "thirdMenuAdvanceQoSbasic",
      href: "/cgi-bin/true-page/advance/advance-ip-qos-basic.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_QoS",
      menuName: "QoS Queue",
      menuId: "thirdMenuAdvanceQoSQueue",
      href: "/cgi-bin/true-page/advance/advance-ip-qos-queue.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_QoS",
      menuName: "QoS Service",
      menuId: "thirdMenuAdvanceQoSService",
      href: "/cgi-bin/true-page/advance/advance-ip-qos-service.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_QoS",
      menuName: "QoS Classification",
      menuId: "thirdMenuAdvanceQoSClassification",
      href: "/cgi-bin/true-page/advance/advance-ip-qos-new-classification.asp",
      subMenuName: "",
    }
  ];
  
  const thirdMenuList_IPv6 = [
    {
      modules: "thirdMenuList_IPv6",
      menuName: "IPv6",
      menuId: "thirdMenuIPv6",
      href: "/cgi-bin/true-page/advance/advance-ipv6-enable-disable.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_IPv6",
      menuName: "RADVD",
      menuId: "thirdMenuIPv6RADVD",
      href: "/cgi-bin/true-page/advance/advance-ipv6-radvd.asp",
      subMenuName: "",    
    },
    {
      modules: "thirdMenuList_IPv6",
      menuName: "DHCPv6 ",
      menuId: "thirdMenuIPv6DHCPv6",
      href: "/cgi-bin/true-page/advance/advance-ipv6-dhcpv6.asp",
      subMenuName: "",
    },
    /*{
      modules: "thirdMenuList_IPv6",
      menuName: "MLD Proxy",
      menuId: "thirdMenuIPv6Proxy",
      href: "/cgi-bin/true-page/advance/advance-ipv6-mld-proxy.asp",
      subMenuName: "",
      whoInvisible: 1,
    },
    {
      modules: "thirdMenuList_IPv6",
      menuName: "MLD Snooping",
      menuId: "thirdMenuIPv6Snooping",
      href: "/cgi-bin/true-page/advance/advance-ipv6-mld-snoopping.asp",
      subMenuName: "",
      whoInvisible: 1,
    },*/
    {
      modules: "thirdMenuList_IPv6",
      menuName: "IPv6 Routing",
      menuId: "thirdMenuIPv6Routing",
      href: "/cgi-bin/true-page/advance/advance-ipv6-routing.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_IPv6",
      menuName: "IP/Port Filtering",
      menuId: "thirdMenuIPv6PortFiltering",
      href: "/cgi-bin/true-page/advance/advance-ipv6-ipport-filtering.asp",
      subMenuName: "",
    }
  ];
  
  var thirdMenuList_advance_WLAN = [
    /*
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Fast Roaming",
      menuId: "thirdMenuMeshRoaming",
      href: "/cgi-bin/true-page/advance/advance-wlan-fast-roaming.asp",
      subMenuName: "",
      diableClick: false,
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
    },*/
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Band Steering",
      menuId: "thirdMenuMeshBandSteering",
      href: "/cgi-bin/true-page/advance/advance-wlan-band-steering.asp",
      subMenuName: "",
      diableClick: false,
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    /*隐藏WiFi Hopping设置，功能默认关闭
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "WiFi Hopping",
      menuId: "thirdMenuWiFiHopping",
      href: "/cgi-bin/true-page/advance/advance-wlan-wifi-hopping.asp",
      subMenuName: "",
    },
    */
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "EasyMesh",
      menuId: "thirdMenuMeshBasic",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-basic.asp",
      subMenuName: "",
    },
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Mesh Advanced",
      menuId: "thirdMenuMeshAdvanced",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-advanced.asp",
      subMenuName: "",
<% if tcWebApi_get("vid_common","skyvid","h") <> "10" then %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% else %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
<% else %>
      whoInvisible: 2,
<% end if %>
    },
    /*隐藏Action页面
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Mesh Action",
      menuId: "thirdMenuMeshAction",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-action.asp",
      subMenuName: "",
      whoInvisible: 1,
    },
    */
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Mesh Status",
      menuId: "thirdMenuMeshStatus",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-status.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% else %>
      whoInvisible: 1,//0:超级用户不可见； 1:普通用户不可见； 2:超级用户及普通用户都不可见；其它值或没有whoInvisible字段则默认显示该菜单
<% end if %>
    },
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Mesh Info",
      menuId: "thirdMenuMeshInfo",
      href: "/cgi-bin/true-page/advance/advance-wlan-easymesh-info.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    },
    {
      modules: "thirdMenuList_advance_WLAN",
      menuName: "Topology",
      menuId: "thirdMenuMeshTopology",
      href: "/cgi-bin/true-page/advance/new-advance-wlan-easymesh-runtime-topology.asp",
      subMenuName: "",
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
      whoInvisible: 2,
<% end if %>
    }
  ];
  
  //export config 
  config.mainMenuList = mainMenuList;
  config.subMenuList_status = subMenuList_status;
  config.subMenuList_LAN = subMenuList_LAN;
  config.subMenuList_WLAN = subMenuList_WLAN;
  config.subMenuList_WAN = subMenuList_WAN;
  config.subMenuList_VoIP = subMenuList_VoIP;
  config.subMenuList_firewall = subMenuList_firewall;
  config.subMenuList_service = subMenuList_service;
  config.subMenuList_advance = subMenuList_advance;
  config.subMenuList_diagnostics = subMenuList_diagnostics;
  config.subMenuList_admin = subMenuList_admin;
  config.subMenuList_statistics = subMenuList_statistics;
  config.subMenuList_OperationMode = subMenuList_OperationMode;
  config.thirdMenuList_LAN = thirdMenuList_LAN;
  config.thirdMenuList_WLAN0 = thirdMenuList_WLAN0;
  config.thirdMenuList_WLAN1 = thirdMenuList_WLAN1;
  config.thirdMenuList_advance = thirdMenuList_advance;
  config.thirdMenuList_QoS = thirdMenuList_QoS;
  config.thirdMenuList_IPv6 = thirdMenuList_IPv6;
  config.thirdMenuList_advance_WLAN = thirdMenuList_advance_WLAN;
  
  return config;
});
