<%
if Request_Form("port_mirror_flag") = "1" then 
  TCWebApi_set("PortMirror_Entry","Enable","enblPortMirrorFlag")
  TCWebApi_commit("PortMirror_Entry")	
  TCWebApi_save()
elseif Request_Form("port_mirror_flag") = "2" then
  TCWebApi_set("PortMirror_Entry","LanNumEnable","lan_port_enable")
  TCWebApi_set("PortMirror_Entry","LanNumEnableBin","lan_port_enable_bin")
  TCWebApi_set("PortMirror_Entry","Direction","Dir")
  TCWebApi_set("PortMirror_Entry","CaptureLan","Cap")
  TCWebApi_commit("PortMirror_Entry")	
  TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Port Mirror</title>
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
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/admin/admin-portmirror.asp" method="post">
    <input type="hidden" name="SaveFlag" value="0">
    <input type="hidden" name="TempleteString" value="TR069,INTERNET">
    <input type="hidden" name="TempleteFlag" value="0">
    <input type="hidden" name="lan_port_enable_bin" value="0">
    <input type="hidden" name="SelectTagFlag" value="0">
    <input type="hidden" name="enblPortMirrorFlag" value="0">
    <input type="hidden" name="lan_port_enable" value="<% tcWebApi_get("PortMirror_Entry","LanNumEnable","s") %>">
    <input type="hidden" name="port_mirror_flag" value="0">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">

    <div class="title-text">Port Mirror</div>
    <div class="title-description-text">On this page.you can configure port mirroring function.</div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">Port Mirror:</div>
      </div>
      <div class="col-4">
        <input type="radio" value="1" id="Enable1" onclick="PortMirrorEnableClick(1)" name="Enable" <% if tcWebApi_get("PortMirror_Entry","Enable","h") = "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Enabled</label>
        <input type="radio" value="0" id="Enable2" onclick="PortMirrorEnableClick(0)" name="Enable" <% if tcWebApi_get("PortMirror_Entry","Enable","h") <> "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Disabled</label>
       
        
      </div>
    </div>
    <div class="row p-1" id="lan_display" <% if tcWebApi_get("PortMirror_Entry", "Enable", "h") <> "Yes"  then %> style="display:none;"<%end if%>>
      <div class="col-4">
        <div class="title-text-left">Mirror</div>
      </div>
        <div class="col-8">

<% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
     <SCRIPT language=JavaScript type=text/javascript>
  var EthPortCapabilityStr = '<% tcWebApi_GetTable("Vid", "EthPortCapability") %>';
  var EthPortCapability = JSON.parse(EthPortCapabilityStr);
  var skylannum = <%tcWebApi_get("Vid_Common","skylannum","s")%>;
			var lan25_exist = 0;
			var lan1_exist = 0;
			var lan2_exist = 0;
			var lan3_exist = 0;
			var lan4_exist = 0;
            for(var i = 0; i < skylannum; i++){
				var currentLanName = EthPortCapability[0]["skylanname" + i];
				
				if(currentLanName == "LAN1"){
					 lan1_exist = 1;
				}else if(currentLanName == "LAN2"){
					 lan2_exist = 1;
				}else if(currentLanName == "LAN3"){
					 lan3_exist = 1;
				}else if(currentLanName == "LAN4"){
					 lan4_exist = 1;
				}
			} 
			
			if(lan1_exist ==1){
            	document.write('<input id="port_num1" type="checkbox" name="port_num1" onclick="lanclick(this)"><label class="input-radio" style="display:inline"> LAN1</label>');
			}else{
				document.write('<input id="port_num1" type="checkbox" name="port_num1" onclick="lanclick(this)" style="display: none"><label class="input-radio" style="display:none"> LAN1</label>');
			}
			if(lan2_exist ==1){
            	document.write('<input id="port_num2" type="checkbox" name="port_num2" onclick="lanclick(this)"><label class="input-radio" style="display:inline"> LAN2</label>');
			}else{
				document.write('<input id="port_num2" type="checkbox" name="port_num2" onclick="lanclick(this)" style="display: none"><label class="input-radio" style="display:none"> LAN2</label>');
			}
			if(lan3_exist ==1){
            	document.write('<input id="port_num3" type="checkbox" name="port_num3" onclick="lanclick(this)"><label class="input-radio" style="display:inline"> LAN3</label>');
			}else{
				document.write('<input id="port_num3" type="checkbox" name="port_num3" onclick="lanclick(this)" style="display: none"><label class="input-radio" style="display:none"> LAN3</label>');
			}
			if(lan4_exist ==1){
            	document.write('<input id="port_num4" type="checkbox" name="port_num4" onclick="lanclick(this)"><label class="input-radio" style="display:inline"> LAN4</label>');
			}else{
				document.write('<input id="port_num4" type="checkbox" name="port_num4" onclick="lanclick(this)" style="display: none"><label class="input-radio" style="display:none"> LAN4</label>');
			}
     </SCRIPT> 
