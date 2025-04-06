<%

if Request_Form("IPV4_Flag") = "1" then
  
  TCWebApi_constSet("Account_Entry0","Logged","0")
  TCWebApi_constSet("Account_Entry0","Logoff","1")
  TCWebApi_constSet("Account_Entry1","Logged","0")
  TCWebApi_constSet("Account_Entry1","Logoff","1")
  TCWebApi_constSet("Account_Entry2","Logged","0")
  TCWebApi_constSet("Account_Entry2","Logoff","1")

  TCWebApi_set("Lan_Dhcp","type","dhcpSrvType")
  TCWebApi_commit("Lan")
  
  if Request_Form("dhcpSrvType") = "0" then
    TCWebApi_unset("DhcpRelay_Entry")
    tcWebApi_constSet("Dhcpd_Common","dns_relay","0")
    TCWebApi_commit("Dhcpd_Common")
  end if
  
  if Request_Form("dhcpSrvType") = "1" then
    TCWebApi_set("Dhcpd_Common","lease","dhcpLeasedTimeFrag")
    TCWebApi_set("Dhcpd_Common","start","dhcpEthStartIp")
    TCWebApi_set("Dhcpd_Common","pool_count","EthendIPcount")
    TCWebApi_set("Dhcpd_Common","dns_relay","dnsTypeRadio")
    
    TCWebApi_unset("DhcpRelay_Entry")
    TCWebApi_commit("Dhcpd_Common")
  end if
  
  if Request_Form("dhcpSrvType") = "2" then
    TCWebApi_set("DhcpRelay_Entry","Server","dhcpRelayServerIP")
    TCWebApi_commit("DhcpRelay_Entry")
    tcWebApi_constSet("Dhcpd_Common","dns_relay","0")
    TCWebApi_commit("Dhcpd_Common")
  end if
  
  
  TCWebApi_set("Dproxy_Entry","type","dnsType")
  if Request_Form("dnsType") = "1" then
    TCWebApi_set("Dproxy_Entry","Primary_DNS","PrimaryDNS")
    TCWebApi_set("Dproxy_Entry","Secondary_DNS","SecondaryDNS")
  end if
  
  TCWebApi_commit("Dproxy_Entry")	
  TCWebApi_save()
  
