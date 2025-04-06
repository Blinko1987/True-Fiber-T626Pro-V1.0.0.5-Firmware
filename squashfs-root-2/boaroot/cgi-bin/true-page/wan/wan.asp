<%
if Request_Form("Wan_Flag") = "1" then
  TCWebApi_set("QoS_Common","Active","enable_qos")
  TCWebApi_commit("QoS_Common")
  TCWebApi_unset("WanInfo_WanIF")
  TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
  if Request_Form("VLANMode") = "TAG" then
    TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlan")
    TCWebApi_set("WanInfo_WanPVC", "DOT1P", "v8021P")
    TCWebApi_set("WanInfo_WanIF", "v8021PEnable", "v8021PClick")
  elseif Request_Form("VLANMode") = "UNTAG" then
    TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanUNTAG")
    TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
  elseif Request_Form("VLANMode") = "TRANSPARENT" then
    TCWebApi_set("WanInfo_WanPVC", "VLANID", "vlanTRANSPARENT")
    TCWebApi_set("WanInfo_WanPVC", "DOT1P", "vlanPriNone")
  end if
  TCWebApi_set("WanInfo_WanPVC","VLANMode","VLANMode")
  TCWebApi_set("WanInfo_WanPVC","ENCAP","EnCAPFlag")
  TCWebApi_set("WanInfo_WanIF","Active","WanActive")
  TCWebApi_set("WanInfo_WanIF","ServiceList","serviceList")
  TCWebApi_set("WanInfo_WanIF","BandActive","bindflag")
  TCWebApi_set("WanInfo_WanIF","LAN1","bindlan1")
  if TCWebApi_get("WebCustom_Entry","isCT1PORTSupported","h" ) <> "Yes" then
    TCWebApi_set("WanInfo_WanIF","LAN2","bindlan2")
  end if
    if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then
    TCWebApi_set("WanInfo_WanIF","LAN3","bindlan3")
    TCWebApi_set("WanInfo_WanIF","LAN4","bindlan4")
  end if
    if TCWebApi_get("WebCustom_Entry","isHsgmiiLanSupported","h" ) = "Yes" then
  TCWebApi_set("WanInfo_WanIF","LAN25","bindlan25")
  end if
  if TCWebApi_get("WebCustom_Entry","isMultiLanSupported","h" ) = "Yes" then
    TCWebApi_set("WanInfo_WanIF","LAN5","bindlan5")
    TCWebApi_set("WanInfo_WanIF","LAN6","bindlan6")
    TCWebApi_set("WanInfo_WanIF","LAN7","bindlan7")
    TCWebApi_set("WanInfo_WanIF","LAN8","bindlan8")
  end if
  if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then
    TCWebApi_set("WanInfo_WanIF","SSID1","bindwireless1")
    TCWebApi_set("WanInfo_WanIF","SSID2","bindwireless2")
    TCWebApi_set("WanInfo_WanIF","SSID3","bindwireless3")
    TCWebApi_set("WanInfo_WanIF","SSID4","bindwireless4")
    if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) = "Yes" then
      TCWebApi_set("WanInfo_WanIF","SSID5","bindwireless5")
      TCWebApi_set("WanInfo_WanIF","SSID6","bindwireless6")
      TCWebApi_set("WanInfo_WanIF","SSID7","bindwireless7")
      TCWebApi_set("WanInfo_WanIF","SSID8","bindwireless8")
    end if
  end if
  if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then
  TCWebApi_set("WanInfo_WanIF","SSIDAC1","bindwirelessac1")
  TCWebApi_set("WanInfo_WanIF","SSIDAC2","bindwirelessac2")
  TCWebApi_set("WanInfo_WanIF","SSIDAC3","bindwirelessac3")
  TCWebApi_set("WanInfo_WanIF","SSIDAC4","bindwirelessac4")
    if TCWebApi_get("WebCustom_Entry","isMultiUserITFSupported","h" ) = "Yes" then
      TCWebApi_set("WanInfo_WanIF","SSIDAC5","bindwirelessac5")
      TCWebApi_set("WanInfo_WanIF","SSIDAC6","bindwirelessac6")
      TCWebApi_set("WanInfo_WanIF","SSIDAC7","bindwirelessac7")
      TCWebApi_set("WanInfo_WanIF","SSIDAC8","bindwirelessac8")
    end if
  end if
  
  TCWebApi_set("WanInfo_WanIF","LinkMode","linkMode")
  TCWebApi_set("WanInfo_WanIF","Enable6rd","disable6rd")
  if Request_Form("wanMode") = "Route" then
    TCWebApi_set("WanInfo_WanIF","WanMode","wanMode")
    TCWebApi_set("WanInfo_WanIF","MTU","MTU")
    TCWebApi_set("WanInfo_WanIF","Option60ValueMode1","Option60ValueMode")
    TCWebApi_set("WanInfo_WanIF","Option60Enable1","Option60Enable")
    TCWebApi_set("WanInfo_WanIF","Option60Type1","Option60Type")
    TCWebApi_set("WanInfo_WanIF","Option60UserName","ipoeUserName")
    TCWebApi_set("WanInfo_WanIF","Option60Password","ipoePassword")
  elseif Request_Form("wanMode") = "Bridge" then
    TCWebApi_set("WanInfo_WanIF","WanMode","wanMode")
    TCWebApi_set("WanInfo_WanIF","BridgeMode","bridgeMode")
    TCWebApi_set("WanInfo_WanIF","DHCPRealy","dhcprelay")
  elseif Request_Form("wanMode") = "PPPoE" then
    TCWebApi_set("WanInfo_WanIF","WanMode","wanPPPMode")
    TCWebApi_set("WanInfo_WanIF","MTU","MTU")
    if Request_Form("linkMode") = "linkPPP" then
      TCWebApi_set("WanInfo_WanIF","PPPGETIP","PPPGetIpFlag")
      TCWebApi_set("WanInfo_WanIF","CONNECTION","ConnectionFlag")
      TCWebApi_set("WanInfo_WanIF","USERNAME","pppUserName")
      TCWebApi_set("WanInfo_WanIF","PASSWORD","pppPassword")
      TCWebApi_set("WanInfo_WanIF","AUTHMETHOD","pppAuthMethod")
      TCWebApi_set("WanInfo_WanIF","ACNAME","pppACName")
      TCWebApi_set("WanInfo_WanIF","SRVNAME","pppServerName")
      TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
      TCWebApi_set("WanInfo_WanIF","PPPManualStart","pppManualEnable")

      if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then
        tcWebApi_set("WanInfo_WanIF","CONNECTION","ppp_DialMethod")
        if Request_Form("ppp_DialMethod") = "Connect_on_Demand" then
          tcWebApi_set("WanInfo_WanIF","CLOSEIFIDLE","pppondemand_idletime")
        end if
      end if
    end if
  elseif Request_Form("wanMode") = "6rd" then
    TCWebApi_set("WanInfo_WanIF","ServiceList","6rdServiceList")
    TCWebApi_set("WanInfo_WanIF","WanMode","rename_6rdmdoe")
    TCWebApi_set("WanInfo_WanIF","MTU","MTU")
    TCWebApi_set("WanInfo_WanIF","Enable6rd","enable6rd")
    TCWebApi_set("WanInfo_WanIF","IPV6RDBRIPv4Addr","BRaddress")
    TCWebApi_set("WanInfo_WanIF","IPV6RDIPv4MaskLen","ipv4masklen")
    TCWebApi_set("WanInfo_WanIF","IPV6RDPrefix","ipv6rd_prefix")
    TCWebApi_set("WanInfo_WanIF","IPV6RDPrefixLen","ipv6rd_prefixLen")
  end if
  
  TCWebApi_set("WanInfo_WanIF","IPVERSION","IPVersionValue")
  TCWebApi_set("WanInfo_WanIF","ISP","ISPTypeValue")
  
  TCWebApi_set("WanInfo_WanIF","VLANMode","VLANMode")
  TCWebApi_set("WanInfo_WanIF","dot1q","vlanId")
  if Request_Form("vlanId") = "Yes" then
    TCWebApi_set("WanInfo_WanIF","VLANID","vlan")
  end if
  TCWebApi_set("WanInfo_WanIF","dot1p","vlanPri")
  if Request_Form("vlanPri") = "Yes" then
    TCWebApi_set("WanInfo_WanIF","dot1pData","v8021P")
  end if
  tcWebApi_set("WanInfo_WanIF", "DOT1P", "v8021P")
  if Request_Form("MulVIDUsed") = "Yes" then
    TCWebApi_set("WanInfo_WanIF","MulticastVID","MulticastVID")
  end if
  if TCWebApi_get("WebCustom_Entry","isRIPDSupported","h" ) = "Yes" then
    tcWebApi_set("WanInfo_WanIF","RIPVERSION","wan_RIP0")
    tcWebApi_set("WanInfo_WanIF","DIRECTION","wan_RIP_Dir0")
  end if
  TCWebApi_set("WanInfo_WanIF","NATENABLE","nat")
  TCWebApi_set("WanInfo_WanIF","IGMPproxy","enblIgmp")
  
  if Request_Form("IPVersionValue") <> "IPv6" then
    if Request_Form("linkMode") = "linkIP" then
      if Request_Form("IpMode") = "Static" then
        TCWebApi_set("WanInfo_WanIF","IPADDR","wanIpAddress")
        TCWebApi_set("WanInfo_WanIF","NETMASK","wanSubnetMask")
        TCWebApi_set("WanInfo_WanIF","GATEWAY","defaultGateway")
        TCWebApi_set("WanInfo_WanIF","DNS","dnsPrimary")
        TCWebApi_set("WanInfo_WanIF","SecDNS","dnsSecondary")
      end if
    end if
  end if

  if Request_Form("IPVersionValue") <> "IPv4" then
    TCWebApi_set("WanInfo_WanIF","DHCPv6","pppv6Mode")
    TCWebApi_set("WanInfo_WanIF","GW6_Manual","Disable_Flag")
    if Request_Form("IdIpv6AddrType") = "Static" then
      TCWebApi_set("WanInfo_WanIF","IPADDR6","IdIpv6Addr")
      TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
      if Request_Form("IdIpv6Gateway") <> "" then
        TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
      end if
      TCWebApi_set("WanInfo_WanIF","PREFIX6","IdIpv6PrefixLen")
      TCWebApi_set("WanInfo_WanIF","DNS6","IdIpv6Dns1")
      TCWebApi_set("WanInfo_WanIF","SecDNS6","IdIpv6Dns2")
    elseif Request_Form("IdIpv6AddrType") = "DHCP" then
      TCWebApi_set("WanInfo_WanIF","GATEWAY6","IdIpv6Gateway")
      if Request_Form("IdIpv6Gateway") <> "" then
        TCWebApi_set("WanInfo_WanIF","GW6_Manual","Enable_Flag")
      end if
    end if
  end if
  
  TCWebApi_set("WanInfo_WanIF","IFIdx","WanCurrIFIdx")
  if Request_Form("OperatorStyle") = "Add" then
    TCWebApi_set("Wan_Common","LatestIFIdx","WanCurrIFIdx")
    TCWebApi_set("WanInfo_WanPVC", "EPONEnable", "xponstate")
    TCWebApi_set("WanInfo_WanPVC", "GPONEnable", "xponstate")
  end if

  if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then
    if Request_Form("dsliteUsed") = "Yes" then
      TCWebApi_set("WanInfo_WanIF","DsliteEnable","enabledslite")
      TCWebApi_set("WanInfo_WanIF","DsliteMode","dslitemode")
      if Request_Form("dslitemode") = "1" then
        TCWebApi_set("WanInfo_WanIF","DsliteAddr","dsliteaddress")
      end if
    else
      TCWebApi_set("WanInfo_WanIF","DsliteEnable","dsliteDisabled")
    end if
  end if

  if Request_Form("PDUsed") = "Yes" then
    TCWebApi_set("WanInfo_WanIF","PDEnable","enablepd")
  else
    TCWebApi_set("WanInfo_WanIF","PDEnable","PDDisabled")
  end if

  if Request_Form("pdmodeUsed") = "Yes" then
    TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmode")
    if Request_Form("pdmode") = "No" then
      TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeStatic")
      TCWebApi_set("WanInfo_WanIF", "PDPrefix", "pdprefix")
      TCWebApi_set("WanInfo_WanIF", "PrefixPltime", "pdprefixptime")
      TCWebApi_set("WanInfo_WanIF", "PrefixVltime", "pdprefixvtime")
    else
      TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeAuto")
    end if
  else
    TCWebApi_set("WanInfo_WanIF", "DHCPv6PD", "pdmodeDisabled")
    TCWebApi_set("WanInfo_WanIF", "PDOrigin", "pdmodeNone")
  end if
  
  if tcwebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then
    TCWebApi_set("WanInfo_WanIF", "DHCPEnable", "enable_dhcp")
  end if
  
  if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then
    tcWebApi_set("WanInfo_WanIF", "WanHWAddr", "wanhwaddress")
  end if

  if tcWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then
    tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyDisabled")
    tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user_zero")
    tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
    if Request_Form("ppp_proxy_biUsed") = "Yes" then
      tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_mode")
      if Request_Form("ppp_proxy_bi_mode") = "1" then
        tcWebApi_set("WanInfo_WanIF","ProxyEnable","pppproxyEnabled")
        tcWebApi_set("WanInfo_WanIF","ProxyMaxUser","pppproxy_user")
      elseif Request_Form("ppp_proxy_bi_mode") = "2" then
        tcWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiEnabled")
      end if
    else
      tcWebApi_set("WanInfo_WanIF","pppProxyBiMode","ppp_proxy_bi_disable")
    end if
  else
    if Request_Form("pppbiUsed") = "Yes" then
      TCWebApi_set("WanInfo_WanIF","BridgeInterface","enablepppbi")
    else
      'TCWebApi_set("WanInfo_WanIF","BridgeInterface","pppbiDisabled")
      TCWebApi_set("WanInfo_WanIF","BridgeInterface","enablepppbi")
    end if
  end if

  TCWebApi_commit("WanInfo_WanPVC")
  TCWebApi_save()
elseif Request_Form("Wan_Flag") = "2" then
  TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
  TCWebApi_commit("WanInfo_Common")
elseif Request_Form("Wan_Flag") = "3" then
  TCWebApi_set("WanInfo_WanIF","IFIdx","afterdeleteFlag1")
  TCWebApi_set("Wan_Common", "LatestIFIdx", "afterdeleteFlag")
  TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
  TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
  TCWebApi_commit("WanInfo_WanPVC")
  TCWebApi_set("WanInfo_Common","CurIFIndex","afterdeleteFlag")
if Request_Form("DelLast") = "1" then
  TCWebApi_Constset("WanInfo_WanIF","SSIDAC4","No")
end if
  TCWebApi_save()
elseif Request_Form("Wan_Flag") = "4" then
  TCWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag")
  TCWebApi_commit("WanInfo_WanIF")
  TCWebApi_save()
elseif Request_Form("Wan_Flag") = "5" then
  if tcwebApi_get("WebCustom_Entry","isWanEtherSupported","h") = "Yes" then
    TCWebApi_set("Wan_Common", "TransMode", "transMode")
    TCWebApi_set("Wan_Common", "RebootToChangeMode", "rebootToChangeMode")
    TCWebApi_save()
  end if
else
  TCWebApi_set("WanInfo_Common","ErrCode","Wan_Flag")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WAN - WAN</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <!-- self sript -->
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
  <script>
<% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
  var EthPortCapabilityStr = '<% tcWebApi_GetTable("Vid", "EthPortCapability") %>';
  var EthPortCapability = JSON.parse(EthPortCapabilityStr);
  var skylannum = <%tcWebApi_get("Vid_Common","skylannum","s")%>;
