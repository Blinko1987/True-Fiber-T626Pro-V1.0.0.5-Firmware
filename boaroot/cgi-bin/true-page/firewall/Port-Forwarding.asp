<%
if Request_Form("VirServer_Enable_Flag") = "1" then
    TCWebApi_set("VirServer_Entry_Entry","Active","hEnableVirServer_Flag")
    TCWebApi_save()
end if
%>

<%
if Request_Form("VirServer_Flag") = "1" then
  TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","virServ_id","VirServCurIndex")
  TCWebApi_commit("WebCurSet_Entry")
  TCWebApi_set("VirServer_Entry","IFName","PortMappingInterface")
  TCWebApi_unset("VirServer_Entry_Entry")
  TCWebApi_commit("VirServer_Entry_Entry")
  TCWebApi_set("VirServer_Entry_Entry","Active","hEnableVirServer_Flag")
  TCWebApi_set("VirServer_Entry_Entry","Protocal","PortMappingProtocol")
  TCWebApi_set("VirServer_Entry_Entry","SrcIP","RemoteHost")
  TCWebApi_set("VirServer_Entry_Entry","STARTPORT","ExternalPort")
  TCWebApi_set("VirServer_Entry_Entry","ENDPORT","ExternalPortEnd")
  TCWebApi_set("VirServer_Entry_Entry","INTSTARTPORT","InternalPort")
  TCWebApi_set("VirServer_Entry_Entry","INTENDPORT","InternalPortEnd")
  TCWebApi_set("VirServer_Entry_Entry","LOCALIP","InternalClient")
  TCWebApi_set("VirServer_Entry_Entry","MapName","PortMappingDescription")	
  TCWebApi_commit("VirServer_Entry_Entry")
  tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "2" then
  TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")	
  TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
  if Request_Form("hVirServEntry0") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry0")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry1") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry1")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry2") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry2")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry3") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry3")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry4") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry4")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry5") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry5")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry6") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry6")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  if Request_Form("hVirServEntry7") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry7")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if	
  if Request_Form("hVirServEntry8") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry8")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if	
  if Request_Form("hVirServEntry9") <> "99" then
    TCWebApi_set("WebCurSet_Entry","virServ_id","hVirServEntry9")
      TCWebApi_unset("VirServer_Entry_Entry")
      TCWebApi_commit("VirServer_Entry_Entry")
  end if
  tcWebApi_save()
