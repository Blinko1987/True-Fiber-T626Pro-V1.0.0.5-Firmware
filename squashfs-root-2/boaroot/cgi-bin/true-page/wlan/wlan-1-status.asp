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
  	var Info_WLan = "<% tcwebApi_get("Info_WLan","ALL","s") %>";
	var Info_WLan_Array = Info_WLan.split('|');

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
      var Bssid1 = "<% tcWebApi_get("Info_WLan","Bssid1","s") %>";
      var Bssid2 = "<% tcWebApi_get("Info_WLan","Bssid2","s") %>";
      var Bssid3 = "<% tcWebApi_get("Info_WLan","Bssid3","s") %>";
      var Bssid4 = "<% tcWebApi_get("Info_WLan","Bssid4","s") %>";
      var Bssid5 = "<% tcWebApi_get("Info_WLan","Bssid5","s") %>";
      var Bssid6 = "<% tcWebApi_get("Info_WLan","Bssid6","s") %>";
      var Bssid7 = "<% tcWebApi_get("Info_WLan","Bssid7","s") %>";
      var Bssid8 = "<% tcWebApi_get("Info_WLan","Bssid8","s") %>";

      var clientNum0 = "<% if tcWebApi_get("wifiMacTab_Common","NUM0","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM0","s") else asp_Write("0") end if %>";
      var clientNum1 = "<% if tcWebApi_get("wifiMacTab_Common","NUM1","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM1","s") else asp_Write("0") end if %>";
      var clientNum2 = "<% if tcWebApi_get("wifiMacTab_Common","NUM2","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM2","s") else asp_Write("0") end if %>";
      var clientNum3 = "<% if tcWebApi_get("wifiMacTab_Common","NUM3","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM3","s") else asp_Write("0") end if %>";
      var clientNum4 = "<% if tcWebApi_get("wifiMacTab_Common","NUM4","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM4","s") else asp_Write("0") end if %>";
      var clientNum5 = "<% if tcWebApi_get("wifiMacTab_Common","NUM5","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM5","s") else asp_Write("0") end if %>";
      var clientNum6 = "<% if tcWebApi_get("wifiMacTab_Common","NUM6","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM6","s") else asp_Write("0") end if %>";
      var clientNum7 = "<% if tcWebApi_get("wifiMacTab_Common","NUM7","h") <> "N/A" then tcWebApi_get("wifiMacTab_Common","NUM7","s") else asp_Write("0") end if %>";
    <% else %>
      var Bssid1 = "/";
      var Bssid2 = "/";
      var Bssid3 = "/";
      var Bssid4 = "/";
      var Bssid5 = "/";
      var Bssid6 = "/";
      var Bssid7 = "/";
      var Bssid8 = "/";

      var clientNum0 = 0;
      var clientNum1 = 0;
      var clientNum2 = 0;
      var clientNum3 = 0;
      var clientNum4 = 0;
      var clientNum5 = 0;
      var clientNum6 = 0;
      var clientNum7 = 0;
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

  var wlanEnbl = "<% TCWebApi_get("WLan_Common", "APOn", "s") %>";
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
        if(Auth[i].toUpperCase ()=="WPAPSK")
        {
          Auth[i]="WPA-PSK";
        }
        else if(Auth[i].toUpperCase ()=="WPA2PSK")
        {
          Auth[i]="WPA2-PSK";
        }
        else if(Auth[i].toUpperCase ()=="WPAPSKWPA2PSK")
        {
          Auth[i]="WPA-PSK/WPA2-PSK";
        }
      }
      if(WlanInfo[i].enable == "0")
      {
        WlanInfo[i].BSSID = "/";
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
  <form name="wlanForm" id="wlanForm" action="/cgi-bin/true-page/wlan/wlan-1-status.asp" method="post">
    <input type="hidden" name="status_Flag" value="0">
    <div class="container-full container-resize-height">
      <div class="card-table">
        <div class="title-content">WLAN 2.4GHz Status</div>
        <div class="title-description-content">This page shows the WLAN 2.4GHz current status.</div>
<% If tcWebApi_get("WLan_Common","APOn","h") = "1" Then %>
        <table style="width:100%">
          <tr class="table-header">
            <th class="p-1">WLAN 2.4GHz</th>
            <th class="p-1">SSID1</th>
            <th class="p-1">SSID2</th>
            <th class="p-1">SSID3</th>
            <th class="p-1">SSID4</th>
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
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">SSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + WlanInfo[0].ssid + '</td>' + '<td style="width: 20%;">' + WlanInfo[1].ssid + '</td>' +'<td style="width: 20%;">' + WlanInfo[2].ssid + '</td>' +'<td style="width: 20%;">' + WlanInfo[3].ssid + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Channel Number</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanInfo[0].Channel + '</td>' + '<td>' + WlanInfo[1].Channel + '</td>' +'<td>' + WlanInfo[2].Channel + '</td>' +'<td>' + WlanInfo[3].Channel + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Encryption</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + Auth[0] + '</td>' + '<td style="width: 20%;">' + Auth[1] + '</td>' +'<td style="width: 20%;">' + Auth[2] + '</td>' +'<td style="width: 20%;">' + Auth[3] + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">BSSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanInfo[0].BSSID + '</td>' + '<td>' + WlanInfo[1].BSSID + '</td>' +'<td>' + WlanInfo[2].BSSID + '</td>' +'<td>' + WlanInfo[3].BSSID + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=1" id="num1"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=2" id="num2"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=3" id="num3"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=4" id="num4"></a></td>
          </tr>
        </table>
<% end if %>
      </div>
<% if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
      <div class="card-table">
<% If tcWebApi_get("WLan_Common","APOn","h") = "1" Then %>
        <table style="width:100%">
          <tr class="table-header">
            <th class="p-1">WLAN 2.4GHz</th>
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
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
            <td>2.4G</td>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">SSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + WlanInfo[4].ssid + '</td>' + '<td style="width: 20%;">' + WlanInfo[5].ssid + '</td>' +'<td style="width: 20%;">' + WlanInfo[6].ssid + '</td>' +'<td style="width: 20%;">' + WlanInfo[7].ssid + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">Channel Number</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanInfo[4].Channel + '</td>' + '<td>' + WlanInfo[5].Channel + '</td>' +'<td>' + WlanInfo[6].Channel + '</td>' +'<td>' + WlanInfo[7].Channel + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Encryption</td>
            <SCRIPT language=javascript>
              document.writeln('<td style="width: 20%;">' + Auth[4] + '</td>' + '<td style="width: 20%;">' + Auth[5] + '</td>' +'<td style="width: 20%;">' + Auth[6] + '</td>' +'<td style="width: 20%;">' + Auth[7] + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-second">
            <td class="table-header-content p-1">BSSID</td>
            <SCRIPT language=javascript>
              document.writeln('<td>' + WlanInfo[4].BSSID + '</td>' + '<td>' + WlanInfo[5].BSSID + '</td>' +'<td>' + WlanInfo[6].BSSID + '</td>' +'<td>' + WlanInfo[7].BSSID + '</td>');
            </SCRIPT>
          </tr>
          <tr class="table-content-fist">
            <td style="width: 20%;" class="table-header-content p-1">Associated Clients</td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=5" id="num5"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=6" id="num6"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=7" id="num7"></a></td>
            <td style="width: 20%;"><a href="../status/status-wlan-active.asp?index=8" id="num8"></a></td>
          </tr>
        </table>
<% end if %>
      </div>
<% end if %>
    </div>
  </form>
<!-- content -->

</body>

</html>
