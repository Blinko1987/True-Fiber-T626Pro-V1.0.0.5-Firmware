<%
if Request_Form("QoS_Flag") = "1" then
  if Request_Form("QoS_Cls") = "0" then
    TCWebApi_set("QoS_Entry0","Active","App_Flag")
    TCWebApi_set("QoS_Entry0","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry0","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry0","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry0","Type1","ClassType1")
    TCWebApi_set("QoS_Entry0","Max1","Max1")
    TCWebApi_set("QoS_Entry0","Min1","Min1")
    TCWebApi_set("QoS_Entry0","Type2","ClassType2")
    TCWebApi_set("QoS_Entry0","Max2","Max2")
    TCWebApi_set("QoS_Entry0","Min2","Min2")
    TCWebApi_set("QoS_Entry0","Type3","ClassType3")
    TCWebApi_set("QoS_Entry0","Max3","Max3")
    TCWebApi_set("QoS_Entry0","Min3","Min3")
    TCWebApi_set("QoS_Entry0", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry0")
    TCWebApi_save()
  elseif Request_Form("QoS_Cls") = "1" then
    TCWebApi_set("QoS_Entry1","Active","App_Flag")
    TCWebApi_set("QoS_Entry1","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry1","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry1","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry1","Type1","ClassType1")
    TCWebApi_set("QoS_Entry1","Max1","Max1")
    TCWebApi_set("QoS_Entry1","Min1","Min1")
    TCWebApi_set("QoS_Entry1","Type2","ClassType2")
    TCWebApi_set("QoS_Entry1","Max2","Max2")
    TCWebApi_set("QoS_Entry1","Min2","Min2")
    TCWebApi_set("QoS_Entry1","Type3","ClassType3")
    TCWebApi_set("QoS_Entry1","Max3","Max3")
    TCWebApi_set("QoS_Entry1","Min3","Min3")
    TCWebApi_set("QoS_Entry1", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry1")
    TCWebApi_save()
  elseif Request_Form("QoS_Cls") = "2" then
    TCWebApi_set("QoS_Entry2","Active","App_Flag")
    TCWebApi_set("QoS_Entry2","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry2","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry2","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry2","Type1","ClassType1")
    TCWebApi_set("QoS_Entry2","Max1","Max1")
    TCWebApi_set("QoS_Entry2","Min1","Min1")
    TCWebApi_set("QoS_Entry2","Type2","ClassType2")
    TCWebApi_set("QoS_Entry2","Max2","Max2")
    TCWebApi_set("QoS_Entry2","Min2","Min2")
    TCWebApi_set("QoS_Entry2","Type3","ClassType3")
    TCWebApi_set("QoS_Entry2","Max3","Max3")
    TCWebApi_set("QoS_Entry2","Min3","Min3")
    TCWebApi_set("QoS_Entry2", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry2")
    TCWebApi_save()
  elseif Request_Form("QoS_Cls") = "3" then
    TCWebApi_set("QoS_Entry3","Active","App_Flag")
    TCWebApi_set("QoS_Entry3","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry3","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry3","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry3","Type1","ClassType1")
    TCWebApi_set("QoS_Entry3","Max1","Max1")
    TCWebApi_set("QoS_Entry3","Min1","Min1")
    TCWebApi_set("QoS_Entry3","Type2","ClassType2")
    TCWebApi_set("QoS_Entry3","Max2","Max2")
    TCWebApi_set("QoS_Entry3","Min2","Min2")
    TCWebApi_set("QoS_Entry3","Type3","ClassType3")
    TCWebApi_set("QoS_Entry3","Max3","Max3")
    TCWebApi_set("QoS_Entry3","Min3","Min3")
    TCWebApi_set("QoS_Entry3", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry3")
    TCWebApi_save()
  elseif Request_Form("QoS_Cls") = "4" then
    TCWebApi_set("QoS_Entry4","Active","App_Flag")
    TCWebApi_set("QoS_Entry4","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry4","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry4","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry4","Type1","ClassType1")
    TCWebApi_set("QoS_Entry4","Max1","Max1")
    TCWebApi_set("QoS_Entry4","Min1","Min1")
    TCWebApi_set("QoS_Entry4","Type2","ClassType2")
    TCWebApi_set("QoS_Entry4","Max2","Max2")
    TCWebApi_set("QoS_Entry4","Min2","Min2")
    TCWebApi_set("QoS_Entry4","Type3","ClassType3")
    TCWebApi_set("QoS_Entry4","Max3","Max3")
    TCWebApi_set("QoS_Entry4","Min3","Min3")
    TCWebApi_set("QoS_Entry4", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry4")
    TCWebApi_save()
  elseif Request_Form("QoS_Cls") = "5" then
    TCWebApi_set("QoS_Entry5","Active","App_Flag")
    TCWebApi_set("QoS_Entry5","ActQueue","ClsQueueValueFlag")
    TCWebApi_set("QoS_Entry5","ActDSCPRemarking","DSCPMark")
    TCWebApi_set("QoS_Entry5","Act8021pRemarkingNum","8021PMark")
    TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")
    TCWebApi_set("QoS_Entry5","Type1","ClassType1")
    TCWebApi_set("QoS_Entry5","Max1","Max1")
    TCWebApi_set("QoS_Entry5","Min1","Min1")
    TCWebApi_set("QoS_Entry5","Type2","ClassType2")
    TCWebApi_set("QoS_Entry5","Max2","Max2")
    TCWebApi_set("QoS_Entry5","Min2","Min2")
    TCWebApi_set("QoS_Entry5","Type3","ClassType3")
    TCWebApi_set("QoS_Entry5","Max3","Max3")
    TCWebApi_set("QoS_Entry5","Min3","Min3")
    TCWebApi_set("QoS_Entry5", "ProtocolID","ProtocolList")
    TCWebApi_commit("QoS_Entry5")
    TCWebApi_save()
  end if
end if

if Request_Form("Del_Flag") = "1" then
  TCWebApi_set("QoS_Common", "QoSOptType","TypeRuleFlag")	
  if Request_Form("TypeDelFlag0") = "Yes" then
    TCWebApi_unset("QoS_Entry0")
    TCWebApi_commit("QoS_Entry0")
  end if
  if Request_Form("TypeDelFlag1") = "Yes" then
    TCWebApi_unset("QoS_Entry1")
    TCWebApi_commit("QoS_Entry1")
  end if
  if Request_Form("TypeDelFlag2") = "Yes" then
    TCWebApi_unset("QoS_Entry2")
    TCWebApi_commit("QoS_Entry2")
  end if
  if Request_Form("TypeDelFlag3") = "Yes" then
    TCWebApi_unset("QoS_Entry3")
    TCWebApi_commit("QoS_Entry3")
  end if
  if Request_Form("TypeDelFlag4") = "Yes" then
    TCWebApi_unset("QoS_Entry4")
    TCWebApi_commit("QoS_Entry4")
  end if
  if Request_Form("TypeDelFlag5") = "Yes" then
    TCWebApi_unset("QoS_Entry5")
    TCWebApi_commit("QoS_Entry5")
  end if
  TCWebApi_save()
elseif Request_Form("Del_Flag") = "2" then
  TCWebApi_unset("QoS_Entry0")
  TCWebApi_unset("QoS_Entry1")
  TCWebApi_unset("QoS_Entry2")
  TCWebApi_unset("QoS_Entry3")
  TCWebApi_unset("QoS_Entry4")
  TCWebApi_unset("QoS_Entry5")
  TCWebApi_commit("QoS_Entry0")
  TCWebApi_commit("QoS_Entry1")
  TCWebApi_commit("QoS_Entry2")
  TCWebApi_commit("QoS_Entry3")
  TCWebApi_commit("QoS_Entry4")
  TCWebApi_commit("QoS_Entry5")
  TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - classifiction</title>
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
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-new-classification.asp" method="post">
    <input type="hidden" name="QoS_Flag" value="0">
    <input type="hidden" name="QoS_Cls" value="-1">
    <input type="hidden" name="Del_Flag" value="0">
    <input type="hidden" name="App_Flag" value="Yes">
    <input type="hidden" name="TypeRuleFlag" value="typeRule">
    <input type="hidden" name="ClsQueueValueFlag" value="1">

    <input type="hidden" name="TypeDelFlag0" value="No">
    <input type="hidden" name="TypeDelFlag1" value="No">
    <input type="hidden" name="TypeDelFlag2" value="No">
    <input type="hidden" name="TypeDelFlag3" value="No">
    <input type="hidden" name="TypeDelFlag4" value="No">
    <input type="hidden" name="TypeDelFlag5" value="No">
    <div class="title-text">IP QoS Classification</div>
    <div class="title-description-text">This page is used to view, delete, and add QoS classifications.</div>

    <div id='ClassQueuepart' class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Class Queue:</div>
      </div>
      <div class="col-6">
        <div class="row">
          <select id="ClassQueue" class="form-control input-select" name="ClassQueue">
            <option value="1" selected>1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>
        </div>
      </div>
    </div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">DSCP/TC Mark:</div>
      </div>
      <div class="col-6">
        <div class="row">
          <input class="input-textfield" type="text" name="DSCPMark" id="DSCPMark" maxlength="10" value="">
        </div>
      </div>
    </div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">802.1P Mark:</div>
      </div>
      <div class="col-6">
        <div class="row">
            <input class="input-textfield" type="text" name="8021PMark" id="8021PMark" maxlength="10" value="">
        </div>
      </div>
    </div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Class Type1:</div>
      </div>
      <div class="col-6">
        <div class="row">
            <select id="ClassType" class="form-control input-select" name="ClassType1" onChange="QoSChangeClassType(1)">
              <option value="N/A"></option>
              <option value="SMAC">SMAC</option>
              <option value="8021P">8021P</option>
              <option value="SIP">SIP</option>
              <option value="DIP">DIP</option>
              <option value="SPORT">SPORT</option>
              <option value="DPORT">DPORT</option>
              <option value="DSCP">DSCP/TC</option>
              <option value="WANInterface">WAN Interface</option>
              <option value="LANInterface">LAN Interface</option>
              <option value="EtherType">EtherType</option>
            </select>
        </div>
      </div>
    </div>
    <div id='ClassTypepart1'>
      <div id="wanpart1" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Interface:</div>
        </div>
        <div class="col-6">
          <div class="row" id="wan1">
          </div>
        </div>
      </div>
      <div id="lanpart1">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmin1">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmax1">
            </div>
          </div>
        </div>
      </div>
      <div id="TypeTospart1" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">TypeTos:</div>
        </div>
        <div class="col-6">
          <div class="row" id="TypeTos1">
          </div>
        </div>
      </div>
      <div id="ethertypepart1" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Ether Type:</div>
        </div>
        <div class="col-6">
          <div class="row" id="ethertype1">
          </div>
        </div>
      </div>
      <div id="commonpart1">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Min1" id="Min1" maxlength="128" value="">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Max1" id="Max1" maxlength="128" value="">
            </div>
          </div>
        </div>
      </div>
    </div>
 
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Class Type2:</div>
      </div>
      <div class="col-6">
        <div class="row">
            <select id="ClassType2" class="form-control input-select" name="ClassType2" onChange="QoSChangeClassType(2)">
              <option value="N/A"></option>
              <option value="SMAC">SMAC</option>
              <option value="8021P">8021P</option>
              <option value="SIP">SIP</option>
              <option value="DIP">DIP</option>
              <option value="SPORT">SPORT</option>
              <option value="DPORT">DPORT</option>
              <option value="DSCP">DSCP/TC</option>
              <option value="WANInterface">WAN Interface</option>
              <option value="LANInterface">LAN Interface</option>
              <option value="EtherType">EtherType</option>
            </select>
        </div>
      </div>
    </div>
    <div id='ClassTypepart2'>
      <div id="wanpart2" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Interface:</div>
        </div>
        <div class="col-6">
          <div class="row" id="wan2">
          </div>
        </div>
      </div>
      <div id="lanpart2">
        <div id="lanminslpart2" class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmin2">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmax2">
            </div>
          </div>
        </div>
      </div>
      <div id="TypeTospart2" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">TypeTos:</div>
        </div>
        <div class="col-6">
          <div class="row" id="TypeTos2">
          </div>
        </div>
      </div>
      <div id="ethertypepart2" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Ether Type:</div>
        </div>
        <div class="col-6">
          <div class="row" id="ethertype2">
          </div>
        </div>
      </div>
      <div id="commonpart2">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Min2" id="Min2" maxlength="128" value="">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Max2" id="Max2" maxlength="128" value="">
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Class Type3:</div>
      </div>
      <div class="col-6">
        <div class="row">
            <select id="ClassType3" class="form-control input-select" name="ClassType3" onChange="QoSChangeClassType(3)">
              <option value="N/A"></option>
              <option value="SMAC">SMAC</option>
              <option value="8021P">8021P</option>
              <option value="SIP">SIP</option>
              <option value="DIP">DIP</option>
              <option value="SPORT">SPORT</option>
              <option value="DPORT">DPORT</option>
              <option value="DSCP">DSCP/TC</option>
              <option value="WANInterface">WAN Interface</option>
              <option value="LANInterface">LAN Interface</option>
              <option value="EtherType">EtherType</option>
            </select>
        </div>
      </div>
    </div>
    <div id='ClassTypepart3'>
      <div id="wanpart3" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Interface:</div>
        </div>
        <div class="col-6">
          <div class="row" id="wan3">
          </div>
        </div>
      </div>
      <div id="lanpart3">
        <div id="lanminslpart3" class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmin3">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row" id="lanmax3">
            </div>
          </div>
        </div>
      </div>
      <div id="TypeTospart3" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">TypeTos:</div>
        </div>
        <div class="col-6">
          <div class="row" id="TypeTos3">
          </div>
        </div>
      </div>
      <div id="ethertypepart3" class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Ether Type:</div>
        </div>
        <div class="col-6">
          <div class="row" id="ethertype3">
          </div>
        </div>
      </div>
      <div id="commonpart3">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Minimum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Min3" id="Min3" maxlength="128" value="">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Maximum:</div>
          </div>
          <div class="col-6">
            <div class="row">
              <input class="input-textfield" type="text" name="Max3" id="Max3" maxlength="128" value="">
            </div>
          </div>
        </div>
      </div>
    </div>

      
    <div id='Protocolpart' class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Protocol:</div>
      </div>
      <div class="col-6">
        <div class="row">
          <select id="ProtocolList" class="form-control input-select" name="ProtocolList">
            <option value="TCP" >TCP</option>
            <option value="UDP" >UDP</option>
            <option value="TCP,UDP" >TCP,UDP</option>
            <option value="ICMP" >ICMP</option>
            <option value="rtp" >RTP</option>
            <option value="all" >ALL</option>
          </select>
        </div>
      </div>
    </div>

    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="QoSClsTypeSubmit()">Add</button>
    </div>

    <div class="card-table-content" id="ClsTable" name= "ClsTable"></div>

    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" onclick="QoSDelSubmit()">Delete Selected</button>
      <button type="button" class="btn-dashboard" onclick="QoSAllDelSubmit()">Delete All</button>
    </div>

    </form>
  </div>
  <!-- content -->
  <script>
  var CurTypeArray =checkClsTypestatus();

  function etherType(Domain,Name)
  {
    this.Domain = Domain;
    this.Name = Name;
  }
  var EtherTypeList = new Array();
  EtherTypeList[0] = new etherType("IPv4","IPv4");
  EtherTypeList[1] = new etherType("IPv6","IPv6");
  
  $(document).ready(function()
  {
    writeClsTable();
    setDisplay('ClassTypepart1', 0);
    setDisplay('ClassTypepart2', 0);
    setDisplay('ClassTypepart3', 0);
  });

  function QosClassConstruction(domain,ClassQueue,DSCPMarkValue,Value8021P,Type1,Max1,Min1,Type2,Max2,Min2,Type3,Max3,Min3,ProtocolList)
  {
    this.domain = domain;
    this.ClassQueue = ClassQueue;
    this.DSCPMarkValue = DSCPMarkValue;
    this.Value8021P = Value8021P;
    this.Type1 = Type1;
    this.Max1 = Max1;
    this.Min1 = Min1;
    this.Type2 = Type2;
    this.Max2 = Max2;
    this.Min2 = Min2;
    this.Type3 = Type3;
    this.Max3 = Max3;
    this.Min3 = Min3;
    this.ProtocolList = ProtocolList;
  }
  
  function is_integer(val)
  {
    if (/^(\+|-)?\d+$/.test( val ))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
 
  function QoSChangeClassType(num)
  {
    if(getValue('ClassType'+parseInt(num))=="N/A")
    {
      setDisplay('ClassTypepart'+parseInt(num), 0);
      setDisplay('commonpart'+parseInt(num), 0);
      setDisplay('lanpart'+parseInt(num), 0);
      setDisplay('wanpart'+parseInt(num), 0);
      setDisplay('TypeTospart'+parseInt(num), 0);
      setDisplay('ethertypepart'+parseInt(num), 0);
    }
    else if(getValue('ClassType'+parseInt(num))=="WANInterface")
    {
      setDisplay('ClassTypepart'+parseInt(num), 1);
      setDisplay('commonpart'+parseInt(num), 0);
      setDisplay('lanpart'+parseInt(num), 0);
      WriteWanInterFace(num);
      setDisplay('wanpart'+parseInt(num), 1);
      setDisplay('TypeTospart'+parseInt(num), 0);
      setDisplay('ethertypepart'+parseInt(num), 0);
    }
    else if(getValue('ClassType'+parseInt(num))=="LANInterface")
    {
      setDisplay('ClassTypepart'+parseInt(num), 1);
      setDisplay('commonpart'+parseInt(num), 0);
      setDisplay('wanpart'+parseInt(num), 0);
      WriteLanInterFace(num);
      setDisplay('lanpart'+parseInt(num), 1);
      setDisplay('TypeTospart'+parseInt(num), 0);
      setDisplay('ethertypepart'+parseInt(num), 0);
    }
    else if(getValue('ClassType'+parseInt(num))=="TOS")
    {
      setDisplay('ClassTypepart'+parseInt(num), 1);
      setDisplay('commonpart'+parseInt(num), 0);
      setDisplay('wanpart'+parseInt(num), 0);
      setDisplay('lanpart'+parseInt(num), 0);
      setDisplay('TypeTospart'+parseInt(num), 1);
      setDisplay('ethertypepart'+parseInt(num), 0);
    }
    else if(getValue('ClassType'+parseInt(num))=="EtherType")
    {
      setDisplay('ClassTypepart'+parseInt(num), 1);
      setDisplay('commonpart'+parseInt(num), 0);
      setDisplay('wanpart'+parseInt(num), 0);
      setDisplay('lanpart'+parseInt(num), 0);
      setDisplay('TypeTospart'+parseInt(num), 0);
      WriteEtherType(num);
      setDisplay('ethertypepart'+parseInt(num), 1);
    }
    else
    {
      setDisplay('ClassTypepart'+parseInt(num), 1);
      setDisplay('commonpart'+parseInt(num), 1);
      setDisplay('lanpart'+parseInt(num), 0);
      setDisplay('wanpart'+parseInt(num), 0);
      setDisplay('TypeTospart'+parseInt(num), 0);
      setDisplay('ethertypepart'+parseInt(num), 0);
    }
  }
  
  function	checkClsTypestatus()
  {
    var ClsCnttemp = 0;
    var vActObj = new Array(10);

    vActObj[ClsCnttemp++] = new QosClassConstruction("0","<% tcWebApi_get("QoS_Entry0","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry0","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry0","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry0","Type1","s") %>","<% tcWebApi_get("QoS_Entry0","Max1","s") %>","<% tcWebApi_get("QoS_Entry0","Min1","s") %>","<% tcWebApi_get("QoS_Entry0","Type2","s") %>","<% tcWebApi_get("QoS_Entry0","Max2","s") %>","<% tcWebApi_get("QoS_Entry0","Min2","s") %>","<% tcWebApi_get("QoS_Entry0","Type3","s") %>","<% tcWebApi_get("QoS_Entry0","Max3","s") %>","<% tcWebApi_get("QoS_Entry0","Min3","s") %>","<% tcWebApi_get("QoS_Entry0","ProtocolID","s") %>");
    vActObj[ClsCnttemp++] = new QosClassConstruction("1","<% tcWebApi_get("QoS_Entry1","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry1","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry1","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry1","Type1","s") %>","<% tcWebApi_get("QoS_Entry1","Max1","s") %>","<% tcWebApi_get("QoS_Entry1","Min1","s") %>","<% tcWebApi_get("QoS_Entry1","Type2","s") %>","<% tcWebApi_get("QoS_Entry1","Max2","s") %>","<% tcWebApi_get("QoS_Entry1","Min2","s") %>","<% tcWebApi_get("QoS_Entry1","Type3","s") %>","<% tcWebApi_get("QoS_Entry1","Max3","s") %>","<% tcWebApi_get("QoS_Entry1","Min3","s") %>","<% tcWebApi_get("QoS_Entry1","ProtocolID","s") %>");
    vActObj[ClsCnttemp++] = new QosClassConstruction("2","<% tcWebApi_get("QoS_Entry2","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry2","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry2","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry2","Type1","s") %>","<% tcWebApi_get("QoS_Entry2","Max1","s") %>","<% tcWebApi_get("QoS_Entry2","Min1","s") %>","<% tcWebApi_get("QoS_Entry2","Type2","s") %>","<% tcWebApi_get("QoS_Entry2","Max2","s") %>","<% tcWebApi_get("QoS_Entry2","Min2","s") %>","<% tcWebApi_get("QoS_Entry2","Type3","s") %>","<% tcWebApi_get("QoS_Entry2","Max3","s") %>","<% tcWebApi_get("QoS_Entry2","Min3","s") %>","<% tcWebApi_get("QoS_Entry2","ProtocolID","s") %>");
    vActObj[ClsCnttemp++] = new QosClassConstruction("3","<% tcWebApi_get("QoS_Entry3","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry3","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry3","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry3","Type1","s") %>","<% tcWebApi_get("QoS_Entry3","Max1","s") %>","<% tcWebApi_get("QoS_Entry3","Min1","s") %>","<% tcWebApi_get("QoS_Entry3","Type2","s") %>","<% tcWebApi_get("QoS_Entry3","Max2","s") %>","<% tcWebApi_get("QoS_Entry3","Min2","s") %>","<% tcWebApi_get("QoS_Entry3","Type3","s") %>","<% tcWebApi_get("QoS_Entry3","Max3","s") %>","<% tcWebApi_get("QoS_Entry3","Min3","s") %>","<% tcWebApi_get("QoS_Entry3","ProtocolID","s") %>");
    vActObj[ClsCnttemp++] = new QosClassConstruction("4","<% tcWebApi_get("QoS_Entry4","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry4","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry4","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry4","Type1","s") %>","<% tcWebApi_get("QoS_Entry4","Max1","s") %>","<% tcWebApi_get("QoS_Entry4","Min1","s") %>","<% tcWebApi_get("QoS_Entry4","Type2","s") %>","<% tcWebApi_get("QoS_Entry4","Max2","s") %>","<% tcWebApi_get("QoS_Entry4","Min2","s") %>","<% tcWebApi_get("QoS_Entry4","Type3","s") %>","<% tcWebApi_get("QoS_Entry4","Max3","s") %>","<% tcWebApi_get("QoS_Entry4","Min3","s") %>","<% tcWebApi_get("QoS_Entry4","ProtocolID","s") %>");
    vActObj[ClsCnttemp++] = new QosClassConstruction("5","<% tcWebApi_get("QoS_Entry5","ActQueue","s") %>","<% tcWebApi_get("QoS_Entry5","ActDSCPRemarking","s") %>","<% tcWebApi_get("QoS_Entry5","Act8021pRemarkingNum","s") %>","<% tcWebApi_get("QoS_Entry5","Type1","s") %>","<% tcWebApi_get("QoS_Entry5","Max1","s") %>","<% tcWebApi_get("QoS_Entry5","Min1","s") %>","<% tcWebApi_get("QoS_Entry5","Type2","s") %>","<% tcWebApi_get("QoS_Entry5","Max2","s") %>","<% tcWebApi_get("QoS_Entry5","Min2","s") %>","<% tcWebApi_get("QoS_Entry5","Type3","s") %>","<% tcWebApi_get("QoS_Entry5","Max3","s") %>","<% tcWebApi_get("QoS_Entry5","Min3","s") %>","<% tcWebApi_get("QoS_Entry5","ProtocolID","s") %>");

    var vObjRet = new Array(ClsCnttemp+1);
    for(var m=0; m<ClsCnttemp; m++)
    {
      vObjRet[m] = vActObj[m];
    }
    vObjRet[ClsCnttemp] = null;
    return vObjRet;
  }
  function WanIndexConstruction(domain,WanName,ServiceName,EnNAT)
  {
    this.domain = domain;
    this.WanName = WanName;
  }
  function CheckWansActives()
  {
    var nCurTemp =0;
    var	vcurLinks = new Array();
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryValue = vArrayStr.split(',');
  
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanNasName","s") %>";
    var vNASNAME = vArrayStr.split(',');
    for(var i=0; i<nEntryNum; i++)
    {
        nCurTemp++;
        var wmin1 = 0;
        var wmin2 = 0;
        var temp = vNASNAME[i].replace("nas", "");
        var nindex = temp.indexOf('_');
        wmin1 = 1 + parseInt(temp.substr(0, nindex));
        wmin2 = 1 + parseInt(temp.substr(nindex + 1));
        temp = wmin1.toString() + "," + wmin2.toString();
        vcurLinks[nCurTemp-1] = new WanIndexConstruction(temp, vEntryName[i]);
    }
    var	vObjRet = new Array(nCurTemp+1);
    for(var m=0; m<nCurTemp; m++)
    {
      vObjRet[m] = vcurLinks[m];
    }
    vObjRet[nCurTemp] = null;
    return vObjRet;
  }
  var WanList = CheckWansActives();
 
  function WriteWanInterFace(num)
  {
    var loc,k;
    loc ='<select class="form-control input-select" id="TypeWanInterFaceMin' + parseInt(num) + '" name="TypeWanInterFaceMin' + parseInt(num)+'">';
    if(WanList!=null)
    {
      if(WanList.length > 0)
      {
        for(i=0;i<WanList.length-1;i++)
        {
          if (i==0)
            loc +='<option value="'+WanList[i].domain+'" selected>'+ WanList[i].WanName +'</option>';
          else
            loc +='<option value="'+WanList[i].domain+'" >'+ WanList[i].WanName +'</option>';
        
        }
      }
    }
    loc +='</select>';
    getElById('wan'+parseInt(num)).innerHTML = loc;
  }
  
  function stLan(Domain,Name)
  {
  this.Domain = Domain;
  this.Name = Name;
  }
  var LanList = new Array();
  LanList[0] = new stLan("1","LAN1");
  LanList[1] = new stLan("2","LAN2");
<% if TCWebApi_get("WebCustom_Entry","isCT2PORTSSupported","h" ) <> "Yes" then %>
  LanList[2] = new stLan("3","LAN3");
  LanList[3] = new stLan("4","LAN4");
<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
  LanList[4] = new stLan("5","SSID1");
  LanList[5] = new stLan("6","SSID2");
  LanList[6] = new stLan("7","SSID3");
  LanList[7] = new stLan("8","SSID4");
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
  LanList[8] = new stLan("9","SSIDAC1");
  LanList[9] = new stLan("10","SSIDAC2");
  LanList[10] = new stLan("11","SSIDAC3");
  LanList[11] = new stLan("12","SSIDAC4");
<% end if %>	
<% else %>
<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
  LanList[2] = new stLan("5","SSID1");
  LanList[3] = new stLan("6","SSID2");
  LanList[4] = new stLan("7","SSID3");
  LanList[5] = new stLan("8","SSID4");	
<% end if %>
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
  LanList[6] = new stLan("9","SSIDAC1");
  LanList[7] = new stLan("10","SSIDAC2");
  LanList[8] = new stLan("11","SSIDAC3");
  LanList[9] = new stLan("12","SSIDAC4");
<% end if %>	
<% end if %>
  function WriteLanInterFace(num)
  {
    var locmin,locmax,k;
    locmin ='<select class="form-control input-select" id="TypeLanInterFaceMin' + parseInt(num) + '" name="TypeLanInterFaceMin' + parseInt(num) + '">';
    for(i=0;i<LanList.length;i++)
    {
      locmin +='<option value="'+ LanList[i].Domain +'" selected>'+ LanList[i].Name +'</option>';
    }
    locmin +='</select>';
    getElById('lanmin'+parseInt(num)).innerHTML = locmin;
    locmax ='<select class="form-control input-select" id="TypeLanInterFaceMax' + parseInt(num) + '" name="TypeLanInterFaceMax' + parseInt(num) + '">';
    for(i=0;i<LanList.length;i++)
    {
      locmax +='<option value="'+LanList[i].Domain+'" selected>'+ LanList[i].Name +'</option>';
    }
    locmax +='</select>';
    getElById('lanmax'+parseInt(num)).innerHTML = locmax;
  }
  function GetLanName(Domain)
  {
<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
    for(i=0;i<12;i++)
<% else %>
    for(i=0;i<8;i++)
<% end if %>
    {
      if(Domain == LanList[i].Domain)
      {
        this.Name = LanList[i].Name;
        return this;
      }
    }
  }
  function WriteEtherType(num)
  {
    var loc,k;
    loc ='<select class="form-control input-select" id="EtherTypeMin' + parseInt(num) + '" name="EtherTypeMin' + parseInt(num) + '">';
    if(EtherTypeList!=null)
    {
      if(EtherTypeList.length > 0)
      {
        for(i=0;i<EtherTypeList.length;i++)
        {
          if (i==0)
            loc +='<option value="'+EtherTypeList[i].Domain+'" selected>'+ EtherTypeList[i].Name +'</option>';
          else
            loc +='<option value="'+EtherTypeList[i].Domain+'" >'+ EtherTypeList[i].Name +'</option>';
        
        }
      }
    }
    loc +='</select>';
    getElById('ethertype'+parseInt(num)).innerHTML = loc;
  }
  
  function CountType(tmp)
  {
    var i = 0;
    if(tmp.Type1 != "" && tmp.Type1 != "N/A")
    {
      ++i;
    }
    if(tmp.Type2 != "" && tmp.Type2 != "N/A")
    {
      ++i;
    }
    if(tmp.Type3 != "" && tmp.Type3 != "N/A")
    {
      ++i;
    }
    return i;
  }
  
  function writeClsTable()
  {
    var loc,k;
    loc = '<div class="table-header">Static Route Table</div>';
    loc += '<table style="width:100%">';
    loc += '<tr class="table-header center">';
    loc += '<th style="width: 8%;" class="p-1">Class Queue</th>';
    loc += '<th style="width: 8%;">DSCP/TC Mark</th>';
    loc += '<th style="width: 8%;">802.1P Mark</th>';
    loc += '<th style="width: 12%;">Class Type</th>';
    loc += '<th style="width: 23%;">Minimum</th>';
    loc += '<th style="width: 23%;">Maximum</th>';
    loc += '<th style="width: 8%;">Protocol</th>';
    loc += '<th style="width: 10%;">Operation</th>';
    loc += '</tr>';
    if ( CurTypeArray == null )
    {
      return;
    }
    
    for(k = 0; k < CurTypeArray.length - 1; k++)
    {
      var count = CountType(CurTypeArray[k]);
      if (count == 0) continue;
      if(k%2==0)
        loc += '<tr class="table-content-fist center">';
      else
        loc += '<tr class="table-content-second center">';

      var tmpDSCPMarkValue,tmpValue8021P;
      if(CurTypeArray[k].DSCPMarkValue == "N/A")
      {
        tmpDSCPMarkValue = "0";
      }
      else
      {
        tmpDSCPMarkValue = CurTypeArray[k].DSCPMarkValue;
      }
      
      if(CurTypeArray[k].Value8021P == "N/A")
      {
        tmpValue8021P = "0";
      }
      else
      {
        tmpValue8021P = CurTypeArray[k].Value8021P;
      }
      
      loc += '<td>' + CurTypeArray[k].ClassQueue + '</td>';
      loc += '<td>' + tmpDSCPMarkValue + '</td>';
      loc += '<td>' + tmpValue8021P + '</td>';

      var tmp = 0;
      tmp = count;
      loc += '<td>';
      if(CurTypeArray[k].Type1 != "N/A")
      {
        if(CurTypeArray[k].Type1 == "DSCP")
        {
          loc += 'DSCP/TC';
        }
        else
        {
          loc += CurTypeArray[k].Type1;
        }
        tmp--;
        if(tmp > 0)
        {
          loc += '<br>';
        }
      }
      if(CurTypeArray[k].Type2 != "N/A")
      {
        if(CurTypeArray[k].Type2 == "DSCP")
        {
          loc += 'DSCP/TC';
        }
        else
        {
          loc += CurTypeArray[k].Type2;
        }
        tmp--;
        if(tmp > 0)
        {
          loc += '<br>';
        }
      }
      if(CurTypeArray[k].Type3 != "N/A")
      {
        if(CurTypeArray[k].Type3 == "DSCP")
        {
          loc += 'DSCP/TC';
        }
        else
        {
          loc += CurTypeArray[k].Type3;
        }
        tmp--;
        if(tmp > 0)
        {
          loc += '<br>';
        }
      }
      loc += '</td>';
      var max = new Array(3);
      var min = new Array(3);
      tmp = 0;
      if(CurTypeArray[k].Type1 != "N/A")
      {
        if (CurTypeArray[k].Type1 == "WANInterface")
        {
          for(i=0;i<WanList.length-1;i++)
          {
            if (WanList[i].domain == CurTypeArray[k].Min1)
            {
              max[tmp]=WanList[i].WanName;
              min[tmp]=WanList[i].WanName;
              ++tmp;
              break;
            }
          }
        }
        else if (CurTypeArray[k].Type1 == "LANInterface")
        {
          var LanMax = new GetLanName(CurTypeArray[k].Max1);
          var LanMin = new GetLanName(CurTypeArray[k].Min1);
          min[tmp]=LanMin.Name;
          max[tmp]=LanMax.Name;
          ++tmp;
        }
        else
        {
          min[tmp]=CurTypeArray[k].Min1;
          max[tmp]=CurTypeArray[k].Max1;
          ++tmp;
        }
      }
      if(CurTypeArray[k].Type2 != "N/A")
      {
        if (CurTypeArray[k].Type2 == "WANInterface")
        {
          for(i=0;i<WanList.length-1;i++)
          {
            if (WanList[i].domain == CurTypeArray[k].Min2)
            {
              max[tmp]=WanList[i].WanName;
              min[tmp]=WanList[i].WanName;
              ++tmp;
              break;
            }
        }
      }
      else if (CurTypeArray[k].Type2 == "LANInterface")
      {
        var LanMax = new GetLanName(CurTypeArray[k].Max2);
        var LanMin = new GetLanName(CurTypeArray[k].Min2);
        min[tmp]=LanMin.Name;
        max[tmp]=LanMax.Name;
        ++tmp;
      }
      else
      {
        min[tmp]=CurTypeArray[k].Min2;
        max[tmp]=CurTypeArray[k].Max2;
        ++tmp;
      }
      }
      if(CurTypeArray[k].Type3 != "N/A")
      {
        if (CurTypeArray[k].Type3 == "WANInterface")
        {
          for(i=0;i<WanList.length-1;i++)
          {
            if (WanList[i].domain == CurTypeArray[k].Min3)
            {
              max[tmp]=WanList[i].WanName;
              min[tmp]=WanList[i].WanName;
              ++tmp;
              break;
            }
          }
        }
        else if (CurTypeArray[k].Type3 == "LANInterface")
        {
          var LanMax = new GetLanName(CurTypeArray[k].Max3);
          var LanMin = new GetLanName(CurTypeArray[k].Min3);
          min[tmp]=LanMin.Name;
          max[tmp]=LanMax.Name;
          ++tmp;
        }
        else
        {
          min[tmp]=CurTypeArray[k].Min3;
          max[tmp]=CurTypeArray[k].Max3;
          ++tmp;
        }
      }
      loc+='<td>';
      var i;
      for(i =0;i<tmp;++i)
      {
        loc+=min[i];
        if(i+1<tmp)
          loc+='<br>';
      }
      loc+='</td><td>';
      for(i =0;i<tmp;++i)
      {
        loc+=max[i];
        if(i+1<tmp)
          loc+='<br>';
      }
      loc+='</td>';
      
      loc += '<td>' + CurTypeArray[k].ProtocolList + '</td>';
      
      loc += '<td><input type="checkbox" name="rmtype" id="rmtype" value="false"><input type="hidden" name="rmvalue" id="rmvalue" value="' + CurTypeArray[k].domain + '"></td>\n';
      loc += '</tr>';
    }

    loc += '</table>';
    getElById('ClsTable').innerHTML = loc;
  }

  function ClsCheck()
  {
    var classQ;
    var Classifytype;
    var max;
    var min;
    var dscp;
    var v8021p;
    var sip;
    var dip;
    with (getElById('ConfigForm'))
    {
      dscp   = getValue('DSCPMark');
      v8021p = getValue('8021PMark');
      if (is_integer(dscp) == false ||  dscp < 0 || dscp > 63)
      {
        alert("The valid value of DSCP/TC is an integer of 0-63. Please re-enter it.");
        return false;
      }
      if (is_integer(v8021p) == false ||  v8021p < 0 || v8021p > 7)
      {
        alert("The valid value of 802.1p is an integer of 0-7. Please re-enter it.");
        return false;
      }
    }
    return true;
  }
  function CompareConstruction(Type, Max, Min, Protocol)
  {
    this.Type = Type;
    this.Max = Max;
    this.Min = Min;
    this.Protocol = Protocol;
  }
  function GenerateArray(tmp)
  {
    var stringList = new Array();
    var ListIndex = 0;
    if(tmp.Type1 != "N/A" && tmp.Type1 != "")
    {
      var CurObject = new CompareConstruction(tmp.Type1,tmp.Max1,tmp.Min1,tmp.ProtocolList);
      stringList[ListIndex++] = CurObject;
    }
    if(tmp.Type1 != "N/A" && tmp.Type2 != "")
    {
      var CurObject = new CompareConstruction(tmp.Type2,tmp.Max2,tmp.Min2,tmp.ProtocolList);
      stringList[ListIndex++] = CurObject;
    }
    if(tmp.Type1 != "N/A" && tmp.Type3 != "")
    {
      var CurObject = new CompareConstruction(tmp.Type3,tmp.Max3,tmp.Min3,tmp.ProtocolList);
      stringList[ListIndex++] = CurObject;
    }
    return stringList;
  }

  function CompareArray(CurList, CompareList)
  {
    var index_cur,index_com;
    for(index_cur = 0; index_cur < CurList.length; index_cur++)
    {
      for(index_com = 0; index_com < CompareList.length; index_com++)
      {
        if(CurList[index_cur].Type == CompareList[index_com].Type && CurList[index_cur].Max == CompareList[index_com].Max && CurList[index_cur].Min == CompareList[index_com].Min)
        {
          if(CurList[index_cur].ProtocolList == "all" || CurList[index_cur].Protocol.indexOf(CompareList[index_com].Protocol) != -1)
          {
            return true;
          }
          if(CompareList[index_com].ProtocolList == "all" || CompareList[index_com].Protocol.indexOf(CurList[index_cur].Protocol) != -1)
          {
            return true;
          }
        }
      }
    }
    return false;
  }
  
  function RepeatRuleCheck()
  {
    var i;
    var ListIndex = 0;
    var NewClass = new Array();
    if(getValue('ClassType1') != "N/A" && getValue('ClassType1') != "")
    {
      var CurObject = new CompareConstruction(getValue('ClassType1'), document.ConfigForm.Max1.value, document.ConfigForm.Min1.value, getSelectVal('ProtocolList'));
      NewClass[ListIndex++] = CurObject;
    }
    if(getValue('ClassType2') != "N/A" && getValue('ClassType2') != "")
    {
      var CurObject = new CompareConstruction(getValue('ClassType2'), document.ConfigForm.Max2.value, document.ConfigForm.Min2.value, getSelectVal('ProtocolList'));
      NewClass[ListIndex++] = CurObject;
    }
    if(getValue('ClassType3') != "N/A" && getValue('ClassType3') != "")
    {
      var CurObject = new CompareConstruction(getValue('ClassType3'), document.ConfigForm.Max3.value, document.ConfigForm.Min3.value, getSelectVal('ProtocolList'));
      NewClass[ListIndex++] = CurObject;
    }
    for(i = 0; i < CurTypeArray.length - 1; ++i)
    {
      var CompareList = GenerateArray(CurTypeArray[i]);
      var ArrayEqualFlag = CompareArray(NewClass,CompareList);
      if(ArrayEqualFlag == true)
      {
        return false;
      }
    }
    return true;
  }

  function TypeCommonCheck()
  {
    var Type1 = getValue('ClassType1');
    var Type2 = getValue('ClassType2');
    var Type3 = getValue('ClassType3');
    if((Type1 == Type2 && Type1 != "N/A" && Type2 != "N/A") || (Type1 == Type3 && Type1 != "N/A" && Type3 != "N/A") || (Type2 == Type3 && Type2 != "N/A" && Type3 != "N/A"))
    {
      alert("The same classification type is not allowed in the same group Please adjust.");
      return false;
    }
    if((Type1 == "TOS" || Type2 == "TOS" || Type3 == "TOS") && (Type1 == "DSCP/TC" || Type2 == "DSCP/TC" || Type3 == "DSCP/TC"))
    {
      alert("TOS and DSCP/TC traffic classification types are not allowed in the same group. please adjust.");
      return false;
    }
    return true;
  }

  function cmpIpAddress(address1,address2)
  {
    var Lnum = 0;
    var Snum = 0;
    var addrParts1 = address1.split('.');
    var addrParts2 = address2.split('.');
    for (var i = 0; i <= 3; i++)
    {
      Lnum = parseInt(addrParts1[i]);
      Snum = parseInt(addrParts2[i]);
      if (Lnum < Snum)
      {
        return false;
      }
    }
    return true;
  }
  
  function ClsTypeCheck()
  {
    var classQ;
    var Classifytype;
    var max;
    var min;
    var dscp;
    var v8021p;
    var sip;
    var dip;
    var k;
    var protocol  = getSelectVal('ProtocolList');
    with (getElById('ConfigForm'))
    {
      classQ = $("#ClassQueue").val();
      for(i = 1; i <= 3; ++i)
      {
        Classifytype = getValue('ClassType' + parseInt(i));
        if(Classifytype == "N/A") 
          continue;
        max = getValue('Max' + parseInt(i));
        min = getValue('Min' + parseInt(i));
        if (max == '' ||min ==''){
          alert("Max or min must not be empty!");
          return false;
        }
        if(false == RepeatRuleCheck())
        {
          alert("The same matching rule is not allowed.");
          return false;
        }
        if(false == TypeCommonCheck())
        {
          return false;
        }
        
        if (Classifytype =='SMAC')
        {
          if (min != '' && isValidMacAddress(min) == false)
          {
            alert("MIN MAC address is invalid.");
            return false;
          }
          else if (max != '' && isValidMacAddress(max) == false)
          {
            alert("MAX MAC address is invalid.");
            return false;
          }
          else if (min != max){
            alert("MIN and MAX MAC address must be same.");
            return false;
          }
        }
        else if (Classifytype =='8021P'){
          if (max != '' && (is_integer(max) == false ||  max < 0 || max> 7))
          {
            alert("Enter the maximum number between 0 to 7.");
            return false;
          }
          else if (min != '' && (is_integer(min) == false ||  min < 0 || min > 7))
          {
            alert("Enter the minimum number between 0 to 7.");
            return false;
          }
          else if (parseInt(min) > parseInt(max)){
            alert("Minimum is greater than the maximum, please re-enter.");
            return false;
          }
        }
        else if (Classifytype =='SIP'){
          if (max != '' && (isAbcIpAddress(max) == false) && (isIpv6Address(max) == false))
          {
            var TipStr = "Source IP address MAX "+"Source IP address MIN" +" is invalid IP address.";
            alert(TipStr);
            return false;
          }
          else if (min != '' && (isAbcIpAddress(min) == false)	&& (isIpv6Address(min) == false))
          {
            var TipStr = "Source IP address MIN "+"min"+" is invalid IP address.";
            alert(TipStr);
            return false;
          }
          else if ((isAbcIpAddress(min) == true) && (isAbcIpAddress(max) == true)	&& (cmpIpAddress(max ,min) == false))
          {
            var TipStr = "Source IP address MIN "+"min"+" MIN port is greater than MAX port. :"+max;
            alert(TipStr);
            return false;
          }
          else if ((isIpv6Address(min) == true)	 || (isIpv6Address(max) == true))
          {
            if (max != min){
              alert("MIN and MAX IPv6 address must be same.");
              return false;
            }
          }
        }
        else if (Classifytype =='DIP')
        {
          if (max != '' && (isAbcIpAddress(max) == false) && (isIpv6Address(max) == false))
          {
            var TipStr = "Destination IP address MAX "+"max"+" is invalid IP address.";
            alert(TipStr);
            return false;
          }
          else if (min != '' && (isAbcIpAddress(min) == false) && (isIpv6Address(min) == false))
          {
            var TipStr = "Destination IP address MIN "+"min"+" is invalid IP address.";
            alert(TipStr);
            return false;
          }
          else if ((isAbcIpAddress(min) == true) && (isAbcIpAddress(max) == true) && (cmpIpAddress(max ,min) == false))
          {
            var TipStr = "Destination IP address MIN "+""+" greater than MAX :"+max;
            alert(TipStr);
            return false;
          }
          else if ((isIpv6Address(min) == true)	 || (isIpv6Address(max) == true) )
          {
            if (max != min){
              alert("MIN and MAX IPv6 address must be same.");
              return false;
            }
          }
        }
        else if ((Classifytype =='DPORT')||(Classifytype =='SPORT'))
        {
          if(protocol == "ICMP")
          {
            alert("ICMP is a control protocol and does not require Dport and Sport.");
            return false;
          }
          if (max != '' && isValidPort(max) == false)
          {
            alert("MAX port is invalid port.");
            return false;
          }
          else if (min != '' && isValidPort(min) == false)
          {
            alert("MIN port is invalid port.");
            return false;
          }
          else if (parseInt(min) > parseInt(max))
          {
            alert("MIN port is greater than MAX port.");
            return false;
          }
        }
        else if (Classifytype =='DSCP')
        {
          if (max != '' && (is_integer(max) == false ||  max < 0 || max> 63))
          {
            alert("DSCP/TC MAX values range from 0 to 63.");
            return false;
          }
          else if (min != '' && (is_integer(min) == false ||  min < 0 || min> 63))
          {
            alert("DSCP/TC MIN value ranges from 0 to 63.");
            return false;
          }
          else if (parseInt(min) > parseInt(max))
          {
            alert("DSCP/TC MIN value is greater than MAX value.");
            return false;
          }
        }
        else if (Classifytype =='WANInterface')
        {
          return true;
        }
        else if (Classifytype =='EtherType')
        {
          return true;
        }
        else if (Classifytype =='LANInterface')
        {
          if(document.getElementById("TypeLanInterFaceMin" + parseInt(i)).selectedIndex > document.getElementById("TypeLanInterFaceMax" + parseInt(i)).selectedIndex)
          {
            alert("The minimum value in the interface is larger than the maximum value. Please re-select.");
            return false;
          }
        }
      }
    }
    return true;
  }

  function QoSClsTypeSubmit()
  {
    var vForm = document.ConfigForm;
    var tmpSave = "-1";
    <% if tcwebApi_get("QoS_Entry5","Active","h") <> "Yes" then %>
    tmpSave = "5";
    <% end if %>
    <% if tcwebApi_get("QoS_Entry4","Active","h") <> "Yes" then %>
    tmpSave = "4";
    <% end if %>
    <% if tcwebApi_get("QoS_Entry3","Active","h") <> "Yes" then %>
    tmpSave = "3";
    <% end if %>
    <% if tcwebApi_get("QoS_Entry2","Active","h") <> "Yes" then %>
    tmpSave = "2";
    <% end if %>
    <% if tcwebApi_get("QoS_Entry1","Active","h") <> "Yes" then %>
    tmpSave = "1";
    <% end if %>
    <% if tcwebApi_get("QoS_Entry0","Active","h") <> "Yes" then %>
    tmpSave = "0";
    <% end if %>
    if(tmpSave == "-1")
    {
      alert("Only 6 Qos classification can be configured.");
      return;
    }
    with (getElById('ConfigForm'))
    {
      if(getValue('ClassType1') == "N/A" && getValue('ClassType2') == "N/A" && getValue('ClassType3') == "N/A")
      {
        alert("At least one ClassType needs to be set.");
        return;
      }
      if(getValue('ClassType1')=="WANInterface")
      {
        vForm.Min1.value = $("#TypeWanInterFaceMin1").val();
        vForm.Max1.value = $("#TypeWanInterFaceMin1").val();
      }
      else if(getValue('ClassType1')=="LANInterface")
      {
        vForm.Min1.value = $("#TypeLanInterFaceMin1").val();
        vForm.Max1.value = $("#TypeLanInterFaceMax1").val();
      }
      else if(getValue('ClassType1')=="EtherType")
      {
        vForm.Min1.value = $("#EtherTypeMin1").val();
        vForm.Max1.value = $("#EtherTypeMin1").val();
      }
      else if(getValue('ClassType1')=="N/A")
      {
        vForm.Min1.value = "0";
        vForm.Max1.value = "0";
      }
      if(getValue('ClassType2')=="WANInterface")
      {
        vForm.Min2.value = $("#TypeWanInterFaceMin2").val();
        vForm.Max2.value = $("#TypeWanInterFaceMin2").val();
      }
      else if(getValue('ClassType2')=="LANInterface")
      {
        vForm.Min2.value = $("#TypeLanInterFaceMin2").val();
        vForm.Max2.value = $("#TypeLanInterFaceMax2").val();
      }
      else if(getValue('ClassType2')=="EtherType")
      {
        vForm.Min2.value = $("#EtherTypeMin2").val();
        vForm.Max2.value = $("#EtherTypeMin2").val();
      }
      else if(getValue('ClassType2')=="N/A")
      {
        vForm.Min2.value = "0";
        vForm.Max2.value = "0";
      }
      if(getValue('ClassType3')=="WANInterface")
      {
        vForm.Min3.value = $("#TypeWanInterFaceMin3").val();
        vForm.Max3.value = $("#TypeWanInterFaceMin3").val();
      }
      else if(getValue('ClassType3')=="LANInterface")
      {
        vForm.Min3.value = $("#TypeLanInterFaceMin3").val();
        vForm.Max3.value = $("#TypeLanInterFaceMax3").val();
      }
      else if(getValue('ClassType3')=="EtherType")
      {
        vForm.Min3.value = $("#EtherTypeMin3").val();
        vForm.Max3.value = $("#EtherTypeMin3").val();
      }
      else if(getValue('ClassType3')=="N/A")
      {
        vForm.Min3.value = "0";
        vForm.Max3.value = "0";
      }
    }
    if (false == ClsTypeCheck() || false == ClsCheck())
    {
      return;
    }
    document.ConfigForm.QoS_Flag.value = "1";
    document.ConfigForm.App_Flag.value = "Yes";
    document.ConfigForm.ClsQueueValueFlag.value = $("#ClassQueue").val();
    document.ConfigForm.QoS_Cls.value = tmpSave;
    vForm.submit();
    showLoading();
  }
  
  function QoSDelSubmit()
  {
    var Rmtype ;
    var RmVal ;
    var k = 0;
    var DelClsCount = 0;
    with (getElById('ConfigForm'))
    {
      Rmtype = getElById("rmtype");
      RmVal = getElById("rmvalue");
      if(Rmtype!=null)
      {
        if(Rmtype.length > 0)
        {
          for(k=0; k < Rmtype.length ; k++ )
          {
            if(Rmtype[k].checked == true )
            {
              if(RmVal[k].value =="0")
                {TypeDelFlag0.value =  "Yes";}
              else if(RmVal[k].value =="1")
                {TypeDelFlag1.value =  "Yes";}
              else if(RmVal[k].value =="2")
                {TypeDelFlag2.value =  "Yes";}
              else if(RmVal[k].value =="3")
                {TypeDelFlag3.value =  "Yes";}
              else if(RmVal[k].value =="4")
                {TypeDelFlag4.value =  "Yes";}
              else if(RmVal[k].value =="5")
                {TypeDelFlag5.value =  "Yes";}
              DelClsCount++;
            }
          }
        }
        else
        {
          if(Rmtype.checked == true )
          {
              if(RmVal.value =="0")
                {TypeDelFlag0.value =  "Yes";}
              else if(RmVal.value =="1")
                {TypeDelFlag1.value =  "Yes";}
              else if(RmVal.value =="2")
                {TypeDelFlag2.value =  "Yes";}
              else if(RmVal.value =="3")
                {TypeDelFlag3.value =  "Yes";}
              else if(RmVal.value =="4")
                {TypeDelFlag4.value =  "Yes";}
              else if(RmVal.value =="5")
                {TypeDelFlag5.value =  "Yes";}
              DelClsCount++;
          }
        }
      }
      if(DelClsCount==0)
      {
        alert("No class was selected.");
        return;
      }
      if(!confirm("Are you sure to delete the selected class?"))
      {
        return;
      }
      Del_Flag.value = "1";
      document.ConfigForm.submit();
      showLoading();
    }
  }
  function QoSAllDelSubmit()
  {
    document.ConfigForm.Del_Flag.value = "2";
    document.ConfigForm.submit();
    showLoading();
  }
  </script>
</body>

</html>