elseif Request_Form("VirServer_Flag") = "3" then
  TCWebApi_set("WebCurSet_Entry","nat_pvc","VirServEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","nat_ifidx","VirServEntryCurIndex")
  TCWebApi_set("WebCurSet_Entry","webacl_ifidx","VirServEntryCurIndex")
  TCWebApi_commit("WebCurSet_Entry")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Port Forwarding</title>
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

  <script>
    var enable_state = false;
    var VirServEntryIndex = 0;
    var VirSerIdleEntryIndex = 0;
    var VirSerIdleFlag = 0;
    var WanInfo = new Array();
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryValue = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
    var vEntryIndex = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Actives","s") %>";
    var vActive = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
    var vNATENABLE = vArrayStr.split(',');
    
    //sort
    vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
    vEntryValue = SortUtil.SortMyArray( vEntryValue );
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

    var PortMapping = new Array();
    var indexPortMapping = 0;
    var MAX_VIRSERVER_NUM = 10;

    nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatActive = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatProtocal = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatSrcIP = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatSTARTPORT = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatENDPORT = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatLOCALIP = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatMapName = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatINPORT = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","VirServerCycleValue","s") %>";
    var vNatINENDPORT = vArrayStr.split(',');
    for (j = 0; j < MAX_VIRSERVER_NUM; j++)
    {
      if(vNatActive[j] == "Yes" || vNatActive[j] == "No")
      {
        PortMapping[indexPortMapping] = new stPortMap(j,vNatActive[j],vNatProtocal[j],vNatSrcIP[j],vNatSTARTPORT[j],vNatENDPORT[j],vNatINPORT[j],vNatLOCALIP[j],vNatMapName[j],vNatINENDPORT[j]);
        indexPortMapping++;
      }
      else if(0 == VirSerIdleFlag){
        VirSerIdleEntryIndex = j;
        VirSerIdleFlag = 1;
      }
    }
    
    var TOTAL_APP = 14;
    var FIRST_APP = "Select...";
    var v = new Array(TOTAL_APP);
    v[0] = new cV("Domain Name Server",1);
    v[0].e[0] = new iVe("53", "53", "2", "53", "53");
    v[1] = new cV("FTP Server",1);
    v[1].e[0] = new iVe("21", "21", "1", "21", "21");
    v[2] = new cV("IPSEC",1);
    v[2].e[0] = new iVe("500", "500", "2", "500", "500");
    v[3] = new cV("Mail POP3",1);
    v[3].e[0] = new iVe("110", "110", "1", "110", "110");
    v[4] = new cV("Mail SMTP",1);
    v[4].e[0] = new iVe("25", "25", "1", "25", "25");
    v[5] = new cV("PPTP",1);
    v[5].e[0] = new iVe("1723", "1723", "1", "1723", "1723");
    v[6] = new cV("Real Player 8 Plus",1);
    v[6].e[0] = new iVe("7070", "7070", "2", "7070", "7070");
    v[7] = new cV("Secure Shell Server",1);
    v[7].e[0] = new iVe("22", "22", "1", "22", "22");
    v[8] = new cV("Secure Web Server HTTPS",1);
    v[8].e[0] = new iVe("443", "443", "1", "443", "443");
    v[9] = new cV("SNMP",1);
    v[9].e[0] = new iVe("161", "161", "2", "161", "161");
    v[10] = new cV("SNMP Trap",1);
    v[10].e[0] = new iVe("162", "162", "2", "162", "162");
    v[11] = new cV("Telnet Server",1);
    v[11].e[0] = new iVe("23", "23", "1", "23", "23");
    v[12] = new cV("TFTP",1);
    v[12].e[0] = new iVe("69", "69", "2", "69", "69");
    v[13] = new cV("Web Server HTTP",1);
    v[13].e[0] = new iVe("80", "80", "1", "80", "80");

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

    function stPortMap(domain,ProtMapEnabled,Protocol,RemoteHost,ExPort,ExEndPort,InPort,InClient,Description,InEndPort)
    {
      domain = ""+domain;	
      this.domain = domain;
      this.key = this.domain;
      this.ProtMapEnabled = ProtMapEnabled;
      this.Protocol = Protocol;
      this.RemoteHost = RemoteHost;
      this.ExPort = ExPort;
      this.InPort = InPort;
      this.InClient = InClient;
      this.Description = Description;
      if(Protocol == "N/A"){
        this.Protocol = "";
      }else{
        this.Protocol = Protocol;
      }
      if(RemoteHost == "N/A"){
        this.RemoteHost = "";
      }else{
        this.RemoteHost = RemoteHost;
      }
      if(ExPort == "N/A"){
        this.ExPort = "";
      }else{
        this.ExPort = ExPort;
      }
      if(ExEndPort == "N/A"){
        this.ExEndPort = "";
      }else{
        this.ExEndPort = ExEndPort;
      }
      if(InPort == "N/A"){
        this.InPort = "";
      }else{
        this.InPort = InPort;
      }
      if(InEndPort == "N/A"){
        this.InEndPort = "";
      }else{
        this.InEndPort = InEndPort;
      }
      if(InClient == "N/A"){
        this.InClient = "";
      }else{
        this.InClient = InClient;
      }
      if(Description == "N/A"){
        this.Description = "";
      }else{
        this.Description = Description;
      }
      var index = domain.lastIndexOf('PortMapping');
      this.interface = domain.substr(0,index - 1);
      this.interface = domain;
      this.NATEnabled = '';
      this.Enable = '';
    }

    function cV(name, entryNum)
    {
      this.name = name;
      this.eNum = entryNum;
      this.e = new Array(5);
    }
    function iVe(eStart, eEnd, proto, iStart, iEnd)
    {
      this.eStart = eStart;
      this.eEnd = eEnd;
      this.proto = proto;
      this.iStart = iStart;
      this.iEnd = iEnd;
    }
    var remoteActive = "<% TCWebApi_get("Webacl_Entry","Active","s") %>";
    var remotePort = "<% TCWebApi_get("Webacl_Entry","webaclport","s") %>";
    //console.log("remoteActive: " + remoteActive + "; remotePort: " + remotePort);
    
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Port Forwarding</div>
    <div class="title-description-text">Entries in this table allow you to automatically redirect common network services to a specific machine behind the NAT firewall. These settings are only necessary if you wish to host some sort of server like a web server or mail server on the private local network behind your Gateway's NAT firewall.</div>
    <form id="PortMappingForm" name="PortMappingForm" method="post" action="/cgi-bin/true-page/firewall/Port-Forwarding.asp">
      <input type="hidden" name="VirServer_Flag" value="0">
      <input type="hidden" name="VirServEntryCurIndex" value="0">
      <input type="hidden" name="VirServCurIndex" value="0">
      <input type="hidden" name="hVirServEntry0" value="99">
      <input type="hidden" name="hVirServEntry1" value="99">
      <input type="hidden" name="hVirServEntry2" value="99">
      <input type="hidden" name="hVirServEntry3" value="99">
      <input type="hidden" name="hVirServEntry4" value="99">
      <input type="hidden" name="hVirServEntry5" value="99">
      <input type="hidden" name="hVirServEntry6" value="99">
      <input type="hidden" name="hVirServEntry7" value="99">
      <input type="hidden" name="hVirServEntry8" value="99">
      <input type="hidden" name="hVirServEntry9" value="99">
      <input type="hidden" name="isVirServerSupported" value="<%if tcWebApi_get("Info_Ether","isVirServerSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if%>">

      <input type="hidden" name="VirServer_Enable_Flag" value="0">
      <input type="hidden" name="hEnableVirServer_Flag" value="Yes">
      <!--目前不支持disable，先隐藏
      <input type="hidden" name="hEnableVirServer_Flag" value="<% tcWebApi_get("VirServer_Entry_Entry","Active","s") %>">
      -->

      <!--目前不支持disable，先隐藏
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Port Forwarding:</div>
        </div>
        <div class="col-3">
          <input type="radio" value="Yes" name="EnableVirServer_Flag" id="EnableVirServer_Flag" onchange="VirServerClick()"
            <%if tcWebApi_get("VirServer_Entry_Entry","Active","h") = "Yes" then asp_Write("checked") end if%>>
          <label class="input-radio">Enable</label>
          <input type="radio" value="No" name="EnableVirServer_Flag" id="EnableVirServer_Flag" onchange="VirServerClick()"
            <%if tcWebApi_get("VirServer_Entry_Entry","Active","h") = "No" then asp_Write("checked") end if%>>
          <label class="input-radio">Disable</label>
        </div>
      </div>
      <hr />
      -->
      <div id="port_content">
        <div class="row p-1">
          <div class="col-6">
            <label class="title-text-left">Interface:</label>
          </div>
          <div class="col-6">
            <select id="PortMappingInterface" class="form-control input-select" name="PortMappingInterface" maxlength="15" onChange="changeWanSelected();">
            </select>
          </div>
        </div>
        <div class="row p-1 manual-mode">
          <div class="col-6 offset-6">
            <input type="radio" name="radiosrv" onchange="radioClick()">
            <label class="input-radio">Custom Service</label>
            <input type="radio" name="radiosrv" onchange="radioClick()" checked>
            <label class="input-radio">Select a Service</label>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Service:</div>
          </div>
          <div class="col-6">
            <select id="constsrvName" class="form-control input-select" name="constsrvName"
              onchange="appSelect(this.value)">
              <option value="FIRST_APP" selected>Select...</option>
              <option value="Domain Name Server">Domain Name Server</option>
              <option value="FTP Server">FTP Server</option>
              <option value="IPSEC">IPSEC</option>
              <option value="Mail POP3">Mail POP3</option>
              <option value="Mail SMTP">Mail SMTP</option>
              <option value="PPTP">PPTP</option>
              <option value="Real Player 8 Plus">Real Player 8 Plus</option>
              <option value="Secure Shell Server">Secure Shell Server</option>
              <option value="Secure Web Server HTTPS">Secure Web Server HTTPS</option>
              <option value="SNMP">SNMP</option>
              <option value="Telnet Server">Telnet Server</option>
              <option value="TFTP">TFTP</option>
              <option value="Web Server HTTP">Web Server HTTP</option>
            </select>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Protocol:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name='PortMappingProtocol'>
              <option value="TCP/UDP">TCP/UDP</option>
              <option value="TCP">TCP</option>
              <option value="UDP">UDP</option>
              <option value="ICMP">ICMP</option>
            </select>
          </div>
        </div>
        <div class="row p-1" style="display: none;">
          <div class="col-6">
            <div class="title-text-left">Server IP:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-select" name="RemoteHost" maxLength="15"  size="20"/>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Remote Port:</div>
          </div>
          <div class="col-2">
            <input class="input-textfield" type="text" name="ExternalPort" maxLength="11" size="20" />
          </div>
          <span>-</span>
          <div class="col-2">
            <input class="input-textfield" type="text" name="ExternalPortEnd" maxLength="15" size="20" />
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Local Port:</div>
          </div>
          <div class="col-2">
            <input class="input-textfield" type="text" name="InternalPort" maxLength="11" size="20" />
          </div>
          <span>-</span>
          <div class="col-2">
            <input class="input-textfield" type="text" name="InternalPortEnd" maxLength="15" size="20" />
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Local IP:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-select" name="InternalClient" maxLength="15"  size="20"/>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Comment:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-select" id="PortMappingDescription" name="PortMappingDescription" maxLength="31"  size="20"/>
          </div>
        </div>
        <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onClick="btnSubmit()">Add</button>
        </div>
        <div id="portMappingInfo" class="card-table-content">
          <table style="width:100%">
            <tr class="table-header left">
              <th class="p-1" colspan="9">Current Port Forwarding Table</th>
            </tr>
            <tr class="table-content-fist center">
              <td class="p-1">Select</td>
              <td>Comment Local</td>
              <td>Protocol</td>
              <!--<td>IP Address</td>-->
              <td>Remote Start Port</td>
              <td>Remote End Port</td>
              <td>Local Start Port</td>
              <td>Local End Port</td>
              <td>Local IP</td>
            </tr>
          </table>
        </div>

        <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onClick="delPortMapping(false);">Delete Selected</button>
          <button type="button" class="btn-dashboard" onClick="delPortMapping(true);">Delete All</button>
        </div>
      </div>
    </form>
  </div>
  <!-- content -->

  <script>
    //console.log(PortMapping);
    function ShowPortMapping() {
      VirServEntryIndex = 0;
      var tableHtml = "";
      for (i = 0; i < PortMapping.length; i++) {
        var rowCss=VirServEntryIndex%2==0?"table-content-fist center":"table-content-second center";
        tableHtml += '<tr class="' + rowCss + '" style="height: 30px;">';
        tableHtml += '<td><input type="checkbox" name="rml" value="'+ PortMapping[i].domain + '"></td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["Description"],10) + '</td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["Protocol"],10) + '</td>';
        /*tableHtml += '<td>' + getDisplayText(PortMapping[i]["RemoteHost"],8) + '</td>';*/
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["ExPort"],5) + '</td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["ExEndPort"],5) + '</td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["InPort"],5) + '</td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["InEndPort"],5) + '</td>';
        tableHtml += '<td>' + getDisplayText(PortMapping[i]["InClient"],10) + '</td>';
        tableHtml += '</tr>';
        VirServEntryIndex++;
      }

      if( tableHtml != "" ) {
        $("#portMappingInfo table").append(tableHtml);
      }
      window.parent.postMessage("LoadComplete", location.origin);
    }

  function initInterface() {
    var natidx = <% tcWebApi_get("WebCurSet_Entry","nat_ifidx","s") %>;
    for (i = 0; i < nEntryNum; i++)
    {
      if((vEntryName[i].indexOf('_TR069_')<0 || vEntryName[i].indexOf('_INTERNET_')>-1) && (vEntryName[i].indexOf('_R_')>-1))
      {
        if(vEntryIndex[i] == natidx)
        {
          $("#PortMappingInterface").append('<option value=' + vEntryValue[i] + ' id=portmp_' + i + ' selected>' + vEntryValue[i] + '</option>');
        }
        else
        {
          $("#PortMappingInterface").append('<option value=' + vEntryValue[i] + ' id=portmp_' + i + '>' + vEntryValue[i] + '</option>');
        }
      }
    }
  }

    function radioClick()
    {
      with(document.PortMappingForm) {
        if (radiosrv[0].checked == true)
        {
          constsrvName.disabled = true;
        }
        else
        {
          constsrvName.disabled = false;
        }
      }
    }
    function VirServerClick()
    {
      var EnableVirServer = getElById("EnableVirServer_Flag");
      if ((EnableVirServer[1].checked) && enable_state) {
        var disableTips = simpleAlert({
          "content": "Are you sure to disable the port filter?",
          "buttons":{
            "OK":function () {
              disableTips.close();
              setTimeout(function () {
                $("input[name='hEnableVirServer_Flag']").val("No");
                $("#PortMappingForm").hide();
                $("input[name='VirServer_Enable_Flag']").val("1");
                showLoading();
                document.PortMappingForm.submit();
              },200);
            },
            "Cancel":function () {
              disableTips.close();
              EnableVirServer[0].checked = true;
              EnableVirServer[1].checked = false;
              return;
            }
          }
        });
      }
      else if((EnableVirServer[0].checked) && !enable_state){
        var enableTips = simpleAlert({
          "content": "Are you sure to enable the port filter?",
          "buttons":{
            "OK":function () {
              enableTips.close();
              setTimeout(function () {
                $("input[name='hEnableVirServer_Flag']").val("Yes");
                $("#PortMappingForm").show();
                $("input[name='VirServer_Enable_Flag']").val("1");
                showLoading();
                document.PortMappingForm.submit();
              },200);
            },
            "Cancel":function () {
              enableTips.close();
              EnableVirServer[0].checked = false;
              EnableVirServer[1].checked = true;
              return;
            }
          }
        });
      }
    }

    function appSelect(sName)
    {
      with (getElById('PortMappingForm'))
      {
        if (sName == FIRST_APP)
        {
          return;
        }
        for(i = 0; i < TOTAL_APP; i++)
        {
          if(v[i].name == sName)
          {
            switch (v[i].e[0].proto)
            {
            case '0':
              setSelect('PortMappingProtocol','TCP/UDP');
              break;
            case '1':
              setSelect('PortMappingProtocol','TCP');
              break;
            case '2':
              setSelect('PortMappingProtocol','UDP');
              break;
            }
            RemoteHost.value = "";
            ExternalPort.value = v[i].e[0].eStart;
            InternalPort.value = v[i].e[0].iStart;
            PortMappingDescription.value = trimspace(sName);
          }
        }
      }
    }

    function trimspace(str)
    {
      var strTemp = new String(str);
      while (-1 != strTemp.search(" "))
      {
        strTemp = strTemp.replace(" ", "");
      }
      return strTemp;
    }

    function changeWanSelected() {
      document.PortMappingForm.VirServer_Flag.value = "3";
      document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
      document.PortMappingForm.submit();
    }

    function btnSubmit()
    {
      if(CheckPortMapping() == false)
        return;

      document.PortMappingForm.VirServCurIndex.value = VirSerIdleEntryIndex;
      document.PortMappingForm.VirServer_Flag.value = "1";
      document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
      document.PortMappingForm.submit();
      showLoading();
    }

    function CheckPortMapping()
    {
      var lanIP="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>";
      var netmask="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>";
      if(VirServEntryIndex >= 10)
      {
        alert('Maximum 10 rules on each interface.')
        return false;
      }
      if(PortMapping.length >= 32)
      {
        alert('Maximum 32 rules in all.')
        return false;
      }
      if (WanInfo.length == 0)
      {
        alert('No WAN interface for PortMapping.');
        return false;
      }
      with (getElById('PortMappingForm') )
      {
        if (RemoteHost.value != "")
        {
          if (isValidIpAddress(RemoteHost.value) == false)
          {
            alert('Invalid source IP address.');
            return false;
          }
          else if ((isLoopIpAddress(getValue('RemoteHost'))==true)||(isBroadcastIpAddress(getValue('RemoteHost'))==true)
          ||(isNtwkSgmtIpAddress(getValue('RemoteHost'))==true))
          {
            alert('Invalid source IP address.');
            return false;
          }
        }
        if (ExternalPort.value == "")
        {
          alert('Remote start port must not be null.' );
          return false;
        }
        if (InternalPort.value == "")
        {
          alert('Local start port must not be null.' );
          return false;
        }
        if (InternalClient.value == "")
        {
          alert('Local IP must not be null.' );
          return false;
        }
        if (PortMappingDescription.value == "")
        {
          alert('Comment must not be null.' );
          return false;
        }
        if (isAbcIpAddress(InternalClient.value) == false ||(isBroadcastIpAddress(getValue('InternalClient'))==true)
        ||(isNtwkSgmtIpAddress(getValue('InternalClient'))==true))
        {
          alert('Invalid local IP address.');
          return false;
        }
        if (lanIP!=""&&netmask!="")
        {
          if (isEqualSegment(InternalClient.value,lanIP,netmask))
          {
            alert('Invalid local IP address.' );
            return false;
          }
        }
        if (isValidPort(ExternalPort.value) == false )
        {
          alert('Invalid remote start port. must be 1-65535.' );
          return false;
        }
        if (ExternalPortEnd.value != "" && isValidPort(ExternalPortEnd.value) == false )
        {
          alert('Invalid remote end port. must be 1-65535.' );
          return false;
        }
        if(parseInt(ExternalPortEnd.value) < parseInt(ExternalPort.value)){
          alert('Remote end port should not less than remote start port.' );
          return false;
        }

        if (isValidPort(InternalPort.value) == false )
        {
          alert('Invalid local start port. must be 1-65535.' );
          return false;
        }
        if (InternalPortEnd.value != "" && isValidPort(InternalPortEnd.value) == false )
        {
          alert('Invalid local end port. must be 1-65535.' );
          return false;
        }
        if(parseInt(InternalPortEnd.value) < parseInt(InternalPort.value)){
          alert('Local end port should not less than local start port.' );
          return false;
        }

        if (isValidNameWSpace(PortMappingDescription.value) == false)
        {
          alert('Invalid comment name.');
          return false;
        }
        if (PortMappingDescription.value.charAt(0) == ' ' )
        {
          alert('Invalid comment name. comment Name must not be start with space or tab characters.');
          return false;
        }
        
        //ExternalPort port(WAN Access端口)使用，则提示错误
        if(remoteActive == "Yes"){
          if(remotePort == ExternalPort.value){
            var msg = "Sorry, port " + remotePort + " is used by remote web access";
            alert(msg);
            return false;
          }
        }

        for (i = 0; i < PortMapping.length; i++)
        {
          if (PortMapping[i].Description == PortMappingDescription.value)
          {
            alert('The port mapping name has been used.');
            return false;
          }
          
          //检测remote port是否和现有规则的remote port冲突，不允许相同协议时同样的remote port对应多个local port
          var cp = PortMappingProtocol.value;
          var ep = PortMapping[i].Protocol;
          //console.log("current protocol = " + cp + "; exsit protocol = " + ep);
          if( ((cp == "TCP") && ((ep == "TCP") || (ep == "TCP/UDP"))) ||
              ((cp == "UDP") && ((ep == "UDP") || (ep == "TCP/UDP"))) ||
              ((cp == "TCP/UDP") && ((ep == "TCP") || (ep == "UDP") || (ep == "TCP/UDP"))) ||
              ((cp == "ICMP") && (ep == "ICMP"))
          ){
            if((parseInt(ExternalPort.value) == parseInt(PortMapping[i].ExPort))){
              alert('Sorry, remote port range conflict with existing rules.');
              return false;
            }
            else if(parseInt(ExternalPort.value) < parseInt(PortMapping[i].ExPort)){
              if((parseInt(ExternalPortEnd.value) != "") && (parseInt(ExternalPortEnd.value) >= parseInt(PortMapping[i].ExPort))){
                alert('Sorry, remote port range conflict with existing rules.');
                return false;
              }
            }
            else if( (PortMapping[i].ExEndPort != "") && (parseInt(ExternalPort.value) <= parseInt(PortMapping[i].ExEndPort)) ){
              alert('Sorry, remote port range conflict with existing rules.');
              return false;
            }
          }

          if (PortMapping[i].Protocol == PortMappingProtocol.value
            && PortMapping[i].ExPort == ExternalPort.value
            && PortMapping[i].InPort == InternalPort.value
            && PortMapping[i].ExEndPort == ExternalPortEnd.value
            && PortMapping[i].InEndPort == InternalPortEnd.value
            && PortMapping[i].InClient == InternalClient.value)
          {
            alert('The rule has been add.');
            return false;
          }
        }
      }
      return true;
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

    function delPortMapping(allTag)
    {
      var chkboxlist = $('input[type=checkbox][name=rml]');
      var checkbox_length = chkboxlist.length;
      if(checkbox_length > 0){
        if(allTag == true){//delete all
          selectChkBox(true);
          setTimeout("delAll()",100);
        }else{//delete checked
          var i, count = 0;
          for(i = 0; i < chkboxlist.length; i++){
            if(chkboxlist[i].checked){
              count++;
            }
          }
          if( !count ){
            var Tips = simpleAlert({
              "content": "Please select at least one item.",
              "buttons":{
                "OK":function () {
                  Tips.close();
                }
              }
            });
            return false;
          }else{
            delChecked(count);
          }
        }
      }else{
        var Tips = simpleAlert({
          "content": "Current Port Forwarding Table is empty!",
          "buttons":{
            "OK":function () {
              Tips.close();
            }
          }
        });
      }
    }

    function selectChkBox(isChecked)
    {
      var chkboxlist = $('input[type=checkbox][name=rml]');
      for(i = 0; i < chkboxlist.length; i++){
        $("input[name=rml]").prop("checked",isChecked);
      }
    }

    function delAll() {
      var deleteTips = simpleAlert({
        "content": "Are you sure to delete all items?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            setTimeout(function () {
              var i = 0;
              var chkboxlist = $('input[type=checkbox][name=rml]');
              for (i = 0; i < chkboxlist.length; i++)
              {
                $("input[name='hVirServEntry" + i +"']").val(chkboxlist[i].value);
              }
              document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
              document.PortMappingForm.VirServer_Flag.value = "2";
              document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
              document.PortMappingForm.submit();
              showLoading();
            },500);
          },
          "Cancel":function () {
            deleteTips.close();
            selectChkBox(false);
            return false;
          }
        }
      });
    }

    function delChecked(count) {
      var deleteTips = simpleAlert({
        "content": "Are you sure to delete checked items?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            setTimeout(function () {
              var i = 0;
              var chkboxlist = $('input[type=checkbox][name=rml]');
              for (i = 0; i < chkboxlist.length; i++)
              {
                if(chkboxlist[i].checked){
                  $("input[name='hVirServEntry" + i +"']").val(chkboxlist[i].value);
                }
              }
              document.PortMappingForm.VirServCurIndex.value = VirServEntryIndex;
              document.PortMappingForm.VirServer_Flag.value = "2";
              document.PortMappingForm.VirServEntryCurIndex.value = getEntryIndex('PortMappingInterface');
              document.PortMappingForm.submit();
              showLoading();
            },500);
          },
          "Cancel":function () {
            deleteTips.close();
            return false;
          }
        }
      });
    }

    $(document).ready(function () {

      /*
      var EnableVirServer = getElById("EnableVirServer_Flag");
      if((EnableVirServer[0].checked == true)){
        $("#port_content").show();
        $("input[name='hEnableVirServer_Flag']").val("Yes");
        enable_state = true;
      }else{
        $("#port_content").hide();
        $("input[name='hEnableVirServer_Flag']").val("No");
        enable_state = false;
      }
      */
      if (document.PortMappingForm.isVirServerSupported.value == 1) {
        ShowPortMapping();
      }

      // init interface select option
      initInterface();
    });
  </script>
</body>

</html>