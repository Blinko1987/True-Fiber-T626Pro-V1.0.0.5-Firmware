<%
if Request_Form("save_Flag") = "1" then 

	TCWebApi_unset("DDos_Entry")
	TCWebApi_set("DDos_Entry","OpMode","OpMode")
	TCWebApi_set("DDos_Entry","szIp","szIp")
	TCWebApi_set("DDos_Entry","szMask","szMask")
	TCWebApi_set("DDos_Entry","enabled","ddosAttackEnable")
	TCWebApi_set("DDos_Entry","synsynflood","synsynflood")
	TCWebApi_set("DDos_Entry","sysfinflood","sysfinflood")
	TCWebApi_set("DDos_Entry","sysudpflood","sysudpflood")
	TCWebApi_set("DDos_Entry","sysicmpflood","sysicmpflood")
	TCWebApi_set("DDos_Entry","blockTime","blockTime")
	TCWebApi_set("DDos_Entry","ddos_debug","ddos_debug")
	TCWebApi_commit("DDos_Entry")
	
	TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - DOS</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
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
  <!-- script -->
	<script language=JavaScript type=text/javascript>
	function LoadFrame()
	{
		var ddosAttackSixteen = "<% tcWebApi_get("DDos_Entry","enabled","s") %>";
		if(ddosAttackSixteen != "N/A"){
		    var ddosAttackTwo = parseInt(ddosAttackSixteen,16).toString(2);	
		    var ddosAttackArray = ddosAttackTwo.split("");
				var ddosLength = ddosAttackArray.length;
				var	Form = document.ConfigForm;
				if("1" == ddosAttackArray[ddosLength-1]){
					Form.ddosAttack.checked = true;
				}else{
					Form.ddosAttack.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-2] || "1" == ddosAttackArray[ddosLength-6])
				{
					Form.SynFlood.checked = true;
					Form.synsynflood.disabled = false;
				}else
				{
					Form.SynFlood.checked = false;
					Form.synsynflood.disabled = true;
				}
				if("1" == ddosAttackArray[ddosLength-3] || "1" == ddosAttackArray[ddosLength-7])
				{
					Form.FinFlood.checked = true;
					Form.sysfinflood.disabled = false;
				}else
				{
					Form.FinFlood.checked = false;
					Form.sysfinflood.disabled = true;
				}
				if("1" == ddosAttackArray[ddosLength-4] || "1" == ddosAttackArray[ddosLength-8])
				{
					Form.UdpFlood.checked = true;
					Form.sysudpflood.disabled = false;
				}else
				{
					Form.UdpFlood.checked = false;
					Form.sysudpflood.disabled = true;
				}
				if("1" == ddosAttackArray[ddosLength-5] || "1" == ddosAttackArray[ddosLength-9])
				{
					Form.IcmpFlood.checked = true;
					Form.sysicmpflood.disabled = false;
				}else
				{
					Form.IcmpFlood.checked = false;
					Form.sysicmpflood.disabled = true;
				}
				if("1" == ddosAttackArray[ddosLength-10])
				{
					Form.TcpUdpPortScan.checked = true;
				}else
				{
					Form.TcpUdpPortScan.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-11])
				{
					Form.IcmpSmurf.checked = true;
				}else
				{
					Form.IcmpSmurf.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-12])
				{
					Form.IpLand.checked = true;
				}else
				{
					Form.IpLand.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-13])
				{
					Form.IpSpoof.checked = true;
				}else
				{
					Form.IpSpoof.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-14])
				{
					Form.TearDrop.checked = true;
				}else
				{
					Form.TearDrop.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-15])
				{
					Form.PingOfDeath.checked = true;
				}else
				{
					Form.PingOfDeath.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-16])
				{
					Form.TcpScan.checked = true;
				}else
				{
					Form.TcpScan.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-17])
				{
					Form.TcpSynWithData.checked = true;
				}else
				{
					Form.TcpSynWithData.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-18])
				{
					Form.UdpBomb.checked = true;
				}else
				{
					Form.UdpBomb.checked = false;
				}		
				if("1" == ddosAttackArray[ddosLength-19])
				{
					Form.UdpEchoChargen.checked = true;
				}else
				{
					Form.UdpEchoChargen.checked = false;
				}
				if("1" == ddosAttackArray[ddosLength-23])
				{
					Form.IpBlock.checked = true;
					Form.blockTime.disabled = false;
				}else
				{
					Form.IpBlock.checked = false;
					Form.blockTime.disabled = true;
				}
				if("1" == ddosAttackArray[ddosLength-24])
				{
					Form.Sensitivity.checked = true;
				}else
				{
					Form.Sensitivity.checked = false;
				}
			}
	}
	
	function SubmitForm()
	{	
		if(checkDDosAttack())
		{
			var	Form = document.ConfigForm;
			Form.save_Flag.value = "1";
			var ddosAttackArray = [0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
			var ddosLength = ddosAttackArray.length;
			if(Form.ddosAttack.checked){
				ddosAttackArray[ddosLength-1] = "1";
			}else{
				ddosAttackArray[ddosLength-1] = "0";
			}
			if(Form.SynFlood.checked)
			{
				ddosAttackArray[ddosLength-2] = "1";
				ddosAttackArray[ddosLength-6] = "1";
			}else
			{
				ddosAttackArray[ddosLength-2] = "0";
				ddosAttackArray[ddosLength-6] = "0";
			}
			if(Form.FinFlood.checked)
			{
				ddosAttackArray[ddosLength-3] = "1";
				ddosAttackArray[ddosLength-7] = "1";
			}else
			{
				ddosAttackArray[ddosLength-3] = "0";
				ddosAttackArray[ddosLength-7] = "0";
			}
			if(Form.UdpFlood.checked)
			{
				ddosAttackArray[ddosLength-4] = "1";
				ddosAttackArray[ddosLength-8] = "1";
			}else
			{
				ddosAttackArray[ddosLength-4] = "0";
				ddosAttackArray[ddosLength-8] = "0";
			}
			if(Form.IcmpFlood.checked)
			{
				ddosAttackArray[ddosLength-5] = "1";
				ddosAttackArray[ddosLength-9] = "1";
			}else
			{
				ddosAttackArray[ddosLength-5] = "0";
				ddosAttackArray[ddosLength-9] = "0";
			}
			if(Form.TcpUdpPortScan.checked)
			{
				ddosAttackArray[ddosLength-10] = "1";
			}else
			{
				ddosAttackArray[ddosLength-10] = "0";
			}
			if(Form.IcmpSmurf.checked)
			{
				ddosAttackArray[ddosLength-11] = "1";
			}else
			{
				ddosAttackArray[ddosLength-11] = "0";
			}
			if(Form.IpLand.checked)
			{
				ddosAttackArray[ddosLength-12] = "1";
			}else
			{
				ddosAttackArray[ddosLength-12] = "0";
			}
			if(Form.IpSpoof.checked)
			{
				ddosAttackArray[ddosLength-13] = "1";
			}else
			{
				ddosAttackArray[ddosLength-13] = "0";
			}
			if(Form.TearDrop.checked)
			{
				ddosAttackArray[ddosLength-14] = "1";
			}else
			{
				ddosAttackArray[ddosLength-14] = "0";
			}
			if(Form.PingOfDeath.checked)
			{
				ddosAttackArray[ddosLength-15] = "1";
			}else
			{
				ddosAttackArray[ddosLength-15] = "0";
			}
			if(Form.TcpScan.checked)
			{
				ddosAttackArray[ddosLength-16] = "1";
			}else
			{
				ddosAttackArray[ddosLength-16] = "0";
			}
			if(Form.TcpSynWithData.checked)
			{
				ddosAttackArray[ddosLength-17] = "1";
			}else
			{
				ddosAttackArray[ddosLength-17] = "0";
			}
			if(Form.UdpBomb.checked)
			{
				ddosAttackArray[ddosLength-18] = "1";
			}else
			{
				ddosAttackArray[ddosLength-18] = "0";
			}		
			if(Form.UdpEchoChargen.checked)
			{
				ddosAttackArray[ddosLength-19] = "1";
			}else
			{
				ddosAttackArray[ddosLength-19] = "0";
			}
			if(Form.IpBlock.checked)
			{
				ddosAttackArray[ddosLength-23] = "1";
			}else
			{
				ddosAttackArray[ddosLength-23] = "0";
			}
			if(Form.Sensitivity.checked)
			{
				ddosAttackArray[ddosLength-24] = "1";
			}else
			{
				ddosAttackArray[ddosLength-24] = "0";
			}
			Form.ddosAttackEnable.value = "0x"+parseInt(ddosAttackArray.join(""),2).toString(16);
            document.ConfigForm.SaveAlter_Flag.value = "1";
            Form.submit();
			//showLoading();
		}
	}
	
	function checkDDosAttack()
	{
		var	Form = document.ConfigForm;
		if(isPlusInteger(Form.synsynflood.value) == false){
			alert("SynFlood must be a number!");
			return false;
		}
		if(isPlusInteger(Form.sysfinflood.value) == false){
			alert("FinFlood must be a number!");
			return false;
		}
		if(isPlusInteger(Form.sysudpflood.value) == false){
			alert("UdpFlood must be a number!");
			return false;
		}
		if(isPlusInteger(Form.sysicmpflood.value) == false){
			alert("IcmpFlood must be a number!");
			return false;
		}
		if(isPlusInteger(Form.blockTime.value) == false){
			alert("Block Time must be a number!");
			return false;
		}
		if(Form.synsynflood.value<10 || Form.synsynflood.value>1000){
			alert("SynFlood must be 10~1000");
			return false;
		}
		if(Form.sysfinflood.value<10 || Form.sysfinflood.value>1000){
			alert("FinFlood must be 10~1000");
			return false;
		}
		if(Form.sysudpflood.value<10 || Form.sysudpflood.value>10000){
			alert("UdpFlood must be 10~10000");
			return false;
		}
		if(Form.sysicmpflood.value<10 || Form.sysicmpflood.value>1000){
			alert("IcmpFlood must be 10~1000");
			return false;
		}
		if(Form.blockTime.value<5 || Form.blockTime.value>60){
			alert("Block Time must be 5~60");
			return false;
		}
		return true;
	}
	
	function setSynFloodEnable()
	{
		if(document.ConfigForm.SynFlood.checked)
		{
			document.ConfigForm.synsynflood.disabled = false;
		}else
		{
			document.ConfigForm.synsynflood.disabled = true;
		}	
	}
	function setFinFloodEnable()
	{
		if(document.ConfigForm.FinFlood.checked)
		{
			document.ConfigForm.sysfinflood.disabled = false;
		}else
		{
			document.ConfigForm.sysfinflood.disabled = true;
		}
	}
	function setUdpFloodEnable()
	{
		if(document.ConfigForm.UdpFlood.checked)
		{
			document.ConfigForm.sysudpflood.disabled = false;
		}else
		{
			document.ConfigForm.sysudpflood.disabled = true;
		}
	}
	function setIcmpFloodEnable()
	{
		if(document.ConfigForm.IcmpFlood.checked)
		{
			document.ConfigForm.sysicmpflood.disabled = false;
		}else
		{
			document.ConfigForm.sysicmpflood.disabled = true;
		}
	}
	function setBlockTimeEnable()
	{	
		if(document.ConfigForm.IpBlock.checked)
		{
			document.ConfigForm.blockTime.disabled = false;
		}else
		{
			document.ConfigForm.blockTime.disabled = true;
		}
	}
	
	function selectAllForm(){
		var	Form = document.ConfigForm;
		Form.SynFlood.checked = true;
		document.ConfigForm.synsynflood.disabled = false;
		Form.FinFlood.checked = true;
		document.ConfigForm.sysfinflood.disabled = false;
		Form.UdpFlood.checked = true;
		document.ConfigForm.sysudpflood.disabled = false;
		Form.IcmpFlood.checked = true;
		document.ConfigForm.sysicmpflood.disabled = false;
		Form.TcpUdpPortScan.checked = true;
		Form.IcmpSmurf.checked = true;
		Form.IpLand.checked = true;
		Form.IpSpoof.checked = true;
		Form.TearDrop.checked = true;
		Form.PingOfDeath.checked = true;
		Form.TcpScan.checked = true;
		Form.TcpSynWithData.checked = true;
		Form.UdpBomb.checked = true;
		Form.UdpEchoChargen.checked = true;
		Form.Sensitivity.checked = true;
	}
	function clearForm(){
		var	Form = document.ConfigForm;
		Form.SynFlood.checked = false;
		document.ConfigForm.synsynflood.disabled = true;
		Form.FinFlood.checked = false;
		document.ConfigForm.sysfinflood.disabled = true;
		Form.UdpFlood.checked = false;
		document.ConfigForm.sysudpflood.disabled = true;
		Form.IcmpFlood.checked = false;
		document.ConfigForm.sysicmpflood.disabled = true;
		Form.TcpUdpPortScan.checked = false;
		Form.IcmpSmurf.checked = false;
		Form.IpLand.checked = false;
		Form.IpSpoof.checked = false;
		Form.TearDrop.checked = false;
		Form.PingOfDeath.checked = false;
		Form.TcpScan.checked = false;
		Form.TcpSynWithData.checked = false;
		Form.UdpBomb.checked = false;
		Form.UdpEchoChargen.checked = false;
		Form.Sensitivity.checked = false;
	}
	</script>  
</head>


<body onload="LoadFrame()">
<!-- content -->
      <div class="container-full container-resize-height">
      	<FORM name="ConfigForm" action="/cgi-bin/true-page/admin/admin-dos.asp" method="post">
      		<input type="hidden" name="save_Flag" value="0">
        	<input type="hidden" name="OpMode" value="0">
        	<input type="hidden" name="szIp" value="<% if tcWebApi_get("Lan_Entry","IP","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","IP","s" ) else asp_Write("192.168.1.1") end if %>">
        	<input type="hidden" name="szMask" value="<% if tcWebApi_get("Lan_Entry","netmask","h" ) <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s" ) else asp_Write("255.255.255.0") end if %>">
        	<input type="hidden" name="ddosAttackEnable" value="<% tcWebApi_get("DDos_Entry","enabled","s") %>">
        	<input type="hidden" name="ddos_debug" value="0">
        	<input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
          <div class="title-text">DOS</div>
          <div class="title-description-text">DoS (Denial-of-Service) attack which is launched by hacker aims to prevent legal user from taking normal services. In this page you can configure to prevent some kinds of DOS attack.</div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="1" name="ddosAttack">
                  <label class="input-radio">Enable DoS Block</label>
              </div>
          </div>
          <hr>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" onclick="setSynFloodEnable()" name="SynFlood">
                  <label class="input-radio">Whole System Flood:SYN</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" name="synsynflood" value="<%if tcWebApi_get("DDos_Entry","synsynflood","h") <> "N/A" then tcWebApi_get("DDos_Entry","synsynflood","s") else asp_Write("100") end if%>" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" onclick="setFinFloodEnable()" name="FinFlood">
                  <label class="input-radio">Whole System Flood:FIN</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" name="sysfinflood" value="<%if tcWebApi_get("DDos_Entry","sysfinflood","h") <> "N/A" then tcWebApi_get("DDos_Entry","sysfinflood","s") else asp_Write("100") end if%>" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" onclick="setUdpFloodEnable()" name="UdpFlood">
                  <label class="input-radio">Whole System Flood:UDP</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" name="sysudpflood" value="<%if tcWebApi_get("DDos_Entry","sysudpflood","h") <> "N/A" then tcWebApi_get("DDos_Entry","sysudpflood","s") else asp_Write("200") end if%>" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" onclick="setIcmpFloodEnable()" name="IcmpFlood">
                  <label class="input-radio">Whole System Flood:ICMP</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" name="sysicmpflood" value="<%if tcWebApi_get("DDos_Entry","sysicmpflood","h") <> "N/A" then tcWebApi_get("DDos_Entry","sysicmpflood","s") else asp_Write("100") end if%>" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="" name="" disabled>
                  <label class="input-radio">Pre-Source IP Flood:SYN</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" value="100" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="" name="" disabled>
                  <label class="input-radio">Pre-Source IP Flood:FIN</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" value="100" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="" name="" disabled>
                  <label class="input-radio">Pre-Source IP Flood:UDP</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" value="100" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="" name="" disabled>
                  <label class="input-radio">Pre-Source IP Flood:ICMP</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" value="100" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">packages/second</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="TcpUdpPortScan">
                  <label class="input-radio">TCP/UDP PortScan</label>
              </div>
              <div class="col-3">
                  <select class="form-control input-select" disabled>
                      <option value="1">1</option>
                  </select>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">sensitivity</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="IcmpSmurf">
                  <label class="input-radio">ICMP Smurf</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="IpLand">
                  <label class="input-radio">IP Land</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="IpSpoof">
                  <label class="input-radio">IP Spoof</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="TearDrop">
                  <label class="input-radio">IP TearDrop</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="PingOfDeath">
                  <label class="input-radio">PingOfDeath</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="TcpScan">
                  <label class="input-radio">TCP Scan</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="TcpSynWithData">
                  <label class="input-radio">TCP SynWithData</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="UdpBomb">
                  <label class="input-radio">UDP Bomb</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="UdpEchoChargen">
                  <label class="input-radio">UDP EchoChargen</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" name="Sensitivity">
                  <label class="input-radio">UDP EchoChargen</label>
              </div>
          </div>
          <div class="mt-3 mb-3 center">
              <button class="btn-dashboard" onclick="selectAllForm();return false;">Select All</button>
              <button class="btn-dashboard" onclick="clearForm();return false;">Clear</button>
          </div>
          <hr>
          <div class="row p-1">
              <div class="col-6 pl60">
                  <input type="checkbox" value="checkbox" onclick="setBlockTimeEnable()" name="IpBlock">
                  <label class="input-radio">Enabled Source IP Blocking</label>
              </div>
              <div class="col-3">
                  <input class="form-control input-textfield" type="text" name="blockTime" value="<%if tcWebApi_get("DDos_Entry","blockTime","h") <> "N/A" then tcWebApi_get("DDos_Entry","blockTime","s") else asp_Write("5") end if%>" disabled>
              </div>
              <div class="col-3 left">
                  <label class="input-radio">Block Interval(seconds)</label>
              </div>
          </div>
          <div class="mt-3 mb-3 center">
              <button class="btn-dashboard" type="button" onclick="SubmitForm()">Apply</button>
          </div>
      	</FORM>
      </div>
<!-- content -->
</body>

</html>