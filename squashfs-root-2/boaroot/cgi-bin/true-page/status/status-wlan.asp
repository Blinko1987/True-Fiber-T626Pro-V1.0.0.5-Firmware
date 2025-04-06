<%
 if Request_Form("status_Flag") = "1" then 
   TCWebApi_commit("wifiMacTab")
   tcWebApi_constSet("wifiMacTab_Common","refreshFlag","1")
   TCWebApi_get("wifiMacTab_Common", "Waiting-3s")
 end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - WLAN</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
  <SCRIPT language=JavaScript type=text/javascript>
    var Info_WLan = "<% tcwebApi_get("Info_WLan","ALL","s") %>";
    var Info_WLan_Array = Info_WLan.split('|');
    //isExist : Info_WLan_Array[0]
    //rxpackets txpackets 1-2
    //rxbytes txbytes
    //hwaddr detectionStatus
    //wlanTxFrames wlanTxErrFrames
    //wlanTxDropFrames wlanRxFrames
    //wlanRxErrFrames wlanRxDropFrames
    //CurrentChannel
    //wlanSelfPinCode
    //wlanWPSStatus_0 wlanWPSStatus_1 wlanWPSStatus_2 wlanWPSStatus_3
    //wlanWPStimerRunning_0 wlanWPStimerRunning_1 wlanWPStimerRunning_2 wlanWPStimerRunning_3
    //isWPSSupported isDot1XSupported isDot1XEnhanceSupported
    //maxStaNumSupported
  
    var Info_WLan11ac = "<% tcwebApi_get("Info_WLan11ac","ALL","s") %>";
    var Info_WLan11ac_Array = Info_WLan11ac.split('|');
    //isExist : Info_WLan11ac_Array[0]
    //wlanTxFrames wlanTxErrFrames 1-2
    //wlanTxDropFrames wlanRxFrames 3-4
    //wlanRxErrFrames wlanRxDropFrames 5-6
    //CurrentChannel 7
    //wlanTxRetryCount wlanRTSSuccessRcvCTS 8-9
    //wlanRTSFailRcvCTS 10
    //wlanSNR0 wlanSNR1 wlanSNR2 11-13
    //wlanSelfPinCode 14
    //wlanWPSStatus_0 wlanWPSStatus_1 wlanWPSStatus_2 wlanWPSStatus_3 15-18
    //wlanWPStimerRunning_0 wlanWPStimerRunning_1 wlanWPStimerRunning_2 wlanWPStimerRunning_3 19-22
    //wlanRxPackets wlanTxPackets wlanRxBytes wlanTxBytes  23-26
    //isWPSSupported isDot1XSupported isDot1XEnhanceSupported 27-29
    //DLS M2U  DFS Carrier 30-33
    //maxStaNumSupported 34
    //TXPath RXPath
    function stWlan(domain,enable,ssid,BeaconType,BasicEncrypt,BasicAuth,WPAEncrypt,WPAAuth,IEEE11iEncrypt,IEEE11iAuth,Channel,ChannelsInUse,NONE,BSSID)
    {
      this.domain = domain;
      this.enable = enable;
      this.ssid = ssid;
      this.BeaconType = BeaconType;
      this.BasicAuth = BasicAuth;
      this.BasicEncrypt = BasicEncrypt;
      this.WPAAuth = WPAAuth;
      this.WPAEncrypt = WPAEncrypt;
      this.IEEE11iAuth = IEEE11iAuth;
      this.IEEE11iEncrypt = IEEE11iEncrypt;
      this.Channel = Channel;
      this.ChannelsInUse = ChannelsInUse;
      this.BSSID = BSSID;
    }
    <% if tcWebApi_get("wifiMacTab_Common","refreshFlag","h") = "1" then %>
      <% if tcwebApi_get("WLan_Entry1","EnableSSID","h") = "1" then %>
      var Bssid1 = "<% tcWebApi_get("Info_WLan","Bssid1","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry1","EnableSSID","h") = "1" then %>
      var Bssid2 = "<% tcWebApi_get("Info_WLan","Bssid2","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry2","EnableSSID","h") = "1" then %>
      var Bssid3 = "<% tcWebApi_get("Info_WLan","Bssid3","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry3","EnableSSID","h") = "1" then %>
      var Bssid4 = "<% tcWebApi_get("Info_WLan","Bssid4","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry4","EnableSSID","h") = "1" then %>
      var Bssid5 = "<% tcWebApi_get("Info_WLan","Bssid5","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry5","EnableSSID","h") = "1" then %>
      var Bssid6 = "<% tcWebApi_get("Info_WLan","Bssid6","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry6","EnableSSID","h") = "1" then %>
      var Bssid7 = "<% tcWebApi_get("Info_WLan","Bssid7","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry7","EnableSSID","h") = "1" then %>
      var Bssid8 = "<% tcWebApi_get("Info_WLan","Bssid8","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan_Entry0","EnableSSID","h") = "1" then %>
      var Bssid8 = "<% tcWebApi_get("Info_WLan","Bssid1","s") %>";
      <% end if %>

      <% if tcwebApi_get("WLan11ac_Entry0","EnableSSID","h") = "1" then %>
      var AC_Bssid1 = "<% tcWebApi_get("Info_WLan11ac","Bssid1","s") %>";
      <% end if %>  
      <% if tcwebApi_get("WLan11ac_Entry1","EnableSSID","h") = "1" then %>
      var AC_Bssid2 = "<% tcWebApi_get("Info_WLan11ac","Bssid2","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry2","EnableSSID","h") = "1" then %>
      var AC_Bssid3 = "<% tcWebApi_get("Info_WLan11ac","Bssid3","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry3","EnableSSID","h") = "1" then %>
      var AC_Bssid4 = "<% tcWebApi_get("Info_WLan11ac","Bssid4","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry4","EnableSSID","h") = "1" then %>
      var AC_Bssid5 = "<% tcWebApi_get("Info_WLan11ac","Bssid5","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry5","EnableSSID","h") = "1" then %>
      var AC_Bssid6 = "<% tcWebApi_get("Info_WLan11ac","Bssid6","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry6","EnableSSID","h") = "1" then %>
      var AC_Bssid7 = "<% tcWebApi_get("Info_WLan11ac","Bssid7","s") %>";
      <% end if %>
      <% if tcwebApi_get("WLan11ac_Entry7","EnableSSID","h") = "1" then %>
      var AC_Bssid8 = "<% tcWebApi_get("Info_WLan11ac","Bssid8","s") %>";
      <% end if %>


      var clientNum0 = "<% if tcWebApi_get("wifiMacTab_Common","NUM0","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM0","s") else asp_Write("0") end if %>";//2.4G BH
      var clientNum1 = "<% if tcWebApi_get("wifiMacTab_Common","NUM1","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM1","s") else asp_Write("0") end if %>";
      var clientNum2 = "<% if tcWebApi_get("wifiMacTab_Common","NUM2","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM2","s") else asp_Write("0") end if %>";
      var clientNum3 = "<% if tcWebApi_get("wifiMacTab_Common","NUM3","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM3","s") else asp_Write("0") end if %>";
      var clientNum4 = "<% if tcWebApi_get("wifiMacTab_Common","NUM4","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM4","s") else asp_Write("0") end if %>";
      var clientNum5 = "<% if tcWebApi_get("wifiMacTab_Common","NUM5","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM5","s") else asp_Write("0") end if %>";
      var clientNum6 = "<% if tcWebApi_get("wifiMacTab_Common","NUM6","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM6","s") else asp_Write("0") end if %>";
      var clientNum7 = "<% if tcWebApi_get("wifiMacTab_Common","NUM7","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM7","s") else asp_Write("0") end if %>";

      var clientNum8 = "<% if tcWebApi_get("wifiMacTab_Common","NUM8","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM8","s") else asp_Write("0") end if %>";//5G BH
      var clientNum9 = "<% if tcWebApi_get("wifiMacTab_Common","NUM9","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM9","s") else asp_Write("0") end if %>";
      var clientNum10 = "<% if tcWebApi_get("wifiMacTab_Common","NUM10","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM10","s") else asp_Write("0") end if %>";
      <% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
      var clientNum11 = "<% if tcWebApi_get("wifiMacTab_Common","NUM11","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM11","s") else asp_Write("0") end if %>";
      <% else %>
      var clientNum11 = 0;//"   .@ TrueHiSpeed"
      <% end if %>
      var clientNum12 = "<% if tcWebApi_get("wifiMacTab_Common","NUM12","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM12","s") else asp_Write("0") end if %>";
      var clientNum13 = "<% if tcWebApi_get("wifiMacTab_Common","NUM13","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM13","s") else asp_Write("0") end if %>";
      var clientNum14 = "<% if tcWebApi_get("wifiMacTab_Common","NUM14","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM14","s") else asp_Write("0") end if %>";
      var clientNum15 = "<% if tcWebApi_get("wifiMacTab_Common","NUM15","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM15","s") else asp_Write("0") end if %>";
    <% else %>
      var Bssid1 = "/";
      var Bssid2 = "/";
      var Bssid3 = "/";
      var Bssid4 = "/";
      var Bssid5 = "/";
      var Bssid6 = "/";
      var Bssid7 = "/";
      var Bssid8 = "/";

      var AC_Bssid1 = "/";
      var AC_Bssid2 = "/";
      var AC_Bssid3 = "/";
      var AC_Bssid4 = "/";
      var AC_Bssid5 = "/";
      var AC_Bssid6 = "/";
      var AC_Bssid7 = "/";
      var AC_Bssid8 = "/";

      var clientNum0 = 0;
      var clientNum1 = 0;
      var clientNum2 = 0;
      var clientNum3 = 0;
      var clientNum4 = 0;
      var clientNum5 = 0;
      var clientNum6 = 0;
      var clientNum7 = 0;
      
      var clientNum8 = 0;
      var clientNum9 = 0;
      var clientNum10 = 0;
      var clientNum11 = 0;
      var clientNum12 = 0;
      var clientNum13 = 0;
      var clientNum14 = 0;
      var clientNum15 = 0;
    <% end if %>
    var WlanInfo = new Array(8);
    WlanInfo[0] = new stWlan("0","<% tcWebApi_get("WLan_Entry1","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry1","SSID","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry1","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid2);
    <% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") <> "Yes" then %>
    WlanInfo[1] = new stWlan("1","<% tcWebApi_get("WLan_Entry2","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry2","SSID","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry2","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid3);
    WlanInfo[2] = new stWlan("2","<% tcWebApi_get("WLan_Entry3","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry3","SSID","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry3","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid4);
    WlanInfo[3] = new stWlan("3","<% tcWebApi_get("WLan_Entry4","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry4","SSID","s") %>","<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry4","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid5);
    <% end if %>
    WlanInfo[4] = new stWlan("4","<% tcWebApi_get("WLan_Entry5","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry5","SSID","s") %>","<% tcWebApi_get("WLan_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry5","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry5","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid6);
    WlanInfo[5] = new stWlan("5","<% tcWebApi_get("WLan_Entry6","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry6","SSID","s") %>","<% tcWebApi_get("WLan_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry6","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry6","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid7);
    WlanInfo[6] = new stWlan("6","<% tcWebApi_get("WLan_Entry7","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry7","SSID","s") %>","<% tcWebApi_get("WLan_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry7","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry7","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid8);
    WlanInfo[7] = new stWlan("7","<% tcWebApi_get("WLan_Entry0","EnableSSID","s") %>","<% tcWebApi_get("WLan_Entry0","SSID","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan_Array[13],"1","",Bssid1);
    
    var WlanacInfo = new Array(8);
    WlanacInfo[0] = new stWlan("0","<% tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry1","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry1","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid2);
    <% if tcwebApi_get("WebCustom_Entry","isCTPONSNSupported","h") <> "Yes" then %>
    WlanacInfo[1] = new stWlan("1","<% tcWebApi_get("WLan11ac_Entry2","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry2","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry2","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry2","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid3);
    WlanacInfo[2] = new stWlan("2","<% tcWebApi_get("WLan11ac_Entry3","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry3","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry3","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry3","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid4);
    WlanacInfo[3] = new stWlan("3","<% tcWebApi_get("WLan11ac_Entry4","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry4","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry4","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry4","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry4","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid5);
    <% end if %>
    WlanacInfo[4] = new stWlan("4","<% tcWebApi_get("WLan11ac_Entry5","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry5","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry5","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry5","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry5","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid6);
    WlanacInfo[5] = new stWlan("5","<% tcWebApi_get("WLan11ac_Entry6","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry6","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry6","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry6","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry6","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid7);
    WlanacInfo[6] = new stWlan("6","<% tcWebApi_get("WLan11ac_Entry7","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry7","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry7","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry7","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid8);
    WlanacInfo[7] = new stWlan("6","<% tcWebApi_get("WLan11ac_Entry0","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry7","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid1);
    var wlanEnbl = "<% TCWebApi_get("WLan_Common", "APOn", "s") %>";
    var wlanacEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";
    var ssidnum = "<% tcWebApi_get("WLan_Common","BssidNum","s") %>";
    ssidnum = 8;
    var Auth = new Array(8);
    if (wlanEnbl == "1")
    {
      for (var i = 0; i < ssidnum; i++)
      {
        if (WlanInfo[i].BeaconType.indexOf('WEP') > -1)
        {
          Auth[i] = "WEP";
        }
        else if(WlanInfo[i].BeaconType.indexOf('OPEN') > -1)
        {
          Auth[i] = "OPEN";
        }
        else 
        {
          Auth[i] = WlanInfo[i].WPAEncrypt;
          if(Auth[i].toUpperCase ()=="WPAPSK"){
            Auth[i]="WPA-PSK";
          }else if(Auth[i].toUpperCase ()=="WPA2PSK"){
            Auth[i]="WPA2-PSK";
          }else if(Auth[i].toUpperCase ()=="WPAPSKWPA2PSK"){
            Auth[i]="WPA-PSK/WPA2-PSK";
          }
        }
        if(WlanInfo[i].enable == "0"){
          WlanInfo[i].BSSID = "/";
        }
      }
    }
    var ssidnumac = "<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>";
    ssidnumac = 8;
    var Authac = new Array(8);
    if (wlanacEnbl == "1")
    {
      for (var i = 0; i < ssidnumac; i++)
      {
        if (WlanacInfo[i].BeaconType.indexOf('WEP') > -1)
        {
          Authac[i] = "WEP";
        }
        else if(WlanacInfo[i].BeaconType.indexOf('OPEN') > -1)
        {
          Authac[i] = "OPEN";
        }
        else 
        {
          Authac[i] = WlanacInfo[i].WPAEncrypt;
          if(Authac[i].toUpperCase ()=="WPAPSK")
          {
            Authac[i]="WPA-PSK";
          }
          else if(Authac[i].toUpperCase ()=="WPA2PSK")
          {
            Authac[i]="WPA2-PSK";
          }
          else if(Authac[i].toUpperCase ()=="WPAPSKWPA2PSK")
          {
            Authac[i]="WPA-PSK/WPA2-PSK";
          }
        }
        if(WlanacInfo[i].enable == "0")
        {
          WlanacInfo[i].BSSID = "/";
        }
      }
    }
    
  function refresh()
  {
    document.wlanForm.status_Flag.value = "1";
    //showLoading();
    window.parent.postMessage("showLoading", location.origin);
    var formData = $("#wlanForm").serialize();
    var formName = $("#wlanForm").attr("action");
    deferAjax(formName, formData)
    .done(function(_html){
      //console.log(_html);
      document.write(_html);
      document.close();
      window.parent.postMessage("hideLoading", location.origin);
    })
    .fail(function(fail){
      //console.log(fail);
      window.parent.postMessage("hideLoading", location.origin);
      alert("Request error! Please try again.");
    });
  }

  function init() {
    $("#num1").text(clientNum1);
    $("#num2").text(clientNum2);
    $("#num3").text(clientNum3);
    $("#num4").text(clientNum4);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
    $("#num5").text(clientNum5);
    $("#num6").text(clientNum6);
    $("#num7").text(clientNum7);
    $("#num8").text(clientNum0);//2.4G BH
<% end if%>

    $("#num9").text(clientNum9);
    $("#num10").text(clientNum10);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
    $("#num11").text(clientNum11);
<% end if %>
    $("#num12").text(clientNum12);
    $("#num13").text(clientNum13);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
    $("#num14").text(clientNum14);
    $("#num15").text(clientNum15);
    $("#num16").text(clientNum8);//5G BH
<% end if %>
  }


  $(function(){
    <% if tcwebApi_get("wifiMacTab_Common","refreshFlag","h") <> "1" then %>
      refresh();
    <% else %>
      <% tcWebApi_constSet("wifiMacTab_Common","refreshFlag","0") %>
    <% end if %>

    init();
  });
  </SCRIPT>
</head>

<body>
  <!-- content -->
  <form name="wlanForm" id="wlanForm" action="/cgi-bin/true-page/status/status-wlan.asp" method="post">
    <input type="hidden" name="status_Flag" value="0">
    <div class="container-full container-resize-height">
      <div class="card-table">
        <div class="title-content">WLAN Status</div>
        <div class="title-description-content">This page shows the WLAN current status.</div>
      </div>
      <div class="card-table">
        <div class="table-header">WLAN 5GHz</div>
        <table style="width:100%">
          <tr class="table-header center">
            <!--
            <th class="p-1">WLAN 5GHz</th>
            <th class="p-1">SSID1</th>
            <th class="p-1">SSID2</th>
            <th class="p-1">SSID3</th>
            <th class="p-1">SSID4</th>
            -->
            <th class="p-1" style="width:10%">Index</th>
            <th class="p-1" style="width:30%">SSID Name</th>
            <th class="p-1" style="width:15%">Channel Number</th>
            <th class="p-1" style="width:10%">Encryption</th>
            <th class="p-1" style="width:20%">BSSID</th>
            <th class="p-1" style="width:10%">Enable</th>
            <th class="p-1" style="width:5%">Associated Clients</th>
          </tr>
<% If tcWebApi_get("WLan11ac_Common","APOn","h") = "1" Then %>
          <!--
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Mode</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Band</td>
            <td>5G</td>
            <td>5G</td>
            <td>5G</td>
            <td>5G</td>
          </tr>
          -->
          <SCRIPT language=javascript>
            var wlan11ac_i = 0;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
              for(wlan11ac_i = 0; wlan11ac_i < 8; wlan11ac_i++)
<% else %>
              for(wlan11ac_i = 0; wlan11ac_i < 5; wlan11ac_i++)
<% end if %>
              {
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") <> "0" then %>
                if(wlan11ac_i == 2)
                  continue;
                if(wlan11ac_i == 4)
                  continue;
                if(wlan11ac_i <= 1)
                {
                  if(wlan11ac_i % 2)
                    document.writeln('<tr class="table-content-second center">');
                  else
                    document.writeln('<tr class="table-content-fist center">');
                }
                else
                {
                  if(wlan11ac_i % 2)
                    document.writeln('<tr class="table-content-fist center">');
                  else
                    document.writeln('<tr class="table-content-second center">');
                }
<% else %>
                if(wlan11ac_i % 2)
                  document.writeln('<tr class="table-content-second center">');
                else
                  document.writeln('<tr class="table-content-fist center">');
<% end if %>
                document.writeln('<td class="table-header-content p-1">SSID'+ (wlan11ac_i + 1) +'</td>');
                document.writeln('<td>' + WlanacInfo[wlan11ac_i].ssid + '</td>');
                document.writeln('<td>' + WlanacInfo[wlan11ac_i].Channel + '</td>');
                document.writeln('<td>' + Authac[wlan11ac_i] + '</td>');
                document.writeln('<td>' + WlanacInfo[wlan11ac_i].BSSID + '</td>');
                document.writeln('<td>' + WlanacInfo[wlan11ac_i].enable + '</td>');
                document.writeln('<td style="width: 20%;"><a href="./status-wlan-active.asp?index='+(wlan11ac_i+9)+'"  id="num'+(wlan11ac_i+9)+'"></a></td>');
                document.writeln('</tr>');
              }
          </SCRIPT>
          <!--
          <tr class="table-content-second">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=9"  id="num9"></a></td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=10" id="num10"></a></td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td style="width: 20%;"><a href="./status-wlan-active.asp?index=11" id="num11"></a></td>');
            else
              document.writeln('<td style="width: 20%;"></td>');
            </SCRIPT>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=12" id="num12"></a></td>
          </tr>
          -->
<% end if %>
        </table>
      </div>
      <div class="card-table">
        <div class="table-header">WLAN 2.4GHz</div>
        <table style="width:100%">
          <tr class="table-header center">
            <th class="p-1" style="width:10%">Index</th>
            <th class="p-1" style="width:30%">SSID Name</th>
            <th class="p-1" style="width:15%">Channel Number</th>
            <th class="p-1" style="width:10%">Encryption</th>
            <th class="p-1" style="width:20%">BSSID</th>
            <th class="p-1" style="width:10%">Enable</th>
            <th class="p-1" style="width:5%">Associated Clients</th>
            <!--
            <th class="p-1">WLAN 2.4GHz</th>
            <th class="p-1">SSID1</th>
            <th class="p-1">SSID2</th>
            <th class="p-1">SSID3</th>
            <th class="p-1">SSID4</th>
            -->
          </tr>
<% If tcWebApi_get("WLan_Common","APOn","h") = "1" Then %>
          <!--
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Mode</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Band</td>
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
          </tr>
          -->
          <SCRIPT language=javascript>
            var wlan_i = 0;
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
            for(wlan_i = 0; wlan_i < 8; wlan_i++)
<% else %>
            for(wlan_i = 0; wlan_i < 4; wlan_i++)
<% end if %>
            {
              if(wlan_i % 2)
                document.writeln('<tr class="table-content-second center">');
              else
                document.writeln('<tr class="table-content-fist center">');
              document.writeln('<td class="table-header-content p-1">SSID'+ (wlan_i + 1) +'</td>');
              document.writeln('<td>' + WlanInfo[wlan_i].ssid + '</td>');
              document.writeln('<td>' + WlanInfo[wlan_i].Channel + '</td>');
              document.writeln('<td>' + Auth[wlan_i] + '</td>');
              document.writeln('<td>' + WlanInfo[wlan_i].BSSID + '</td>');
              document.writeln('<td>' + WlanInfo[wlan_i].enable + '</td>');
              document.writeln('<td><a href="./status-wlan-active.asp?index='+(wlan_i+1)+'" id="num'+(wlan_i+1)+'"></a></td>');
              document.writeln('</tr>');
            }
          </SCRIPT>
          <!--
          <tr class="table-content-second">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=1" id="num1"></a></td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=2" id="num2"></a></td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=3" id="num3"></a></td>
            <td style="width: 20%;"><a href="./status-wlan-active.asp?index=4" id="num4"></a></td>
          </tr>
          -->
<% end if %>
        </table>
      </div>
    </div>
  </form>
</body>

</html>
