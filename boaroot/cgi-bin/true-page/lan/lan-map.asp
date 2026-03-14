<%
if Request_Form("formcommit") = "1" then
	TCWebApi_set("WebCurSet_Entry","VlanBind_id","entryidx")
	TCWebApi_set("VlanBind_Entry","Active","bindmode")
	if Request_Form("bindmode") = "Yes" then
		TCWebApi_set("VlanBind_Entry","mn","bindvalue")
	else
		TCWebApi_set("VlanBind_Entry","mn","empty")
	end if
	TCWebApi_commit("VlanBind_Entry")	
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>LAN - VLAN Binding Configuration</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
<%if Request_Form("formcommit") = "1" then %>
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
  <style>
    .p-1 {
        cursor:pointer;
    }
  </style>
  <script>
    var LanArray = new Array(
        new BindInfoClass('<% tcWebApi_get("VlanBind_Entry0","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry0","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry1","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry1","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry2","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry2","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry3","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry3","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry4","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry4","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry5","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry5","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry6","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry6","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry7","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry7","mn","s") %>')
        <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry8","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry8","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry9","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry9","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry10","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry10","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry11","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry11","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry12","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry12","mn","s") %>')
        , new BindInfoClass('<% tcWebApi_get("VlanBind_Entry13","Active","s") %>', '<% tcWebApi_get("VlanBind_Entry13","mn","s") %>')
        <% end if %>
        ,null);

    // LAN Mapping 节点结构
    function BindInfoClass(Mode, Vlan)
    {
        this.Mode = ( 'Yes' == Mode ) ? 1 : 0;
        this.Vlan = ( 'N/A' == Vlan ) ? '' : Vlan;
    }

    //自动选择端口
    function ChoosePort(Port)
    {   
        var obj_id = "record_"+Port;
        getElById("port").value=obj_id;
        selectLine(obj_id); 
    }
    
    //创建port vlan 路由链表 
    function CreateRouteList()
    {     
        var HtmlCode = "";
        var Lan_Indenti1 = "LAN";
        var Lan_Indenti2 = "SSID";
        var Lan_Indenti3 = "SSIDAC";
        var Lan = "";
        var LanCnt = 4;
        var LanWire = 4;

    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        for(var i = 1; i <= 14; i++)
    <% else %>
        for(var i = 1; i <= 8; i++)
    <% end if %>
        {  
            var modestr = "";
            if (LanArray[i-1].Mode == 0)
            {
            	modestr = "Port Mapping";
            }
            else if (LanArray[i-1].Mode == 1)
            {
            	modestr = "VLAN Mapping";
            }

        <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then%>
            if(i <= 8)
            {
                Lan = i > LanWire ? (Lan_Indenti2+(i-4)) : (Lan_Indenti1+i);
            }
            else
            {
                if(i == 9 || i == 10)
                    continue;
            
                Lan = Lan_Indenti3+(i-10);
            }
        <% else %>
            Lan = i > LanWire ? (Lan_Indenti2+(i-4)) : (Lan_Indenti1+i);
        <% end if %>
			
            if( i%2 == 1 ) 
            {
                HtmlCode += '<tr id= "record_' + i +'" class="table-content-fist center table1_01" >';
            } 
			else 
			{
                HtmlCode += '<tr id= "record_' + i +'" class="table-content-second center table1_01" >';
            }
            
            HtmlCode += '<td class="p-1" onclick="ChoosePort('+i+');">' + Lan + '</td>';

            HtmlCode += '<td>' +modestr + '</td>';
        
            if( (LanArray[i-1].Vlan == "") || (LanArray[i-1].Mode == 0))
            {
                HtmlCode += '<td>--</td>';
            }
            else
            {
                HtmlCode += '<td style="word-break:break-all;word-wrap:break-word;">' + LanArray[i-1].Vlan + '</td>'; 
            }
            
       	 	HtmlCode += '</tr>'; 
			
        }  
        
        return HtmlCode;    
    }
	
    // 创建port下拉列表内容
    function WritePortSelected()
    {
        var flag = false;
        if(getElById('record_1').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_1' selected>LAN1</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_1'>LAN1</option>");
            }
        }
        if(getElById('record_2').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_2' selected>LAN2</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_2'>LAN2</option>");
            }
        }
        if(getElById('record_3').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_3' selected>LAN3</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_3'>LAN3</option>");
            }
        }
        if(getElById('record_4').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_4' selected>LAN4</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_4'>LAN4</option>");
            }
        }
        if(getElById('record_5').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_5' selected>SSID1</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_5'>SSID1</option>");
            }
        }
        if(getElById('record_6').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_6' selected>SSID2</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_6'>SSID2</option>");
            }
        }
        if(getElById('record_7').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_7' selected>SSID3</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_7'>SSID3</option>");
            }
        }
        if(getElById('record_8').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_8' selected>SSID4</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_8'>SSID4</option>");
            }
        }
        if(getElById('record_11').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_11' selected>SSIDAC1</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_11'>SSIDAC1</option>");
            }
        }
        if(getElById('record_12').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_12' selected>SSIDAC2</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_12'>SSIDAC2</option>");
            }
        }
        if(getElById('record_13').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_13' selected>SSIDAC3</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_13'>SSIDAC3</option>");
            }
        }
        if(getElById('record_14').style.display!="none" )
        {
            if(flag == false)
            {
                document.writeln("<option value='record_14' selected>SSIDAC4</option>");
                flag = true;
            }
            else
            {
                document.writeln("<option value='record_14'>SSIDAC4</option>");
            }
        }
    }

	// 不根据列表项创建下拉列表内容
	function NewWritePortSelected()
    {
    <% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
    	var ssidNum = parseInt('<% tcWebApi_get("WLan_Common","BssidNum","s") %>');
	<% end if %>
	<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
		var ssidacNum = parseInt('<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>');
	<% end if %>
		
    	document.writeln("<option value='record_1'>LAN1</option>");
	<% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
		document.writeln("<option value='record_2'>LAN2</option>");
	<% end if %>
	<% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) = "Yes" then %>
		if(ssidNum == 1)
    	{	
    		document.writeln("<option value='record_5'>SSID1</option>");
		}
		else if(ssidNum == 2)  
    	{
    		document.writeln("<option value='record_5'>SSID1</option>");
    		document.writeln("<option value='record_6'>SSID2</option>");
		}
		else if(ssidNum == 3)
		{	
			document.writeln("<option value='record_5'>SSID1</option>");
			document.writeln("<option value='record_6'>SSID2</option>");
    		document.writeln("<option value='record_7'>SSID3</option>");
		}
		else
		{
			document.writeln("<option value='record_5'>SSID1</option>");
	    	document.writeln("<option value='record_6'>SSID2</option>");
	    	document.writeln("<option value='record_7'>SSID3</option>");
			document.writeln("<option value='record_8'>SSID4</option>");
		}
	<% end if %>
	<% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) = "Yes" then %>
		if(ssidacNum == 1)
		{
			document.writeln("<option value='record_11'>SSIDAX1</option>");
	        
		}
		else if(ssidacNum == 2)  
    	{
    		document.writeln("<option value='record_11'>SSIDAX1</option>");
	        document.writeln("<option value='record_12'>SSIDAX2</option>");
		}
		else if(ssidacNum == 3)  
    	{
    		document.writeln("<option value='record_11'>SSIDAX1</option>");
	        document.writeln("<option value='record_12'>SSIDAX2</option>");
	    	document.writeln("<option value='record_13'>SSIDAX3</option>");
		}
		else
		{
			document.writeln("<option value='record_11'>SSIDAX1</option>");
	        document.writeln("<option value='record_12'>SSIDAX2</option>");
	    	document.writeln("<option value='record_13'>SSIDAX3</option>");
	  		document.writeln("<option value='record_14'>SSIDAX4</option>");
		}
	<% end if %>
    }
	
    // port select触发事件
    function portChange()
    {
        var selObj = getElById("port");
        var temp = selObj.options[selObj.selectedIndex].value;
        selectLine(temp); 
    }

    // model select触发事件
    function OnChooseDeviceType(Select)
    {
    var Mode = getElById("ChooseDeviceType").value;

    if (Mode == "lanwanbinding")
        getElById("BindVlanRow").style.display = 'none';
    else if (Mode == "vlanbinding")
        getElById("BindVlanRow").style.display = '';
    }
	function getEntryIndex(portid)
	{
		switch ( portid )
		{
			case 'LAN1':
			case 'LAN2':
			case 'LAN3':
			case 'LAN4':
				return parseInt(portid.substring(3, 4)) - 1;
			case 'SSID1':
			case 'SSID2':
			case 'SSID3':
			case 'SSID4':
				return parseInt(portid.substring(4, 5)) + 3;
	<% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>			
			case 'SSIDAC1':
			case 'SSIDAC2':
			case 'SSIDAC3':
			case 'SSIDAC4':
				return parseInt(portid.substring(6, 7)) + 9;
	<% end if %>			
			default:
				return -1;
		}
	}
    // 表单提交事件
    function OnApplyButtonClick()
    {
        var entryidx = 0;
        var PortId = getElById("PortId").innerHTML;

        if (FillBindInfo() == false)
            return false;

        entryidx = getEntryIndex(PortId);
        if ( entryidx < 0 )
        {
            alert('Invalid entry!')
            return false;	
        }
        document.forms[0].entryidx.value = entryidx;
        document.forms[0].formcommit.value = 1;
        document.forms[0].bindmode.value = ('vlanbinding' == getElById("ChooseDeviceType").value) ? 'Yes' : 'No';
        if ( 'Yes' == document.forms[0].bindmode.value )
            document.forms[0].bindvalue.value = getElById("UrlAddressControl").value;
        document.forms[0].submit();
        //showLoading();
    }

    function FillBindInfo(Form)
    {
        if (CheckParameter() == false)
            return false;

        return true;
    }

    function CheckParameter()
    {
        var BindVlan = getElById("UrlAddressControl").value;
        
        var Mode = getElById("ChooseDeviceType").value;
        if ((0 == BindVlan.length) && (Mode == "vlanbinding"))
        {
            alert('You must be set VLAN pair');
                return false;
        }

        if (Mode == "vlanbinding")
        {
            if (IsBindBindVlanValid(BindVlan) == false)
            {
                return false;
            }
        }

        return true;
    }

    function IsBindBindVlanValid(BindVlan)
    {   
        var LanVlanWanVlanList = BindVlan.split(";");
        var LanVlan0;
        var WanVlan;
        var TempList;

        for (var i = 0; i < LanVlanWanVlanList.length; i++)
        {
            TempList = LanVlanWanVlanList[i].split("/");
            
            /* 检验是否满足a/b格式 */
            if (TempList.length != 2)
            {
                alert(BindVlan+"is invalid.");
                return false;
            }
            
            /* 检验a，b是否为数字 */
            if ((isNaN(parseInt(TempList[0]))) || (isNaN(parseInt(TempList[1]))))
            {
                alert(BindVlan+"is invalid.");
                return false;
            }
            
            /* 检验lan口的vlan是否合法 */
            if (!(parseInt(TempList[0]) >= 1 && parseInt(TempList[0]) <= 4094))
            {
                alert(BindVlan+"user Vlan\""+parseInt(TempList[0])+"\"is invalid.");
                return false;
            }
            
            if (!(parseInt(TempList[1]) >= 1 && parseInt(TempList[1]) <= 4094))
            {
                alert(BindVlan+"interface Vlan\""+parseInt(TempList[1])+"\"is invalid");
                return false;
            }
        }

        if ( LanVlanWanVlanList.length > 20 )
        {
                alert("Max 20 Vlan pair.");
                return false;
        }

        return true;
    }

    function ModifyInstance(index)
    {
        var lanmode = LanArray[index -1].Mode;
        var vlanpair = LanArray[index -1].Vlan;

        getElById("UrlAddressControl").value = vlanpair;
        
        if (lanmode == 0)
        {
            getElById("ChooseDeviceType").value = "lanwanbinding";
            getElById("BindVlanRow").style.display = "none";
        }
        else if (lanmode == 1)
        {
            getElById("ChooseDeviceType").value = "vlanbinding"; 
            getElById("BindVlanRow").style.display = "";
        }
    }

    
    function setControl(index) 
    { 
        var identi = "";

        selectIndex = index;
        if (index < -1)
            return;

        if(index <= 8)
        {
            identi = index > 4 ? "SSID"+(index-4) : "LAN"+index;
        }
        else
        {
            identi = "SSIDAC"+(index-10)
        }
        document.getElementById("PortId").innerHTML = identi;

        return ModifyInstance(index);
    }

    //用户点击了取消按钮后的代码逻辑
    function OnCancelButtonClick()
    {
        //  document.getElementById("TableUrlInfo").style.display = "none";
        location.replace('/cgi-bin/true-page/lan/lan-map.asp');
        return false;
    }

	//隐藏不需要显示的项
	function showHideListItem() 
	{
    <% if tcWebApi_get("WebCustom_Entry", "isWLanACSupported","h") = "Yes" then %>
        for(var i = 1; i <= 14; i++)
    <% else %>
        for(var i = 1; i <= 8; i++)
    <% end if %>
    	{
    		if(i == 9 || i == 10)
				continue;
    		if(LanArray[i-1].Mode == 1)
    		{
				document.getElementById('record_'+ i).style.display = "";
		
    		}
			else
    		{
				document.getElementById('record_'+ i).style.display = "none";
			}
    	}
  	}
	
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="card-table" style="overflow-x:hidden;">
      <div class="title-content">VLAN Binding Configuration</div>
      <div class="title-description-content"> You can undertake the operation of the VLAN binding, the
                            value of the VLAN Settings in m1 / n1 VLAN on way. m1 represents the user side of the VLAN,
                            n1 represents the interface of the VLAN, multiple sets of VLAN in separated by commas.</div>
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 20%;" class="p-1">Port</th>
          <th style="width: 20%;">Binding Mode</th>
          <th style="width: 60%;">VLAN Binding Configuration</th>
        </tr>
        <script>
          document.write(CreateRouteList());
		  showHideListItem();
		  
          <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") = "Yes" then %>
            setDisplay('record_2', 0);
          <% end if %>
          <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") = "Yes" then %>
            setDisplay('record_3', 0);
            setDisplay('record_4', 0);
          <% end if %>
          <% if TCWebApi_get("WebCustom_Entry","isWLanSupported","h" ) <> "Yes" then %>
            for(var i = 5; i <= 8; i++){
              var ctlID = 'record_'+i;
              setDisplay(ctlID, 0);
            }
          <% else %>
            var ssidNum = parseInt('<% tcWebApi_get("WLan_Common","BssidNum","s") %>');
            if(ssidNum == 1)
            {
              setDisplay('record_6', 0);
              setDisplay('record_7', 0);
              setDisplay('record_8', 0);
            }
            else if(ssidNum == 2)  
            {
              setDisplay('record_7', 0);
              setDisplay('record_8', 0);
            }
            else if(ssidNum == 3)  
            {
              setDisplay('record_8', 0);
            }	
          <% end if %>
          <% if TCWebApi_get("WebCustom_Entry","isWLanACSupported","h" ) <> "Yes" then %>
            for(var i = 11; i <= 14; i++){
              var ctlID = 'record_'+i;
              setDisplay(ctlID, 0);
            }
          <% else %>
            var ssidacNum = parseInt('<% tcWebApi_get("WLan11ac_Common","BssidNum","s") %>');
            if(ssidacNum == 1)
            {
              setDisplay('record_12', 0);
              setDisplay('record_13', 0);
              setDisplay('record_14', 0);
            }
            else if(ssidacNum == 2)  
            {
              setDisplay('record_13', 0);
              setDisplay('record_14', 0);
            }
            else if(ssidacNum == 3)  
            {
              setDisplay('record_14', 0);
            }
          <% end if %>
        </script>
      </table>
    </div>
    <hr>
    <form name="ConfigForm" action="" method="post" style="margin: 1rem 1rem 1rem 1rem;">
      <div class="title-text p-1 mb-2">VLAN Mapping Setting</div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left p-1">Port:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" name="port" id="port" onchange="portChange()"> 
            <script language="javascript" type="text/javascript">
              //WritePortSelected()
              NewWritePortSelected();
            </script>
          </select>
        </div>
      </div>
      <div class="row p-1" style="display: none;">
        <div class="col-6">
          <div class="title-text-left p-1">Port:</div>
        </div>
        <div class="col-6">
          <div id="PortId"></div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left p-1">Model:</div>
        </div>
        <div class="col-6">
          <select id="ChooseDeviceType" class="form-control input-select" onchange="OnChooseDeviceType(this);">
            <option value="vlanbinding">VLAN Binding</option>
            <option value="lanwanbinding">Port Binding</option>
          </select>
        </div>
      </div>
      <div id="BindVlanRow" class="row p-1">
        <div class="col-6">
          <div class="title-text-left p-1">VLAN:</div>
        </div>
        <div class="col-6">
          <input type="text" id="UrlAddressControl" class="form-control input-textfield" name="UrlAddressControl"  maxlength="255">
        </div>
      </div>
      <div id="BindVlanRow" class="row p-1">
        <div class="col-12">
          <span style="font-size: 10px; color: #888888; padding-top: 5px; padding-left: 5px;">
            Note: VLAN format is m1/n1, m1 is LAN vlan, n1 is WAN vlan. Each vlan separate by semicolon.<br/>
            &nbsp;&nbsp;Eg: 101/102 or 101/102;110/102.
          </span>
        </div>
      </div>
      <div class="mt-2 center">
        <input type='hidden' value='0' name='entryidx'>
        <input type='hidden' value='0' name='formcommit'>
        <input type='hidden' value='0' name='bindmode'>
        <input type='hidden' value='0' name='bindvalue'>
        <input type='hidden' value='' name='empty'>
        <button class="btn-dashboard" type="button" onClick="javascript:return OnApplyButtonClick();">Apply</button>
        <button class="btn-dashboard" type="button" onClick="javascript:OnCancelButtonClick();">Cancel</button>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    portChange();
  </script>
</body>

</html>