<% end if %>
    var AddFlag = false;
    var SelWanIndex = -1;
    var pdDefaultSel = 0;
    var enabledhcpSel = 0;
    var isWanModeChg = -1;
    var isAddBtnClick = 0;
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %> + 1;

    // num 0
    var vArrayStrName1 = "newlink,<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName1 = vArrayStrName1.split(','); 

    var vArrayStr = "newlink,<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryName = vArrayStr.split(',');

    var vArrayStrVlan = "-1,<% tcWebApi_get("WanInfo_Common","Wan_VidPRI","s") %>";
    var vEntryVlan = vArrayStrVlan.split(',');
        
    var vArrayStrIndex = "-1,<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
    var vEntryIndex = vArrayStrIndex.split(',');
    var vCurrentDHCPv6 = "<% tcWebApi_get("WanInfo_WanIF","DHCPv6","s") %>";
    var vBindStatus = "<% tcWebApi_get("WanInfo_Common","BindStatus","s") %>";
    var ppp_flag = 2;
    var manual_flag = 2;
    var vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>";
    if(vcurConnect == "Connect_Keep_Alive")
      ppp_flag = 0;
    else if(vcurConnect == "Connect_Manually")
      ppp_flag = 1;	
    vcurConnect = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>";
    if(vcurConnect == "connect")
      manual_flag = 0;
    else if((vcurConnect == "disconnect"))
      manual_flag = 1;

    SortUtil.SetReplaceStrflag(1);
    vEntryName1 = SortUtil.UpdateWanIFName( vEntryName1, nEntryNum );
    
    vEntryName = SortUtil.SortMyArray( vEntryName );
    vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
    vEntryVlan = SortUtil.SortMyArray( vEntryVlan );

    function trimString(destStr, cTrim)
    {
      var i;
      var j;
      var retStr = '';
      for (i = 0; i < destStr.length; i++)
      {
        if (destStr.charAt(i) != cTrim)
        {
          retStr += destStr.charAt(i);
        }
      }
      return retStr;
    }
    function PvcConstruction(domain,atmPvc,atmQoS,atmPeakCellRate,LinkType,atmSustainedCellRate,atmMaxBurstSize,encapMode)
    {
      this.domain = domain;
      var list = domain.split('.');
      this.key =     '.' + list[4] + '.';
      var realPvc = trimString(atmPvc, ' ');
      if(realPvc.charAt(0) == 'P')
      {
        realPvc = realPvc.substr(4);
      }
      var pvc = realPvc.split('/');
      this.atmVpi = pvc[0];
      this.atmVci = pvc[1];
      this.LinkType = LinkType;    
      this.atmServiceCategory = atmQoS;
      this.atmPeakCellRate = atmPeakCellRate;
      this.atmSustainedCellRate = atmSustainedCellRate;
      this.atmMaxBurstSize = atmMaxBurstSize;
      this.encapMode = encapMode;
    }
    var WanPPP = new Array(null);
    var WanIP = new Array(null);
    var CntPvc = new Array(new PvcConstruction("InternetGatewayDevice.WANDevice.1.WANConnectionDevice.4.WANDSLLinkConfig","PVC:0/35","UBR","0","EoA","0","0","LLC"),null);
    if (WanIP.length > 1)
      AssociateParam('WanIP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');
    if (WanPPP.length > 1)
      AssociateParam('WanPPP','CntPvc','atmVpi|atmVci|atmServiceCategory|atmPeakCellRate|LinkType|atmSustainedCellRate|atmMaxBurstSize|encapMode');

    var Wan = Array();
    var i = 0;
    for (i = 0; i < WanIP.length-1; i++)
    {
      Wan[i] = WanIP[i];
    }
    for (j = 0; j < WanPPP.length-1; j++,i++)
    {
      Wan[i] = WanPPP[j];
    }


    var msg = new Array(6);
    msg[0] = "Successful operation!";
    msg[1] = "Modify failed, a PVC can only create 8 Interface!";
    msg[2] = "Modify failed, PVC is full, can only create 8 PVC!";
    msg[3] = "Failed to create, this PVC already exists 8 Interface!";
    msg[4] = "Failed to create, PVC is full, can only create 8 PVC!";
    msg[5] = "Delete error, Interface does not exist!";
    var oldIpVer;

    <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") <> "Yes"  then%>
      // num 20
      var CycleV = "-1,<% tcWebApi_get("WanInfo_Common","WanIFIndex","s") %>";
      var IFIdxArray = CycleV.split(',');
      IFIdxArray = SortUtil.SortMyArray( IFIdxArray );

      // num 26
      var CycleV1 = "NO,<% tcWebApi_get("WanInfo_Common","WanPPPBi","s") %>";
      var PPPBiArray = CycleV1.split(',');
      PPPBiArray = SortUtil.SortMyArray( PPPBiArray );

      var IFIdxStore = "<% tcWebApi_get("Wan_Common","LatestIFIdx","s") %>";
      
      var vlanIdPVC = ["<%if tcWebApi_get("Wan_PVC0","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC0","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC1","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC1","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC2","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC2","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC3","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC3","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC4","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC4","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC5","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC5","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC6","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC6","VLANID","s") end if%>",
            "<%if tcWebApi_get("Wan_PVC7","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC7","VLANID","s") end if%>"];

    <% else %>
      //num 3
      var vArrayStrEnableVlan = "Yes,<% tcWebApi_get("WanInfo_Common","WanEnableVlan","s") %>";
      var enableVlan = vArrayStrEnableVlan.split(',');
      enableVlan = SortUtil.SortMyArray( enableVlan );
      // num 20
      var vArrayStrIFIndex = "-1,<% tcWebApi_get("WanInfo_Common","WanIFIndex","s") %>";
      var IFIdxArray = vArrayStrIFIndex.split(',');
      IFIdxArray = SortUtil.SortMyArray( IFIdxArray );
      // num 23
      var vArrayStrVlanId= "0/0,<% tcWebApi_get("WanInfo_Common","WanVlanId","s") %>";
      var vlanIdPVC = vArrayStrVlanId.split(',');
      vlanIdPVC = SortUtil.SortMyArray( vlanIdPVC );
      // num 26
      var vArrayStrPPPBi= "No,<% tcWebApi_get("WanInfo_Common","WanPPPBi","s") %>";
      var PPPBiArray = vArrayStrPPPBi.split(',');
      PPPBiArray = SortUtil.SortMyArray( PPPBiArray );

      var IFIdxStore = "<% tcWebApi_get("Wan_Common","LatestIFIdx","s") %>";
    <% end if %>
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/wan/wan.asp" method="post">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
      <input type="hidden" name="WanActive" value="<% tcWebApi_get("WanInfo_WanIF","Active","s") %>">
      <input type="hidden" name="WanCurrIFIdx" value='1'>
      <input type="hidden" name="Wan_Flag" value="0">
      <input type="hidden" name="EnCAPFlag" value="PPPoE">
      <input type="hidden" name="PPPGetIpFlag" value="Dynamic">
      <input type="hidden" name="ConnectionFlag" value="<% tcWebApi_get("WanInfo_WanIF","CONNECTION","s") %>">
      <input type="hidden" name="Enable_Flag" value="Yes">
      <input type="hidden" name="Disable_Flag" value="No">
      <input type="hidden" name="afterdeleteFlag" value="0">
      <input type="hidden" name="OperatorStyle" value="Add">
      <input type="hidden" name="dhcpv6pdflag" value="Yes">
      <input type="hidden" name="btnAddCnt" id="btnAddCnt" />
      <input type="hidden" name="wanPPPMode" id="wanPPPMode" value="Route"/>
      <input type="hidden" name="Option60Enable" id="Option60Enable" value=""/>
      <input type="hidden" name="Option60Type" id="Option60Type" value="6"/>
      <input type="hidden" name="Option60ValueMode" id="Option60ValueMode" value="1"/>
      <input type="hidden" name="6rdServiceList" id="6rdServiceList" value="INTERNET"/>
	  <input type="hidden" name="DelLast" id="DelLast" value="0"/>
      <% if tcWebApi_get("WanInfo_WanIF","PPPManualStart","h")<> "Yes" then %>
        <input type="hidden" name="pppManualEnable" value="No">
      <% else %>
        <input type="hidden" name="pppManualEnable" value="Yes">
      <% end if %>
      <input type="hidden" name="pppManualStatus_Flag" value="<%if tcWebApi_get("XPON_Common","trafficStatus","h") = "up" then tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") end if%>">
      <% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
      <div class="title-text">WAN</div>
      <div class="title-description-text">This page is used to configure the parameters for WAN</div>
      <% else %>
      <div class="title-text">PON WAN</div>
      <div class="title-description-text">This page is used to configure the parameters for PON WAN</div>
      <% end if %>
      <div class="row p-1">
        <div class="col-auto">
            <div class="title-text-left">
              <select class="form-control input-select" id="wanId" name="wanId" onchange="WanIdChange()" style="width:100px;">
              </select>
            </div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Channel Mode:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="wanModeSelect" name="wanMode" onChange="WanModeSelect()">
            <option value="Bridge">Bridge</option>
            <option value="Route">DHCP/STATIC</option>
            <option value="PPPoE">PPPoE</option>
            <option value="6rd">6rd</option>
          </select>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Connection Type:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="serviceList" name="serviceList" onChange="onSelectSvrList()">
          </select>
        </div>
      </div>
      <div class="row p-1" style="display:none;">
        <div class="col-6">
          <div class="title-text-left">Enable WAN:</div>
        </div>
        <div class="col-6">
          <input id="cb_enblService" onclick="cb_enblServiceChange()" type=checkbox name="cb_enblService" <%if tcWebApi_get("WanInfo_WanIF","Active","h") = "Yes" then asp_Write("checked") end if%>>
          <input id="enblService" type="hidden" name="enblService">
        </div>
      </div>
      <div class="row p-1" id="enabledhcpsec">
        <div class="col-6">
          <div class="title-text-left">Enable DHCP Server:</div>
        </div>
        <div class="col-6">
          <input id="cb_enabledhcp" type="checkbox" name="cb_enabledhcp" <%if tcWebApi_get("WanInfo_WanIF","DHCPEnable","h") = "1" then asp_Write("checked") end if%>>
          <input id="enable_dhcp" type="hidden" name="enable_dhcp">
        </div>
      </div>
      <!--enable admin status-->
      <div class="row p-1" id="enable_adminstatus">
        <div class="col-6">
          <div class="title-text-left">Admin Status:</div>
        </div>
        <div class="col-6">
            <input onclick="cb_enblServiceChange()" type=radio value="1" name="cb_enblWanService">
            <label class="input-radio">Enabled</label>
            <input onclick="cb_enblServiceChange()" type=radio value="0" name="cb_enblWanService">
            <label class="input-radio">Disabled</label>
        </div>
      </div>
      <!--enable admin status-->
      <!--enable qos-->
      <div class="row p-1" id="enabledqos">
        <div class="col-6">
          <div class="title-text-left">Enable QoS:</div>
        </div>
        <div class="col-6">
          <input id="cb_enableqos" type="checkbox" name="cb_enableqos" <% if tcWebApi_get("QoS_Common","Active","h") = "Yes" then asp_Write("checked") end if %>>
          <input id="enable_qos" type="hidden" name="enable_qos" value="<%tcWebApi_get("QoS_Common","Active","s")%>">
        </div>
      </div>
      <!--enable qos-->
      <!--enable IPoE-->
      <div id="secIpoeItems">
      <div class="row p-1" id="enabledipoe">
        <div class="col-6">
          <div class="title-text-left">Enable IPoE:</div>
        </div>
        <div class="col-6">
          <input id="cb_enableipoe" type="checkbox" name="cb_enableipoe" onclick="IpoeConf();" >
          <input id="enable_ipoe" type="hidden" name="enable_ipoe">
        </div>
      </div>
      <div class="row p-1" id="ipoename" style="display:none;">
        <div class="col-6">
          <div class="title-text-left">User Name:</div>
        </div>
        <div class="col-6">
          <input class="form-control input-textfield" id="ipoe_name" maxLength=32 size=15 name="ipoeUserName" value="<%if tcWebApi_get("WanInfo_WanIF","Option60UserName","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60UserName","s") end if %>">
        </div>
      </div>
      <div class="row p-1" id="ipoepass" style="display:none;">
        <div class="col-6">
          <div class="title-text-left">Password:</div>
        </div>
        <div class="col-6">
          <input class="form-control input-textfield" id="ipoe_pass" maxLength=32 size=15 name="ipoePassword" value="<%if tcWebApi_get("WanInfo_WanIF","Option60Password","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","Option60Password","s") end if%>">
        </div>
      </div>
      </div>
      <!--enable IPoE-->
      
      <div class="row p-1" id="secbridgeDhcprelay">
        <div class="col-6">
          <div class="title-text-left">DHCP Relay:</div>
        </div>
        <div class="col-6">
          <INPUT id="cb_dhcprelay" type="checkbox" name="cb_dhcprelay" onClick="EnableDHCPRealy()" <%if tcWebApi_get("WanInfo_WanIF","DHCPRealy","h") = "Yes" then asp_Write("checked") end if%>>
          <input type="hidden" name="dhcprelay" value="No">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">VLAN Mode:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="VLANMode" onChange="VLANModeChg()" size=1 name='VLANMode'>
            <option value="TAG" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TAG" then asp_Write("selected") end if%>>TAG
            <option value="UNTAG"  <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "UNTAG" then asp_Write("selected") end if%>>UNTAG
            <option value="TRANSPARENT" <%if tcWebApi_get("WanInfo_WanIF","VLANMode","h") = "TRANSPARENT" then asp_Write("selected") end if%>>TRANSPARENT
          </select>
        </div>
      </div>
      <div class="row p-1" id="vlansec">
        <div class="col-6">
          <div class="title-text-left">VLAN ID:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" id="vlan" maxLength=4 size=5 name="vlan" onBlur="onVlanBlur()" value="<%if tcWebApi_get("WanInfo_WanIF","VLANID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","VLANID","s") end if%>">
          <input id="vlanId" type="hidden" name="vlanId" value="No">
          <input id="vlanUNTAG" type="hidden" name="vlanUNTAG" value="4096">
          <input id="vlanTRANSPARENT" type="hidden" name="vlanTRANSPARENT" value="4097">
        </div>
        <div class="col-3 left">
          <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;">[1-4094]</label>
        </div>
      </div>
      <div class="row p-1" id="mulvidsec">
        <div class="col-6">
          <div class="title-text-left">Multicast VLAN ID:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" id="MulticastVID" maxLength=4 size=5 name="MulticastVID" value="<%if tcWebApi_get("WanInfo_WanIF","MulticastVID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MulticastVID","s") end if%>">
          <input type="hidden" name="MulVIDUsed" value="No">
        </div>
        <div class="col-3 left">
          <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;">[1-4094]</label>
        </div>
      </div>
      <div class="row p-1" id="MTUsec">
        <div class="col-6">
          <div class="title-text-left">MTU:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" id="MTU" maxLength=4 size=5 name="MTU" value="<%if tcWebApi_get("WanInfo_WanIF","MTU","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","MTU","s") end if%>">
        </div>
        <div class="col-3">
          <label class="input-radio" id="MTUsecRange" style="line-height: 24px; margin-bottom: 0px;">[1280-1500]</label>
        </div>
      </div>
      <div class="row p-1" id="priosec">
        <div class="col-6">
          <div class="title-text-left">802.1p_Mark:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="cb_8021P" name="cb_8021P" onChange="change8021P()">
            <option value="-1">Disable</option>
            <option value="0">0</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
          </select>
          <input id="v8021PClick" type="hidden" name="v8021PClick" <%if tcWebApi_get("WanInfo_WanIF","v8021PEnable","h") = "No" then asp_Write("value='No'") else asp_Write("value='Yes'") end if%>>
          <input id="v8021P" type="hidden" maxLength=1 size=5 name="v8021P" value="<%if tcWebApi_get("WanInfo_WanIF","dot1pData","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","dot1pData","s") end if%>">
          <input id=vlanPri type=hidden name=vlanPri value="No">
          <input id=vlanPriNone type=hidden name=vlanPriNone value="0">
        </div>
      </div>
      <div class="row p-1" id="secBridgeType" style="display: none;">
        <div class="col-6">
          <div class="title-text-left">Bridge Mode:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="bridgeMode" name="bridgeMode"> 
            <option value="PPPoE_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "PPPoE_Bridged" then asp_Write("selected") end if%>>PPPoE_Bridged</option>
            <option value="IP_Bridged" <%if tcWebApi_get("WanInfo_WanIF","BridgeMode","h") = "IP_Bridged" then asp_Write("selected") end if%>>IP_Bridged</option>
          </select> 
        </div>
      </div>
      <div class="row p-1" id="divLink" style="display:none;">
        <div class="col-6">
          <div class="title-text-left">Link Mode:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="linkMode" name="linkMode" onchange="linkModeSelect()">
            <option value="linkIP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkIP" then asp_Write("selected") end if%>>IP</option>
            <option value="linkPPP" <%if tcWebApi_get("WanInfo_WanIF","LinkMode","h") = "linkPPP" then asp_Write("selected") end if%>>PPP </option>
          </select>
        </div>
      </div>
      <div class="row p-1" id="divIpVersion">
        <div class="col-6">
          <div class="title-text-left">IP Protocol:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="IpVersion" name="IpVersion" onchange="pdDefaultSel=1;IPProtocolSelect()">
            <option value="IPv4" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION", "h") = "IPv4" then asp_Write("selected") elseif tcWebApi_get("Wan_Entry","IPVERSION","h") = "N/A" then asp_Write("selected") end if%>>IPv4</option>
            <option value="IPv6" <%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv6" then  asp_Write("selected") end if%>>IPv6</option>
            <option value="IPv4/IPv6"<%if tcWebApi_get("WanInfo_WanIF","IPVERSION","h") = "IPv4/IPv6" then  asp_Write("selected") end if%>>IPv4/IPv6</option>
          </select>
          <input type="hidden" name="IPVersionValue" value="IPv4/IPv6">
          <input type="hidden" name="ISPTypeValue" value="<% tcWebApi_get("WanInfo_WanIF","ISP","s") %>">
        </div>
      </div>
      <div class="row p-1" id="secNat">
        <div class="col-6">
          <div class="title-text-left">Enable NAT:</div>
        </div>
        <div class="col-6">
          <input id="cb_nat" type="checkbox" name="cb_nat" onClick="EnableNatClick()" <%if tcWebApi_get("WanInfo_WanIF","NATENABLE","h") = "Enable" then asp_Write("checked") end if%>>
          <input id="nat" type="hidden" value='<% tcWebApi_get("WanInfo_WanIF","NATENABLE","s") %>' name="nat">
        </div>
        <br>
      </div>
      <br>

      <div id="secIpMode">
        <div class="title-text">IPv4 WAN Setting</div>
        <div class="row p-1" id="secIpMode1">
          <div class="col-6">
            <div class="title-text-left">Type:</div>
          </div>
          <div class="col-6"><!--todo add PPPoA/IPoA-->
            <input onclick="IpModeChange()" type=radio value="Static" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "1" then asp_Write("checked") end if%>>
            <label class="input-radio">Fixed IP</label>
            <input onclick="IpModeChange()" type=radio value="DHCP" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "0" then asp_Write("checked") end if%>>
            <label class="input-radio">DHCP</label>
            <input style="display:none;" onclick="IpModeChange()" type=radio value="PPPoE" name="IpMode" <%if tcWebApi_get("WanInfo_WanIF","ISP","h") = "2" then asp_Write("checked") end if%>>
            <label style="display:none;" class="input-radio">PPPoE</label>
          </div>
        </div>
        <br>
      </div>

      <div id="secRouteItems">
        <div id="secStaticItems" style="display: none;">
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Local IP Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="wanIpAddress" maxLength=15 size=15 name="wanIpAddress" 
              value="<%if TCWebApi_get("WanInfo_WanIF","IPADDR","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Remote IP Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="wanRemoteIpAddress" maxLength=15 size=15 name="wanRemoteIpAddress" value="" disabled>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Subnet Mask:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="wanSubnetMask" maxLength=15 size=15 name="wanSubnetMask" 
              value="<%if TCWebApi_get("WanInfo_WanIF","NETMASK","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","NETMASK","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">IP Unnumbered:</div>
            </div>
            <div class="col-6">
              <input id="wanIPUnnumbered" name="wanIPUnnumbered" type="checkbox" disabled>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Request DNS:</div>
            </div>
            <div class="col-6">
                <input type=radio value="DHCP" name="RequestDNS" checked>
                <label class="input-radio">Enabled</label>
                <input type=radio value="Static" name="RequestDNS">
                <label class="input-radio">Disabled</label>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Default Gateway:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="defaultGateway" maxLength=15 size=15 name="defaultGateway" 
              value="<%if TCWebApi_get("WanInfo_WanIF","GATEWAY","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","GATEWAY","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Primary DNS Server:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="dnsPrimary" maxLength=15 size=15 name="dnsPrimary" 
              value="<%if TCWebApi_get("WanInfo_WanIF","DNS","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","DNS","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Secondary DNS Server:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="dnsSecondary" maxLength=15 size=15 name="dnsSecondary" 
              value="<%if TCWebApi_get("WanInfo_WanIF","SecDNS","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","SecDNS","s" ) end if %>">
            </div>
          </div>
          <br>
        </div>

        <div id="secPppoeItems">
          <div class="title-text">PPP Setting</div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">User Name:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="pppUserName" type="text" maxLength=32 size=15 name="pppUserName"
               value='<%if TCWebApi_get("WanInfo_WanIF","USERNAME","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","USERNAME","s" ) end if %>' disabled>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Password:</div>
            </div>
            <div class="col-4">
              <input class="form-control input-textfield" id="pppPassword" type="password" maxLength=32 size=15 name="pppPassword"
               value='<% if TCWebApi_get("WanInfo_WanIF","PASSWORD","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PASSWORD","s" ) end if %>' disabled>
            </div>
            <div class="col-2 left">
              <img src="/image/icon/visibility.svg" width="20" height="30" onclick="pppPasswordVisible()">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Authentication Method:</div>
            </div>
            <div class="col-6">
              <select class="form-control input-select" id="pppAuthMethod" name="pppAuthMethod">
                <option value="AUTO" <%if tcWebApi_get("WanInfo_WanIF","AUTHMETHOD","h") = "AUTO" then  asp_Write("selected") end if%>>AUTO</option>
                <option value="PAP" <%if tcWebApi_get("WanInfo_WanIF","AUTHMETHOD","h") = "PAP" then  asp_Write("selected") end if%>>PAP</option>
                <option value="CHAP" <%if tcWebApi_get("WanInfo_WanIF","AUTHMETHOD","h") = "CHAP" then  asp_Write("selected") end if%>>CHAP</option>
              </select>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">AC-Name:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="pppACName" maxLength=63 size=15 name="pppACName"
               value="<%if TCWebApi_get("WanInfo_WanIF","ACNAME","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","ACNAME","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Service Name:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="pppServerName" maxLength=63 size=15 name="pppServerName"
               value="<%if TCWebApi_get("WanInfo_WanIF","SRVNAME","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","SRVNAME","s" ) end if %>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Dial:</div>
            </div>
            <div class="col-3">
              <select class="form-control input-select" id='ppp_DialMethod' onchange='ppp_dialMethodChg()' name='ppp_DialMethod'> 
              <option value="Connect_Keep_Alive" <%if TCWebApi_get("WanInfo_WanIF","CONNECTION","h" ) = "Connect_Keep_Alive" then asp_Write("selected") end if %>>AlwaysOn</option>
              <% if tcWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
                <option value="Connect_on_Demand" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_on_Demand" then asp_Write("selected")  end if%>>OnDemand</option>
                <option value="Connect_Manually" <%if tcWebApi_get("WanInfo_WanIF","CONNECTION","h") = "Connect_Manually" then asp_Write("selected")  end if%>>Manual</option>
              <% end if %>
              </select>
            </div>
            <div class="col-3" id="secManualDial">
              <input class="btn-dashboard" id="pppDialButton" onclick="ManualCntSubmit()" type="button" name="pppDialButton" style="margin: 0px; width: 100px; padding: 0.4rem;"
               value='<%if tcWebApi_get("XPON_Common","trafficStatus","h")<> "up" then asp_Write("connect") else asp_Write("disconnect") end if%>' >
            </div>
          </div>
          <div class="row p-1" id="secIdleTime">
            <div class="col-6">
              <div class="title-text-left">No flow:</div>
            </div>
            <div class="col-2">
              <input type="hidden" id='pppondemand_idletime' name='pppondemand_idletime'
               value="<%if tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","CLOSEIFIDLE","s") end if%>" >
              <input class="form-control input-textfield" id="pppTimeOut" maxLength=4 size=4 name="pppTimeOut" onblur="onPppTimeOutBlur()">
            </div>
            <div class="col-4">
              <label class="input-radio" style="  line-height: 24px; margin-bottom: 0px;">Disconnect after&nbsp;<span id="pppTimeOutText"></span>&nbsp;seconds</label>
              <input type="hidden" name="pppv6Mode" value="0">
            </div>
          </div>
          <div class="row p-1" id="ppp_bi">
            <div class="col-6">
              <div class="title-text-left">PPPoE with Bridge:</div>
            </div>
            <div class="col-6">
              <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes"  then%>
                <input id='cb_enable_pppbi' disabled="true" type="checkbox" name='cb_enable_pppbi' <%if tcWebApi_get("WanInfo_WanIF","BridgeInterface","h") = "Yes" then asp_Write("checked") end if%>>
              <%else%>
                <input id='cb_enable_pppbi' type="checkbox" name='cb_enable_pppbi' <%if tcWebApi_get("WanInfo_WanIF","BridgeInterface","h") = "Yes" then asp_Write("checked") end if%>>
              <%end if%>
                <input id='enablepppbi' type=hidden name='enablepppbi'>
                <input id='pppbiUsed' type=hidden name='pppbiUsed'>
                <input id='pppbiDisabled' type=hidden name='pppbiDisabled' value='No'>
            </div>
          </div>
          <br>
        </div>
      </div>

      <div id="secIPv6Div" style="display: none;">
        <div class="title-text" id="TrIpv6AddrTitle">IPv6 WAN Setting</div>
        <div class="row p-1" id="TrIpv6AddrType">
          <div class="col-6">
            <div class="title-text-left">IPv6 WAN Access Type:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" id="IdIpv6AddrType" name="IdIpv6AddrType" onChange="pdDefaultSel=1;OnIPv6Changed();">
              <option value="SLAAC" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "No" then asp_Write("selected") end if %>>SLAAC</option>
              <option value="DHCP" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "Yes" then asp_Write("selected") end if %>>DHCP</option>
              <option value="Static" <%if TCWebApi_get("WanInfo_WanIF","DHCPv6","h" ) = "Sta" then asp_Write("selected") end if %>>Static</option>
            </select>
          </div>
        </div>
        <div id="TrIpv6Addr">
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">IPv6 Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id="IdIpv6Addr" maxLength=39 size=36 name="IdIpv6Addr"
                value='<%if TCWebApi_get("WanInfo_WanIF","IPADDR6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","IPADDR6","s" ) end if %>'>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">IPv6 Prefix Len:</div>
            </div>
            <div class="col-2">
              <input class="form-control input-textfield" id="IdIpv6PrefixLen" maxLength=3 size=3 name="IdIpv6PrefixLen"
               value='<% if TCWebApi_get("WanInfo_WanIF","PREFIX6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","PREFIX6","s" ) end if %>'> 
            </div>
          </div>
        </div>
        <div class="row p-1" id="TrIpv6Gateway">
          <div class="col-6">
            <div class="title-text-left">IPv6 Default Gateway:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" id="IdIpv6Gateway" maxLength=39 size=36 name="IdIpv6Gateway"
             value='<% if TCWebApi_get("WanInfo_WanIF","GATEWAY6","h" ) <> "N/A" then TCWebApi_get("WanInfo_WanIF","GATEWAY6","s" ) end if %>'
             placeholder="automaticly" onfocus="this.placeholder=''" onblur="this.placeholder='automaticly'">
          </div>
        </div>
        <!--v1.4-->
        <div class="row p-1" id="RequestIPv6DNS">
          <div class="col-6">
            <div class="title-text-left">Request DNS:</div>
          </div>
          <div class="col-6">
            <input type=radio value="DHCP" name="RequestIPv6DNS" checked>
            <label class="input-radio">Enabled</label>
            <input type=radio value="Static" name="RequestIPv6DNS">
            <label class="input-radio">Disabled</label>
          </div>
        </div>
        <!--v1.4-->
        <div class="row p-1" id="TrIpv6Dns1">
          <div class="col-6">
            <div class="title-text-left">IPv6 Primary IPv6 DNS:</div>
          </div>
          <div class="col-6">
             <input class="form-control input-textfield" id="IdIpv6Dns1" maxLength=39 size=36 name="IdIpv6Dns1"
              value='<%if tcWebApi_get("WanInfo_WanIF","DNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DNS6","s") end if%>'>
          </div>
        </div>
        <div class="row p-1" id="TrIpv6Dns2">
          <div class="col-6">
            <div class="title-text-left">IPv6 Secondary IPv6 DNS:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" id="IdIpv6Dns2" maxLength=39 size=36 name="IdIpv6Dns2"
             value='<%if tcWebApi_get("WanInfo_WanIF","SecDNS6","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","SecDNS6","s") end if%>'>
          </div>
        </div>
        <div class="row p-1" id="PDEnableSec">
            <div class="col-6">
                <div class="title-text-left">Enable PD:</div>
            </div>
            <div class="col-6">
              <input id="cb_enabledpd" type="checkbox" onclick="cb_pdEnableChange()" name="cb_enabledpd" <%if tcWebApi_get("WanInfo_WanIF","PDEnable","h") = "Yes" then asp_Write("checked") end if%>>
              <input id="enablepd" type="hidden" name="enablepd">
              <input id="PDUsed" type="hidden" name="PDUsed">
              <input id="PDDisabled" type="hidden" name="PDDisabled" value="No">
            </div>
        </div>
        <div class="row p-1" id="pdmode_1">
          <div class="col-6">
            <div class="title-text-left">Prefix Mode:</div>
          </div>
          <div class="col-6">
            <input onclick="pdmodeChange()" type="radio" value="Yes" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin", "h") <> "Static" then asp_Write("checked") end if%>>
            <label class="input-radio">Auto</label>
            <input onclick="pdmodeChange()" type="radio" value="No" name="pdmode" <%if tcWebApi_get("WanInfo_WanIF","PDOrigin","h") = "Static" then asp_Write("checked") end if%>>
            <label class="input-radio">Manual</label>
            <input id='pdmodeUsed' type=hidden name='pdmodeUsed'>
            <input id='pdmodeDisabled' type=hidden name='pdmodeDisabled' value='No'>
            <input id='pdmodeAuto' type=hidden name='pdmodeAuto' value='PrefixDelegation'>
            <input id='pdmodeStatic' type=hidden name='pdmodeStatic' value='Static'>
            <input id='pdmodeNone' type=hidden name='pdmodeNone' value='None'>
          </div>
        </div>
        <div id="ipv6_manual_div">
          <div class="row p-1" id="pdmode_2">
            <div class="col-6">
              <div class="title-text-left">Prefix Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-textfield" id='pdprefix' maxLength=39 size=36 name='pdprefix'
                value="<%if tcWebApi_get("WanInfo_WanIF","PDPrefix","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PDPrefix","s") end if%>">
            </div>
          </div>
          <div class="row p-1" id="pdmode_3">
            <div class="col-6">
              <div class="title-text-left">Preferred Time:</div>
            </div>
            <div class="col-3">
              <input class="form-control input-textfield" id='pdprefixptime' maxLength=10 size=10 name='pdprefixptime'
                value="<%if tcWebApi_get("WanInfo_WanIF","PrefixPltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixPltime","s") end if%>">
            </div>
            <div class="col-3">
              <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;"><strong style="COLOR: #ff0033">*</strong>[600 - 4294967295 s]</label>
            </div>
          </div>
          <div class="row p-1" id="pdmode_4">
            <div class="col-6">
              <div class="title-text-left">Valid Time:</div>
            </div>
            <div class="col-3">
              <input class="form-control input-textfield" id='pdprefixvtime' maxLength=10 size=10 name='pdprefixvtime'
                value="<%if tcWebApi_get("WanInfo_WanIF","PrefixVltime","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","PrefixVltime","s") end if%>">
            </div>
            <div class="col-3">
              <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;"><strong style="COLOR: #ff0033">*</strong>[600 - 4294967295 s]</label>
            </div>
          </div>
        </div>
        <div class="row p-1" id="dslite_1">
          <div class="col-6">
            <div class="title-text-left">DS-Lite:</div>
          </div>
          <div class="col-6">
            <input id='cb_enabledslite' onclick=cb_enabledsliteChange() type=checkbox name='cb_enabledslite' <%if tcWebApi_get("WanInfo_WanIF","DsliteEnable","h") = "Yes" then asp_Write("checked") end if%>>
            <input id='enabledslite' type=hidden name='enabledslite'>
            <input id='dsliteUsed' type=hidden name='dsliteUsed'>
            <input id='dsliteDisabled' type=hidden name='dsliteDisabled' value='No'>
          </div>
        </div>
        <div class="row p-1" id="dslite_2">
          <div class="col-6">
            <div class="title-text-left">DS-Lite Mode:</div>
          </div>
          <div class="col-6">
            <input onclick='dslitemodeChange()' type=radio value="0" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode", "h") = "0" then asp_Write("checked") elseif tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "N/A" then asp_Write("checked") end if%>>
            <label class="input-radio">Auto</label>
            <input onclick='dslitemodeChange()' type=radio value="1" name="dslitemode" <%if tcWebApi_get("WanInfo_WanIF","DsliteMode","h") = "1" then  asp_Write("checked") end if%>>
            <label class="input-radio">Manual</label>
          </div>
        </div>
        <div class="row p-1" id="dslite_3">
          <div class="col-6">
            <div class="title-text-left">DS-Lite Server:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" id='dsliteaddress' maxLength=39 size=36 name='dsliteaddress'
             value='<%if tcWebApi_get("WanInfo_WanIF","DsliteAddr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","DsliteAddr","s") end if%>'>
          </div>
        </div>
        <br>
      </div>
      <!--6rd-->
      <div id="sec6RdItems" class="6rd" style="display:none;">
        <div class="title-text">6rd Config</div>
        <input id='enable6rd' type=hidden name='enable6rd'>
        <input id='disable6rd' type=hidden name='disable6rd' value="No">
        <input id='rename_6rdmdoe' type=hidden name='rename_6rdmdoe' value="Route">
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Board Router v4 Address:</div>
            </div>
          <div class="col-6">
            <input class="form-control input-textfield" id='BRaddress' maxLength=39 size=36 name='BRaddress'
             value='<%if tcWebApi_get("WanInfo_WanIF","IPV6RDBRIPv4Addr","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","IPV6RDBRIPv4Addr","s") end if%>'>
          </div>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">6rd IPv4 Mask Len [0 - 31]:</div>
            </div>
          <div class="col-6">
            <input class="form-control input-textfield" id='ipv4masklen' maxLength=39 size=36 name='ipv4masklen'
             value='<%if tcWebApi_get("WanInfo_WanIF","IPV6RDIPv4MaskLen","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","IPV6RDIPv4MaskLen","s") end if%>'>
          </div>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">6rd Prefix (EX:"2001:db8::"):</div>
            </div>
          <div class="col-6">
            <input class="form-control input-textfield" id='ipv6rd_prefix' maxLength=39 size=36 name='ipv6rd_prefix'
             value='<%if tcWebApi_get("WanInfo_WanIF","IPV6RDPrefix","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","IPV6RDPrefix","s") end if%>'>
          </div>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">6rd Prefix length [1 - 64]:</div>
            </div>
          <div class="col-6">
            <input class="form-control input-textfield" id='ipv6rd_prefixLen' maxLength=39 size=36 name='ipv6rd_prefixLen'
             value='<%if tcWebApi_get("WanInfo_WanIF","IPV6RDPrefixLen","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","IPV6RDPrefixLen","s") end if%>'>
          </div>
        </div>
      </div>
      
      <!--6rd-->
      <div id="secBind">
        <div class="title-text">Port Mapping</div>
        <% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
                      <SCRIPT language=JavaScript type=text/javascript>
						var lan25_exist = 0;
						var lan1_exist = 0;
						var lan2_exist = 0;
						var lan3_exist = 0;
						var lan4_exist = 0;
	                    for(var i = 0; i < skylannum; i++){
							var currentLanName = EthPortCapability[0]["skylanname" + i];
							if(currentLanName == "LAN25"){
								 lan25_exist = 1;
							}else if(currentLanName == "LAN1"){
								 lan1_exist = 1;
							}else if(currentLanName == "LAN2"){
								 lan2_exist = 1;
							}else if(currentLanName == "LAN3"){
								 lan3_exist = 1;
							}else if(currentLanName == "LAN4"){
								 lan4_exist = 1;
							}
						} 
						
                        if(lan25_exist == 1){
                        	document.write('<div class="row p-1">');
                            document.write('<div class="col-3" id="secLan25">');
						}else{
							document.write('<div class="row p-1">');
							document.write('<div class="col-3" id="secLan25" style="display:none;">');
						}
                            document.write('<div class="title-text-left">');
                            document.write('<INPUT id="cb_bindlan25" type="checkbox" name="cb_bindlan25" <%if tcWebApi_get("WanInfo_WanIF","LAN25","h") = "Yes" then asp_Write("checked") end if%> >');
                            document.write('<label class="input-radio padding-right-0" style="display:inline"> LAN(2.5GE)</label>');
                            document.write('<INPUT id="bindlan25" type="hidden" value=0 name="bindlan25">');
                            document.write('</div>');
                            document.write('</div>');
                            document.write('</div>');
						document.write('<div class="row p-1">');
                        if(lan1_exist == 1){
							document.write('<div class="col-3" id="secLan1">');
						}else{
							document.write('<div class="col-3" id="secLan1" style="display:none;">');
						}
                            document.write('<div class="title-text-left">');
                            document.write('<INPUT id="cb_bindlan1" type="checkbox" name="cb_bindlan1" <%if tcWebApi_get("WanInfo_WanIF","LAN1","h") = "Yes" then asp_Write("checked") end if%> >');
                            document.write('<label class="input-radio padding-right-0" style="display:inline"> LAN_1</label>');
                            document.write('<INPUT id="bindlan1" type="hidden" value=0 name="bindlan1">');
                            document.write('</div>');
                            document.write('</div>');
						
                        if(lan2_exist == 1){
							document.write('<div class="col-3" id="secLan2">');
						}else{
							document.write('<div class="col-3" id="secLan2" style="display:none;">');
						}
                            document.write('<div class="title-text-left">');
                            document.write('<INPUT id="cb_bindlan2" type="checkbox" name="cb_bindlan2" <%if tcWebApi_get("WanInfo_WanIF","LAN2","h") = "Yes" then asp_Write("checked") end if%> >');
                            document.write('<label class="input-radio padding-right-0" style="display:inline"> LAN_2</label>');
                            document.write('<INPUT id="bindlan2" type="hidden" value=0 name="bindlan2">');
                            document.write('</div>');
                            document.write('</div>');
						
                        if(lan3_exist == 1){
							document.write('<div class="col-3" id="secLan3">');
						}else{
							document.write('<div class="col-3" id="secLan3" style="display:none;">');
						}
                            document.write('<div class="title-text-left">');
                            document.write('<INPUT id="cb_bindlan3" type="checkbox" name="cb_bindlan3" <%if tcWebApi_get("WanInfo_WanIF","LAN3","h") = "Yes" then asp_Write("checked") end if%> >');
                            document.write('<label class="input-radio padding-right-0" style="display:inline"> LAN_3</label>');
                            document.write('<INPUT id="bindlan3" type="hidden" value=0 name="bindlan3">');
                            document.write('</div>');
                            document.write('</div>');
						
                        if(lan4_exist == 1){
							document.write('<div class="col-3" id="secLan4">');
						}else{
							document.write('<div class="col-3" id="secLan4" style="display:none;">');
						}
                            document.write('<div class="title-text-left">');
                            document.write('<INPUT id="cb_bindlan4" type="checkbox" name="cb_bindlan4" <%if tcWebApi_get("WanInfo_WanIF","LAN4","h") = "Yes" then asp_Write("checked") end if%> >');
                            document.write('<label class="input-radio padding-right-0" style="display:inline"> LAN_4</label>');
                            document.write('<INPUT id="bindlan4" type="hidden" value=0 name="bindlan4">');
                            document.write('</div>');
                            document.write('</div>');
						document.write('</div>');
                      </SCRIPT>
