<%
If request_Form("VoIP_AppBtn_flag")="1" then
	tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "1")
	if tcWebApi_get("VoIPBasic_Entry1", "Enable", "h") = "Yes"  then
		if tcWebApi_get("VoIPSysParam_Entry1", "SC_LINE_INFO_STATUS", "h") <> "Idle"  then 
			tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "0")
		end if
	end if

	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
		tcWebApi_set("VoIPBasic_Common", "SIPProtocol", "sipMode")
		tcWebApi_set("VoIPAdvanced_Common","CurIFName","ifName")
		tcWebApi_set("VoIPAdvanced_Common","CurIFIndex","curSetIndex")
		tcWebApi_set("VoIPAdvanced_Common", "SIPDomain", "dareSipDomain")
		tcWebApi_set("VoIPBasic_Common", "RegistrarServer", "regAddr")
		tcWebApi_set("VoIPBasic_Common", "RegistrarServerPort", "regPort")
		tcWebApi_set("VoIPBasic_Common", "SBRegistrarServer", "regAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBRegistrarServerPort", "regPort2")	

		tcWebApi_set("VoIPBasic_Common", "SIPProxyAddr", "proxyAddr")
		tcWebApi_set("VoIPBasic_Common", "SIPProxyPort", "proxyPort")
		tcWebApi_set("VoIPBasic_Common", "SBSIPProxyAddr", "proxyAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBSIPProxyPort", "proxyPort2")
		if tcWebApi_get("WebCustom_Entry", "isCTPONC9Supported", "h") = "Yes"  then
			tcWebApi_set("VoIPBasic_Common", "SIPOutboundProxyEnable", "obProxyEn_flag")
		end if
		tcWebApi_set("VoIPBasic_Common", "SIPOutboundProxyAddr", "obProxyAddr")
		tcWebApi_set("VoIPBasic_Common", "SIPOutboundProxyPort", "obProxyPort")
		tcWebApi_set("VoIPBasic_Common", "SBOutboundProxyAddr", "obProxyAddr2")
		tcWebApi_set("VoIPBasic_Common", "SBOutboundProxyPort", "obProxyPort2")			
			
		If tcWebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then
			tcWebApi_constSet("VoIPBasic_Entry1", "Enable", "Yes")
			tcWebApi_set("VoIPBasic_Entry1", "SIPAuthenticationName", "authName1")
			tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayName", "authName1")
			tcWebApi_set("VoIPBasic_Entry1", "SIPPassword", "password1")		
		End If		
		if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "IMSSIP" then
			
			If tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") <> "Yes"  then
			tcWebApi_constSet("VoIPAdvanced_Common", "SubscribeType", "1")
			End if
			If tcWebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then
				tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayName", "extension1")
				tcWebApi_set("VoIPBasic_Entry1", "SIPDisplayNumber", "dispName1")
			End If		
		end if	
		if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then
			If tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") <> "Yes"  then
			tcWebApi_constSet("VoIPAdvanced_Common", "SubscribeType", "0")
			End If
		end if	
	
		tcWebApi_set("VoIPBasic_Common", "LocalSIPPort", "lclSIPPort")
		tcWebApi_set("VoIPBasic_Common", "LocalRTPPort", "lclRTPPort")
		tcWebApi_set("VoIPAdvanced_Common", "RegistrationExpire", "regExpTmr")
		tcWebApi_set("VoIPAdvanced_Common", "CallSynEnAutoSwitch", "autoSynPhoneDateSwitchFlag")
		tcWebApi_set("VoIPAdvanced_Common", "DTMFTransportMode", "dtmfRelay")
		if request_Form("dtmfRelay") = "RFC2833" then
			tcWebApi_set("VoIPBasic_Common", "TelephoneEventPayloadType", "rfc2833pt")
		end if
		tcWebApi_set("VoIPCallCtrl_Entry1", "SIPCallWaitingEnable", "callwait1Flag")
		tcWebApi_set("VoIPCallCtrl_Entry1", "SIPCallTransfer", "transfer1Flag")
		tcWebApi_set("VoIPCallCtrl_Entry1", "SIP3wayConf", "threepartyservice1Flag")
		tcWebApi_set("VoIPCallCtrl_Entry1", "conference-uri", "conf-uri")	
		tcWebApi_set("VoIPDigitMap_Entry", "DigitMapEnable", "DigitMapEnableFlag")
		tcWebApi_set("VoIPAdvanced_Common", "rtpRedundantEnable", "siprtpredundancyflag")
		tcWebApi_set("VoIPAdvanced_Common", "rtpRedundantPT", "siprtpredundancypt")
	
		if Request_Form("isMultiDigitMap") = "1" then
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap1", "DigitMap1")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap2", "DigitMap2")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap3", "DigitMap3")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap4", "DigitMap4")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap5", "DigitMap5")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap6", "DigitMap6")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap7", "DigitMap7")	
			tcWebApi_set("VoIPDigitMap_Entry", "DigitMap8", "DigitMap8")	
		else
		tcWebApi_set("VoIPAdvanced_Common", "DialPlan", "dialPlan")
		end if
		
		tcWebApi_commit("VoIPBasic")
		tcWebApi_save()
	end if
	
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>VoIP - Port1</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
  <SCRIPT language=JavaScript type="text/javascript">
	function showRegisterState(port)
	{
		var Status = '';
		var LineEnable='';
		var RegFailReason = '';
		
		if ( 1 == port ){
		  Status = "<% tcWebAPI_get("InfoVoIP_Entry0", "Status", "s") %>";
		  LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry0", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry0", "Enable", "s") else asp_Write("") end if %>';
		  RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry0", "RegFailReason", "s") %>";
		}
	  <% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		else if ( 2 == port ){
		  Status = "<% tcWebAPI_get("InfoVoIP_Entry1", "Status", "s") %>";
		  LineEnable = '<%if tcWebAPI_get("VoIPBasic_Entry1", "Enable", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "Enable", "s") else asp_Write("") end if %>';
		  RegFailReason = "<% tcWebAPI_get("InfoVoIP_Entry1", "RegFailReason", "s") %>";
	  }
	  <% end if %>
		else
		  return;
		if(LineEnable == 'No'){
				return 'Disable';
		};
		if ( Status == 'Up' )
				return 'Registered';
		else if ( Status == 'Initializing' )
				return 'Initializing';
		else if ( Status == 'Registering' )
				return 'Registering';
		else if ( Status == 'Unregistering' )
				return 'Unregistering';
		else if ( Status == 'Quiescent' )
				return 'Quiescent';
		else if ( Status == 'Disabled' )
				return 'Disable';
		else if ( Status == 'Error' ){
			switch ( parseInt(RegFailReason) ){
				case 2:
				case 3:
					voiptatus = 'Network (SBC) is not reachable';
					break;
				case 4:
					voiptatus = 'Authentication failed';
					break;
				case 6:
					voiptatus = 'Business channel abnormal';
					break;				
				default:
					voiptatus = 'Error';
					break;
			}
			return voiptatus;		
			}
		else if ( Status == 'Testing' )
				return 'Testing';
		else
				return '--';
	}
	
	
	function dtmfRelayChange(o){
	  var idx = o.selectedIndex;
	  var val = o.options[idx].value;
	  if ( val == "RFC2833" ){
			document.getElementById("trRFC2833PT").style.display = "";
	  }
	  else{
			document.getElementById("trRFC2833PT").style.display = "none";
	  }
	}
	
	function limitNum(o)
	{
		if (o.value != "")
		{
			if (!isInteger(o.value))
			{
				alert('"' + o.value + '"' + ' can only be numbers.');	
				window.setTimeout( function(){ o.focus(); }, 0);
			}
		}
	}
	
	function checkPort(o)
	{
		if (o.value != "")
		{
			if (!isInteger(o.value) || !isValidPort(o.value))
			{
				alert('"' + o.value + '"' + ' is invalid port.');	
				window.setTimeout( function(){ o.focus(); }, 0);
			}
		}
	}
	
	function doCheckSelect(obj,gid){
		if (obj.checked)
		{
			var sid="callwait" + gid;
			setCheck(sid,0);
			sid="fwdBusy" + gid;
			setCheck(sid,0);
			sid="fwdNoAns" + gid;
			setCheck(sid,0);
			sid="fwdAll" + gid;
			setCheck(sid,0);
			obj.checked = true;
		}
	}

	function CheckDigitMapEnable(cbCtl)
	{   
		if (cbCtl.checked == true)
		{
			setDisplay('sec_DigitMap',1);
		}
		else
		{
			setDisplay('sec_DigitMap',0);
		}
	}
	
	function curIndexUpdate()
	{
		var pvc_counts = <% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>;
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "WanName", "s") %>";
		var indexArrayStr = "<% tcWebApi_get("WanInfo_Common", "ValidIFIndex", "s") %>";
		var Wan_WanName = vArrayStr.split(',');
		var Voip_WanIndex = indexArrayStr.split(',');

		for (var i = 0;i < pvc_counts;i++)
		{
			if(Wan_WanName[i]==document.ConfigForm.ifName.value) 
			{
				document.ConfigForm.curSetIndex.value = Voip_WanIndex[i]; 
			}
		}
	}

	function printInterfaceListBox()
	{
		var pvc_counts = <% tcWebApi_get("WanInfo_Common", "CycleNum", "s") %>;
		var vArrayStr = "<% tcWebApi_get("WanInfo_Common", "WanName", "s") %>";
		var Voip_WanName = "<% tcWebApi_get("VoIPAdvanced_Common", "CurIFName", "s") %>";
		var Wan_WanName = vArrayStr.split(',');
			vArrayStr = "<% tcWebApi_get("WanInfo_Common", "WanPvcIndex", "s") %>";
		var pvcIndex = vArrayStr.split(',');
			vArrayStr = "<% tcWebApi_get("WanInfo_Common", "WanEntryIndex", "s") %>";
		var entryIndex = vArrayStr.split(',');
		for (var i = 0;i < pvc_counts;i++)
		{
			if (Wan_WanName[i].indexOf('_VOICE_') > -1 && Wan_WanName[i].indexOf('_R_') > -1)
			{
				if(pvcIndex[i]==2 && entryIndex[i]==1 ) 
				{
					document.writeln("<option value=\"" + Wan_WanName[i] + "\" selected>"+Wan_WanName[i]+"");
				}	
				else if(Wan_WanName[i]==Voip_WanName)
				{
					document.writeln("<option value=\"" + Wan_WanName[i] + "\" selected>"+Wan_WanName[i]+"");
				}	
				else
					document.writeln("<option value=\"" + Wan_WanName[i] + "\">"+Wan_WanName[i]+"");
			}	
		}

		curIndexUpdate();
	}
	
	
	

	<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
	function getDigitMapValue()
	{
		if(document.getElementById("DigitMap1").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value;
		}
		else if(document.getElementById("DigitMap2").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + document.getElementById("DigitMap2").value;
		}else if(document.getElementById("DigitMap3").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value;
		}else if(document.getElementById("DigitMap4").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value +
																									document.getElementById("DigitMap4").value;
		}else if(document.getElementById("DigitMap5").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value +
																									document.getElementById("DigitMap4").value +
																									document.getElementById("DigitMap5").value;
		}else if(document.getElementById("DigitMap6").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value +
																									document.getElementById("DigitMap4").value + 
																									document.getElementById("DigitMap5").value +
																									document.getElementById("DigitMap6").value;
		}else if(document.getElementById("DigitMap7").value.length < 512){
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value +
																									document.getElementById("DigitMap4").value +
																									document.getElementById("DigitMap5").value + 
																									document.getElementById("DigitMap6").value +
																									document.getElementById("DigitMap7").value;
		}else{
			document.getElementById("dialPlan").value = document.getElementById("DigitMap1").value + 
																									document.getElementById("DigitMap2").value +
																									document.getElementById("DigitMap3").value +
																									document.getElementById("DigitMap4").value +
																									document.getElementById("DigitMap5").value + 
																									document.getElementById("DigitMap6").value + 
																									document.getElementById("DigitMap7").value +
																									document.getElementById("DigitMap8").value;
		}		

	}
	
	function setDigitMapValue()
	{
		var len = document.getElementById("dialPlan").value.length;
		var num = len/512;

		if(len > 4096){
			alert("Dial plan must be less than 4096 bytes!!!");
			return -1;
		}
		
		if(num < 1){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value;
			document.getElementById("DigitMap2").value = "";
		}else if(num < 2){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512);		
			document.getElementById("DigitMap3").value = "";
		}else if(num < 3){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2);
			document.getElementById("DigitMap4").value = "";
		}else if(num < 4){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
			document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3);
			document.getElementById("DigitMap5").value = "";
		}else if(num < 5){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
			document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
			document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4);
			document.getElementById("DigitMap6").value = "";
		}else if(num < 6){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
			document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
			document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
			document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5);
			document.getElementById("DigitMap7").value = "";
		}else if(num < 7){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
			document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
			document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
			document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5,512*6);
			document.getElementById("DigitMap7").value = document.getElementById("dialPlan").value.substring(512*6);
			document.getElementById("DigitMap8").value = "";
		}else if(num <= 8){
			document.getElementById("DigitMap1").value = document.getElementById("dialPlan").value.substring(0,512);
			document.getElementById("DigitMap2").value = document.getElementById("dialPlan").value.substring(512,512*2);
			document.getElementById("DigitMap3").value = document.getElementById("dialPlan").value.substring(512*2,512*3);
			document.getElementById("DigitMap4").value = document.getElementById("dialPlan").value.substring(512*3,512*4);
			document.getElementById("DigitMap5").value = document.getElementById("dialPlan").value.substring(512*4,512*5);
			document.getElementById("DigitMap6").value = document.getElementById("dialPlan").value.substring(512*5,512*6);
			document.getElementById("DigitMap7").value = document.getElementById("dialPlan").value.substring(512*6,512*7);
			document.getElementById("DigitMap8").value = document.getElementById("dialPlan").value.substring(512*7);
		}

	   return 0;
	}
	<%end if%>

	
	var sm = "<%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then asp_Write("1") else asp_Write("0") end if %>";
	function enableEditBoxes()
	{
	   if ( sm == "1" )
	   {
			document.getElementById('edit_dareSipDomain').style.display = "none";
			document.getElementById('edit_telnumber').style.display = "none";
			document.getElementById('edit_displayname').style.display = "none";    	
		}
		else
		{
			document.getElementById('edit_dareSipDomain').style.display = "";
			document.getElementById('edit_telnumber').style.display = "";
			document.getElementById('edit_displayname').style.display = "";    	
	 
		}
	}
	
	function lineStatus()
	{
		var form = document.ConfigForm;
		<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
		<%if tcWebAPI_get("VoIPBasic_Entry1", "Enable", "h") = "Yes" then %>
			form.authName1.disabled = false;
			form.password1.disabled = false;
			form.extension1.disabled = false;
			form.dispName1.disabled = false;
		<% else %>
			form.authName1.disabled = true;
			form.password1.disabled = true;
			form.extension1.disabled = true;
			form.dispName1.disabled = true;
		<% end if %>
		<% end if %>
	
	}
	
	function proClick(obj) {
		var idx = obj.selectedIndex;
		var val = obj.options[idx].value;
		if ( val == "SIP" )
		{
			sm = '1';
		}
	<% if tcWebApi_get("WebCustom_Entry", "isCTCUCSIPH248Supported", "h") = "Yes"  then %>
		else if ( val == "H.248" )
		{
			location.replace("/cgi-bin/app-VoIP248.asp?isLocation=1");
		}
	<% end if %>
		else
		{
			sm = '0';	
		}
		
		enableEditBoxes();
	}

	function on_load()
	{
		with ( document.ConfigForm ) 
		{
			enableEditBoxes();
			 //auto fill input problem			
			
			if ( "RFC2833" == "<%tcWebApi_get("VoIPAdvanced_Common", "DTMFTransportMode", "s") %>"){
				document.getElementById("trRFC2833PT").style.display = "";
			}
			else{
				document.getElementById("trRFC2833PT").style.display = "none";
			}
		
			<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
			getDigitMapValue();
		
			<%end if%>
			CheckDigitMapEnable(getElById('cb_DigitMapEnable'));
			getElById('txt_DigitMap').value=getElById('dialPlan').value;
			
			<% if tcWebApi_get("WebCustom_Entry", "isCTSCSupported", "h") = "Yes"  then %>	
			<% if tcwebApi_get("WanInfo_Common","NoGUIAccessLimit","h" ) <> "1" then %>
				getElById('txt_DigitMap').disabled = true;
			<% end if %>
			<%end if%>			
		}
	}
	
	
  </script>