end if

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Service - DHCP</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
</head>
<body onload="init()">
  <!-- content -->
  <div class="container-full container-resize-height" >
    <FORM name="ConfigForm" action="/cgi-bin/true-page/service/service-dhcp.asp" method="post">
      <input type="hidden" name="StartIPTmp" value="0" >
      <input type="hidden" name="EndIPTmp" value="0" >
      <div class="title-text">DHCP Setting</div>
      <div class="title-description-text">This page is used to configure DHCP Server and DHCP Relay.</div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">DHCP Mode:</div>
        </div>
        <div class="col-6">
          <INPUT id="dhcpSrvType1" type=radio value="0" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") end if %>>
          <label class="input-radio">None</label>
          <INPUT id="dhcpSrvType2" type=radio value="2" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "2" then asp_Write("checked") end if %>> 
          <label class="input-radio">DHCP Relay</label>
          <INPUT id="dhcpSrvType3" type=radio value="1" name="dhcpSrvType" <%if tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if %>> 
          <label class="input-radio">DHCP Server</label>
		  <INPUT id="dhcpSrvType4" type=radio value="3" name="dhcpCliType" disabled>
		  <label class="input-radio">DHCP Client</label>
        </div>
      </div>
      <hr>
      <div class="row p-1 element-hide" id="DhcprelayIP">
        <div class="col-6">
          <div class="title-text-left">Relay Server IP:</div>
        </div>
        <div class="col-6">
          <input class="form-control input-textfield" type="text" name="dhcpRelayServerIP" id="dhcpRelayServerIP" value="<% if tcWebApi_get("DhcpRelay_Entry","Server","h") <> "N/A" then tcWebApi_get("DhcpRelay_Entry","Server","s") end if %>">
        </div>
      </div>
        
      <div id="dhcpserver" class="element-hide">
        <div class="row p-1">
          <div class="col-12">
            <div class="title-text-left">Enabled the DHCP Server if you are using this device as a DHCP Server. </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-12">
            <div class="title-text-left">LAN IP Address: <% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %> 
              &nbsp;&nbsp;&nbsp;&nbsp;Subnet Mask: <% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) end if %>
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">IP Pool Range:</div>
          </div>
          <div class="col-6">
            <div class="row" style="margin-left: 0px;">
              <div class="title-text-right pr5" id="ipstr1">192.168.1.</div>
              <input class="form-control input-textfield" style="width: 15% !important;" type="text" id="starip">
              <div class="title-text-right pr5 pl5" id="ipstr2">- 192.168.1.</div>
              <input class="form-control input-textfield" style="width: 15% !important;" type="text" id="endip">&nbsp;&nbsp;
              <a class="btn-file btn-a" style="height: 30px;" href="/cgi-bin/true-page/status/status-lan.asp">Show Client</a>
            </div>
            <div class="row">
            <input type="hidden" name="IPV4_Flag" value="0">
            <input type="hidden" name="EthendIPcount" value="100">
            <input type="hidden" name="dhcpEthStartIp" value="<%tcWebApi_get("Dhcpd_Common","start","h")%>">
            </div>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Max Lease Time:</div>
          </div>
          <div class="col-3">
            <input class="form-control input-textfield" type="text" name='dhcpLeasedTimeFrag' id='dhcpLeasedTimeFrag' value="<% if tcWebApi_get("Dhcpd_Common","lease","h") <> "N/A" then tcWebApi_get("Dhcpd_Common","lease","s") end if %>">
          </div>
          <div class="col-3 left">
            <label class="input-radio" style="  line-height: 24px; margin-bottom: 0px;">seconds</label>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Domain Name:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" disabled>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Gateway Address:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" type="text" value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) end if %>" disabled>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">DNS Relay:</div>
          </div>
          <div class="col-6">
            <input TYPE="radio" name="dnsTypeRadio" VALUE="0" <%If tcWebApi_get("Dhcpd_Common","dns_relay","h") = "0" then asp_Write("checked") end if%> >
            <label class="input-radio">Enable</label>
            <input TYPE="radio" name="dnsTypeRadio" VALUE="1" <%If tcWebApi_get("Dhcpd_Common","dns_relay","h") = "1" then asp_Write("checked") end if%> >
            <label class="input-radio">Disable</label>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">DNS:</div>
          </div>
          <div class="col-6">
            <input TYPE="radio" id="dnsType1" name="dnsType" VALUE="0" <%If tcWebApi_get("Dproxy_Entry","type","h") = "0" then asp_Write("checked") end if%> >
            <label class="input-radio">Auto</label>
            <input TYPE="radio" id="dnsType2" name="dnsType" VALUE="1" <%If tcWebApi_get("Dproxy_Entry","type","h") = "1" then asp_Write("checked") end if%> >
            <label class="input-radio">Manual</label>
          </div>
        </div>
        
        <div id="dnsManualDiv" class="element-hide">
          <div class="row p-1">
            <div class="col-6" id="Primary_DNS_Server" >
              <div class="title-text-left" >Primary DNS Server:</div>
            </div>
            <div class="col-3" id="PrimaryDNS_tr" >
              <input class="form-control input-textfield" name="PrimaryDNS" id="PrimaryDNS" type="text" value="<% if tcWebApi_get("Dproxy_Entry","Primary_DNS","h") <> "N/A" then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") end if %>">
            </div>
            <div class="col-3 left" id="redstar1" >
              <strong style="color: #ff0033">*</strong> 
            </div>
          </div>
          
          <div class="row p-1">	
            <div class="col-6" id="Secondary_DNS_Server" >
              <div class="title-text-left" >Secondary DNS Server:</div>
            </div>
            <div class="col-3" id="SecondaryDNS_tr">
              <input class="form-control input-textfield" name="SecondaryDNS" id="SecondaryDNS" type="text" value="<% if tcWebApi_get("Dproxy_Entry","Secondary_DNS","h") <> "N/A" then tcWebApi_get("Dproxy_Entry","Secondary_DNS","s") end if %>">
            </div>
            <div class="col-3 left" id="redstar2">
              <strong style="color: #ff0033">*</strong> 
            </div>
          </div>
        </div>
      </div>
      
      <div class="mt-2 center">
		<div id="divid1" class="element-hide">
			<button type="button" class="btn-dashboard" onclick="btnSaveIPv4()">Apply</button>
			<a class="btn-file btn-a" style="height: 35px;" href="/cgi-bin/true-page/service/port-base-filter.asp">Port-Based Filter</a>
			<a class="btn-file btn-a" style="height: 35px;" href="/cgi-bin/true-page/service/mac-base-assignment.asp">MAC-Based Assignment</a>
		</div>
		<div id="divid2" class="element-hide">
			<button type="button" class="btn-dashboard" onclick="btnSaveIPv4()">Apply</button>
		</div>
      </div>
    </form>
  </div>
  <!-- content -->
  <script language="JavaScript" type="text/JavaScript">

  var dhcpEthStart = 0, dhcpEthEnd = 0;
  var ethIpAddress = '<% tcWebApi_get("Lan_Entry","IP","s") %>';

  $(document).ready(function() {
    $('input[type=radio][name=dnsType]').change(function() {
      if (this.value == 0) {
        if($('#dnsManualDiv').hasClass('element-show'))
          $('#dnsManualDiv').removeClass('element-show').addClass('element-hide');
      }
      else if (this.value == 1) {
        if($('#dnsManualDiv').hasClass('element-hide'))
          $('#dnsManualDiv').removeClass('element-hide').addClass('element-show');
      }
    });

    $('input[type=radio][name=dhcpSrvType]').change(function() {
      if (this.value == 2) { //dhcp relay
        if($('#DhcprelayIP').hasClass('element-hide'))
          $('#DhcprelayIP').removeClass('element-hide').addClass('element-show');
        $("#dhcpRelayServerIP").focus();
        if($('#dhcpserver').hasClass('element-show'))
          $('#dhcpserver').removeClass('element-show').addClass('element-hide');
        getElById('dhcpRelayServerIP').focus();
		
		if($('#divid1').hasClass('element-show'))
		  $('#divid1').removeClass('element-show').addClass('element-hide');
		if($('#divid2').hasClass('element-hide'))
		  $('#divid2').removeClass('element-hide').addClass('element-show');
      }
      else if (this.value == 1) { //dhcp enable
        if($('#DhcprelayIP').hasClass('element-show'))
          $('#DhcprelayIP').removeClass('element-show').addClass('element-hide');
        if($('#dhcpserver').hasClass('element-hide'))
          $('#dhcpserver').removeClass('element-hide').addClass('element-show');
		  
		  if($('#divid1').hasClass('element-hide'))
		    $('#divid1').removeClass('element-hide').addClass('element-show');
		  if($('#divid2').hasClass('element-show'))
		    $('#divid2').removeClass('element-show').addClass('element-hide');
      }else{
        if($('#DhcprelayIP').hasClass('element-show'))
          $('#DhcprelayIP').removeClass('element-show').addClass('element-hide');
        if($('#dhcpserver').hasClass('element-show'))
          $('#dhcpserver').removeClass('element-show').addClass('element-hide');
		  
		 if($('#divid1').hasClass('element-show'))
		   $('#divid1').removeClass('element-show').addClass('element-hide');
		 if($('#divid2').hasClass('element-hide'))
		   $('#divid2').removeClass('element-hide').addClass('element-show');
      }
    });
  });
    
  function isEndGTEStart(EndIp, StartIp)
  {
    addrEnd = EndIp.split('.');
    addrStart = StartIp.split('.');
    E = parseInt(addrEnd[3]) + 1;
    S = parseInt(addrStart[3]) + 1;
    if (E < S)
      return false;
    return true;
  }
  
  
  function CheckForm()
  {
    with(document.forms[0])
    {
      if (dhcpSrvType[2].checked == true) //dhcp enable
      {
        //dhcpLeasedTimeFrag
        if ( dhcpLeasedTimeFrag.value == "" || !isInteger(dhcpLeasedTimeFrag.value))
        {
            alert('"' + dhcpLeasedTimeFrag.value + '"' + ' can only be numbers.');
            window.setTimeout( function(){ dhcpLeasedTimeFrag.focus(); }, 0);
            dhcpLeasedTimeFrag.value = "<% tcWebApi_get("Dhcpd_Common","lease","s") %>";
            return false;
        }

        dhcpEthStart = $("#ipstr1").text() + starip.value;
        dhcpEthEnd = $("#ipstr1").text() + endip.value;
        $("input[name='StartIPTmp']").val(dhcpEthStart);
        $("input[name='EndIPTmp']").val(dhcpEthEnd);

        if (!(isEndGTEStart(dhcpEthEnd, dhcpEthStart)))
        {
          alert("End IP address must be equal to or greater than the Start IP address.");
          return false;
        }
        if (dhcpEthStart == ethIpAddress)
        {
          alert("Start IP address must not be same with IP of the route.");
          return false;
        }
        if (dhcpEthEnd == ethIpAddress)
        {
          alert("End IP address must not be same with IP of the route.");
          return false;
        }
        if (!checkIpAddress(document.ConfigForm.StartIPTmp, false))
          return false;
        if (!checkIpAddress(document.ConfigForm.EndIPTmp, false))
          return false;
        
      }
      
      if ( dhcpSrvType[1].checked == true ) //dhcp relay
      {
        if(dhcpRelayServerIP.value == "" )
        {
          alert("Please input dhcp relay server IP.");
          return false;
        }

        if (!checkIpAddress(document.ConfigForm.dhcpRelayServerIP, false))
          return false;
      }
      
    }
    
    return true;
  }

  function checkDnsServer()
  {
    dnsTypeVal = $('input[type=radio][name=dnsType]:checked').val();
    console.log("dnsTypeVal: " + dnsTypeVal);
    if(1 == dnsTypeVal){//Manual
      if($("#PrimaryDNS").val() == $("#SecondaryDNS").val()){
          alert('Secondary DNS cannot be the same as Primary DNS!');
          return false;
      }

      if (!checkIpAddress(document.ConfigForm.PrimaryDNS, false))
        return false;
      if($("#SecondaryDNS").val() != ""){
        if (!checkIpAddress(document.ConfigForm.SecondaryDNS, false))
          return false;
      }
    }

    return true;
  }


  function GetEndSubStartCount(EndIp, StartIp)
  {
    var vret;
    addrEnd = EndIp.split('.');
    addrStart = StartIp.split('.');
    E = parseInt(addrEnd[3]) + 1;
    S = parseInt(addrStart[3]);
    vret = E - S;
    return vret;
  }

    
  function btnSaveIPv4()
  {
    if(CheckForm() == false)
      return false;
    
    if(checkDnsServer() == false)
      return false;

    var	vForm = document.ConfigForm;
    
    dhcpEthStart = $("#ipstr1").text() + starip.value;
    dhcpEthEnd = $("#ipstr1").text() + endip.value;
    
    vForm.EthendIPcount.value = GetEndSubStartCount(dhcpEthEnd, dhcpEthStart);

    vForm.IPV4_Flag.value = "1";
    vForm.dhcpEthStartIp.value = dhcpEthStart;
      
    vForm.submit();
    showLoading();
  }
    
  function getdhcp_st_ip_char()
  {
    var dhcp_st_ip_str = '<% tcWebApi_get("Dhcpd_Common","start","s") %>';
    var pool_count = '<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>';

    var end_ip_ch = 0;
    var arr=new Array();

    arr=dhcp_st_ip_str.split('.');

    $("#ipstr1").text(arr[0]+'.'+arr[1]+'.'+arr[2]+'.');
    $("#ipstr2").text('- ' + arr[0]+'.'+arr[1]+'.'+arr[2]+'.');
    
    $("#starip").val(arr[3]);

    end_ip_ch = parseInt(arr[3]) + parseInt(pool_count) - 1;
    $("#endip").val(end_ip_ch);
  }

    
  function init()
  {
    var dSrvType = '<% tcWebApi_get("Lan_Dhcp","type","s") %>';
    var dnsmode = '<% tcWebApi_get("Dproxy_Entry","type","s") %>';
    
    getdhcp_st_ip_char();
    
    if(dSrvType == 1){//DHCP Server
      if($('#DhcprelayIP').hasClass('element-show'))
        $('#DhcprelayIP').removeClass('element-show').addClass('element-hide');
        
      if($('#dhcpserver').hasClass('element-hide'))
        $('#dhcpserver').removeClass('element-hide').addClass('element-show');
		
		if($('#divid1').hasClass('element-hide'))
		  $('#divid1').removeClass('element-hide').addClass('element-show');
		if($('#divid2').hasClass('element-show'))
		  $('#divid2').removeClass('element-show').addClass('element-hide');
    }else if(dSrvType == 2){//DHCP Relay
      if($('#dhcpserver').hasClass('element-show'))
        $('#dhcpserver').removeClass('element-show').addClass('element-hide');

      if($('#DhcprelayIP').hasClass('element-hide'))
        $('#DhcprelayIP').removeClass('element-hide').addClass('element-show');
        
      $("#dhcpRelayServerIP").focus();
	  
	  if($('#divid1').hasClass('element-show'))
	    $('#divid1').removeClass('element-show').addClass('element-hide');
	  if($('#divid2').hasClass('element-hide'))
	    $('#divid2').removeClass('element-hide').addClass('element-show');
    }else{
      if($('#dhcpserver').hasClass('element-show'))
        $('#dhcpserver').removeClass('element-show').addClass('element-hide');

      if($('#DhcprelayIP').hasClass('element-show'))
        $('#DhcprelayIP').removeClass('element-show').addClass('element-hide');
		
		if($('#divid1').hasClass('element-show'))
		  $('#divid1').removeClass('element-show').addClass('element-hide');
		if($('#divid2').hasClass('element-hide'))
		  $('#divid2').removeClass('element-hide').addClass('element-show');
    }

    if( dnsmode == '1')
    {
      if($('#dnsManualDiv').hasClass('element-hide'))
        $('#dnsManualDiv').removeClass('element-hide').addClass('element-show');
    }
  }

  </script>
</body>

</html>