<% else %> 
		<div class="row p-1">
            <div class="col-3" id="secLan1">
                <div class="title-text-left">
                  <input id="cb_bindlan1" type="checkbox" name="cb_bindlan1" <%if tcWebApi_get("WanInfo_WanIF","LAN1","h") = "Yes" then asp_Write("checked") end if%>>
                  <label class="input-radio padding-right-0">LAN_1</label>
                  <input id="bindlan1" type="hidden" value="0" name="bindlan1">
                </div>
            </div>
            <div class="col-3" id="secLan2">
              <div class="title-text-left">
                <input id="cb_bindlan2" type="checkbox" name="cb_bindlan2" <%if tcWebApi_get("WanInfo_WanIF","LAN2","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio padding-right-0">LAN_2</label>
                <input id="bindlan2" type="hidden" value="0" name="bindlan2">
              </div>
            </div>
            <div class="col-3" id="secLan3">
                <div class="title-text-left">
                  <input id="cb_bindlan3" type="checkbox" name="cb_bindlan3" <%if tcWebApi_get("WanInfo_WanIF","LAN3","h") = "Yes" then asp_Write("checked") end if%>>
                  <label class="input-radio padding-right-0">LAN_3</label>
                  <input id="bindlan3" type="hidden" value="0" name="bindlan3">
                </div>
            </div>
            <div class="col-3" id="secLan4">
              <div class="title-text-left">
                <input id="cb_bindlan4" type="checkbox" name="cb_bindlan4" <%if tcWebApi_get("WanInfo_WanIF","LAN4","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio padding-right-0">LAN_4</label>
                <input id="bindlan4" type="hidden" value="0" name="bindlan4">
              </div>
            </div>
          </div>
 <% end if %>
      <div class="row p-1" id="LanBindExt">
            <div class="col-3" id="secLan5">
                <div class="title-text-left">
                  <input id="cb_bindlan5" type="checkbox" name="cb_bindlan5" <%if tcWebApi_get("WanInfo_WanIF","LAN5","h") = "Yes" then asp_Write("checked") end if%>>
                  <label class="input-radio padding-right-0">LAN_5</label>
                  <input id="bindlan5" type="hidden" value="0" name="bindlan5">
                </div>
            </div>
            <div class="col-3" id="secLan6">
              <div class="title-text-left">
                <input id="cb_bindlan6" type="checkbox" name="cb_bindlan6" <%if tcWebApi_get("WanInfo_WanIF","LAN6","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio padding-right-0">LAN_6</label>
                <input id="bindlan6" type="hidden" value="0" name="bindlan6">
              </div>
            </div>
            <div class="col-3" id="secLan7">
                <div class="title-text-left">
                  <input id="cb_bindlan7" type="checkbox" name="cb_bindlan7" <%if tcWebApi_get("WanInfo_WanIF","LAN7","h") = "Yes" then asp_Write("checked") end if%>>
                  <label class="input-radio padding-right-0">LAN_7</label>
                  <input id="bindlan7" type="hidden" value="0" name="bindlan7">
                </div>
            </div>
            <div class="col-3" id="secLan8">
              <div class="title-text-left">
                <input id="cb_bindlan8" type="checkbox" name="cb_bindlan8" <%if tcWebApi_get("WanInfo_WanIF","LAN8","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio padding-right-0">LAN_8</label>
                <input id="bindlan8" type="hidden" value="0" name="bindlan8">
              </div>
            </div>
        </div>
        <div class="row p-1" id="wlanacBindTab">
          <div class="col-3" id="secWirelessac1" style="display:none;">
            <div class="title-text-left">
              <input id="cb_bindwirelessac1" type="checkbox" name="cb_bindwirelessac1" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC1","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-AP1</label>
              <input id="bindwirelessac1" type="hidden" value="0" name="bindwirelessac1">
            </div>
          </div>
          <div class="col-3" id="secWirelessac2">
            <div class="title-text-left">
              <input id="cb_bindwirelessac2" type="checkbox" name="cb_bindwirelessac2" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC2","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-SSID1</label>
              <input id="bindwirelessac2" type="hidden" value="0" name="bindwirelessac2">
            </div>
          </div>
          <div class="col-3" id="secWirelessac3">
            <div class="title-text-left">
              <input id="cb_bindwirelessac3" type="checkbox" name="cb_bindwirelessac3" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC3","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-SSID2</label>
              <input id="bindwirelessac3" type="hidden" value="0" name="bindwirelessac3">
            </div>
          </div>
          <div class="col-3" id="secWirelessac4">
            <div class="title-text-left">
<% if tcWebApi_get("vid_common","skyvid","h") = "10" then %>
              <input id="cb_bindwirelessac4" type="checkbox" name="cb_bindwirelessac4" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC4","h") = "Yes" then asp_Write("checked") end if%>>
<% else %>
              <input id="cb_bindwirelessac4" type="checkbox" name="cb_bindwirelessac4" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC4","h") = "Yes" then asp_Write("checked") asp_Write(" disabled") end if%>>
<% end if %>
              <label class="input-radio padding-right-0">WLAN0-SSID3</label>
              <input id="bindwirelessac4" type="hidden" value="0" name="bindwirelessac4">
            </div>
          </div>
          <div class="col-3" id="secWirelessac5">
            <div class="title-text-left">
              <input id="cb_bindwirelessac5" type="checkbox" name="cb_bindwirelessac5" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC5","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-SSID4</label>
              <input id="bindwirelessac5" type="hidden" value="0" name="bindwirelessac5">
            </div>
          </div>
        </div>
        <div class="row p-1" id="wlanacBindSSIDExt" style="display:none;">
          <div class="col-3" id="secWirelessac6">
            <div class="title-text-left">
              <input id="cb_bindwirelessac6" type="checkbox" name="cb_bindwirelessac6" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC6","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-AP5</label>
              <input id="bindwirelessac6" type="hidden" value="0" name="bindwirelessac6">
            </div>
          </div>
          <div class="col-3" id="secWirelessac7">
            <div class="title-text-left">
              <input id="cb_bindwirelessac7" type="checkbox" name="cb_bindwirelessac7" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC7","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-AP6</label>
              <input id="bindwirelessac7" type="hidden" value="0" name="bindwirelessac7">
            </div>
          </div>
          <div class="col-3" id="secWirelessac8">
            <div class="title-text-left">
              <input id="cb_bindwirelessac8" type="checkbox" name="cb_bindwirelessac8" <%if tcWebApi_get("WanInfo_WanIF","SSIDAC8","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN0-AP7</label>
              <input id="bindwirelessac8" type="hidden" value="0" name="bindwirelessac8">
            </div>
          </div>
        </div>
        <div class="row p-1" id="wlanBindTab">
          <div class="col-3" id="secWireless1" style="display:none;">
            <div class="title-text-left">
              <input id="cb_bindwireless1" type="checkbox" name="cb_bindwireless1" <%if tcWebApi_get("WanInfo_WanIF","SSID1","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-AP1</label>
              <input id="bindwireless1" type="hidden" value="0" name="bindwireless1">
            </div>
          </div>
          <div class="col-3" id="secWireless2">
            <div class="title-text-left">
              <input id="cb_bindwireless2" type="checkbox" name="cb_bindwireless2" <%if tcWebApi_get("WanInfo_WanIF","SSID2","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-SSID1</label>
              <input id="bindwireless2" type="hidden" value="0" name="bindwireless2">
            </div>
          </div>
          <div class="col-3" id="secWireless3">
            <div class="title-text-left">
              <input id="cb_bindwireless3" type="checkbox" name="cb_bindwireless3" <%if tcWebApi_get("WanInfo_WanIF","SSID3","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-SSID2</label>
              <input id="bindwireless3" type="hidden" value="0" name="bindwireless3">
            </div>
          </div>
          <div class="col-3" id="secWireless4">
            <div class="title-text-left">
              <input id="cb_bindwireless4" type="checkbox" name="cb_bindwireless4" <%if tcWebApi_get("WanInfo_WanIF","SSID4","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-SSID3</label>
              <input id="bindwireless4" type="hidden" value="0" name="bindwireless4">
            </div>
          </div>
          <div class="col-3" id="secWireless5">
            <div class="title-text-left">
              <input id="cb_bindwireless5" type="checkbox" name="cb_bindwireless5" <%if tcWebApi_get("WanInfo_WanIF","SSID5","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-SSID4</label>
              <input id="bindwireless5" type="hidden" value="0" name="bindwireless5">
            </div>
          </div>
        </div>
        <div class="row p-1" id="wlanBindSSIDExt" style="display:none;">
          <div class="col-3" id="secWireless6">
            <div class="title-text-left">
              <input id="cb_bindwireless6" type="checkbox" name="cb_bindwireless6" <%if tcWebApi_get("WanInfo_WanIF","SSID6","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-AP5</label>
              <input id="bindwireless6" type="hidden" value="0" name="bindwireless6">
            </div>
          </div>
          <div class="col-3" id="secWireless7">
            <div class="title-text-left">
              <input id="cb_bindwireless7" type="checkbox" name="cb_bindwireless7" <%if tcWebApi_get("WanInfo_WanIF","SSID7","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-AP6</label>
              <input id="bindwireless7" type="hidden" value="0" name="bindwireless7">
            </div>
          </div>
          <div class="col-3" id="secWireless8">
            <div class="title-text-left">
              <input id="cb_bindwireless8" type="checkbox" name="cb_bindwireless8" <%if tcWebApi_get("WanInfo_WanIF","SSID8","h") = "Yes" then asp_Write("checked") end if%>>
              <label class="input-radio padding-right-0">WLAN1-AP7</label>
              <input id="bindwireless8" type="hidden" value="0" name="bindwireless8">
            </div>
          </div>
        </div>
      </div>
      <br>
      <div class="mt-2 center">
        <button type="button" class="btn-dashboard" id="btnOK" onclick="btnSave()">Apply Changes</button>
        <button type="button" class="btn-dashboard" id="btnRemoveCnt" onclick="btnRemoveWanCnt()" value="Delete">Delete</button>
      </div>
    </form>
  </div>
  <!-- content -->
   
  <script>
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") <> "Yes" then %>
  setDisplay('secLan5', 0);
  setDisplay('secLan6', 0);
  setDisplay('secLan7', 0);
  setDisplay('secLan8', 0);
  setDisplay('LanBindExt', 0);
<% end if %>
  var validSSID = "<% tcWebApi_get("WLan_Common","BssidNum","s") %>";
  var validNum = parseInt(validSSID);
  if(validSSID == "1"){
    setDisplay('secWireless1', 1);
    setDisplay('secWireless2', 0);
    setDisplay('secWireless3', 0);
    setDisplay('secWireless4', 0);
    setDisplay('secWireless5', 0);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
  else if(validSSID == "2"){
    setDisplay('secWireless1', 0);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 0);
    setDisplay('secWireless5', 0);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
  else if(validSSID == "3"){
    setDisplay('secWireless1', 0);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 0);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
  else if(validSSID == "4"){
    setDisplay('secWireless1', 0);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 0);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") <> "Yes" then %>
  else if(validNum > 4){
    setDisplay('secWireless1', 1);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 0);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
<% else %>
  else if(validSSID == "5"){
    setDisplay('secWireless1', 1);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 1);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
  }
  else if(validSSID == "6"){
    setDisplay('secWireless1', 1);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 1);
    setDisplay('secWireless6', 1);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
  }
  else if(validSSID == "7"){
    setDisplay('secWireless1', 1);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 1);
    setDisplay('secWireless6', 1);
    setDisplay('secWireless7', 1);
    setDisplay('secWireless8', 0);
  }
  else if(validNum >= 8){
    setDisplay('secWireless1', 0);
    setDisplay('secWireless2', 1);
    setDisplay('secWireless3', 1);
    setDisplay('secWireless4', 1);
    setDisplay('secWireless5', 1);
    setDisplay('secWireless6', 0);
    setDisplay('secWireless7', 0);
    setDisplay('secWireless8', 0);
    setDisplay('wlanBindSSIDExt', 0);
  }
<% end if %>
  //wireless 5g
  var validacSSID = "<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>";	
  var validAcNum = parseInt(validSSID);
  if(validacSSID == "1"){
    setDisplay('secWirelessac1', 1);
    setDisplay('secWirelessac2', 0);
    setDisplay('secWirelessac3', 0);
    setDisplay('secWirelessac4', 0);
    setDisplay('secWirelessac5', 0);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
  else if(validacSSID == "2"){
    setDisplay('secWirelessac1', 0);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 0);
    setDisplay('secWirelessac4', 0);
    setDisplay('secWirelessac5', 0);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
  else if(validacSSID == "3"){
    setDisplay('secWirelessac1', 0);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 0);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
  else if(validacSSID == "4"){
    setDisplay('secWirelessac1', 0);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 0);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") <> "Yes" then %>
  else if(validAcNum > 4){
    setDisplay('secWirelessac1', 1);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 0);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
  <% else %>
  else if(validacSSID == "5"){
    setDisplay('secWirelessac1', 1);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 1);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
  }
  else if(validacSSID == "6"){
    setDisplay('secWirelessac1', 1);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 1);
    setDisplay('secWirelessac6', 1);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
  }
  else if(validacSSID == "7"){
    setDisplay('secWirelessac1', 1);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 1);
    setDisplay('secWirelessac6', 1);
    setDisplay('secWirelessac7', 1);
    setDisplay('secWirelessac8', 0);
  }
  else if(validAcNum >= 8){
    setDisplay('secWirelessac1', 0);
    setDisplay('secWirelessac2', 1);
    setDisplay('secWirelessac3', 1);
    setDisplay('secWirelessac4', 1);
    setDisplay('secWirelessac5', 1);
    setDisplay('secWirelessac6', 0);
    setDisplay('secWirelessac7', 0);
    setDisplay('secWirelessac8', 0);
    setDisplay('wlanacBindSSIDExt', 0);
  }
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") = "Yes" then %>
  setDisplay('secLan2', 0);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") = "Yes" then %>
  setDisplay('secLan3', 0);
  setDisplay('secLan4', 0);
<% end if %>
<% if tcWebApi_get("Vid_Common","skyvid","h") = "10" then %>
  setDisplay('secLan3', 0);
  setDisplay('secLan4', 0);
<% end if %>
    
<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) <> "Yes" then %>
  setDisplay('wlanBindTab', 0);
  setDisplay('wlanBindSSIDExt', 0);
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) <> "Yes" then %>
  setDisplay('wlanacBindTab', 0);
  setDisplay('wlanacBindSSIDExt', 0);
<% end if %>
    $(document).ready(function () {
      WriteWanNameSelected();
      load_cb_8021P();
      LoadFrame();
    });
    
    function load_cb_8021P(){
      var en_8021P = '<% tcWebApi_get("WanInfo_WanIF","v8021PEnable","s") %>';
      var value_8021P = '<% tcWebApi_get("WanInfo_WanIF","dot1pData","s") %>';
      if(en_8021P == "No"){
        $("select[name='cb_8021P']").get(0).selectedIndex = 0;
      }else{
        $("#cb_8021P").val(value_8021P);
      }
    }

    function change8021P(){
      //var cb_8021PIndex = $("select[name='cb_8021P']").prop("selectedIndex");
      var cb_8021P_Value = $("#cb_8021P").val();
      console.log("cb_8021P_Value: " + cb_8021P_Value);
      if(cb_8021P_Value == -1){
        $("#v8021PClick").val("No");
        $("#v8021P").val(0);
      }else{
        $("#v8021PClick").val("Yes");
        $("#v8021P").val(cb_8021P_Value);
      }
    }

    function clearBindList()
    {
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") = "Yes" then %>
      var LanNum = 8;
<% else %>
      var LanNum = 4;
<% end if %>
      for (var i = 1; i <= LanNum; i++)
      {
        document.getElementById("secLan" + i).disabled = false;
        document.getElementById("cb_bindlan" + i).checked = false;
      }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
    var WlanNum = 8;
<% else %>
    var WlanNum = 4;
<% end if %>
    for (var i = 1; i <= WlanNum; i++)
    {
        document.getElementById("secWireless" + i).disabled = false;
        document.getElementById("cb_bindwireless" + i).checked = false;
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        document.getElementById("secWirelessac" + i).disabled = false;
        document.getElementById("cb_bindwirelessac" + i).checked = false;
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isHsgmiiLanSupported","h") = "Yes" then %>
        document.getElementById("cb_bindlan25").checked = false;
<% end if %>
  }
    }

    /*****************************************************************/
    function AddWanCnt()
    {
      if ((CurWan.length-1) >= 9)
      {
        var i = 0;

        alert("The number of WAN connection must be less than or equal 8.");

        for( i=0; i< WanNameObjs.length; i++)
        {
            var opt = new Option(WanNameObjs[i].IfaceName, WanNameObjs[i].IfaceDomain);
            if ( document.ConfigForm.curSetIndex.value == WanNameObjs[i].IfaceDomain )
            {
                getElementById('wanId').selectedIndex = i;   
                break;
            }
        }

        return;
      }
      if (AddFlag == true)
      {
        alert("Please save.");
        return;
      }
      
      AddFlag = true;
      resetText();
      with (getElById('ConfigForm'))
      {
        setDisable("serviceList",0);
        setSelect('linkMode', 'linkPPP');
        
        setSelect('serviceList','INTERNET');
        setText('ConnectionFlag', "Connect_Keep_Alive");
        
        setCheck('cb_enblService',1);
        cb_enblWanService[0].checked = true;//Admin Status Enable

        setSelect("wanModeSelect","PPPoE");
        setSelect('bridgeMode', "PPPoE_Bridged");

        setSelect('ppp_DialMethod', "Connect_Keep_Alive");
        pppTimeOut.value = 30;
        pppondemand_idletime.value = parseInt(pppTimeOut.value) * 60;
        
        lockObj('pppUserName',false);
        lockObj('pppPassword',false);
        lockObj('vlan',false);
        SelWanIndex = -1;
        enabledhcpSel = 1;
       
        WanModeChange();
        onChangeSvrList();
        IpMode[2].checked = true;
        IpModeChange();
        VLANModeChg();
        
        DOT1PShow();
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") = "Yes" then %>
      var LanNum = 8;
<% else %>
      var LanNum = 4;
<% end if %>
        for (var i = 0; i < LanNum; i++)
        {
          var checkString = 'cb_bindlan' + (i+1);
          setCheck(checkString,0);        
        }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
      var WlanNum = 8;
<% else %>
      var WlanNum = 4;
<% end if %>
      for (var i = 0; i < WlanNum; i++)
      {
        checkString = 'cb_bindwireless' + (i+1);
        setCheck(checkString,0);
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        checkString = 'cb_bindwirelessac' + (i+1);
        setCheck(checkString,0);
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isHsgmiiLanSupported","h") = "Yes" then %>
    setCheck("cb_bindlan25",0);
<% end if %>
  }
        setRadio('pdmode', 'Yes');
        
      }
    }
    
    
    /*****************************************************************/
    function WanIdChange()
    {
      if( -1 == getSelectVal('wanId') )
      {
        setDisable("btnAddCnt",1);
        setDisplay("btnRemoveCnt",0);
        AddWanCnt();
      }
      else
      {
        setDisable("btnAddCnt",0);
        setDisable("serviceList",0);
        document.ConfigForm.curSetIndex.value = getSelectVal('wanId');
        document.ConfigForm.Wan_Flag.value  = "2";
        document.ConfigForm.submit();
        showLoading();
      }
     
    }

    function WanIndexConstruction(domain,WanName,WanRName,WanVlan)
    {
      this.domain = domain;
      this.WanName = WanName;
      this.WanRName = WanRName;
      this.WanVlan = WanVlan;
    }

    function EnableNatClick()
    {
      if(document.ConfigForm.cb_nat.checked)
        document.ConfigForm.nat.value = "Enable";
      else
        document.ConfigForm.nat.value = "Disabled";
    }

    var CurWan = CheckWansActives();
    function CheckWansActives()
    {
      nEntryNum;
      var nCurTemp = 0;
      var vcurLinks = new Array(nEntryNum);
    
      for(var i=0; i<nEntryNum; i++)
      {
        vcurLinks[nCurTemp++] = new WanIndexConstruction(vEntryIndex[i], vEntryName[i], vEntryName1[i], vEntryVlan[i]);
      }
      
      var vObjRet = new Array(nCurTemp+1);
      for(var m=0; m<nCurTemp; m++)
      {
        vObjRet[m] = vcurLinks[m];
      }
      vObjRet[nCurTemp] = null;
      return vObjRet;
    }

    function WriteWanNameSelected()
    {
      var WanIDNums = CurWan;
      var nlength = WanIDNums.length-1;
      var i = 0;
      var isSel = 0;
      var gotopts = 0;
      <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
        if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
        if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
            var str = 0;
        <% end if
        end if
      end if%>

      if(nlength == 1) 
        document.ConfigForm.curSetIndex.value = WanIDNums[0].domain;
      
      WanNameObjs = new Array(nlength)
      for( i=0; i< nlength; i++)
      {
        <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
          if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
          if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
            str = WanIDNums[i].WanName;
            if( str.indexOf('TR069') >= 0 )
            {
              WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i], WanIDNums[i].WanVlan);
              vlength++;
            }
          <%else%>
            WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i], WanIDNums[i].WanVlan);
          <%end if
          else%>
            WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i], WanIDNums[i].WanVlan);
          <%end if
        else%>
            WanNameObjs[i] = new WanNameObject(WanIDNums[i].domain, WanIDNums[i].WanName, IFIdxArray[i], WanIDNums[i].WanVlan);
        <% end if%>
      }
      WanNameObjs.sort(WanNameSort);
      
      with (getElById('wanId'))
      {
        <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
          if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
          if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
            for( i=0; i< vlength; i++)
          <%else%>
            for( i=0; i< WanNameObjs.length; i++)
          <% end if
          else%>
            for( i=0; i< WanNameObjs.length; i++)
          <% end if
        else%>
          for( i=0; i< WanNameObjs.length; i++)
        <% end if%>
          {
            <%if 1 <> 1 then%>
            <%if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h" ) = "1" then%>
              if(vlanIdPVC[i] == 293)
                continue;
            <%end if%>
            <%end if%>

            if(WanNameObjs[i].IfaceVlan.indexOf("293") >= 0)
              var opt = new Option("THSI", WanNameObjs[i].IfaceDomain);
            else
              var opt = new Option(WanNameObjs[i].IfaceName, WanNameObjs[i].IfaceDomain);
            if ( document.ConfigForm.curSetIndex.value == WanNameObjs[i].IfaceDomain )
            {
              opt.selected = true
              isSel = i;
            }
            options.add ( opt );
            gotopts = 1;
          }
          if ( gotopts )
          {
            <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
              if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
              if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
              <%else%>
                options[isSel].setAttribute('selected', 'true');
              <% end if
              else%>
                options[isSel].setAttribute('selected', 'true');
              <% end if
            else%>
              options[isSel].setAttribute('selected', 'true');
            <% end if%>
          }
      }
    }
    //WanMode change
    function WanModeChange()
    {
      with (getElById('ConfigForm'))
      {
        if (wanMode.value == "Route")//IP mode
        {
          ServiceListLoad(0);
          setDisplay('secIpMode',1);
          setDisplay('secRouteItems',1);
          setDisplay('secIpoeItems',1);
          
          var linkmode = "<% tcWebApi_get("WanInfo_WanIF","LinkMode","s"); %>";
          if('linkIP' == linkmode){
                setDisplay('secStaticItems',1);
                setDisplay('secPppoeItems',0);
          }
          else
          {
                setDisplay('secStaticItems',0);
                setDisplay('secPppoeItems',1);
          }
          
          setDisplay('sec6RdItems',0);
          setDisplay('divLink', 0);
          setSelect('linkMode', 'linkIP');
          setDisplay('secbridgeDhcprelay',0);
          setDisplay('secBridgeType',0);
          enable6rd.value = 'No';
        
          if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE")
          {
            setDisplay('secNat',0);
          }
          else
          {
            setDisplay('secNat',1);
          }
          IpModeChange();
          <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
            setDisplay('secCloneMAC', 1);
          <%end if%>
        }
        else if (wanMode.value == "Bridge")
        {
          ServiceListLoad(1);
          setDisplay('secIpMode',0);
          setDisplay('secRouteItems',0);
          setDisplay('divLink', 0);
          setDisplay('secStaticItems',0);
          setDisplay('secPppoeItems',0);
          setDisplay('secIpoeItems',0);
          setDisplay('sec6RdItems',0);
          setDisable('pppPassword', 1);
          setDisable('pppUserName', 1);
          setDisplay('secBridgeType',1);
          setDisplay('cb_dhcprelay',1);
          setDisplay('secbridgeDhcprelay',1);
          //getElement('secbridgeDhcprelay').style.display = "";
          setDisplay('secNat',0);
          nat.value = "Disabled";
          enable6rd.value = 'No';
          <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
            setDisplay('secCloneMAC', 0);
          <%end if%>
        }
        else if (wanMode.value == "6rd")//6rd
        {
          ServiceListLoad(0);
          setDisplay('secIpMode',1);
          setDisplay('secRouteItems',1);
          setDisplay('secStaticItems',0);
          setDisplay('secPppoeItems',0);
          setDisplay('secIpoeItems',0);
          setDisplay('sec6RdItems',1);
          setDisplay('divLink', 0);
          setSelect('linkMode', 'linkIP');
          setDisplay('secbridgeDhcprelay',0);
          setDisplay('secBridgeType',0);
          enable6rd.value = 'Yes';
          if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE")
          {
            setDisplay('secNat',0);
          }
          else
          {
            setDisplay('secNat',1);
          }
          IpModeChange();
          <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
            setDisplay('secCloneMAC', 1);
          <%end if%>

        }
        else if (wanMode.value == "PPPoE")//PPPoE
        {
          ServiceListLoad(0);
          setDisplay('secIpMode',1);
          setDisplay('secRouteItems',1);
          setDisplay('secStaticItems',0);
          setDisplay('secPppoeItems',1);
          setDisplay('sec6RdItems',0);
          setDisplay('secIpoeItems',0);
          setSelect('linkMode', 'linkPPP');
          setDisplay('divLink', 0);
          setDisplay('secbridgeDhcprelay',0);
          setDisplay('secBridgeType',0);
          enable6rd.value = 'No';
          if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE")
          {
            setDisplay('secNat',0);
          }
          else
          {
            setDisplay('secNat',1);
          }
          IpModeChange();
          <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
            setDisplay('secCloneMAC', 1);
          <%end if%>
            
        }
        if (AddFlag == true)
        {
          if (serviceList.value == "INTERNET" && wanMode.value == "Bridge")
          {
            cb_dhcprelay.checked = true;
          }
          else
          {
            cb_dhcprelay.checked = false;
          }
        }
        IpVersionChange();
        MTUDispChange();
        MultiVIDDispChange();
        dsliteShow();
        pdEnableShow();
        dhcpEnableShow();
        pppoeProxyShow();
        ppp_dialMethodChg();
      }
    }

    var changeflag = 1;
    function onChangeSvrList()
    {
      with (getElById('ConfigForm'))
      {
        if ((serviceList.value == 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
        {
          changeflag = 0;
          secManualDial.style.display = "none";
          secIdleTime.style.display = "none";
        }
        else if((serviceList.value != 0) && (IpMode[2].checked == true) && (wanMode.value != "Bridge"))
        {
          if(changeflag == 0)
          {
            //addOption(ppp_DialMethod,1,"auto dial");
            //addOption(ppp_DialMethod,'Manual',"manual dial");
            changeflag = 1;
          }
        }
        if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
        {
          dhcpv6pdflag.value = "No";
          cb_nat.checked = false;
          nat.value = "Disabled";
          setDisplay('secBind',0);
          setDisplay('secNat',0);
          clearBindList();
        }
        else
        {
          dhcpv6pdflag.value = "Yes";
          cb_nat.checked = true;
          nat.value = "Enable";
          <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
            setDisplay('secBind',0);
          <% else %>
          <% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %>
            setDisplay('secBind',0);
          <% else %>
            setDisplay('secBind',1);
          <% end if %>
          <% end if %>
          if(wanMode.value == "Bridge")
          {
            setDisplay('secNat',0);
            nat.value = "Disabled";
          }
          else
          {
            setDisplay('secNat',1);
          }
        }
        if (AddFlag == true)
        {
          if (serviceList.value == "INTERNET" && wanMode.value == "Bridge")
          {
            cb_dhcprelay.checked = true;
          }
          else
          {
            cb_dhcprelay.checked = false;
          }
        }
        IpVersionChange();
        MTUDispChange();
        MultiVIDDispChange();
        dsliteShow();
        pdEnableShow();
        dhcpEnableShow();
        pppoeProxyShow();
        ppp_dialMethodChg();
      }
    }

    function onSelectSvrList()
    {
      pdDefaultSel = 1;
      enabledhcpSel = 1;
      onChangeSvrList();
      with (getElById('ConfigForm'))
      {
        if (serviceList.value == "INTERNET" && wanMode.value == "Bridge")
        {
          cb_dhcprelay.checked = true;
        }
        else
        {
          cb_dhcprelay.checked = false;
        }
      }
    }

    function WanModeSelect()
    {
      isNeedChange = 1;
      //
      WanModeChange();
      linkModeSelect();
      /*特殊参数配置*/
      with (getElById('ConfigForm'))
      {
        if (serviceList.value == "INTERNET" && wanMode.value == "Bridge")
        {
          cb_dhcprelay.checked = true;
        }
        else
        {
          cb_dhcprelay.checked = false;
        }
        if ( serviceList.value != "TR069"
        && serviceList.value != "VOICE"
        && serviceList.value != "TR069_VOICE"
        && ('Route' == wanMode.value || 'PPPoE' == wanMode.value || '6rd' == wanMode.value) )//NAT参数使能,当wanmode为Route,PPPoE,6rd
        {
          nat.value = "Enable";
          setCheck('cb_nat', 1);
        }
        
        /*start:add by fanqiang,20200731*/
        if ( '6rd' == wanMode.value )
        {
            setSelect("IpVersion","IPv4");
            setDisable("IpVersion",1);
            setDisplay("secIpoeItems",0);
        }
        /*end:add by fanqiang,20200731*/
      }
    }

    function WanNameObject(IFDomain, IFName, IFIdx, IFVlan)
    {
      this.IfaceDomain = IFDomain;
      this.IfaceName = IFName;
      this.IfaceIndex = IFIdx;
      this.IfaceVlan = IFVlan;
    }

    function v4v6BindCheck(curindex, v4BindIdx, v6BindIdx)
    {
      <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
        if ( ( curindex == v4BindIdx && (-1 == v6BindIdx ) )
          || ( curindex == v4BindIdx && curindex == v6BindIdx )
          || ( curindex == v6BindIdx && (-1 == v4BindIdx ) )
          || ( curindex == v6BindIdx && curindex == v4BindIdx ) )
          return 1;

        return 0;
      <%end if%>
    }

    function ServiceListLoad(isBridge)
    {
      var bridgeArray = new Array('INTERNET', 'OTHER');
      var i = 0;
      var status = '<% tcWebApi_get("WanInfo_WanIF","ServiceList","s") %>';
      var isSel = 0;
      <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) = "1" then %>
        var routeArray = new Array('TR069', 'INTERNET', 'TR069_INTERNET'
          <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
          , 'VOICE', 'TR069_VOICE', 'VOICE_INTERNET', 'TR069_VOICE_INTERNET'
          <% end if %>
          , 'OTHER');
      <% else %>
        var routeArray;
        if ( status.indexOf('TR069') >= 0 && 0 == isAddBtnClick )
          routeArray = new Array(status);
        else
          routeArray = new Array('INTERNET'
            <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
            , 'VOICE', 'VOICE_INTERNET'
            <% end if %>
            , 'OTHER');
      <% end if %>

      with ( getElById('serviceList') )
      {
        options.length=0;

        if ( 1 == isBridge )
        {
          for( i=0; i< bridgeArray.length; i++)
          {
            var opt = new Option(bridgeArray[i], bridgeArray[i]);
            if ( status == opt.value )
            {
              opt.selected = true;
              isSel = i;
            }
            options.add ( opt );
          }
          options[isSel].setAttribute('selected', 'true');
        }
        else
        {
          for( i=0; i< routeArray.length; i++)
          {
            var opt = new Option(routeArray[i], routeArray[i]);
            if ( status == opt.value )
            {
              opt.selected = true;
              isSel = i;
            }
            options.add ( opt );
          }
          options[isSel].setAttribute('selected', 'true');
        }
        
        if ( -1 == isWanModeChg )
          isWanModeChg = isBridge;
        else
        {
          if ( isWanModeChg != isBridge )
          {
            isWanModeChg = isBridge;
            onSelectSvrList();
          }
        }
      }
      
      /*start:6rd*/
      if( "6rd" == getSelectVal("wanModeSelect") )
      {
         setSelect("serviceList","INTERNET");
         setDisable("serviceList",1);
      }
      else
      {
         setDisable("serviceList",0);
      }
      /*end:6rd*/
    }

    function cb_enblServiceChange()
    {
      if(/*document.ConfigForm.cb_enblService.checked ||*/ document.ConfigForm.cb_enblWanService[0].checked){
        <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes"  then%>
          var v = document.getElementById("vlan").value;	
          var addBtn = document.getElementById("btnAddCnt");
          for(var i=0;i<vlanIdPVC.length;i++){
            var vlanidArray=vlanIdPVC[i].split("/");
            var vlanid= (vlanidArray[0]===undefined?"":vlanidArray[0]);
            if((v == vlanid && addBtn.disabled) || (v == vlanid && !addBtn.disabled && ( CurWan[i] && (document.ConfigForm.curSetIndex.value != CurWan[i].domain)))){

                alert("The same VLAN ID: " + v + " has already been used by wan " + vEntryName[i]);
                for(var j = 0;j < vlanIdPVC.length; j++){
                    if(( CurWan[j] && (document.ConfigForm.curSetIndex.value == CurWan[j].domain))){
                        vlanidArray = vlanIdPVC[j].split("/");
                        vlanid = (vlanidArray[0]===undefined?"":vlanidArray[0]);
                        document.getElementById("vlan").value = vlanid;
                        break;
                    }
                }
                return false;
            }
          }
        <% end if %>
        document.ConfigForm.WanActive.value = "Yes";
      }else{
        document.ConfigForm.WanActive.value = "No";
      }
      return true;
    }

    function VLANModeChg()
    {
      with (getElById('ConfigForm'))
      {
        switch (VLANMode.value)
        {
          case 'TAG':
            setDisplay('vlansec', 1);
            setDisplay('priosec', 1);
            vlanId.value = "Yes";
            vlanPri.value = "Yes";
          if ( 0 == v8021P.value.length )
            v8021P.value = '0';
          break;

          case 'UNTAG':
          case 'TRANSPARENT':
            setDisplay('vlansec', 0);
            setDisplay('priosec', 0);
            vlanId.value = "No";
            vlanPri.value = "No";
          break;

          default:
          break;
        }
      }
    }

    function IpModeChange()
    {
      with (getElById('ConfigForm'))
      {
        var ipVer = getSelectVal("IpVersion");
        if (IpMode[1].checked == true)/*Dhcp*/
        {
          setDisplay('secStaticItems',0);
          setDisplay('secPppoeItems',0);
          setDisable('pppPassword', 1);
          setDisable('pppUserName', 1);
          document.ConfigForm.ISPTypeValue.value = "0";
          if("IPv4/IPv6" == ipVer){
            if(getSelectVal('linkMode') == 'linkIP')
              WriteIPv6List(0);
          }
          
        }
        else if (IpMode[0].checked == true)/*Fixed IP*/
        {
          setDisplay('secStaticItems',1);
          setDisplay('secPppoeItems',0);
          setDisable('pppPassword', 1);
          setDisable('pppUserName', 1);
          document.ConfigForm.ISPTypeValue.value = "1";
          if("IPv4/IPv6" == ipVer){
            if(getSelectVal('linkMode') == 'linkIP')
              WriteIPv6List(2);
          }
        }
        else if (IpMode[2].checked == true)/*PPPoE*/
        {
          setDisplay('secStaticItems',0);
          setDisplay('secPppoeItems',1);
          setDisable('pppPassword', 0);
          setDisable('pppUserName', 0);
          changeTypetoPassword("pppPassword");
          document.ConfigForm.ISPTypeValue.value = "2";
        }
      }
    }

    function WriteIPv6List(index)
    {
      var vmode = new Array("No", "Yes", "Sta");
      var ctrl = getElById('IdIpv6AddrType');
      for(var i=0; i<ctrl.options.length;)
      {
        ctrl.removeChild(ctrl.options[i]);
      }
      if(index == 0)
      {
        var aMenu = new Array("SLAAC","DHCP");
        for(i=0; i<aMenu.length; i++)
        {
          ctrl.options.add(new Option(aMenu[i],aMenu[i]));
          if(vCurrentDHCPv6 == vmode[i])
          {
            document.ConfigForm.IdIpv6AddrType.selectedIndex = i;
          }
        }
      }
      else if(index == 1)
      {
        var aMenu = new Array("SLAAC","DHCP","Static");
        for(i=0; i<aMenu.length; i++)
        {
          ctrl.options.add(new Option(aMenu[i],aMenu[i]));
          if(vCurrentDHCPv6 == vmode[i])
          {
            document.ConfigForm.IdIpv6AddrType.selectedIndex = i;
          }
        }
      }
      else if(index == 2)
      {
        var aMenu = "Static";
        ctrl.options.add(new Option(aMenu,aMenu));
      }
      OnIPv6Changed();
    }

    function IPProtocolSelect(){
      IpVersionChange();
      MTUDispChange();
    }

    function IpVersionChange()
    {
      with (getElById('ConfigForm'))
      {
        var ipVer = getSelectVal("IpVersion");
        var ConnType = getSelectVal('wanMode');
        var Serverlist = getSelectVal('serviceList');
        if ((ConnType != 'Route')&&(ConnType != 'PPPoE')&&(ConnType != '6rd'))//ip协议切换规则
        {
          setDisplay('divIpVersion', 1);
          setDisable("IpVersion",0);
          setDisplay('secIPv6Div', 0);
          return;
        }
        /*start:add by fanqiang, 20200731*/
        if(ConnType == '6rd')
        {
          setSelect("IpVersion","IPv4");
          setDisable("IpVersion",1);
        }
        else
        {
          setDisable("IpVersion",0);
        }
        setDisplay('divIpVersion', 1);
        if ("IPv4" == ipVer)
        {
          if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE" )
          {
            setDisplay('secNat', 0);
            $("#nat").val("Disabled");
          }
          else
          {
            setDisplay('secNat', 1);
            if ( oldIpVer != ipVer )
            {
              $("#nat").val("Enable");
              setCheck('cb_nat', 1);
            }
          }
          if ('linkIP' == getSelectVal('linkMode'))
          {
            setDisplay('secIpoeItems', 1);
            setDisplay('secIpMode',1);
            setDisplay('secPppoeItems', 0);
            setDisable('pppPassword', 1);
            setDisable('pppUserName', 1);
            if (SelWanIndex != -1)
            {
              if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))
              {
                IpMode[1].checked = true;/*DHCP*/
              }
              else
              {
                IpMode[0].checked = true;/*Fixed IP*/
              }
            }
          }
          else
          {
            setDisplay('secIpMode',0);
            setDisplay('secPppoeItems', 1);
            setDisable('pppPassword', 0);
            setDisable('pppUserName', 0);
            changeTypetoPassword("pppPassword");
          }
          if(IpMode[0].checked && ("linkIP" == getSelectVal('linkMode')))/*Fixed IP*/
          {
            setDisplay('secStaticItems', 1);
          }
          else
          {
            setDisplay('secStaticItems', 0);
          }
          setDisplay('secIPv6Div', 0);
          setDisplay('TrIpv6AddrTitle', 0);
          setDisplay('TrIpv6AddrType', 0);
          setDisplay('TrIpv6Addr', 0);
          setDisplay('TrIpv6Dns1', 0);
          setDisplay('TrIpv6Dns2', 0);
          setDisplay('TrIpv6Gateway', 0);
        }
        else if ("IPv6" == ipVer)
        {
          setDisplay('secNat', 0);
          nat.value = "Disabled";
          setDisplay('secIpMode',0);
          setDisplay('secStaticItems', 0);
          setDisplay('secIpoeItems', 0);
          setDisplay('secIPv6Div', 1);
          setDisplay('TrIpv6AddrTitle', 1);
          setDisplay('TrIpv6AddrType', 1);
          var linkstr = getSelectVal('linkMode');
          if(linkstr == "linkIP")
            WriteIPv6List(1);
          else
            WriteIPv6List(0);
        }
        else
        {
          if (Serverlist == "TR069"  || Serverlist == "VOICE" || Serverlist == "TR069_VOICE")
          {
            setDisplay('secNat', 0);
            nat.value = "Disabled";
          }
          else
          {
            setDisplay('secNat', 1);
            if ( oldIpVer != ipVer )
            {
              nat.value = "Enable";
              setCheck('cb_nat', 1);
            }
          }
          if ('linkIP' == getSelectVal('linkMode'))
          {
            setDisplay('secIpMode',1);
            setDisplay('secIpoeItems', 1);
            setDisplay('secPppoeItems', 0);
            setDisable('pppPassword', 1);
            setDisable('pppUserName', 1);
            if (SelWanIndex != -1)
            {
              if ((Wan[SelWanIndex].addrType == 'DHCP') || (Wan[SelWanIndex].wanConn == "PPPCon"))/*DHCP*/
              {
                IpMode[1].checked = true;
              }
              else
              {
                IpMode[0].checked = true;
              }
            }
          }
          else
          {
            setDisplay('secIpMode',0);
            setDisplay('secPppoeItems', 1);
            setDisable('pppPassword', 0);
            setDisable('pppUserName', 0);
            changeTypetoPassword("pppPassword");
          }
            if (('linkIP' == getSelectVal('linkMode')) && IpMode[0].checked)/*Fixed IP*/
            {
              setDisplay('secStaticItems', 1);
            }
            else
            {
              setDisplay('secStaticItems', 0);
            }
            setDisplay('secIPv6Div', 1);
            setDisplay('TrIpv6AddrTitle', 1);
            setDisplay('TrIpv6AddrType', 1);
            if('linkIP' == getSelectVal('linkMode'))
            {
              if(IpMode[1].checked)/*DHCP*/
              {
                WriteIPv6List(0);
              }
              else if(IpMode[0].checked)/*Fixed IP*/
                WriteIPv6List(2);
              else
                WriteIPv6List(0);
            }
            else
              WriteIPv6List(0);
          }
          oldIpVer = ipVer;
          
          dsliteShow();
          pdEnableShow();
          ppp_dialMethodChg();
      }
    }

    function dsliteShow()
    {
      <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
        var ipVer;
        var svrList;
        var mode;
        var addrType;

        ipVer = getSelectVal('IpVersion');
        svrList = getSelectVal('serviceList');
        mode = getSelectVal('wanMode');

        if ( ('Route' == mode || 'PPPoE' == mode || '6rd' == mode)&& 
          ipVer.indexOf('IPv4') < 0 && svrList.indexOf('INTERNET') >= 0)
        {
          setDisplay('dslite_1', 1);
          var modeObj = document.getElementsByName('dslitemode');
          if ( modeObj.length >= 2 )
          {
            modeObj[0].disabled = false;
            modeObj[1].disabled = false;
          }
          addrType = getSelectVal('IdIpv6AddrType');
          if ( 'Static' == addrType )
          {
            if ( modeObj.length >= 2 )
            {
              modeObj[0].disabled = true;
              modeObj[1].checked = true;
            }
          }
          cb_enabledsliteChange();
        }
        else
        {
          setDisplay('dslite_1', 0);
          setDisplay('dslite_2', 0);
          setDisplay('dslite_3', 0);
        }
      <%end if%>
    }
    
    function cb_enabledsliteChange()
    {
      <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
        with (getElById('ConfigForm'))
        {
          if ( 1 == getCheckVal('cb_enabledslite') )
          {
            setDisplay('dslite_2', 1);
            dslitemodeChange();
          }
          else
          {
            setDisplay('dslite_2', 0);
            setDisplay('dslite_3', 0);
          }
        }
        MTUDispChange();
      <%end if%>
    }

    function dslitemodeChange()
    {
      <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
        var mode;

        with (getElById('ConfigForm'))
        {
          mode = getRadioVal("dslitemode");
          switch (mode)
          {
            case '1':
              setDisplay('dslite_3', 1);
              break;
            default:
              setDisplay('dslite_3', 0);
              break;	
          }
        }
      <%end if%>
    }

    function pdEnableShow()
    {
      var ipVer;
      var mode;
      var svrList;

      ipVer = getSelectVal('IpVersion');
      mode = getSelectVal('wanMode');
      svrList = getSelectVal('serviceList');
      addrType = getSelectVal('IdIpv6AddrType');
      /*Route,PPPoE,6rd*/
      if ( ('PPPoE' == mode || 'Route' == mode || '6rd' == mode)&& 'IPv4' != ipVer
        && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
      {
        setDisplay('PDEnableSec', 1);
        if ( svrList.indexOf('INTERNET') >= 0 && 1 == pdDefaultSel )
          setCheck('cb_enabledpd', 1);
        pdDefaultSel = 0;
        pdModeShow( getCheckVal('cb_enabledpd') );
      }
      else
      {
        setDisplay('PDEnableSec', 0);
        pdModeShow(0);
      }
    }

    function cb_pdEnableChange()
    {
        var pdEnable = getCheckVal('cb_enabledpd');

        pdModeShow(pdEnable);
    }

    function pdModeShow( show )
    {
      addrType = getSelectVal('IdIpv6AddrType');

      if ( 1 == show )
      {
        setDisplay('pdmode_1', 1);
        var modeObj = document.getElementsByName('pdmode');
        if ( modeObj.length >= 2 )
        {
          modeObj[0].disabled = false;
          modeObj[1].disabled = false;
        }

        if ( 'Static' == addrType )
        {
          if ( modeObj.length >= 2 )
          {
            modeObj[0].disabled = true;
            modeObj[1].checked = true;
          }
        }

        pdmodeChange();
      }
      else
      {
        setDisplay('pdmode_1', 0);
        pdStaticCfgShow(0);
      }
    }

    function pdmodeChange()
    {
      var pdmode_sel;

      pdmode_sel = getRadioVal('pdmode');
      if ( 'No' == pdmode_sel )
        pdStaticCfgShow(1);
      else
        pdStaticCfgShow(0);
    }

    function pdStaticCfgShow( show )
    {
      setDisplay('pdmode_2', show);
      setDisplay('pdmode_3', show);
      setDisplay('pdmode_4', show);
    }

    function CheckPDTime(Time1,Time2)
    {
      var TemTime1 = Time1;
      var TemTime2 = Time2;

      if ( TemTime1.length > 10 || '' == TemTime1 )
        return 1;
      if ( TemTime2.length > 10 || '' == TemTime2 )
        return 2;
      if ( true != isPlusInteger(TemTime1))
        return 1;
      if ( true != isPlusInteger(TemTime2))
        return 2;

      TemTime1 = parseInt(Time1);
      TemTime2 = parseInt(Time2);
      if ( TemTime1 > 4294967295 || TemTime1 < 600 )
        return 1;
      if ( TemTime2 > 4294967295 || TemTime2 < 600 )
        return 2;
      if ( TemTime2 <= TemTime1 )
          return 3;

      return true;
    }

    function ppp_dialMethodChg()
    { 

    <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
      var mode;
      var linkMode;

      mode_val = getSelectVal('wanMode');
      linkMode_val = getSelectVal('linkMode');

      setDisplay('secIdleTime', 0);
      setDisplay('secManualDial', 0);
      with ( getElById('ConfigForm') )
      {
        /*PPPoE*/
        if ( 'PPPoE' == mode_val && 'linkPPP' == linkMode_val )
        {
          switch ( getSelectVal('ppp_DialMethod') )
          {
            case 'Connect_on_Demand':
              setDisplay('secIdleTime', 1);
              setDisplay('secManualDial',0);
              if ( 0 == pppTimeOut.value.length )
              {
                if ( 0 == pppondemand_idletime.value.length ){
                  pppTimeOut.value = '30';
                  $("#pppTimeOutText").text('30');
                }
                else{
                  var v = parseInt(pppondemand_idletime.value) / 60;
                  pppTimeOut.value = v;
                  $("#pppTimeOutText").text(v);
                }
              }
              break;
            case 'Connect_Keep_Alive':
            {
              setDisplay('secIdleTime',0);
              setDisplay('secManualDial',0);
              setText('ConnectionFlag', "Connect_Keep_Alive");
            }
              break;
            case 'Connect_Manually':
            {
              setDisplay('secIdleTime',0);
              setDisplay('secManualDial',1);
              setText('ConnectionFlag', "Connect_Manually");
              if(0 == ppp_flag){
                setDisable('pppDialButton',1);
                setText('pppDialButton', 'manual dial');
              }
              else if(1 == ppp_flag){
                if(0 == manual_flag){
                  setDisable('pppDialButton',0);
                  setText('pppDialButton', 'disconnect');
                  setText('pppManualStatus_Flag', 'connect');//current status
                }
                else{
                  setDisable('pppDialButton',0);
                  //setText('pppDialButton', 'manual dial');	
                  setText('pppDialButton', 'connect');	
                  setText('pppManualStatus_Flag', 'disconnect');
                }

              }
              else
              {
                setDisable('pppDialButton',1);
                setText('pppDialButton', 'manual dial');
              }
            }		
              break;					
            default:
              break;
          }
        }
      }
    <% end if %>
    }

    /*Start:add by fanqiang, 20200728*/
    function initWanMode()
    {
        var wanmode = "<% tcWebApi_get("WanInfo_WanIF","WanMode","s");%>";
        var enable_6rd = "<% tcWebApi_get("WanInfo_WanIF","Enable6rd","s");%>";
        var linkmode = "<% tcWebApi_get("WanInfo_WanIF","LinkMode","s");%>";
        if( wanmode == "Route")
        {
            if( linkmode == "linkIP" )
            {
                if(enable_6rd == "Yes")
                {
                    setSelect("wanModeSelect","6rd");
                }
                else
                {
                    setSelect("wanModeSelect","Route");
                }
            }
            else if( linkmode == "linkPPP")
            {
                setSelect("wanModeSelect","PPPoE");
            }
        }
        else if ( wanmode == "Bridge")
        {
            setSelect("wanModeSelect","Bridge");
        }
        else
        {}
        
        /*init wan active status*/
        var wan_active_status = "<%tcWebApi_get("WanInfo_WanIF","Active","s");%>";
        if( "Yes" == wan_active_status )
        {
            document.ConfigForm.cb_enblWanService[0].checked = true;
        }
        else
        {
            document.ConfigForm.cb_enblWanService[1].checked = true;
        }
        /*init IPoE status*/
        var ipoestatus = "<% tcWebApi_get("WanInfo_WanIF","Option60Enable1","s") %>";
        if( "Yes" == ipoestatus )
        {
            setCheck("cb_enableipoe",true);
            IpoeConf();
        }
    }
    /*End:add by fanqiang, 20200728 */
    
    function LoadFrame()
    {
      initWanMode();//add by fanqiang, 20200728
      with (getElById('ConfigForm'))
      {
        Wan_Flag.value = "0";
        var wanStatus = "<% tcWebApi_get("WanInfo_Common","ErrCode","s") %>";
        if((0 != parseInt(wanStatus)) && (wanStatus != "N/A"))
        {
          if(99 == parseInt(wanStatus))
          {
            alert(msg[5]);
          }
          else{
            alert(msg[parseInt(wanStatus)]);
          }
          document.ConfigForm.submit();
          showLoading();
        }

        oldIpVer = getSelectVal("IpVersion");
        if ((CurWan.length-1) > 0)
        {
          WanModeChange();
          if (serviceList.value == "TR069" || serviceList.value == "VOICE" || serviceList.value == "TR069_VOICE" )
          {
            dhcpv6pdflag.value = "No";
            setDisplay('secBind',0);
            setDisplay('secNat',0);
            clearBindList();
          }
          else
          {
            var ipVer = getSelectVal("IpVersion");
            <% if tcWebApi_get("WebCustom_Entry", "isCT1PORTSupported", "h") = "Yes"  then %>
              setDisplay('secBind',0);
            <% else %>
              setDisplay('secBind',1);
            <% end if %>
            if((wanMode.value == "Bridge") || ("IPv6" == ipVer)) setDisplay('secNat',0)
              ;
            else
              setDisplay('secNat',1);
          }
          if(linkMode.value == "linkPPP")
            DialMethodChange();
          VLANModeChg();
          DOT1PShow();
          
          WanCurrIFIdx.value = getIFIdxvidDomain(getSelectVal('wanId'));
        }
        else
        {
          onChangeSvrList();
          ServiceListLoad(0);
        }
      }

      <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
        LockTR69Node(1);
      <% end if %>

      <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
        if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
        if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
        setDisable('btnRemoveCnt',1);
        setDisable('btnAddCnt',1);
        setDisplay('btnOK', 0);
        setDisplay('btnCancel', 0);
      <% end if
      end if
      end if %>
    }

    function onVlanBlur(){//添加多条WAN时，如果VLAN相同则自动关闭当前WAN
    /*
      <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes"  then%>
        var v = document.getElementById("vlan").value;
        var addBtn = document.getElementById("btnAddCnt");
        var isRepeat = false;
        for(var i=0;i<vlanIdPVC.length;i++){
          var vlanidArray=vlanIdPVC[i].split("/");
          var vlanid= (vlanidArray[0]===undefined?"":vlanidArray[0]);
          if((v == vlanid && addBtn.disabled) || (v == vlanid && !addBtn.disabled && document.ConfigForm.curSetIndex.value != CurWan[i].domain)){
            isRepeat = true;
            if(enableVlan[i] == "Yes"){
              setCheck("cb_enblService",0);
              document.ConfigForm.cb_enblWanService[1].checked = true;//Admin Status Disabled
            }else{
              setCheck("cb_enblService",1);
              document.ConfigForm.cb_enblWanService[0].checked = true;//Admin Status Enable
            }
          }
        }
        if(isRepeat == false)
        {
          setCheck("cb_enblService",1);
          document.ConfigForm.cb_enblWanService[0].checked = true;//Admin Status Enable
        }
      <% end if %>*/
    }

    function onPppTimeOutBlur() {
        var v = document.getElementById("pppTimeOut").value;
        $("#pppTimeOutText").text(v);
    }

    var isNeedChange = 0;
    function MTUDispChange()
    {
      var mtudescrip = new Array('[128-1492]', '[576-1500]', '[1280-1492]', '[1280-1500]','[1320-1492]','[1320-1500]');
      with (getElById('ConfigForm'))
      {
        if ('Route' == wanMode.value || 'PPPoE' == wanMode.value || '6rd' == wanMode.value)
        {
          setDisplay('MTUsec', 1);
          if (AddFlag == true || isNeedChange)
          {
            isNeedChange = false;
            if (getSelectVal('linkMode') == 'linkPPP')
              MTU.value = 1492;
            else
              MTU.value = 1500;
          }

          if (getSelectVal('linkMode') == 'linkPPP')
          {
            if ('IPv4' == getSelectVal('IpVersion'))
              getElement("MTUsecRange").innerHTML = mtudescrip[0];
            else{
              <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                if (getCheckVal('cb_enabledslite') == 1){
                  getElement("MTUsecRange").innerHTML = mtudescrip[4];	
                }else{
                  getElement("MTUsecRange").innerHTML = mtudescrip[2];
                }
              <% else %>
                getElement("MTUsecRange").innerHTML = mtudescrip[2];
              <% end if %>
            }
          }
          else
          {
            if ('IPv4' == getSelectVal('IpVersion'))
              getElement("MTUsecRange").innerHTML = mtudescrip[1];
            else{
              <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                if (getCheckVal('cb_enabledslite') == 1){
                  getElement("MTUsecRange").innerHTML = mtudescrip[5];
                }else{
                  getElement("MTUsecRange").innerHTML = mtudescrip[3];
                }
              <% else %>
                getElement("MTUsecRange").innerHTML = mtudescrip[3];
              <% end if %>
            }
          }
        }
        else
        {
          setDisplay('MTUsec', 0);
        }
      }
    }

    function MultiVIDDispChange()
    {
      var svrList;

      with (getElById('ConfigForm'))
      {
        svrList = serviceList.value;
        if ( svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0 )
          setDisplay('mulvidsec', 1);
        else
          setDisplay('mulvidsec', 0);
      }
    }

    var enabledhcpSel = 0;
    function dhcpEnableShow()
    {
      <%if TCWebApi_get("WebCustom_Entry","isCTDHCPPortFilterSupported","h" ) = "Yes" then%>
        var svrList;

        svrList = getSelectVal('serviceList');

        if ( 'TR069' == svrList
          || 'VOICE' == svrList
          || 'TR069_VOICE' == svrList )
        {
          setDisplay('enabledhcpsec', 0);
          setCheck('cb_enabledhcp', 0);
        }
        else
        {
          setDisplay('enabledhcpsec', 1);
          if ( 1 == enabledhcpSel )
          {
            enabledhcpSel = 0;
            if ( svrList.indexOf('OTHER') >= 0 )
              setCheck('cb_enabledhcp', 0);
            else
              setCheck('cb_enabledhcp', 1);

            if (svrList.indexOf('OTHER') == 0 && document.ConfigForm.wanMode.value == "Bridge")
            {
              setCheck('cb_enabledhcp', 1);
            }
            if (svrList.indexOf('INTERNET') == 0 && document.ConfigForm.wanMode.value == "Bridge")
            {
              setCheck('cb_enabledhcp', 0);
            }
          }
        }
      <%else%>
        setDisplay('enabledhcpsec', 0);
        setCheck('cb_enabledhcp', 0);
      <%end if%>
    }


    function pppoeProxyShow()
    {
      <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
        var mode;
        var linkMode;
        var svrList;

        mode = getSelectVal('wanMode');
        linkMode = getSelectVal('linkMode');
        svrList = getSelectVal('serviceList');
        /*PPPoE*/
        if ( 'PPPoE' == mode && 'linkPPP' == linkMode
          && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
        {
          setDisplay('ppp_proxy_bi', 1);
          ppp_proxy_bi_Change();
        }
        else
        {
          setDisplay('ppp_proxy_bi', 0);
          setDisplay('ppp_proxy_user', 0);
        }
      <%else%>
        pppbiShow();
      <%end if%>
    }

    function ppp_proxy_bi_Change()
    {
      <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
        var mode;

        with (getElById('ConfigForm'))
        {
          mode = getRadioVal("ppp_proxy_bi_mode");

          switch ( mode )
          {
            case '1':
              setDisplay('ppp_proxy_user', 1);
              break;
            default:
              setDisplay('ppp_proxy_user', 0);
              break;	
          }
        }
      <%end if%>
    }

    function pppbiShow()
    {
      var mode;
      var linkMode;
      var svrList;

      mode = getSelectVal('wanMode');
      linkMode = getSelectVal('linkMode');
      svrList = getSelectVal('serviceList');
      /*PPPoE*/
      if ( 'PPPoE' == mode && 'linkPPP' == linkMode
        && (svrList.indexOf('INTERNET') >= 0 || svrList.indexOf('OTHER') >= 0) )
        //setDisplay('ppp_bi', 1);
        setDisplay('ppp_bi', 0);
      else
        setDisplay('ppp_bi', 0);
    }

    function DialMethodChange()
    {
      <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") <> "Yes"  then %>
        <% if TCWebApi_get("WebCustom_Entry","isPPPoEOnDemandSupported","h" ) = "Yes" then %>
          setDisplay('secIdleTime',0);
          setDisplay('secManualDial',0);
        <% else %>
          var cntMode = getSelectVal('DialMethod');
          //if (cntMode == 'AlwaysOn')
          if (cntMode == 'Connect_Keep_Alive')
          {
            setDisplay('secIdleTime',0);
            setDisplay('secManualDial',0);
            setText('ConnectionFlag', "Connect_Keep_Alive");
          }
          else if (cntMode == 'Manual')
          {
            setDisplay('secIdleTime',0);
            setDisplay('secManualDial',1);
            setText('ConnectionFlag', "Connect_Manually");
            if(0 == ppp_flag){
              setDisable('pppDialButton',1);
              setText('pppDialButton', 'manual dial');
            }
            else if(1 == ppp_flag){
              if(0 == manual_flag){
                setDisable('pppDialButton',0);
                setText('pppDialButton', 'disconnect');
                setText('pppManualStatus_Flag', 'disconnect');
              }
              else{
                setDisable('pppDialButton',0);
                setText('pppDialButton', 'manual dial');
                setText('pppManualStatus_Flag', 'connect');
              }
              
            }
            else
            {
              setDisable('pppDialButton',1);
              setText('pppDialButton', 'manual dial');
            }
          }
        <% end if %>
      <% end if %>
    }

    function DOT1PShow()
    {
      var cb_8021P_Value = $("#cb_8021P").val();
      if(cb_8021P_Value == -1){
        $("#v8021PClick").val("No");
        $("#v8021P").val(0);
      }else{
        $("#v8021PClick").val("Yes");
        $("#v8021P").val(cb_8021P_Value);
      }
    }

    function getIFIdxvidDomain(domain)
    {
      var i = 0;
      <% if tcWebApi_get("WebCustom_Entry", "isCTSIMCARDSEPARATIONSupported", "h") = "Yes"  then
        if tcWebApi_get("SimCard_Entry", "cardExist", "h") = "1"  then
        if tcWebApi_get("SimCard_Entry", "simAuthRet", "h") = "0"  then %>
        for( i=0; i< vlength; i++)
        <%else%>
        for( i=0; i< WanNameObjs.length; i++)
        <% end if
        else%>
        for( i=0; i< WanNameObjs.length; i++)
        <% end if
      else%>
        for( i=0; i< WanNameObjs.length; i++)
      <% end if%>
      {
        if ( domain == WanNameObjs[i].IfaceDomain )
          return WanNameObjs[i].IfaceIndex;
      }

      return 1;
    }
    //link mode：ip+ppp
    function linkModeSelect()
    {
      with (getElById('ConfigForm'))
      {
        pdDefaultSel = 1;
        isNeedChange = 1;
        var ipVer = getSelectVal("IpVersion");//获取ip协议版本
        if (getSelectVal('linkMode') == 'linkIP')//获取 Link Mode值ip,ppp
        {
          if("IPv6" == ipVer)
            WriteIPv6List(1);
          else if("IPv4/IPv6" == ipVer)
          {
            if(IpMode[1].checked)/*DHCP*/
              WriteIPv6List(0);
            else if(IpMode[0].checked)/*Fixed IP*/
              WriteIPv6List(2);
            else
              WriteIPv6List(0);
          }
          if (wanMode.value == "Route" || wanMode.value == "6rd"){//获取Channel Mode，ipoe
            setDisplay('secIpMode',1);//ipv4 wan access配置
          }
          if (SelWanIndex == -1)
          {
            IpMode[1].checked = true;/*DHCP*/
          }
        }
        else
        {
          if("IPv4" != ipVer)
            WriteIPv6List(0);
          setDisplay('secIpMode',0);
          IpMode[2].checked = true;
          //DialMethodChange();
          //ppp_dialMethodChg();
        }
        IpModeChange();
        IpVersionChange();
        MTUDispChange();
        dsliteShow();
        pdEnableShow();
        dhcpEnableShow();
        pppoeProxyShow();
        ppp_dialMethodChg();
      }
    }

    function OnIPv6Changed()
    {
      with (getElById('ConfigForm'))
      {
        var linkstr = getSelectVal('linkMode');
        var AddrType = getSelectVal('IdIpv6AddrType');
        if (AddrType == 'SLAAC')
        {
              setDisplay('TrIpv6Addr', 0);
              setDisplay('TrIpv6Dns1', 0);
              setDisplay('TrIpv6Dns2', 0);
              //setDisplay('TrIpv6GatewayInfo', 0);
              setDisplay('TrIpv6Gateway', 0);
              ISPTypeValue.value = "0";
        }
        else if (AddrType == 'DHCP')
        {
              setDisplay('TrIpv6Addr', 0);
              setDisplay('TrIpv6Dns1', 0);
              setDisplay('TrIpv6Dns2', 0);
              setDisplay('TrIpv6Gateway', 1);
              //setDisplay('TrIpv6GatewayInfo', 1);
              ISPTypeValue.value = "0";
        }
        else if (AddrType == 'Static')
        {
              setDisplay('TrIpv6Addr', 1);
              setDisplay('TrIpv6Dns1', 1);
              setDisplay('TrIpv6Dns2', 1);
              setDisplay('TrIpv6Gateway', 1);
              //setDisplay('TrIpv6GatewayInfo', 1);
              ISPTypeValue.value = "1";
        }
        dsliteShow();
        pdEnableShow();
      }
    }

    function btnAddWanCnt()
    {
      if ((CurWan.length-1) >= 8)
      {
        alert("The number of WAN connection must be less than or equal 8.");
        return;
      }
      if (AddFlag == true)
      {
        alert("Please save.");
        return;
      }
      <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
        LockTR69Node(0);
      <% end if %>
      AddFlag = true;
      resetText();
      with (getElById('ConfigForm'))
      {
        AddOption(getElementByName('wanId'),-1,'Add WAN Connection',true);
        setDisable('btnAddCnt',1);
        $("#btnAddCnt").addClass("button-disable-gray");
        setSelect('linkMode', 'linkPPP');
        <% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
          isAddBtnClick = 1;
          ServiceListLoad(1);
        <% end if %>
        setSelect('serviceList','INTERNET');
        setText('ConnectionFlag', "Connect_Keep_Alive");
        <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes"  then%>
          setCheck('cb_enblService',1);
          cb_enblWanService[0].checked = true;//Admin Status Enable
        <% else %>
          setCheck('cb_enblService',1);
          cb_enblWanService[0].checked = true;//Admin Status Enable
        <% end if %>
          setSelect('wanMode',"Route");
          setSelect('bridgeMode', "PPPoE_Bridged");
        <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
          setSelect('ppp_DialMethod', "Connect_Keep_Alive");
          pppTimeOut.value = 30;
          pppondemand_idletime.value = parseInt(pppTimeOut.value) * 60;
        <% end if %>
        lockObj('pppUserName',false);
        lockObj('pppPassword',false);
        lockObj('vlan',false);
        SelWanIndex = -1;
        enabledhcpSel = 1;
        WanModeChange();
        onChangeSvrList();
        IpMode[2].checked = true;
        IpModeChange();
        VLANModeChg();
        DOT1PShow();
<% if tcWebApi_get("WebCustom_Entry", "isMultiLanSupported","h") = "Yes" then %>
      var LanNum = 8;
<% else %>
      var LanNum = 4;
<% end if %>
        for (var i = 0; i < LanNum; i++)
        {
          var checkString = 'cb_bindlan' + (i+1);
          setCheck(checkString,0);
        }
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
    var WlanNum = 8;
<% else %>
    var WlanNum = 4;
<% end if %>
    for (var i = 0; i < WlanNum; i++)
    {
      checkString = 'cb_bindwireless' + (i+1);
      setCheck(checkString,0);
<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
      checkString = 'cb_bindwirelessac' + (i+1);
      setCheck(checkString,0);
<% end if %>
  }
        setRadio('pdmode', 'Yes');
        <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
          setText('wanhwaddress', '00:00:00:00:00:00');
        <%end if%>
      }
    }

    function getMaxIFIdx()
    {
      var IFIdxLen = IFIdxArray.length;
      var IFIdxStoreV = 0;
      var i = 0;
      var IFIdxV = 0;
      
      if ( isPlusInteger(IFIdxStore) )
        IFIdxStoreV = parseInt(IFIdxStore);
      
      IFIdxStoreV ++;
      
      for ( i = IFIdxStoreV; i <= 99; i ++ )
      {
        if (!isIdExist(i))
          return i;
      }
      
      for ( i = 1; i < IFIdxStoreV; i ++ )
      {
        if (!isIdExist(i))
          return i;
      }

      return 1; 
    }
    
    function isIdExist(ifIdx)
    {
      var i = 0;
      var IFIdxV = 0;
      var IFIdxLen = IFIdxArray.length;
      
      for ( i = 0; i < IFIdxLen; i ++ )
      {
        IFIdxV = parseInt(IFIdxArray[i]);

        if ( IFIdxV == ifIdx )
          return true;
      }
      
      return false;
    }

    function resetText()
    {
      var Inputs = document.getElementsByTagName("input");
      for (var i = 0; i < Inputs.length; i++)
      {
        if (Inputs[i].type == "text" || Inputs[i].type == "password" )
        {
          Inputs[i].value = '';
        }
      }
    }

    function AddOption(selItem,value,text,ifSelected)
    {
      var option = document.createElement("option");
      option.innerHTML = text;
      option.value = value;
      option.selected = ifSelected;
      selItem.appendChild(option);
    }

    function RemoveOption(selItem,index)
    {
      selItem.removeChild(selItem.options[index]);
    }
    
    function lockObj(objName, readST)
    {
      if ( null != getElById(objName) )
      {
        getElById(objName).readOnly = readST;
        getElById(objName).style.color = readST ? 'gray' : '';
      }
    }

    var UsernameOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPUsername","s")%>";
    var PasswordOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aPPPPassword","s")%>";
    var VLANIDOpenFlag = "<%tcWebApi_get("dynCwmpAttr_Entry","aVLANIDMark","s")%>";
    if(UsernameOpenFlag == "0")
      lockObj('pppUserName', true);
    if(PasswordOpenFlag == "0")
      lockObj('pppPassword', true);
    if(VLANIDOpenFlag == "0")
      lockObj('vlan', true);

    function btnRemoveWanCnt()
    {
      if ((CurWan.length - 2) == 0)
      {
        alert("No WAN connection to be delete.");
        return;
      }
      if (AddFlag == true)
      {
        alert("Please save.");
        return;
      }
      if (confirm("Are you sure to delete the selected WAN connection?") == false)
        return;

      var vForm = document.ConfigForm;
      vForm.Wan_Flag.value = "3";
      for(var i=0; i<(CurWan.length-1); i++)
      {
        if(CurWan[i].domain != vForm.curSetIndex.value)
        {
          vForm.afterdeleteFlag.value = CurWan[i].domain;
          break;
        }
      }
	  if(CurWan.length == 3)
	  {
	    vForm.DelLast.value = 1;
	  }
      setDisable('btnRemoveCnt',1);
      setDisable('btnOK',1);
      setDisable('btnAddCnt',1);
      vForm.OperatorStyle.value = "Del";
      vForm.submit();
      showLoading();
    }

    <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes" then%>
      function noVlanIDRepeatTips()
      {
        var v = document.getElementById("vlan").value;
        var addBtn = document.getElementById("btnAddCnt");
        var isRepeat = false;
        for(var i=0;i<vlanIdPVC.length;i++){
          var vlanidArray=vlanIdPVC[i].split("/");
          var vlanid= (vlanidArray[0]===undefined?"":vlanidArray[0]);
          if(v == vlanid){
            isRepeat = true;
          }
        }
        if(isRepeat == false && addBtn.disabled){
          if(document.ConfigForm.cb_enblService.checked == false){
            return confirm("This wan you want to add will not be actived. Are you sure?");
          }
        }
        return true;
      }
    <% end if %>

    function EnableDHCPRealy()
    {
      if(document.ConfigForm.cb_dhcprelay.checked)
        document.ConfigForm.dhcprelay.value = "Yes";
      else
        document.ConfigForm.dhcprelay.value = "No";
    }

  function isValidIpAddress6(address) {

    ipParts = address.split('/');
    cnt = 0;
    if (ipParts.length > 2) return false;
    if (ipParts.length == 2) {
      num = parseInt(ipParts[1]);
      if (num <= 0 || num > 128)
          return false;
    }

    addrParts = ipParts[0].split(':');
    if (addrParts.length < 3 || addrParts.length > 8)
      return false;
    for (i = 0; i < addrParts.length; i++) {
      if ( addrParts[i] != "" ) {
          num = parseInt(addrParts[i], 16);
      if(num > 0xffff || isNaN(num))
        return false;
    }
    else
      cnt += 1;
      if ( i == 0 ) {
    //         if ( (num & 0xf000) == 0xf000 )
    //            return false;	//can not be link-local, site-local or multicast address
      }
      else if ( (i + 1) == addrParts.length) {
    //         if ( num == 0 || num == 1)
    //            return false;	//can not be unspecified or loopback address
      }
      //if ( num != 0 )
          //break;
    if(cnt > 1){
      if((i + 1) == addrParts.length)
        return true
      return false;
    }
    }
    return true;
 }

  function dslite_ServerAddressCheck(ipv6) {
    // Check if input is empty.
    if (ipv6 === '') {
      alert('Please enter the DS Lite Server address.');
      return false;
    }
    
    // Check if input is a valid IPv6 address.
    if (false == isValidIpAddress6(ipv6)) {
      alert(ipv6 + 'is not a valid address.');
      return false;
    }
    
    // Check if input is a valid global unicast address.
    const prefix = ipv6.slice(0, 1);

    //The first three digits of the ipv6 address are '001', which is converted to decimal to be 2 or 3
    if (prefix != '2' && prefix != '3') {
      alert(ipv6 + 'is not a valid address');
      return false;
    }
    
    // If all checks pass, return true.
    return true;
  }

    var isSave = 0;
    function btnSave()
    {
      if( isSave )
        return;
      if(CheckForm(1) == false)
        return false;
      getENCAPstatus();
      CheckIpVersionState();
      if(cb_enblServiceChange() == false){
        return;
      }
      <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") = "Yes" then%>
        if(noVlanIDRepeatTips() == false){
          return;
        }
      <% end if %>
      EnableDHCPRealy();
      var	vForm = document.ConfigForm;
      
      if(getElById('dslite_3').style.display != 'none') {
        if(!dslite_ServerAddressCheck(document.getElementById('dsliteaddress').value)){
          return;
        }
      } 
      
      if(vForm.linkMode.value == "linkPPP")
      {
        //DialMethodChange();
        ppp_dialMethodChg();
        setText('pppManualStatus_Flag', 'disconnect');
      }
      vForm.Wan_Flag.value = "1";
      if(AddFlag == true){
        vForm.OperatorStyle.value = "Add";//add new
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
    if(checkBandBoxStatus1(0) == false)
<% elseif  tcwebApi_get("WebCustom_Entry","isMultiLanSupported","h") = "Yes" then %>
    if(checkBandBoxStatus1(0) == false)
<% else %>
    if(checkBandBoxStatus(0) == false)
<% end if %>
          return false;
        vForm.WanCurrIFIdx.value = getMaxIFIdx();
      }
      else{
        vForm.OperatorStyle.value = "Modify";//modify
<% if tcWebApi_get("WebCustom_Entry", "isMultiUserITFSupported","h") = "Yes" then %>
    if(checkBandBoxStatus1(1) == false)
<% elseif  tcwebApi_get("WebCustom_Entry","isMultiLanSupported","h") = "Yes" then %>
    if(checkBandBoxStatus1(1) == false)
<% else %>
    if(checkBandBoxStatus(1) == false)
<% end if %>
          return false;
      }
      if(getCheckVal('cb_enableqos') == 1)
      {
          vForm.enable_qos.value = "Yes";
      }
      else
      {
          vForm.enable_qos.value = "No";
      }
      setDisable('btnRemoveCnt',1);
      setDisable('btnOK',1);
      setDisable('btnAddCnt',1);
      isSave = 1;
      document.ConfigForm.SaveAlter_Flag.value = "1";
      vForm.submit();
      //showLoading();
    }

    function CheckIpVersionState()
    {
      var vForm = document.ConfigForm;
      ipvChanged = 0;
      vForm.IPVersionValue.value = "<% tcWebApi_get("WanInfo_WanIF","IPVERSION","s") %>";
      var vValue = getSelectVal("IpVersion");
      if(vForm.IPVersionValue.value != vValue){
        if(vForm.IPVersionValue.value == "IPv4")
          ipvChanged = 1;
        else if(vForm.IPVersionValue.value == "IPv6")
          ipvChanged = 2;
        else ipvChanged = 3;
      }
      vForm.IPVersionValue.value = vValue;
      
      with (getElById('ConfigForm'))
      {
        if(IdIpv6AddrType.value == "SLAAC")
          pppv6Mode.value = "No";
        else if(IdIpv6AddrType.value == "DHCP")
          pppv6Mode.value = "Yes";
        else
          pppv6Mode.value = "Sta";	
      }
      
    }

    var vManualEnable = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStart","s") %>";
    function ManualCntSubmit()
    {
      if (AddFlag == true)
      {
        return;
      }
      setDisable('btnRemoveCnt',1);
      setDisable('btnOK',1);
      setDisable('btnAddCnt',1);
      setDisable('pppDialButton',1);
      
      var ponConnect = "<% tcWebApi_get("XPON_Common","trafficStatus","s") %>";	
      var vConnect = "<% tcWebApi_get("WanInfo_WanIF","PPPManualStatus","s") %>";
      
      setText('pppDialButton', 'disconnect');
      setText('pppManualStatus_Flag', 'disconnect');
      if((vManualEnable == "Yes")||(vManualEnable == "yes"))
        document.ConfigForm.pppManualEnable.value = 'No';
      else
        document.ConfigForm.pppManualEnable.value = 'Yes';
      
      if(ponConnect == "up")
      {
        if(vConnect == "connect")
        {
          setText('pppDialButton', 'connect');
          setText('pppManualStatus_Flag', 'connect');
        }
        
        <% tcWebApi_set("WanInfo_WanIF","PPPManualStatus","pppManualStatus_Flag") %>
      }
      else
      {
        <% tcWebApi_set("WanInfo_WanIF","PPPManualStatus","disconnect") %>
      }

      var vForm = document.ConfigForm;
      vForm.OperatorStyle.value = "Modify";
      document.ConfigForm.Wan_Flag.value = "1";//"4";
      vForm.WanCurrIFIdx.value = getIFIdxvidDomain(getSelectVal('wanId'));
      //if(isDecimalDigit(vForm.WanCurrIFIdx.value) == false)
      //return false;

      getENCAPstatus();
      CheckIpVersionState();
      ppp_dialMethodChg();
      document.ConfigForm.submit();

      showLoading();
    }

    function getENCAPstatus()
    {
      with (getElById('ConfigForm'))
      {
        if(wanMode.value == "Bridge")
        {
          ISPTypeValue.value = "3";
          EnCAPFlag.value = "1483 Bridged IP LLC";
        }
        else
        {
          if(linkMode.value == "linkPPP")
          {
            ISPTypeValue.value = "2";//pppoe mode
            EnCAPFlag.value = "PPPoE LLC";
          }
          else
            EnCAPFlag.value = "1483 Bridged IP LLC";
        }
      }
    }

    function isDigit(val) {
      if (val < '0' || val > '9')
        return false;
      return true;
    }
    function isDecimalDigit(digit)
    {
      if ( digit == "" )
      {
        return false;
      }
      for ( var i = 0 ; i < digit.length ; i++ )
      {
        if ( !isDigit(digit.charAt(i)) )
        {
          return false;
        }
      }
      return true;
    }
    function isUseableIpAddress(address)
    {
      var num = 0;
      var addrParts = address.split('.');
      if (addrParts.length != 4)
      {
        return false;
      }
      if (isDecimalDigit(addrParts[0]) == false)
      {
        return false;
      }
      num = parseInt(addrParts[0]);
      if (!(num >= 1 && num <= 223 && num != 127))
      {
        return false;
      }
      for (var i = 1; i <= 2; i++)
      {
        if (isDecimalDigit(addrParts[i]) == false)
        {
          return false;
        }
        num = parseInt(addrParts[i]);
        if (!(num >= 0 && num <= 255))
        {
          return false;
        }
      }
      if (isDecimalDigit(addrParts[3]) == false)
      {
        return false;
      }
      num = parseInt(addrParts[3]);
      if (!(num >= 1 && num <= 254))
      {
        return false;
      }
      return true;
    }

    var curVlanId = "<%if tcWebApi_get("WanInfo_WanIF","VLANID","h") <> "N/A" then tcWebApi_get("WanInfo_WanIF","VLANID","s") end if%>";
    function CheckForm(type)
    {
      if (type == 0)
      {
        return true;
      }
      with (getElById('ConfigForm'))
      {
        if (wanId.length == 0)
        {
          alert("No WAN connection,please add one by click on Add button.");
          return false;
        }

        if ( serviceList.value.indexOf('TR069') >= 0 )
        {
          for(var i=0; i< (CurWan.length-1); i++)
          {
            if ( false == AddFlag && curSetIndex.value == CurWan[i].domain )
              continue;
            if ( CurWan[i].WanRName.indexOf('TR069') >= 0 )
            {
              alert('TR069 WAN connection is exist.');
              return false;
            }
          }
        }

        if ( 'TAG' == VLANMode.value )
        {
          var v = document.getElementById("vlan").value;
          if(isPlusInteger(v) == false)
          {
            alert("VLAN ID is invalid.");
            return false;
          }
          else
          {
            if ((v == "") || (v < 1) || (v > 4094))
            {
            alert("VLAN ID is invalid.");
            return false;
            }
            <% if tcWebApi_get("WebCustom_Entry", "isCTCAPTCHALOGINSupported", "h") <> "Yes"  then%>
              for(var i=0;i<vlanIdPVC.length;i++){
                if(v == vlanIdPVC[i]){
                  if(AddFlag == true || v != curVlanId){
                    for(var j=0; j< WanNameObjs.length; j++)
                    {
                      if(WanNameObjs[j].IfaceName.indexOf(v) > 0){
                        alert("VLAN ID has already been used by wan "+WanNameObjs[j].IfaceName+".");
                        return false;
                      }
                    }
                  }
                  
                }
              }
            <% else %>
                var addBtn = document.getElementById("btnAddCnt");
                for(var i=0;i<vlanIdPVC.length;i++){
                var vlanidArray=vlanIdPVC[i].split("/");
                var vlanid= (vlanidArray[0]===undefined?"":vlanidArray[0]);
                if(v == vlanid && addBtn.disabled) {
                    alert("The same VLAN ID: " + v + " has already been used by wan " + vEntryName[i]);
                    return false;
                }
              }
            <% end if %>
              
          }
        }

        if ( 'TAG' == VLANMode.value )
        {
          var v = v8021P.value;
          if (isPlusInteger(v) == false)
          {
            alert("802.1p is invalid.");
            return false;
          }
          else
          {
            if ((v == "") || (v < 0) || (v > 7))
            {
              alert("802.1p is invalid.");
              return false;
            }
          }
        }

        if ( 'none' != getElement('mulvidsec').style.display )
        {
          var v = MulticastVID.value;
          if ( 0 != v.length)
          {
            if (isPlusInteger(v) == false)
            {
              alert("Multicast VLAN ID is invalid.");
              return false;
            }
            else
            {
              if ( v < 1 || v > 4094 )
              {
                alert("Multi cast VLAN ID is invalid.");
                return false;
              }
            }
          }
          MulVIDUsed.value = 'Yes';
        }
        else
          MulVIDUsed.value = 'No';

        if ( 'none' != getElement('MTUsec').style.display )
        {
          var v = MTU.value;
          if (isPlusInteger(v) == false)
          {
            alert("MTU is invalid.");
            return false;
          }
          else
          {
            if (getSelectVal('linkMode') == 'linkPPP')
            {
              if ('IPv4' == getSelectVal('IpVersion'))
              {
                if ((v == '') || (v < 128) || (v > 1492))
                {
                  alert("MTU is invalid. range(128--1492)");
                  return false;
                }
              }
              else
              {
                <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                  if (getCheckVal('cb_enabledslite') == 1){
                    if ((v == '') || (v < 1320) || (v > 1492))
                    {
                      alert("MTU is invalid. range(1320--1492)");
                      return false;
                    }
                  }else{
                    if ((v == '') || (v < 1280) || (v > 1492))
                    {
                      alert("MTU is invalid. range(1280--1492)");
                      return false;
                    }
                  }
                <% else %>
                  if ((v == '') || (v < 1280) || (v > 1492))
                    {
                      alert("MTU is invalid. range(1280--1492)");
                      return false;
                    }
                <% end if %>
              }
            }
            else
            {
              if ('IPv4' == getSelectVal('IpVersion'))
              {
                if ((v == '') || (v < 576) || (v > 1500))
                {
                  alert("MTU is invalid. range(576--1500)");
                  return false;
                }
              }
              else
              {
                <% if tcwebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then %>
                  if (getCheckVal('cb_enabledslite') == 1){
                    if ((v == '') || (v < 1320) || (v > 1500))
                    {
                      alert("MTU is invalid. range(1320--1500)");
                      return false;
                    }
                  }else{
                    if ((v == '') || (v < 1280) || (v > 1500))
                    {
                      alert("MTU is invalid. range(1280--1500)");
                      return false;
                    }
                  }
                <% else %>
                  if ((v == '') || (v < 1280) || (v > 1500))
                  {
                    alert("MTU is invalid. range(1280--1500)");
                    return false;
                  }
                <% end if %>
              }
            }
          }
        }

        if ( 'none' != getElement('PDEnableSec').style.display )
        {
          PDUsed.value = 'Yes';
          if (getCheckVal('cb_enabledpd') == 1)
            enablepd.value = 'Yes';
          else
            enablepd.value = 'No';
        }
        else
          PDUsed.value = 'No';

        if ( 'none' != getElement('pdmode_1').style.display )
        {
          pdmodeUsed.value = 'Yes';
          if ( getRadioVal('pdmode') == 'No' )
          {
            var prefixObjs = pdprefix.value.split('/');
            if ( prefixObjs.length != 2 )
            {
              alert("Prefix is invalid.Format is XXXX.XXXX.XXXX.XXXX::/XX");
              return false;	
            }

            if ( true != isGlobalIpv6Address(prefixObjs[0]) )
            {
              alert("Prefix is invalid global IPv6 address!Format is XXXX.XXXX.XXXX.XXXX::");
              return false;
            }

            var TemLen = parseInt(prefixObjs[1]);
            if ( true != isPlusInteger(prefixObjs[1]) || true == isNaN(TemLen) || TemLen > 64 || TemLen < 16)
            {
              alert("Prefix length should be range from 16 to 64.");
              return false;	
            }
            
            switch ( CheckPDTime(pdprefixptime.value, pdprefixvtime.value) )
            {
              case 1 :
                alert('Prefix preferred time : "' + pdprefixptime.value + '" is invalid.');
                return false;
              case 2 :
                alert('Prefix valid time : "' + pdprefixvtime.value + '" is invalid.');
                return false;
              case 3 :
                alert('Prefix valid time : ' + pdprefixvtime.value + 'must not be less than preferred time : ' + pdprefixptime.value);
                return false;
            }
          }
        }
        else
          pdmodeUsed.value = 'No';

        if ( 'none' != getElement('enabledhcpsec').style.display )
        {
          if (getCheckVal('cb_enabledhcp') == 1)
            enable_dhcp.value = '1';
          else
            enable_dhcp.value = '0';
        }
        else
          enable_dhcp.value = '0';
        /*PPPoE*/
        if (getElement('secPppoeItems').style.display != "none" && document.ConfigForm.wanMode.value == "PPPoE")
        {
          if (getElement('secIdleTime').style.display != "none")
          {
            <% if tcWebApi_get("WebCustom_Entry", "isPPPoEOnDemandWEBUISupported", "h") = "Yes"  then %>
              var idletime_val = pppTimeOut.value;
              if ( 0 == idletime_val.length
                  || false == isPlusInteger(idletime_val)
                  || parseInt(idletime_val) < 1 )
              {
                alert('No flow idle time is invalid');
                return false;
              }

              pppondemand_idletime.value = parseInt(idletime_val) * 60;
            <% else %>
              if (isPlusInteger(pppTimeOut.value) == false)
              {
              alert("Idle time is invalid.");
              return false;
              }
              else
              {
                if ((getElement('pppTimeOut').value < 1) || (getElement('pppTimeOut').value > 4320)
                || (getElement('pppTimeOut').value == ''))
                {
                  alert("Idle time is invalid.range(1--4320)");
                  return false;
                }
              }
            <% end if %>
          }
          if (pppUserName.value == '' || pppUserName.value.indexOf("\"") >= 0 || isValidNameEx(pppUserName.value) == false)
          {
            alert("Invalid user name.");
            return false;
          }
          if (pppPassword.value == '' || pppPassword.value.indexOf("\"") >= 0 || isValidNameEx(pppPassword.value) == false)
          {
            alert("Invalid psssword.");
            return false;
          }
          if (pppACName.value.indexOf("\"") >= 0 || isValidNameEx(pppACName.value) == false)
          {
            alert("Invalid AC name.");
            return false;
          }
          if (pppServerName.value.indexOf("\"") >= 0 || isValidNameEx(pppServerName.value) == false)
          {
            alert("Invalid service name.");
            return false;
          }
        }

        if ((getElement('secStaticItems').style.display != "none") && ("IPv6" != getRadioVal("IpVersion")))
        {
          if (WanIP != null)
          {
            var iloop;
            for (iloop = 0; iloop< WanIP.length-1; iloop++)
            {
              if ( (vpi != WanIP[iloop].atmVpi) && (vci != WanIP[iloop].atmVci))
              {
                if ( wanIpAddress.value == WanIP[iloop].wanIpAddress)
                {
                  alert("IP Address same with " + WanIP[iloop].conName + " ip.") ;
                  return false;
                }
              }
            }
          }

          if (!isAbcIpAddress(wanIpAddress.value))
          {
            alert("Invalid IP address.");
            wanIpAddress.focus();
            return false;
          }
          if (!isValidSubnetMask(wanSubnetMask.value))
          {
            alert("Invalid subnet mask.");
            wanSubnetMask.focus();
            return false;
          }
		  
          var gateways  =  defaultGateway.value.split('.');
          var wanips  =  wanIpAddress.value.split('.');
          var wanmasks  =  wanSubnetMask.value.split('.');
		  
          if( parseInt(wanmasks[0]) == 255 && parseInt(wanmasks[1]) == 255 &&
              parseInt(wanmasks[2]) == 255 && parseInt(wanmasks[3]) == 254 )
          {
            if( parseInt(wanips[0]) != parseInt(gateways[0]) || parseInt(wanips[1]) != parseInt(gateways[1]) ||
                parseInt(wanips[2]) != parseInt(gateways[2]) || (parseInt(wanips[3]) ^ parseInt(gateways[3])) != 1)
            {
              alert("Default Gateway and Wan IP should be at the same network segment!");
              wanIpAddress.focus();
              return false;
            }
          }
          else
          {
            if (!isHostIpWithSubnetMask(wanIpAddress.value, wanSubnetMask.value))
            {
              alert("IP address is not match with subnet mask.");
              wanIpAddress.focus();
              return false;
            }
          }
          if (!isAbcIpAddress(defaultGateway.value))
          {
            alert("Invalid default gateway.");
            defaultGateway.focus();
            return false;
          }

          var lanips  =  "<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>";
          if(lanips == "")
          {
            lanips = "192.168.1.1";
          }
          lanips = lanips.split('.');

          if( parseInt(wanips[0]) == parseInt(lanips[0]) && parseInt(wanips[1]) == parseInt(lanips[1]) 
            && parseInt(wanips[2]) == parseInt(lanips[2]))
          {
            alert("Wan IP and LAN IP shouldn't be at the same network segment!");
              wanIpAddress.focus();
              return false;
          }
          
          if( parseInt(wanips[0]) != parseInt(gateways[0]) || parseInt(wanips[1]) != parseInt(gateways[1]) 
            || parseInt(wanips[2]) != parseInt(gateways[2]))
          {
            alert("Default Gateway and Wan IP should be at the same network segment!");
              defaultGateway.focus();
              return false;
          }

          if( parseInt(wanips[0]) == parseInt(gateways[0]) && parseInt(wanips[1]) == parseInt(gateways[1])
              && parseInt(wanips[2]) == parseInt(gateways[2]) && parseInt(wanips[3]) == parseInt(gateways[3]))
          {

            alert("Default Gateway can't be same with IP Address.");
            defaultGateway.focus();
            return false;

          }

          if (!isAbcIpAddress(dnsPrimary.value))
          {
            alert("Invalid primary DNS.");
            dnsPrimary.focus();
            return false;
          }
          if (!isUseableIpAddress(dnsPrimary.value))
          {
            alert("Invalid primary DNS.");
            dnsPrimary.focus();
            return false;
          }
          if (dnsSecondary.value != '' && !isAbcIpAddress(dnsSecondary.value))
          {
            alert("Invalid secondary DNS.");
            dnsSecondary.focus();
            return false;
          }
          if (dnsSecondary.value != '' && !isUseableIpAddress(dnsSecondary.value))
          {
            alert("Invalid secondary DNS.");
            dnsSecondary.focus();
            return false;
          }
        }

        if ((secIPv6Div.style.display != "none"))
        {
          if ('IPv4' != getRadioVal('IpVersion'))
          {
            if (TrIpv6Addr.style.display != "none")
            {
              if (!isGlobalIpv6Address(getValue('IdIpv6Addr')))
              {
                alert("IPv6 Address must be global address.");
                return false;
              }
              var v = getValue('IdIpv6PrefixLen');
              if(isPlusInteger(v) == false)
              {
                alert("Invalid prefix length.");
                return false;
              }
              else
              {
                if ((v == "") || (v <= 0) || (v > 128))
                {
                  alert("Invalid prefix length.");
                  return false;
                }
                if (v.length > 1 && v.charAt(0) == '0')
                {
                  alert("Invalid prefix length.");
                  return false;
                }
              }
              if (!isUnicastIpv6Address(getValue('IdIpv6Dns1')))
              {
                alert("Invalid IPv6 primary DNS.");
                return false;
              }
              var v1 = getValue('IdIpv6Dns2');
              if (v1 != '' && !isUnicastIpv6Address(v1))
              {
                alert("Invalid IPv6 secondary DNS.");
                return false;
              }
            }
            var v2 = getValue('IdIpv6Gateway');
            if (v2 != '' && !isUnicastIpv6Address(v2))
            {
              alert("Invalid IPv6 default gateway.");
              return false;
            }
          }
        }
        
        /*Start:6Rd*/
        if ((sec6RdItems.style.display != "none"))
        {
            if ('IPv4' == getSelectVal('IpVersion'))/*only for ipv4*/
            {
                /*ipv4 address*/
                if (!isAbcIpAddress(BRaddress.value))
                {
                    alert("Invalid IPv4 address.");
                    BRaddress.focus();
                    return false;
                }
                /*ipv4 prefix*/
                var v4_prefix_len = getValue('ipv4masklen');
                if(isPlusInteger(v4_prefix_len) == false)
                {
                    alert("Invalid IPv4 prefix length.");
                    return false;
                }
                else
                {
                    if ((v4_prefix_len == "") || (v4_prefix_len < 0) || (v4_prefix_len >= 32))
                    {
                        alert("Invalid IPv4 Mask length.");
                        return false;
                    }
                    if (v.length > 1 && v.charAt(0) == '0')
                    {
                        alert("Invalid IPv4 Mask length.");
                        return false;
                    }
                }
                /*ipv6 address*/
                if (!isGlobalIpv6Address(getValue('ipv6rd_prefix')))
                {
                    alert("IPv6 Address must be global address.");
                    return false;
                }
                var v = getValue('ipv6rd_prefixLen');
                if(isPlusInteger(v) == false)
                {
                    alert("Invalid IPv6 prefix length.");
                    return false;
                }
                else
                {
                    if ((v == "") || (v <= 0) || (v > 64))
                    {
                        alert("Invalid IPv6 prefix length.");
                        return false;
                    }
                    if (v.length > 1 && v.charAt(0) == '0')
                    {
                        alert("Invalid IPv6 prefix length.");
                        return false;
                    }
                }
            }
        }
        /*End:6Rd*/
        <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
          if ( 'none' != getElement('dslite_1').style.display )
          {
            if (getCheckVal('cb_enabledslite') == 1)
              enabledslite.value = 'Yes';
            else
              enabledslite.value = 'No';

            dsliteUsed.value = 'Yes';
          }
          else
            dsliteUsed.value = 'No';
        <%end if%>
        
        <%if tcWebApi_get("WebCustom_Entry","isCTPONC9Supported","h" ) = "Yes" then%>
          if ( !checkWANMac( wanhwaddress.value ) )
          {
            alert('WAN MAC is invalid.');
            return false;	
          }
          wanhwaddress.value = wanhwaddress.value.replace( /-/g , ':' );
        <%end if%>

        <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
          if ( 'none' != getElement('ppp_proxy_bi').style.display )
          {
            ppp_proxy_biUsed.value = 'Yes';
            if ( '1' == getRadioVal("ppp_proxy_bi_mode") && 'none' != getElement('ppp_proxy_user').style.display )
            {
                var pppmaxUser = parseInt(pppproxy_user.value);
                if ( true != isPlusInteger(pppproxy_user.value) || true == isNaN(pppmaxUser) || pppmaxUser > 4 || pppmaxUser < 1)
                {
                  alert("The number of PPPoE agent users is  invalid, range(1-4)");
                  return false;
                }
            }
            
            if ( 0 != getRadioVal("ppp_proxy_bi_mode") )
            {
                if ( 1 == checkDupPPPBi() )
                {
                  alert("Only support 1 WAN connection open proxy or mixed bridge mode.");
                  return false;
                }
            }
          }
          else
            ppp_proxy_biUsed.value = 'No';
        <%else%>
          if ( 'none' != getElement('ppp_bi').style.display )
          {
            pppbiUsed.value = 'Yes';
            if ( getCheckVal('cb_enable_pppbi') == '1' )
            {
              if ( 1 == checkDupPPPBi() )
              {
                alert("Only support 1 WAN connection open mixed bridge mode.");
                return false;
              }
              enablepppbi.value = 'Yes';
            }
            else
              enablepppbi.value = 'No';
          }
          else
            pppbiUsed.value = 'No';
        <%end if%>
      }
    }
  function  checkBandBoxStatus1(type)
  {
    var strCurBind = "";
    var aCurBindFlag = new Array(24);
  
    aCurBindFlag[0] = "<% tcWebApi_get("WanInfo_WanIF","LAN1","s") %>";
    if(aCurBindFlag[0] != "N/A")
    {
      aCurBindFlag[1] = "<% tcWebApi_get("WanInfo_WanIF","LAN2","s") %>";
      aCurBindFlag[2] = "<% tcWebApi_get("WanInfo_WanIF","LAN3","s") %>";
      aCurBindFlag[3] = "<% tcWebApi_get("WanInfo_WanIF","LAN4","s") %>";
      aCurBindFlag[4] = "<% tcWebApi_get("WanInfo_WanIF","LAN5","s") %>";
      aCurBindFlag[5] = "<% tcWebApi_get("WanInfo_WanIF","LAN6","s") %>";
      aCurBindFlag[6] = "<% tcWebApi_get("WanInfo_WanIF","LAN7","s") %>";
      aCurBindFlag[7] = "<% tcWebApi_get("WanInfo_WanIF","LAN8","s") %>";
      aCurBindFlag[8] = "<% tcWebApi_get("WanInfo_WanIF","SSID1","s") %>";
      aCurBindFlag[9] = "<% tcWebApi_get("WanInfo_WanIF","SSID2","s") %>";
      aCurBindFlag[10] = "<% tcWebApi_get("WanInfo_WanIF","SSID3","s") %>";
      aCurBindFlag[11] = "<% tcWebApi_get("WanInfo_WanIF","SSID4","s") %>";
      aCurBindFlag[12] = "<% tcWebApi_get("WanInfo_WanIF","SSID5","s") %>";
      aCurBindFlag[13] = "<% tcWebApi_get("WanInfo_WanIF","SSID6","s") %>";
      aCurBindFlag[14] = "<% tcWebApi_get("WanInfo_WanIF","SSID7","s") %>";
      aCurBindFlag[15] = "<% tcWebApi_get("WanInfo_WanIF","SSID8","s") %>";
      aCurBindFlag[16] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC1","s") %>";
      aCurBindFlag[17] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC2","s") %>";
      aCurBindFlag[18] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC3","s") %>";
      aCurBindFlag[19] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC4","s") %>";
      aCurBindFlag[20] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC5","s") %>";
      aCurBindFlag[21] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC6","s") %>";
      aCurBindFlag[22] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC7","s") %>";
      aCurBindFlag[23] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC8","s") %>";
      aCurBindFlag[24] = "<% tcWebApi_get("WanInfo_WanIF","USB","s") %>";
      aCurBindFlag[25] = "<% tcWebApi_get("WanInfo_WanIF","WDS","s") %>";
<% if tcwebApi_get("WebCustom_Entry","isHsgmiiLanSupported","h") = "Yes" then %>
      aCurBindFlag[26] = "<% tcWebApi_get("WanInfo_WanIF","LAN25","s") %>";
    for(k=0; k<27; k++)
<% else %>
    for(k=0; k<26; k++)
<% end if %>
    {
        strCurBind = strCurBind + aCurBindFlag[k] + ",";
    }
   }
    
    var strBindFlag = "";
    var nInterfaces = CurWan.length-1;
    var vForm = document.ConfigForm;
    if(vForm.cb_bindlan1.checked)
      vForm.bindlan1.value = "Yes";
    else vForm.bindlan1.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan1.value + ",";
    if(vForm.cb_bindlan2.checked)
      vForm.bindlan2.value = "Yes";
    else vForm.bindlan2.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan2.value + ",";
    if(vForm.cb_bindlan3.checked)
      vForm.bindlan3.value = "Yes";
    else vForm.bindlan3.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan3.value + ",";
    if(vForm.cb_bindlan4.checked)
      vForm.bindlan4.value = "Yes";
    else vForm.bindlan4.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan4.value + ",";
    if(vForm.cb_bindlan5.checked)
      vForm.bindlan5.value = "Yes";
    else vForm.bindlan5.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan5.value + ",";
    if(vForm.cb_bindlan6.checked)
      vForm.bindlan6.value = "Yes";
    else vForm.bindlan6.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan6.value + ",";
    if(vForm.cb_bindlan7.checked)
      vForm.bindlan7.value = "Yes";
    else vForm.bindlan7.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan7.value + ",";
    if(vForm.cb_bindlan8.checked)
      vForm.bindlan8.value = "Yes";
    else vForm.bindlan8.value = "No";
    strBindFlag = strBindFlag + vForm.bindlan8.value + ",";
    //wireless
    if(vForm.cb_bindwireless2.checked)
    {
      vForm.bindwireless1.value = "Yes";
      vForm.bindwireless2.value = "Yes";
    }
    else
    {
      vForm.bindwireless1.value = "No";
      vForm.bindwireless2.value = "No";
    }
    strBindFlag = strBindFlag + vForm.bindwireless1.value + ",";
    strBindFlag = strBindFlag + vForm.bindwireless2.value + ",";
    if(vForm.cb_bindwireless3.checked)
      vForm.bindwireless3.value = "Yes";
    else vForm.bindwireless3.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless3.value + ",";
    if(vForm.cb_bindwireless4.checked)
      vForm.bindwireless4.value = "Yes";
    else vForm.bindwireless4.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless4.value;
    strBindFlag = strBindFlag + ",";
    if(vForm.cb_bindwireless5.checked)
      vForm.bindwireless5.value = "Yes";
    else vForm.bindwireless5.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless5.value + ",";
    if(vForm.cb_bindwireless6.checked)
      vForm.bindwireless6.value = "Yes";
    else vForm.bindwireless6.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless6.value + ",";
    if(vForm.cb_bindwireless7.checked)
      vForm.bindwireless7.value = "Yes";
    else vForm.bindwireless7.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless7.value + ",";
    if(vForm.cb_bindwireless8.checked)
      vForm.bindwireless8.value = "Yes";
    else vForm.bindwireless8.value = "No";
    strBindFlag = strBindFlag + vForm.bindwireless8.value;
    strBindFlag = strBindFlag + ",";
    //wireless 5g
    if(vForm.cb_bindwirelessac2.checked)
    {
      vForm.bindwirelessac1.value = "Yes";
      vForm.bindwirelessac2.value = "Yes";
    }
    else
    {
      vForm.bindwirelessac1.value = "No";
      vForm.bindwirelessac2.value = "No";
    }
    strBindFlag = strBindFlag + vForm.bindwirelessac1.value + ",";
    strBindFlag = strBindFlag + vForm.bindwirelessac2.value + ",";
    if(vForm.cb_bindwirelessac3.checked)
      vForm.bindwirelessac3.value = "Yes";
    else vForm.bindwirelessac3.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac3.value + ",";
    if(vForm.cb_bindwirelessac4.checked)
      vForm.bindwirelessac4.value = "Yes";
    else vForm.bindwirelessac4.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac4.value;
    strBindFlag = strBindFlag + ",";
    if(vForm.cb_bindwirelessac5.checked)
      vForm.bindwirelessac5.value = "Yes";
    else vForm.bindwirelessac5.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac5.value + ",";
    if(vForm.cb_bindwirelessac6.checked)
      vForm.bindwirelessac6.value = "Yes";
    else vForm.bindwirelessac6.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac6.value + ",";
    if(vForm.cb_bindwirelessac7.checked)
      vForm.bindwirelessac7.value = "Yes";
    else vForm.bindwirelessac7.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac7.value + ",";
    if(vForm.cb_bindwirelessac8.checked)
      vForm.bindwirelessac8.value = "Yes";
    else vForm.bindwirelessac8.value = "No";
    strBindFlag = strBindFlag + vForm.bindwirelessac8.value + ",";
    strBindFlag = strBindFlag + "No,No";
<% if tcwebApi_get("WebCustom_Entry","isHsgmiiLanSupported","h") = "Yes" then %>
  if(vForm.cb_bindlan25.checked)  
    vForm.bindlan25.value = "Yes";
  else vForm.bindlan25.value = "No";
    strBindFlag = strBindFlag + "," + vForm.bindlan25.value;
<% end if %>
    var aTemp1 = new Array();
    var aTemp2 = new Array();
    var aTemp3 = new Array();
    
<%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
      if ( 'none' != getElement('ppp_proxy_bi').style.display )
      {
        if ( getRadioVal("ppp_proxy_bi_mode") == '1' )
          return true;
      }
<%end if%>
    
    if(vBindStatus != "N/A")
    {
      aTemp1 = vBindStatus.split(',');
      aTemp2 = strBindFlag.split(',');
      aTemp3 = strCurBind.split(',');
      //*check ip version;*/
      var strIpversion = vForm.IPVersionValue.value;/*current ip version;*/
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
      if ( 'none' != getElement('dslite_1').style.display )
      {
        if (getCheckVal('cb_enabledslite') == 1)
            strIpversion = "IPv4/IPv6";
      } 
<%end if%>
      
      for(var i=0; i<27; i++)
      {
        if((aTemp1[i] == "Yes") && (aTemp2[i] == "Yes"))
        {
<%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
          if (1 == type) /* modify action*/
          {
            if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[81+2*i]))
               || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[81+2*i+1]))
               || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[81+2*i]), parseInt(aTemp1[81+2*i+1]))) )
              continue;
          }