</head>

<body onload="on_load()">
  <!-- content -->
  <div class="container-full container-resize-height">
   <FORM id=ConfigForm name="ConfigForm" action="/cgi-bin/true-page/vo-ip/port1.asp" method="post">
		<input type='hidden' name="VoIP_AppBtn_flag" value="0">
		<input type='hidden' value='0' name="DigitMapEnableFlag">
		<input type='hidden' value='0' name="siprtpredundancyflag">
		<input type='hidden' value='0' name="callwait1Flag">
		<input type='hidden' value='No' name="transfer1Flag">
		<input type='hidden' value='No' name="threepartyservice1Flag">
		
		<input type="hidden" name="isMultiDigitMap" value="<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
		<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
		<input type='hidden' id='DigitMap1' name="DigitMap1" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap1", "s")%>">
		<input type='hidden' id='DigitMap2' name="DigitMap2" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap2", "s")%>">
		<input type='hidden' id='DigitMap3' name="DigitMap3" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap3", "s")%>">
		<input type='hidden' id='DigitMap4' name="DigitMap4" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap4", "s")%>">
		<input type='hidden' id='DigitMap5' name="DigitMap5" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap5", "s")%>">
		<input type='hidden' id='DigitMap6' name="DigitMap6" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap6", "s")%>">
		<input type='hidden' id='DigitMap7' name="DigitMap7" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap7", "s")%>">
		<input type='hidden' id='DigitMap8' name="DigitMap8" value="<%tcWebAPI_get("VoIPDigitMap_Entry", "DigitMap8", "s")%>">
		<% end if%>
		<div class="title-text">Port1 Configuration</div>
		<div class="title-description-text">This page is used to configure Port1.</div>
		 <div style="display:none">
			<input type="hidden" name="curSetIndex" value="<%if tcWebApi_get("VoIPAdvanced_Common", "CurIFIndex", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "CurIFIndex", "s") else asp_Write("") end if %>">
			<select name="ifName" onChange="curIndexUpdate()" size="1" disabled=true>
			  <script TYPE="text/javascript">
				 printInterfaceListBox()
			  </script>
			</select>
			<b>(Notice:Reboot to make change effective.)</b>
	   </div>
	   
		<div class="row p-1" style="display:none">
			<div class="col-6">
			Dial Plan:
			</div>
			<div class="col-6">
			<% if tcWebApi_get("WebCustom_Entry","isMultiDigitMap","h") = "Yes" then %>
			<input type='text' name='dialPlan' id='dialPlan' value="">
			<% else %>
			<input type='text' name='dialPlan' value="<%if tcWebApi_get("VoIPAdvanced_Common", "DialPlan", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "DialPlan", "s") else asp_Write("") end if %>">
			<%end if%>
			</div>
		</div>
		
	  <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Protocol:</div>
          </div>
          <div class="col-6">
              <select name="sipMode" id="mg_regist" class="form-control input-select"  onChange="proClick(this)">
				<option value="IMSSIP" <%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "IMSSIP" then asp_Write("selected") end if %>>IMS SIP</option>
				<option value="SIP" <%if tcWebApi_get("VoIPBasic_Common", "SIPProtocol", "h") = "SIP" then asp_Write("selected") end if %>>SIP</option>
			  </select>
          </div>
      </div>
	  
	  <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left"></div>
          </div>
          <div class="col-6">
		  <div class="title-text-right">If you switch VoIP protocols, please restart.</div>
		  </div>
      </div>
		
		
	  <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Registration Server:</div>
          </div>
          <div class="col-6">
             <input type='text' class="form-control input-textfield" name='regAddr'  VALUE="<%if tcWebApi_get("VoIPBasic_Common", "RegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServer", "s") else asp_Write("") end if %>">
          </div>
      </div>
	  <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Registration Server Port:</div>
          </div>
          <div class="col-6">
             <input type='text' class="form-control input-textfield" name='regPort' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "RegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "RegistrarServerPort", "s") else asp_Write("") end if %>">
          </div>
      </div>	  
	  <div class="row p-1" ID="edit_regAddr2">
          <div class="col-6">
              <div class="title-text-left">Standby Registration Server:</div>
          </div>
          <div class="col-6">
             <input type='text' class="form-control input-textfield" name='regAddr2'  VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServer", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServer", "s") else asp_Write("") end if %>">
          </div>
      </div>
	  <div class="row p-1" ID="edit_regPort2">
          <div class="col-6">
              <div class="title-text-left">Standby Registration Port:</div>
          </div>
          <div class="col-6">
             <input type='text' class="form-control input-textfield" name='regPort2' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SBRegistrarServerPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SBRegistrarServerPort", "s") else asp_Write("") end if %>">
          </div>
      </div>
		
      <br>
      <div class="title-text">Pots1</div>
      <div class="row p-1" id="edit_telnumber">
          <div class="col-6">
              <div class="title-text-left">Display Name:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" name='extension1' size=20 maxlength=64 value="<% tcWebApi_get("VoIPBasic_entry1","SIPDisplayName","s") %>">
          </div>
      </div>
      <div class="row p-1" id="edit_displayname" >
          <div class="col-6">
              <div class="title-text-left">Number:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" size=20 maxlength=128 name='dispName1' value="<% tcWebApi_get("VoIPBasic_entry1","SIPDisplayNumber","s") %>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Account:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='text' size=20 maxlength=128 name='authName1'  value='<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPAuthenticationName", "s") else asp_Write("") end if %>'>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Password:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='Password' size=20 maxlength=128 name='password1' value='<%if tcWebAPI_get("VoIPBasic_Entry1", "SIPPassword", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Entry1", "SIPPassword", "s") else asp_Write("") end if %>'>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Proxy:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" name="check1" value='Yes' <%if tcWebApi_get("VoIPBasic_Common", "SIPProxyEnable", "h") = "Yes" then asp_Write("checked") end if %> disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Proxy Addr:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield"type='text' name='proxyAddr'  VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPProxyAddr", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPProxyAddr", "s") else asp_Write("") end if %>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Proxy Port:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='text' name='proxyPort'  onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPProxyPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPProxyPort", "s") else asp_Write("") end if %>">
          </div>
      </div>
      <div class="row p-1" id="edit_dareSipDomain" >
          <div class="col-6">
              <div class="title-text-left">SIP Domain:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='text' name='dareSipDomain' VALUE="<%if tcWebApi_get("VoIPAdvanced_Common", "SIPDomain", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "SIPDomain", "s") else asp_Write("") end if %>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Reg Expire (sec):</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='text' name='regExpTmr' onblur="limitNum(this)" value="<%if tcWebApi_get("VoIPAdvanced_Common", "RegistrationExpire", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "RegistrationExpire", "s") else asp_Write("") end if %>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Outbound Proxy:</div>
          </div>
          <div class="col-6">         
			  <input type='checkbox' name='obProxyEn' value='YES' <%if tcWebApi_get("VoIPBasic_Common", "SIPOutboundProxyEnable", "h") = "Yes" then asp_Write("checked") end if %> disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Outbound Proxy Addr:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" type='text' name='obProxyAddr' VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPOutboundProxyAddr", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPOutboundProxyAddr", "s") else asp_Write("") end if %>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Outbound Proxy Port:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield"  type='text' name='obProxyPort' onblur="checkPort(this)" VALUE="<%if tcWebApi_get("VoIPBasic_Common", "SIPOutboundProxyPort", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "SIPOutboundProxyPort", "s") else asp_Write("") end if %>">
		  </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Enable Session timer:</div>
          </div>
          <div class="col-6">             
			  <input type='checkbox' name='autoSynPhoneDateSwitch' ID="Checkbox12" value='YES' <%if tcWebApi_get("VoIPAdvanced_Common", "CallSynEnAutoSwitch", "h") = "1" then asp_Write("checked") end if %>>
			  <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Session Expire (sec):</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" value="1800" disabled type="text">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Register Status:</div>
          </div>
          <div class="col-6">
              <div class="title-text-right">
			  <SCRIPT language=JavaScript type="text/javascript">			
			  document.write(showRegisterState(1));
			  </script>
			  </div>
          </div>
      </div>
	  <br>
	  <br>
      <div class="title-text">SIP Advanced</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SIP Port:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" onblur="checkPort(this)" name="lclSIPPort" type="text" value="<% tcWebApi_get("VoIPBasic_Common","LocalSIPPort","s")%>">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Media Port:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" onblur="checkPort(this)" name="lclRTPPort" type="text" value="<% tcWebApi_get("VoIPBasic_Common","LocalRTPPort","s")%>" >
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">DTMF Relay:</div>
          </div>
          <div class="col-6">             
            <select name="dtmfRelay" size="1" class="form-control input-select"  onchange="dtmfRelayChange(this)">
				<option value="SIPInfo" <%if tcWebApi_get("VoIPAdvanced_Common", "DTMFTransportMode", "h") = "SIPInfo" then asp_Write("selected") end if %>>
				SIPInfo
				<option value="RFC2833" <%if tcWebApi_get("VoIPAdvanced_Common", "DTMFTransportMode", "h") = "RFC2833" then asp_Write("selected") end if %>>
				RFC2833
				<option value="InBand" <%if tcWebApi_get("VoIPAdvanced_Common", "DTMFTransportMode", "h") = "InBand" then asp_Write("selected") end if %>>
				InBand
			</select>
          </div>		 
      </div>

		<div class="row p-1" id="trRFC2833PT" style="display:none">
			<div class="col-6">
				<div class="title-text-left">Telephone Event Payload Type:</div>
			</div>
			<div class="col-6">
				<input class="form-control input-textfield" type='text' size=20 maxlength=20 name='rfc2833pt' onblur='limitNum(this)' value="<%if tcWebApi_get("VoIPBasic_Common", "TelephoneEventPayloadType", "h") <> "N/A" then tcWebAPI_get("VoIPBasic_Common", "TelephoneEventPayloadType", "s") else asp_Write("") end if %>">
			</div>			
		</div>
	
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Call Waiting:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" value="1" name="callwait1" <%if tcWebApi_get("VoIPCallCtrl_Entry1", "SIPCallWaitingEnable", "h") = "1" then asp_Write("checked") end if %>>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">call transfer:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" name="transfer1" <%if tcWebApi_get("VoIPCallCtrl_Entry1", "SIPCallTransfer", "h") = "Yes" then asp_Write("checked") end if %>>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">3 way conference:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" name="threepartyservice1" <%if tcWebApi_get("VoIPCallCtrl_Entry1", "SIP3wayConf", "h") = "Yes" then asp_Write("checked") end if %>>
              <label class="input-radio">Enable</label>
          </div>
      </div>	
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">conference-uri:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" name="conf-uri" type="text" value="<% tcWebApi_get("VoIPCallCtrl_Entry1","conference-uri","s")%>" >
          </div>
      </div>
      <br>
      <div class="title-text">Dial plan</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Enable Dialplan:</div>
          </div>
          <div class="col-6">
		  <input type='checkbox' size=10 id='cb_DigitMapEnable' name='cb_DigitMapEnable' <%if tcWebApi_get("VoIPDigitMap_Entry", "DigitMapEnable", "h") = "1" then asp_Write("checked") end if %> onclick='CheckDigitMapEnable(this)'>
          </div>
      </div>
      <div class="row p-1" id='sec_DigitMap'>
          <div class="col-6">
              <div class="title-text-left">Dial plan:</div>
          </div>
          <div class="col-6" class="title-text-right">
			  <textarea id='txt_DigitMap' name='txt_DigitMap' rows=4 maxlength=4096 wrap='OFF' style='WIDTH:280px;' ><%if tcWebApi_get("VoIPAdvanced_Common", "DialPlan", "s") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "DialPlan", "s") else asp_Write("") end if %></textarea>
          </div>
      </div>
      <br>
      <div class="title-text">Codec</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">RTP Redundant <br> (First precedence)</div>
          </div>
          <div class="col-6">
              <input name="siprtpredundancy"  class="form chackbox" type="checkbox" <%if tcWebApi_get("VoIPAdvanced_Common", "rtpRedundantEnable", "h") = "1" then asp_Write("checked") end if %>>
          </div>		
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">RTP Redundancy paylod type:</div>
          </div>
          <div class="col-6">
			  <input class="form-control input-textfield" name="siprtpredundancypt" type="text" id="sip_rtp_redundancy_pt_val_1" onblur="limitNum(this)"  value="<%if tcWebApi_get("VoIPAdvanced_Common", "rtpRedundantPT", "h") <> "N/A" then tcWebAPI_get("VoIPAdvanced_Common", "rtpRedundantPT", "s") else asp_Write("") end if %>">
			  <label class="input-radio">&nbsp;(96-127)</label>
          </div>
      </div>
       <br>		
      <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onClick="btnApplySip()" ID="ApplyButton" >Apply</button>
          <button class="btn-dashboard">Reset</button>
      </div>
	  
	  </form>
	  
  </div>
  <!-- content -->
  <script>
  
	function isValidName_Bas(name) 
	{
		var i = 0;
		var unsafeString = "\"<>%\\^[]`\+\$\,='#&:;*/{} \t";
		for ( i = 0; i < name.length; i++ )
		{
			for( j = 0; j < unsafeString.length; j++)
				if ( (name.charAt(i)) == unsafeString.charAt(j) )
				return false;
		}
		for (k = 0; k < name.length; k++)
		{
			if (name.charAt(k) == '.')
			{
				break;
			}
		}
		if (k >= name.length - 1 || k == 0)
			return false;
	}
  
  
	function btnApplySip() 
	{
	   with ( document.ConfigForm )
	   {					
			if (regAddr.value != "")
			{
				if (isValidName_Bas(regAddr.value) == false)
				{
					alert('Registration server address is invalid.');	
					return;
				}
				
				if (!checkIpAddress(document.ConfigForm.regAddr, false))
					return false;
				
				if (regPort.value == "")
				{
					alert('Registration server port can not be empty!');
					return;
				}
			}
			/*else
			{
				if (regPort.value != "")
				{
					alert('Registration server address can not be empty!');
					return;
				}
			}*/			
			
			if (proxyAddr.value != "")
			{
				if (isValidName_Bas(proxyAddr.value) == false)
				{
					alert('Proxy server address is invalid.');	
					return;
				}
				
				if (!checkIpAddress(document.ConfigForm.proxyAddr, false))
					return false;
				
				if (proxyPort.value == "")
				{
					alert('Proxy port can not be empty!');
					return;
				}
			}
			/*else
			{
				if (proxyPort.value != "")
				{
					alert('Proxy address can not be empty!');
					return;
				}
			}*/
			
			if (obProxyAddr.value != "")
			{
				if (isValidName_Bas(obProxyAddr.value) == false)
				{
					alert('Outbound Proxy server address is invalid.');	
					return;
				}
				
				if (!checkIpAddress(document.ConfigForm.obProxyAddr, false))
					return false;
				
				if (obProxyPort.value == "")
				{
					alert('Outbound Proxy port can not be empty!');
					return;
				}
			}
			/*else
			{
				if (obProxyPort.value != "")
				{
					alert('Outbound Proxy address can not be empty!');
					return;
				}
			}*/	
			
			if (regAddr2.value != "")
			{
				if (isValidName_Bas(regAddr2.value) == false)
				{
					alert('Standby registration server address is invalid.');	
					return;
				}
				
				if (!checkIpAddress(document.ConfigForm.regAddr2, false))
					return false;
					
				if (regPort2.value == "")
				{
					alert('Standby registration server port can not be empty!');
					return;
				}
			}
			/*else
			{
				if (regPort2.value != "")
				{
					alert('Standby registration server address can not be empty!');
					return;
				}
			}*/		

			var re=/[~!@#$%^&*()_+|?<>]/;   
		
			<% if tcwebApi_get("VoIPBasic_Common","VoIPLine2Enable","h") = "Yes" then %>
			if (authName1.value == "")
			{
				alert('SIP Account1 can not be empty!');
				return;
			}
			if (authName1.value.indexOf("\"") >= 0)
			{
				alert('Invalid SIP Account1!');
				return;
			}
			if ( password1.value != "" && password1.value.indexOf("\"") >= 0)
			{
				alert('Invalid Passowrd1!');
				return;
			}
			<% end if %>			
			
			if (cb_DigitMapEnable.checked)
			{
				DigitMapEnableFlag.value = "1";
			}
			
			var regDigitMap = /[^0-9\[\]\-\|\.\*#xXABCDTLStlsEF]/g;
			
			if (cb_DigitMapEnable.checked){		
				if(regDigitMap.test(getElById('txt_DigitMap').value)){
					alert("Invaild characters in special digit map.");
					return;
				}
				getElById('dialPlan').value=getElById('txt_DigitMap').value;
			}
			
			var temp = parseInt(rfc2833pt.value);	
			if (temp < 96 || temp > 127)
			{
				alert('Telephone Event Payload Type range:96~127.');
				return;
			}
						
			var temp = parseInt(siprtpredundancypt.value);	
			if (temp < 96 || temp > 127)
			{
				alert('RTP redundant payload type range is 96~127.');
				return;
			}
			if (siprtpredundancy.checked)
			{
				siprtpredundancyflag.value = "1";	
			}
			
	<% if tcWebApi_get("WebCustom_Entry", "isCTPONC9Supported", "h") = "Yes"  then %>		
			if (obProxyEn.checked)
			{
				obProxyEn_flag.value = "Yes";
			}
	<% end if %>
			
			
			if (getElById("callwait1").checked)
			{
				callwait1Flag.value = "1";
			}
			
			if (getElById("transfer1").checked)
			{
				transfer1Flag.value = "Yes";
			}
			
			if (getElById("threepartyservice1").checked)
			{
				threepartyservice1Flag.value = "Yes";
			}
			
			
			VoIP_AppBtn_flag.value = 1;
			parent.voipType = "SIP";
			submit();
			showLoading();						
	   }
	}
	
	
  </script>
 </body>

</html>