<% else %> 
       <input id="port_num1" type="checkbox" name="port_num1" onclick="lanclick(this)"><label class="input-radio" > LAN1</label>
       <input id="port_num2" type="checkbox" name="port_num2" onclick="lanclick(this)"><label class="input-radio" > LAN2</label>
       <input id="port_num3" type="checkbox" name="port_num3" onclick="lanclick(this)"><label class="input-radio" > LAN3</label>
       <input id="port_num4" type="checkbox" name="port_num4" onclick="lanclick(this)"><label class="input-radio" > LAN4</label>
<% end if %>
       </div>
     
    </div>
    <div id='Direction' class="row p-1" <% if tcWebApi_get("PortMirror_Entry", "Enable", "h") <> "Yes"  then %> style="display:none;"<%end if%>>
      <div class="col-4">
        <div class="title-text-left">Direction</div>
      </div>
      <div class="col-4">
        <select id="Dir" class="form-control input-select" name="Dir" size="1"> 
          <option value="0" <%if tcWebApi_get("PortMirror_Entry","Direction","h") = "0" then asp_Write("selected") end if%>>inDirection</option>
          <option value="1" <%if tcWebApi_get("PortMirror_Entry","Direction","h") = "1" then asp_Write("selected") end if%>>outDirection</option>
        </select>
      </div>
    </div>

    <div id='Capture' class="row p-1" <% if tcWebApi_get("PortMirror_Entry", "Enable", "h") <> "Yes"  then %> style="display:none;"<%end if%>>
      <div class="col-4">
        <div class="title-text-left">Capture Port</div>
      </div>
      <div class="col-4">
        <select id="Cap" class="form-control input-select" name="Cap" size="1" onChange="ChangePort();"> 
<% if tcwebApi_get("Vid_EthPortCapability","skylanportenable","h") = "1" then %>
<SCRIPT language=JavaScript type=text/javascript>
 			if(lan1_exist ==1){
            	document.write('<option value="1" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "1" then asp_Write("selected") end if%>>LAN1</option>');
			}else{
				document.write('<option value="1" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "1" then asp_Write("selected") end if%> style="display:none">LAN1</option>');
			}
			if(lan2_exist ==1){
            	document.write('<option value="2" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "2" then asp_Write("selected") end if%>>LAN2</option>');
			}else{
				document.write('<option value="2" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "2" then asp_Write("selected") end if%> style="display:none">LAN2</option>');
			}
			if(lan3_exist ==1){
            	document.write('<option value="3" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "3" then asp_Write("selected") end if%>>LAN3</option>');
			}else{
				document.write('<option value="3" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "3" then asp_Write("selected") end if%> style="display:none">LAN3</option>');
			}
			if(lan4_exist ==1){
            	document.write('<option value="4" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "4" then asp_Write("selected") end if%>>LAN4</option>');
			}else{
				document.write('<option value="4" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "4" then asp_Write("selected") end if%> style="display:none">LAN4</option>');
			}
