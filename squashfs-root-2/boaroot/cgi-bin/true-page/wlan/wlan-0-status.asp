<%
if Request_Form("status_Flag") = "1" then 
  TCWebApi_commit("wifiMacTab")
  tcWebApi_constSet("wifiMacTab_Common","refreshFlag","1")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Status</title>
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
    var Info_WLan11ac = "<% tcwebApi_get("Info_WLan11ac","ALL","s") %>";
    var Info_WLan11ac_Array = Info_WLan11ac.split('|');

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
      var AC_Bssid1 = "<% tcWebApi_get("Info_WLan11ac","Bssid1","s") %>";
      var AC_Bssid2 = "<% tcWebApi_get("Info_WLan11ac","Bssid2","s") %>";
      var AC_Bssid3 = "<% tcWebApi_get("Info_WLan11ac","Bssid3","s") %>";
      var AC_Bssid4 = "<% tcWebApi_get("Info_WLan11ac","Bssid4","s") %>";
      var AC_Bssid5 = "<% tcWebApi_get("Info_WLan11ac","Bssid5","s") %>";
      var AC_Bssid6 = "<% tcWebApi_get("Info_WLan11ac","Bssid6","s") %>";
      var AC_Bssid7 = "<% tcWebApi_get("Info_WLan11ac","Bssid7","s") %>";
      var AC_Bssid8 = "<% tcWebApi_get("Info_WLan11ac","Bssid8","s") %>";

      var clientNum8 = "<% if tcWebApi_get("wifiMacTab_Common","NUM8","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM8","s") else asp_Write("0") end if %>";
      var clientNum9 = "<% if tcWebApi_get("wifiMacTab_Common","NUM9","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM9","s") else asp_Write("0") end if %>";
      var clientNum10 = "<% if tcWebApi_get("wifiMacTab_Common","NUM10","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM10","s") else asp_Write("0") end if %>";
<% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
      var clientNum11 = "<% if tcWebApi_get("wifiMacTab_Common","NUM11","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM11","s") else asp_Write("0") end if %>";
<% else %>
      var clientNum11 = 0;
<% end if %>
      var clientNum12 = "<% if tcWebApi_get("wifiMacTab_Common","NUM12","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM12","s") else asp_Write("0") end if %>";
      var clientNum13 = "<% if tcWebApi_get("wifiMacTab_Common","NUM13","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM13","s") else asp_Write("0") end if %>";
      var clientNum14 = "<% if tcWebApi_get("wifiMacTab_Common","NUM14","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM14","s") else asp_Write("0") end if %>";
      var clientNum15 = "<% if tcWebApi_get("wifiMacTab_Common","NUM15","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM15","s") else asp_Write("0") end if %>";
<% else %>
      var AC_Bssid1 = "/";
      var AC_Bssid2 = "/";
      var AC_Bssid3 = "/";
      var AC_Bssid4 = "/";
      var AC_Bssid5 = "/";
      var AC_Bssid6 = "/";
      var AC_Bssid7 = "/";
      var AC_Bssid8 = "/";

      var clientNum8 = 0;
      var clientNum9 = 0;
      var clientNum10 = 0;
      var clientNum11 = 0;
      var clientNum12 = 0;
      var clientNum13 = 0;
      var clientNum14 = 0;
      var clientNum15 = 0;
<% end if %>
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
    WlanacInfo[7] = new stWlan("7","<% tcWebApi_get("WLan11ac_Entry0","EnableSSID","s") %>","<% tcWebApi_get("WLan11ac_Entry0","SSID","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","WEPAuthType","s") %>","<% tcWebApi_get("WLan11ac_Entry0","AuthMode","s") %>","<% tcWebApi_get("WLan11ac_Entry0","EncrypType","s") %>","AESEncryption","PSKAuthentication",Info_WLan11ac_Array[7],"1","",AC_Bssid1);

    var wlanacEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";
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
      $("#num9").text(clientNum9);
      $("#num10").text(clientNum10);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      $("#num11").text(clientNum11);
<% end if %>
      $("#num12").text(clientNum12);
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      $("#num13").text(clientNum13);
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
  <form name="wlanForm" id="wlanForm" action="/cgi-bin/true-page/wlan/wlan-0-status.asp" method="post">
    <input type="hidden" name="status_Flag" value="0">
    <div class="container-full container-resize-height">
      <div class="card-table">
        <div class="title-content">WLAN 5GHz Status</div>
        <div class="title-description-content">This page shows the WLAN 5GHz current status.</div>
