<%
if Request_form("add_flag") = "1" then
	if Request_form("emptyEntry") <> "" then
    	tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")	
        tcWebApi_set("Dhcpd_Entry","Enable","enable_flag")
    	tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
    	tcWebApi_set("Dhcpd_Entry","MAC","MACAddr")
    	TCWebApi_commit("Dhcpd_Entry")	
		TCWebApi_save()
	end if
end if

if Request_Form("delflag") = "2" then
    if Request_Form("delflag0") <> "33" then 
        TCWebApi_unset("Dhcpd_Entry0")
    end if
    if Request_Form("delflag1") <> "33" then 
        TCWebApi_unset("Dhcpd_Entry1")
    end if
	if Request_Form("delflag2") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry2")
	end if
	if Request_Form("delflag3") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry3")
	end if
	if Request_Form("delflag4") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry4")
	end if
	if Request_Form("delflag5") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry5")
	end if
	if Request_Form("delflag6") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry6")
	end if
	if Request_Form("delflag7") <> "33" then
	    TCWebApi_unset("Dhcpd_Entry7")
	end if
	
	TCWebApi_commit("Dhcpd_Entry")
	TCWebApi_save()
end if

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 Static Routing</title>
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
    
    <script language=JavaScript type=text/javascript>
		
	//add 
	var route6count = 7;
	
	function stStaticRoute6(Domain, IPAddress, MACAddr)
	{
	    this.Domain = Domain;
	    this.IPAddress = IPAddress;
	    this.MACAddr = MACAddr;
	}
	
	function getStaticRoute6Info()
	{
	    var	nCurTemp = 0;
	    var	vIP = new Array(route6count);
	    var	vMAC = new Array(route6count);
	    var	vcurLinks = new Array(route6count);
	    
	    vIP[0] = "<% tcWebApi_get("Dhcpd_Entry0","IP","s") %>";
	    vIP[1] = "<% tcWebApi_get("Dhcpd_Entry1","IP","s") %>";
	    vIP[2] = "<% tcWebApi_get("Dhcpd_Entry2","IP","s") %>";
	    vIP[3] = "<% tcWebApi_get("Dhcpd_Entry3","IP","s") %>";
	    vIP[4] = "<% tcWebApi_get("Dhcpd_Entry4","IP","s") %>";
	    vIP[5] = "<% tcWebApi_get("Dhcpd_Entry5","IP","s") %>";
	    vIP[6] = "<% tcWebApi_get("Dhcpd_Entry6","IP","s") %>";
	    vIP[7] = "<% tcWebApi_get("Dhcpd_Entry7","IP","s") %>";
	    
	    vMAC[0] = "<% tcWebApi_get("Dhcpd_Entry0","MAC","s") %>";
	    vMAC[1] = "<% tcWebApi_get("Dhcpd_Entry1","MAC","s") %>";
	    vMAC[2] = "<% tcWebApi_get("Dhcpd_Entry2","MAC","s") %>";
	    vMAC[3] = "<% tcWebApi_get("Dhcpd_Entry3","MAC","s") %>";
	    vMAC[4] = "<% tcWebApi_get("Dhcpd_Entry4","MAC","s") %>";
	    vMAC[5] = "<% tcWebApi_get("Dhcpd_Entry5","MAC","s") %>";
	    vMAC[6] = "<% tcWebApi_get("Dhcpd_Entry6","MAC","s") %>";
	    vMAC[7] = "<% tcWebApi_get("Dhcpd_Entry7","MAC","s") %>";
	    
	    for(var i=0; i<route6count; i++)
	    {
	        if(vIP[i] != "N/A")
	            vcurLinks[nCurTemp++] = new stStaticRoute6(i, vIP[i], vMAC[i]);
	    }
	    var	vObjRet = new Array(nCurTemp+1);
	    for(var m=0; m<nCurTemp; m++)
	    {
	        vObjRet[m] = vcurLinks[m];
	    }
	    vObjRet[nCurTemp] = null;
	    return vObjRet;
	}
	var StaticRoute = getStaticRoute6Info();
	//end add

    //show table
    function Macinfo(Domain, IPAddress, MACAddr, Status)
    {
        this.Domain = Domain;

        this.IPAddress = IPAddress;
        this.MACAddr = MACAddr;
        this.Status = Status;
    }
    
    function Getallstaticip()
    {
        var ncount6 = 7;
        var	nCurTemp = 0;
        var	vIP = new Array(ncount6);
        var	vMAC = new Array(ncount6);
        var	vPrefixLength = new Array(ncount6);
        var	vGatewayIPAddress = new Array(ncount6);
        var	vInterface = new Array(ncount6);
        
        var	vcurLinks = new Array(ncount6);
        vIP[0] = "<% tcWebApi_get("Dhcpd_Entry0","IP","s") %>";
        vIP[1] = "<% tcWebApi_get("Dhcpd_Entry1","IP","s") %>";
		vIP[2] = "<% tcWebApi_get("Dhcpd_Entry2","IP","s") %>";
		vIP[3] = "<% tcWebApi_get("Dhcpd_Entry3","IP","s") %>";
		vIP[4] = "<% tcWebApi_get("Dhcpd_Entry4","IP","s") %>";
		vIP[5] = "<% tcWebApi_get("Dhcpd_Entry5","IP","s") %>";
		vIP[6] = "<% tcWebApi_get("Dhcpd_Entry6","IP","s") %>";
		vIP[7] = "<% tcWebApi_get("Dhcpd_Entry7","IP","s") %>";
        
        vMAC[0] = "<% tcWebApi_get("Dhcpd_Entry0","MAC","s") %>";
        vMAC[1] = "<% tcWebApi_get("Dhcpd_Entry1","MAC","s") %>";
		vMAC[2] = "<% tcWebApi_get("Dhcpd_Entry2","MAC","s") %>";
		vMAC[3] = "<% tcWebApi_get("Dhcpd_Entry3","MAC","s") %>";
		vMAC[4] = "<% tcWebApi_get("Dhcpd_Entry4","MAC","s") %>";
		vMAC[5] = "<% tcWebApi_get("Dhcpd_Entry5","MAC","s") %>";
		vMAC[6] = "<% tcWebApi_get("Dhcpd_Entry6","MAC","s") %>";
		vMAC[7] = "<% tcWebApi_get("Dhcpd_Entry7","MAC","s") %>";

        for(var i=0; i<ncount6; i++)
        {
			if(vIP[i] != "N/A")
				vcurLinks[nCurTemp++] = new Macinfo(i, vIP[i], vMAC[i], 0);
        }
        var	vObjRet = new Array(nCurTemp+1);
        for(var m=0; m<nCurTemp; m++)
        {
            vObjRet[m] = vcurLinks[m];
        }
        vObjRet[nCurTemp] = null;
        return vObjRet;
    }
    
    var statable = Getallstaticip();
    //end table
	
	function goBack()
	{
		window.history.go(-1);
	}
    </script>