</SCRIPT> 	
<% else %> 
          <option value="1" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "1" then asp_Write("selected") end if%>>LAN1</option>
          <option value="2" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "2" then asp_Write("selected") end if%>>LAN2</option>
          <option value="3" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "3" then asp_Write("selected") end if%>>LAN3</option>
          <option value="4" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "4" then asp_Write("selected") end if%>>LAN4</option>
<% end if %>
          <option value="0" <%if tcWebApi_get("PortMirror_Entry","CaptureLan","h") = "0" then asp_Write("selected") end if%>>WAN</option>
        </select>
      </div>
    </div>
    
    
    </form>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="PortMirrorSubmit()">Apply Changes</button>
    </div>
  </div>
  <!-- content -->
  <script>
    $(document).ready(function()
    {
      
    });

    function LoadFrame() { 
        var Form = document.ConfigForm;
        var lan_port = "<% tcWebApi_get("PortMirror_Entry","LanNumEnable","s") %>";
        if(lan_port != "N/A")
        {
          var lan_port_id = parseInt(lan_port,10).toString(2);	
          var lan_port_array = lan_port_id.split("");
          var lan_port_length = lan_port_array.length;

          if(Form.Cap.value != "0" && (lan_port == "1" || lan_port == "2" || lan_port == "4" || lan_port == "8" || lan_port == "0")) 
          {
              if("1" == lan_port_array[lan_port_length-1]){
                Form.port_num1.checked = true;
                Form.port_num2.disabled=true;
                Form.port_num3.disabled=true;
                Form.port_num4.disabled=true;
              }else{
                Form.port_num1.checked = false;
              }

              if("1" == lan_port_array[lan_port_length-2]){
                Form.port_num2.checked = true;
                Form.port_num1.disabled=true;
                Form.port_num3.disabled=true;
                Form.port_num4.disabled=true;
              }else{
                Form.port_num2.checked = false;
              }

              if("1" == lan_port_array[lan_port_length-3]){
                Form.port_num3.checked = true;
                Form.port_num1.disabled=true;
                Form.port_num2.disabled=true;
                Form.port_num4.disabled=true;
              }else{
                Form.port_num3.checked = false;
              }
              
              if("1" == lan_port_array[lan_port_length-4]){
                Form.port_num4.checked = true;
                Form.port_num1.disabled=true;
                Form.port_num2.disabled=true;
                Form.port_num3.disabled=true;
              }else{
                Form.port_num4.checked = false;
              }
              
          }
          else if (Form.Cap.value != "0") //wan 切lan发现如果有多个lan口被勾选时，清空所有勾选项
          {
              Form.port_num1.checked = false;
              Form.port_num2.checked = false;
              Form.port_num3.checked = false;
              Form.port_num4.checked = false;
          }
          else
          {
              if("1" == lan_port_array[lan_port_length-1]){
                Form.port_num1.checked = true;
              }else{
                Form.port_num1.checked = false;
              }

              if("1" == lan_port_array[lan_port_length-2]){
                Form.port_num2.checked = true;
              }else{
                Form.port_num2.checked = false;
              }

              if("1" == lan_port_array[lan_port_length-3]){
                Form.port_num3.checked = true;
              }else{
                Form.port_num3.checked = false;
              }
              
              if("1" == lan_port_array[lan_port_length-4]){
                Form.port_num4.checked = true;
              }else{
                Form.port_num4.checked = false;
              }
              document.ConfigForm.Dir.options[1].style.display="none";

          }

       }
      }

     
    
    function lanclick(val)
    {
      var Form = document.ConfigForm;
      var lan_port = "<% tcWebApi_get("PortMirror_Entry","LanNumEnable","s") %>";
      
      if(Form.Cap.value != "0" && (lan_port == "1" || lan_port == "2" || lan_port == "4" || lan_port == "8" || lan_port == "0")) //只有lan2lan是一对一，才需要将其他按钮置灰
      {
        if( Form.port_num1.checked || Form.port_num2.checked || Form.port_num3.checked || Form.port_num4.checked )
        {
          
          if(val.name == "port_num1" && val.checked)
          {
            Form.port_num2.disabled=true;
            Form.port_num3.disabled=true;
            Form.port_num4.disabled=true;
          }
          else if(val.name == "port_num2" && val.checked)
          {
            Form.port_num1.disabled=true;
            Form.port_num3.disabled=true;
            Form.port_num4.disabled=true;
          }
          else if(val.name == "port_num3" && val.checked)
          {
            Form.port_num1.disabled=true;
            Form.port_num2.disabled=true;
            Form.port_num4.disabled=true;
          }
          else if(val.name == "port_num4" && val.checked)
          {
            Form.port_num1.disabled=true;
            Form.port_num3.disabled=true;
            Form.port_num2.disabled=true;
          }
        }
        else
        {
            Form.port_num1.disabled=false;
            Form.port_num2.disabled=false;
            Form.port_num3.disabled=false;
            Form.port_num4.disabled=false;
        }
     }
     

    }
    function PortMirrorEnableClick(val)
      {
        var Form = document.ConfigForm;
          
        if (val == "1")
        {
          Form.enblPortMirrorFlag.value = "Yes";
        }
        else
        {
          Form.enblPortMirrorFlag.value = "No";    
        }
        Form.port_mirror_flag.value = "1";
        Form.submit();
        //showLoading();
      }
      function ChangePort() {
        var Form = document.ConfigForm;
        if(Form.Cap.value == "0")
        {
          Form.Dir.options[1].style.display="none";
          Form.Dir.value = "0";
          Form.port_num1.disabled=false;
          Form.port_num2.disabled=false;
          Form.port_num3.disabled=false;
          Form.port_num4.disabled=false;
        }
        else
        {
          Form.Dir.options[0].style.display="";
          
        }
    }
      function PortMirrorSubmit()
      {
        var	Form = document.ConfigForm;
        var lan_port = "<% tcWebApi_get("PortMirror_Entry","LanNumEnable","s") %>";
        var lan_port_array = [0,0,0,0];
        var portLength = lan_port_array.length;
		var i = 0;

        if(Form.port_num1.checked){
          lan_port_array[portLength-1] = "1";     // 该值用于wan2lan镜像命令
          Form.lan_port_enable_bin.value = "1"; // 该值用于lan2lan镜像命令
          i++;
        }else{
          lan_port_array[portLength-1] = "0";
        }

        if(Form.port_num2.checked){
          lan_port_array[portLength-2] = "1";
          Form.lan_port_enable_bin.value = "2";
		  i++;
        }else{
          lan_port_array[portLength-2] = "0";
        }

        if(Form.port_num3.checked){
          lan_port_array[portLength-3] = "1";
          Form.lan_port_enable_bin.value = "3";
		  i++;
        }else{
          lan_port_array[portLength-3] = "0";
        }

        if(Form.port_num4.checked){
          lan_port_array[portLength-4] = "1";
          Form.lan_port_enable_bin.value = "4";
		  i++;
        }else{
          lan_port_array[portLength-4] = "0";
        }
        Form.port_mirror_flag.value = "2";
        Form.lan_port_enable.value = parseInt(lan_port_array.join(""),2).toString(10); // 转成10进制方便后台wan2lan镜像下命令
        //Form.lan_port_enable_bin.value=lan_port_array.reverse().join("");
        if (Form.Cap.value != "0" && i > 1) //wan 切lan发现如果有多个lan口被勾选时，清空所有勾选项
        {
            alert("Lan Port Mirror only can configured one for one!");
            Form.port_num1.checked = false;
            Form.port_num2.checked = false;
            Form.port_num3.checked = false;
            Form.port_num4.checked = false;
            Form.lan_port_enable.value="0";
            Form.lan_port_enable_bin.value = "0";
        }
        Form.submit();
        showLoading();
      }

  </script>
</body>

</html>