<% If tcWebApi_get("WLan11ac_Common","APOn","h") = "1" Then %>
        <table style="width:100%">
          <tr class="table-header">
            <th class="p-1">WLAN 5GHz</th>
            <th class="p-1">SSID1</th>
            <th class="p-1">SSID2</th>
            <th class="p-1">SSID3</th>
            <th class="p-1">SSID4</th>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Mode</td>
            <td style="width: 20%;">AP</td>
            <td style="width: 20%;">AP</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td style="width: 20%;">AP</td>');
            else
              document.writeln('<td style="width: 20%;"></td>');
            </SCRIPT>
            <td style="width: 20%;">AP</td>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Band</td>
            <td>5G</td>
            <td>5G</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td>5G</td>');
            else
              document.writeln('<td></td>');
            </SCRIPT>
            <td>5G</td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">SSID</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td style="width: 20%;">' + WlanacInfo[0].ssid + '</td>' + '<td style="width: 20%;">' + WlanacInfo[1].ssid + '</td>' +'<td style="width: 20%;">' + WlanacInfo[2].ssid + '</td>' +'<td style="width: 20%;">' + WlanacInfo[3].ssid + '</td>');
            else
              document.writeln('<td style="width: 20%;">' + WlanacInfo[0].ssid + '</td>' + '<td style="width: 20%;">' + WlanacInfo[1].ssid + '</td>' +'<td style="width: 20%;">' + '' + '</td>' +'<td style="width: 20%;">' + WlanacInfo[3].ssid + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Channel Number</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td>' + WlanacInfo[0].Channel + '</td>' + '<td>' + WlanacInfo[1].Channel + '</td>' +'<td>' + WlanacInfo[2].Channel + '</td>' +'<td>' + WlanacInfo[3].Channel + '</td>');
            else
              document.writeln('<td>' + WlanacInfo[0].Channel + '</td>' + '<td>' + WlanacInfo[1].Channel + '</td>' +'<td>' + '' + '</td>' +'<td>' + WlanacInfo[3].Channel + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Encryption</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td style="width: 20%;">' + Authac[0] + '</td>' + '<td style="width: 20%;">' + Authac[1] + '</td>' +'<td style="width: 20%;">' + Authac[2] + '</td>' +'<td style="width: 20%;">' + Authac[3] + '</td>');
            else
              document.writeln('<td style="width: 20%;">' + Authac[0] + '</td>' + '<td style="width: 20%;">' + Authac[1] + '</td>' +'<td style="width: 20%;">' + '' + '</td>' +'<td style="width: 20%;">' + Authac[3] + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">BSSID</td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td>' + WlanacInfo[0].BSSID + '</td>' + '<td>' + WlanacInfo[1].BSSID + '</td>' +'<td>' + WlanacInfo[2].BSSID + '</td>' +'<td>' + WlanacInfo[3].BSSID + '</td>');
            else
              document.writeln('<td>' + WlanacInfo[0].BSSID + '</td>' + '<td>' + WlanacInfo[1].BSSID + '</td>' +'<td>' + '' + '</td>' +'<td>' + WlanacInfo[3].BSSID + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=9"  id="num9"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=10" id="num10"></a></td>
            <SCRIPT language=javascript>
            if(curUserName == sptUserName)
              document.writeln('<td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=11" id="num11"></a></td>');
            else
              document.writeln('<td style="width: 20%;"></td>');
            </SCRIPT>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=12" id="num12"></a></td>
          </tr>
        </table>
<% end if %>
      </div>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <div class="card-table">
<% If tcWebApi_get("WLan11ac_Common","APOn","h") = "1" Then %>
        <table style="width:100%">
          <tr class="table-header">
            <th class="p-1">WLAN 5GHz</th>
            <th class="p-1">SSID5</th>
            <th class="p-1">SSID6</th>
            <th class="p-1">SSID7</th>
            <th class="p-1">SSID8</th>
          </tr>
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
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">SSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + WlanacInfo[4].ssid + '</td>' + '<td style="width: 20%;">' + WlanacInfo[5].ssid + '</td>' +'<td style="width: 20%;">' + WlanacInfo[6].ssid + '</td>' +'<td style="width: 20%;">' + WlanacInfo[7].ssid + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Channel Number</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanacInfo[4].Channel + '</td>' + '<td>' + WlanacInfo[5].Channel + '</td>' +'<td>' + WlanacInfo[6].Channel + '</td>' +'<td>' + WlanacInfo[7].Channel + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Encryption</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + Authac[4] + '</td>' + '<td style="width: 20%;">' + Authac[5] + '</td>' +'<td style="width: 20%;">' + Authac[6] + '</td>' +'<td style="width: 20%;">' + Authac[7] + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">BSSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanacInfo[4].BSSID + '</td>' + '<td>' + WlanacInfo[5].BSSID + '</td>' +'<td>' + WlanacInfo[6].BSSID + '</td>' +'<td>' + WlanacInfo[7].BSSID + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=13" id="num13"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=14" id="num14"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=15" id="num15"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=16" id="num16"></a></td>
          </tr>
        </table>
<% end if %>
      </div>
<% end if %>
    </div>
<!-- content -->
  </form>
</body>

</html>