</head>

<body>
<!-- content -->
<form name=ConfigForm method="post" action="/cgi-bin/true-page/service/mac-based.asp"> 
	<input type="hidden" name="delete_flag" value="0">
	<input TYPE="hidden" NAME="add_flag" VALUE="0">
	<input type="hidden" name="staticNum" value="<%TcWebApi_get("Dhcpd","Static_Num","s")%>">
	<input type="hidden" name="emptyEntry" value="<%TcWebApi_get("Dhcpd","Empty_Entry","s")%>">
	<input TYPE="hidden" NAME="tmpStartIp" value="<%tcWebApi_get("Dhcpd_Common","start","s")%>">
	<input type="hidden" NAME="tmpPoolCount" value="<%tcWebApi_get("Dhcpd_Common","pool_count","s")%>">
	<input type="hidden" name="dhcpEthStart" value="<% tcWebApi_get("Dhcpd_Common","start","s") %>">
	<input type="hidden" name="dhcpEthEnd" value="<% tcWebApi_get("Dhcpd_Common","pool_count","s") %>">
	<input type="hidden" name="ethSubnetMask" value="<% tcWebApi_get("Lan_Entry","netmask","s" ) %>">
	<input type="hidden" name="curSetIdx" value="<% tcWebApi_get("Dhcpd","Static_Num","s") %>">
	<input type="hidden" name="enable_flag" value="0">
    <div class="container-full container-resize-height">
        <div class="title-text">MAC_Based Assignment</div>        
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">MAC Address (xx:xx:xx:xx:xx:xx):</div>
            </div>
            <div class="col-6">
                <input class="input-textfield" type='text' name="MACAddr" id="MACAddr" maxlength='17' value="">
            </div>
        </div>
       
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Assigned IP Address (xxx.xxx.xxx.xxx):</div>
            </div>
            <div class="col-6">
                <input class="input-textfield" type="text" name="IpAddr" id="IpAddr" maxlength='15' value="">
            </div>
        </div>

        <div class="mt-2 center">
            <button type="button" class="btn-dashboard" onclick="btnAdd()">Assign IP</button>
			<button id="goback" name="goback" type="button" class="btn-dashboard" onclick="goBack();">Close</button>
        </div>
        <hr>
        
        <!-- table -->
        <input type="hidden" name="delflag" value="0">
        <input type="hidden" name="delflag0" value="33">
        <input type="hidden" name="delflag1" value="33">
        <input type="hidden" name="delflag2" value="33">
        <input type="hidden" name="delflag3" value="33">
        <input type="hidden" name="delflag4" value="33">
        <input type="hidden" name="delflag5" value="33">
        <input type="hidden" name="delflag6" value="33">
        <input type="hidden" name="delflag7" value="33">
        
        <div class="card-table-content">
            <div class="table-header">MAC-Based Assignment Table</div>
            <table style="width:100%" id="static_list">
                <tr class="table-header center">
                    <th style="width: 20%;" class="p-1">Select</th>
                    <th style="width: 40%;">MAC Address</th>
                    <th style="width: 40%;">Assigned IP Address</th>
                </tr>
                    <script language=JavaScript type=text/javascript>
                    for (i = 0; i < statable.length-1; i++)
                    {
                        if(i%2==0)
                            document.writeln('<tr class="table-content-fist center">');
                        else
                            document.writeln('<tr class="table-content-second center">');
                        document.writeln('<td>' + '<input type="checkbox" name="rml"'  + ' value="'+ statable[i].Domain + '">' + '</td>');
                        document.writeln('<td>' + statable[i].MACAddr + '</td>');
						document.writeln('<td>' + statable[i].IPAddress + '</td>');
                        document.writeln('</tr>');
                    }
                    </script>
            </table>
        </div>
        <div class="mt-2 center">
            <button type="button" class="btn-dashboard" onclick="removeClick(this.form.rml)">Delete Selected</button>
			<button type="button" class="btn-dashboard" onclick="removeallClick(this.form.rml)">Delete All</button>
        </div>
    </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
    //add route
    function LoadFrame()
    {
		document.ConfigForm.add_flag.value = "0";
		document.ConfigForm.delete_flag.value = "0";
    }

	function doStaticTableRange()
	{
		var sIP = document.ConfigForm.dhcpEthStart.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits = sIP[0].split(".");
		var num = document.ConfigForm.dhcpEthEnd.value.match("^[0-9]{1,3}$");
		var mask = document.ConfigForm.ethSubnetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits2 = mask[0].split(".");	
		var staticIP = document.ConfigForm.IpAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var staticdigits = staticIP[0].split(".");
		
		var stIP = parseInt(digits[3]);
		var Pool_num = parseInt(num);
		var staticIP = parseInt(staticdigits[3]);
		var isIpValid = 1;
		var total = parseInt(document.ConfigForm.staticNum.value);
		
		for(i=0;i<4;i++)
		{
		  if((digits2[i] & digits[i]) != (digits2[i] & staticdigits[i])){	
				isIpValid = 0;
				break;
			}
		}
		if(isIpValid == 0){
			alert("DHCP Start IP and DHCP Static IP are not in the same subnet");                                   						
			return false;
		}
		
		if( staticIP <  stIP || staticIP >= stIP+Pool_num)
		{
		   alert("DHCP Static IP is out of DHCP pool range!");
			return false;
		}
		
		return true;
	}
	
    function CheckForm(Form)
    {
        with ( document.forms[0] )
        {
			if(emptyEntry.value == "N/A"){
				alert("DHCP reservation table is full!" );
				return false;
			}
			
			if (getValue('IpAddr') == ""){
				alert('IP address must not be null.');
				return false;
			}
			if(isValidIpAddress(IpAddr.value) == false){
				alert('Invalid IP address.');
				return false;
			}
			
			if(getValue('MACAddr') == ""){
				alert('MAC address must not be null.');
				return false;
			}
			if(isValidMacAddress(MACAddr.value) == false){
				alert('MAC "' + MACAddr.value + '" is invalid. Format is (AA:BB:CC:DD:EE:FF)');
				return false;
			}
			
			for (i = 0; i < StaticRoute.length - 1; i++)
			{
			    if (StaticRoute[i].IPAddress == getValue('IpAddr'))
			    {
			        alert("DHCP Static IP has existed in the list!");
			        return false;
			    }
				if (StaticRoute[i].MACAddr == getValue('MACAddr'))
				{
				    alert("DHCP Static MAC address has existed in the list!");
				    return false;
				}
			}
			
			if(!doStaticTableRange())
			return false;
		}
        return true;
    }
    
    function btnAdd()
    {
        var Form = document.ConfigForm;
        if (true == CheckForm(Form))
        {
            Form.enable_flag.value = "1";
            Form.add_flag.value = "1";
            Form.submit();
            showLoading();
        }
    }
    //add end
    
    //Update summbit
    function UpdateSubmit()
    {
        location.reload();
    }
    //end Update
    
    //del select
    function removeClick(rml)
    {
        with(getElById('ConfigForm'))
        {
            if (rml == null)
            {
                return;
            }
            var Form = document.ConfigForm;
            var k;
            if (rml.length > 0)
            {
                for (k = 0; k < rml.length; k++)
                {
                    var strindex = "delflag" + rml[k].value;
                    if ( rml[k].checked == true )
                    {
                        setText(strindex, rml[k].value);
						//alert("1"+strindex)
                    }
                    else {
                        setText(strindex, "33");
						//alert("2"+strindex)
					}
                }
            }
            else if ( rml.checked == true )
            {
                var strindex = "delflag" + rml.value;
                setText(strindex, rml.value);
                //alert("3"+strindex)
            }
			//alert(strindex)
			
			/*alert(route6delflag0.value);
			alert(route6delflag1.value);
			alert(route6delflag2.value);
			alert(route6delflag3.value);
			alert(route6delflag4.value);
			alert(route6delflag5.value);
			alert(route6delflag6.value);
			alert(route6delflag7.value);*/
            Form.delflag.value = "2";
            Form.submit();
            showLoading();
        }
    }
    //end del
    
    //delete all
    function removeallClick(rml)
    {
        with(getElById('ConfigForm'))
        {
            if (rml == null)
            {
                return;
            }
            var Form = document.ConfigForm;
            var k;

            if (rml.length > 0)
            {
                for (k = 0; k < rml.length; k++)
                {
                    var strindex = "delflag" + rml[k].value;
                    setText(strindex, rml[k].value);
                }
            }
            else
            {
                var strindex = "delflag" + rml.value;
                setText(strindex, rml.value);
            }
            Form.delflag.value = "2";
            Form.submit();
            showLoading();
        }
    }
    //end del

    $(document).ready(function(){
        LoadFrame();
    });
    
</script>
</body>

</html>