<%else%>
          /*continue if it do modify action and the port is bind */
          if((1 == type) && (aTemp3[i] == "Yes")){
            if(0 == ipvChanged)//ip version  has not changed
              continue;
            else{
              //if("IPv4/IPv6" == strIpversion){
                if(3 == ipvChanged){//ipv4/v6->ipv4 or ipv6
                  continue;
                }
                else if(1 == ipvChanged){//ipv4->ipv4/ipv6
                  if(0 == aTemp1[27+2*i+1])//if ipv6 is not binded, can ok
                    continue;
                }
                else if(2 == ipvChanged){//ipv6->ipv4/ipv6
                  if(0 == aTemp1[27+2*i])//if ipv4 is not binded, can ok
                    continue;
                }
            }
          }
<%end if%>
          if((("IPv4" == strIpversion) && (0 == aTemp1[27+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[27+2*i+1]))){ 
            continue;
          }
            
          var strindex;
          if(i < 8)
          {
            strindex = i+1;
            alert("Lan " + strindex.toString() + " was binded by other interface.");
          }
          else if(i >=8 && i < 16)
          {
            strindex = i - 8;
            alert("SSID " + strindex.toString() + " was binded by other interface.");
          }
          else if(i >=17 && i < 24)
          {
            strindex = i - 16;
            //SSIDAC1 is allow to be binded by other interface.
            if(0 == strindex)
                continue;
            alert("SSIDAC " + strindex.toString() + " was binded by other interface.");
          }
		  else if(i == 26){
			alert("LAN 2.5G " +  " was binded by other interface.");
		  }
  
          return false;
        }
      } 
    }
    return true;
  }
    //type: 
    //0: Add action
    //1: Modify action
    function	checkBandBoxStatus(type)
    {
      //lan
      var strCurBind = "";
      <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        var aCurBindFlag = new Array(12);
      <% else %>
        var aCurBindFlag = new Array(8);
      <% end if %>
      aCurBindFlag[0] = "<% tcWebApi_get("WanInfo_WanIF","LAN1","s") %>";
      if(aCurBindFlag[0] != "N/A")
      {
        aCurBindFlag[1] = "<% tcWebApi_get("WanInfo_WanIF","LAN2","s") %>";
        aCurBindFlag[2] = "<% tcWebApi_get("WanInfo_WanIF","LAN3","s") %>";
        aCurBindFlag[3] = "<% tcWebApi_get("WanInfo_WanIF","LAN4","s") %>";
        aCurBindFlag[4] = "<% tcWebApi_get("WanInfo_WanIF","SSID1","s") %>";
        aCurBindFlag[5] = "<% tcWebApi_get("WanInfo_WanIF","SSID2","s") %>";
        aCurBindFlag[6] = "<% tcWebApi_get("WanInfo_WanIF","SSID3","s") %>";
        aCurBindFlag[7] = "<% tcWebApi_get("WanInfo_WanIF","SSID4","s") %>";
        <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
          aCurBindFlag[8] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC1","s") %>";
          aCurBindFlag[9] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC2","s") %>";
          aCurBindFlag[10] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC3","s") %>";
          aCurBindFlag[11] = "<% tcWebApi_get("WanInfo_WanIF","SSIDAC4","s") %>";
          for(k=0; k<12; k++)
        <% else %>
          for(k=0; k<8; k++)
        <% end if %>
          {
            strCurBind = strCurBind + aCurBindFlag[k] + ",";
          }
      }
      
      var strBindFlag = "";
      var nInterfaces = CurWan.length-1;
      var vForm = document.ConfigForm;
      if(vForm.cb_bindlan1.checked)
        vForm.bindlan1.value = "Yes";
      else vForm.bindlan1.value = "No";
      strBindFlag = strBindFlag + vForm.bindlan1.value + ",";
      if(vForm.cb_bindlan2.checked)
        vForm.bindlan2.value = "Yes";
      else vForm.bindlan2.value = "No";
      strBindFlag = strBindFlag + vForm.bindlan2.value + ",";
      if(vForm.cb_bindlan3.checked)
        vForm.bindlan3.value = "Yes";
      else vForm.bindlan3.value = "No";
      strBindFlag = strBindFlag + vForm.bindlan3.value + ",";
      if(vForm.cb_bindlan4.checked)
        vForm.bindlan4.value = "Yes";
      else vForm.bindlan4.value = "No";
      strBindFlag = strBindFlag + vForm.bindlan4.value + ",";
      //wireless
      if(vForm.cb_bindwireless1.checked)
        vForm.bindwireless1.value = "Yes";
      else vForm.bindwireless1.value = "No";
      strBindFlag = strBindFlag + vForm.bindwireless1.value + ",";
      if(vForm.cb_bindwireless2.checked)
        vForm.bindwireless2.value = "Yes";
      else vForm.bindwireless2.value = "No";
      strBindFlag = strBindFlag + vForm.bindwireless2.value + ",";
      if(vForm.cb_bindwireless3.checked)
        vForm.bindwireless3.value = "Yes";
      else vForm.bindwireless3.value = "No";
      strBindFlag = strBindFlag + vForm.bindwireless3.value + ",";
      if(vForm.cb_bindwireless4.checked)
        vForm.bindwireless4.value = "Yes";
      else vForm.bindwireless4.value = "No";
      strBindFlag = strBindFlag + vForm.bindwireless4.value;
      <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        strBindFlag = strBindFlag + ",No,No,";
        //wireless 5g
        if(vForm.cb_bindwirelessac1.checked)
          vForm.bindwirelessac1.value = "Yes";
        else vForm.bindwirelessac1.value = "No";
        strBindFlag = strBindFlag + vForm.bindwirelessac1.value + ",";
        if(vForm.cb_bindwirelessac2.checked)
          vForm.bindwirelessac2.value = "Yes";
        else vForm.bindwirelessac2.value = "No";
        strBindFlag = strBindFlag + vForm.bindwirelessac2.value + ",";
        if(vForm.cb_bindwirelessac3.checked)
          vForm.bindwirelessac3.value = "Yes";
        else vForm.bindwirelessac3.value = "No";
        strBindFlag = strBindFlag + vForm.bindwirelessac3.value + ",";
        if(vForm.cb_bindwirelessac4.checked)
          vForm.bindwirelessac4.value = "Yes";
        else vForm.bindwirelessac4.value = "No";
        strBindFlag = strBindFlag + vForm.bindwirelessac4.value;
      <% end if %>
      var aTemp1 = new Array();
      var aTemp2 = new Array();
      var aTemp3 = new Array();
      
      <%if TCWebApi_get("WebCustom_Entry","isPPPoEProxySupported","h" ) = "Yes" then%>
        if ( 'none' != getElement('ppp_proxy_bi').style.display )
        {
          if ( getRadioVal("ppp_proxy_bi_mode") == '1' )
            return true;
        }
      <%end if%>
      
      if(vBindStatus != "N/A")
      {
        aTemp1 = vBindStatus.split(',');
        aTemp2 = strBindFlag.split(',');
        aTemp3 = strCurBind.split(',');
        //check ip version;
        var strIpversion = vForm.IPVersionValue.value;//current ip version;
        <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
          if ( 'none' != getElement('dslite_1').style.display )
          {
            if (getCheckVal('cb_enabledslite') == 1)
                strIpversion = "IPv4/IPv6";
          }
        <%end if%>
        
        <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>		
          for(var i=0; i<14; i++)
        <% else %>
          for(var i=0; i<8; i++)
        <% end if %>
        {
          if((aTemp1[i] == "Yes") && (aTemp2[i] == "Yes"))
          {
            <%if TCWebApi_get("WebCustom_Entry","isDSLiteSupported","h" ) = "Yes" then%>
              if (1 == type) // modify action
              {
                <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>	
                  if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i]))
                    || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[42+2*i+1]))
                    || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[42+2*i]), parseInt(aTemp1[42+2*i+1]))) )
                    continue;
                <% else %>
                  if ( ("IPv4" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i]))
                    || ("IPv6" == strIpversion && vForm.curSetIndex.value == parseInt(aTemp1[24+2*i+1]))
                    || ("IPv4/IPv6" == strIpversion && v4v6BindCheck(vForm.curSetIndex.value, parseInt(aTemp1[24+2*i]), parseInt(aTemp1[24+2*i+1]))) )
                    continue;
                <% end if %>
              }
            <%else%>
              //continue if it do modify action and the port is bind 
              if((1 == type) && (aTemp3[i] == "Yes")){
                if(0 == ipvChanged)//ip version  has not changed
                  continue;
                else{
                  //if("IPv4/IPv6" == strIpversion){
                  if(3 == ipvChanged){//ipv4/v6->ipv4 or ipv6
                    continue;
                  }
                  else if(1 == ipvChanged){//ipv4->ipv4/ipv6
                    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                      if(0 == aTemp1[14+2*i+1])//if ipv6 is not binded, can ok
                    <% else %>
                      if(0 == aTemp1[8+2*i+1])//if ipv6 is not binded, can ok
                    <% end if %>
                        continue;
                  }
                  else if(2 == ipvChanged){//ipv6->ipv4/ipv6
                    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
                    if(0 == aTemp1[14+2*i])//if ipv4 is not binded, can ok
                    <% else %>
                    if(0 == aTemp1[8+2*i])//if ipv4 is not binded, can ok
                    <% end if %>
                      continue;
                  }
                  //}
                }
              }
            <%end if%>

            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>				
              if((("IPv4" == strIpversion) && (0 == aTemp1[14+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[14+2*i+1]))){				
                continue;
              }
            <% else %>
              if((("IPv4" == strIpversion) && (0 == aTemp1[8+2*i])) || (("IPv6" == strIpversion) && (0 == aTemp1[8+2*i+1]))){
                continue;
              }
            <% end if %>
            var strindex;
            if(i < 4)
            {
              strindex = i+1;
              alert("Lan " + strindex.toString() + " was binded by other interface.");
            }
            <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
              else if(i >=4 && i < 8)
              {
                strindex = i - 3;
                alert("SSID" + strindex.toString() + "was binded by other interface.");
              }
              else
              {
                strindex = i - 9;
                //SSIDAC1 is allow to be binded by other interface.
                if(0 == strindex)
                    continue;
                <%if TCWebApi_get("WebCustom_Entry","isCTPONCNJSSupported","h" ) = "Yes" then%>
                <%else%>
                  alert("SSIDAC" + strindex.toString() + "was binded by other interface.");
                <%end if%>
              }
            <% else %>
              else
              {
                strindex = i - 3;
                alert("SSID " + strindex.toString() + " was binded by other inetface.");
              }
            <% end if %>
            return false;
          }
        }
      }
      return true;
    }
    
    function pppPasswordVisible()
    {
      if($("#pppPassword").prop("type") == "password"){
        $('#pppPassword').prop('type','text');
      }else{
        $('#pppPassword').prop('type','password');
      };
    }
    
    function IpoeConf()
    {
        if( 1 == getCheckVal("cb_enableipoe") )
        {
            getElById('ipoename').style.display="";
            getElById('ipoepass').style.display="";
            setText("Option60Enable","Yes");
        }
        else
        {
            getElById('ipoename').style.display="none";
            getElById('ipoepass').style.display="none";
            setText("Option60Enable","No");
        }
    }
  </script>
</body>

</html>
