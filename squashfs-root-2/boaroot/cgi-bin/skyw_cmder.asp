<%
if Request_Form("save_flag") = "1" then 

  TCWebApi_set("Mesh_steercfg","disable_force_strng","disable_force_strng_flag")
  TCWebApi_set("Mesh_steercfg","disable_force_strng_11v_cli","disable_force_strng_11v_cli_flag")
  TCWebApi_set("Mesh_steercfg","LowRSSIAPSteerEdge_RE","LowRSSIAPSteerEdge_RE_flag")
  TCWebApi_set("Mesh_steercfg","LowRSSIAPSteerEdge_root","LowRSSIAPSteerEdge_root_flag")
  TCWebApi_set("Mesh_steercfg","RSSISteeringEdge_DG","RSSISteeringEdge_DG_flag")
  TCWebApi_set("Mesh_steercfg","RSSISteeringEdge_UG","RSSISteeringEdge_UG_flag")
  TCWebApi_commit("Mesh_steercfg")
  TCWebApi_commit("Mesh_common")
  TCWebApi_save()
  
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>CMDer</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/ui-dialog.css" type=text/css rel=stylesheet>
<LINK href="/JS/stylemain_skyw.css?v=<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s")%>" rel="stylesheet" type="text/css">
<LINK href="/JS/message.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/dialog-min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util_skyw.js"></SCRIPT>
<script type="text/javascript" src="/JS/message.js"></script>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
<style>

.btn-cmder{
  color: white;
  background-color: #22b6ec;
  border: none;
  height: 30px;
  margin-left: 20px;
}

</style>
</HEAD>
<body style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=1008 align=center 
border=0>
  <TBODY>
  <TR>
    <TD height=1>
      <TABLE cellSpacing=0 cellPadding=0 border=0 class="FragmeLogo"> 
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=558>
            <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0 height="100%">
              <TBODY>
              <TR>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD  align=right><SPAN class=curUserName>&nbsp; 
                  </SPAN></TD>
                <TD class=welcom vAlign=bottom align=middle width=20 style="color:#ffffff;line-height:40px;"></TD>
                <TD vAlign=bottom width=100><A
                  href="/cgi-bin/index.asp" target=_top style="TEXT-DECORATION: none;"><SPAN 
                  class=logout style="line-height:40px;">Home Page
      </SPAN></A></TD></TR></TBODY>
    </TABLE></TD></TR>
    </TBODY>
    </TABLE>
    <TABLE id=table3 cellSpacing=0 cellPadding=0 class=HeaderTable3 border=0>
      <TBODY>
        <TR>
          <TD class=HeaderTable3Img_1></TD>
          <TD class=HeaderTable3Img_2></TD>
        </TR>
      </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD vAlign=top>
<SCRIPT language=JavaScript type=text/javascript>
function LoadFrame()
{
  with ( document.forms[0] )
  {
    if("<%tcWebApi_get("Mesh_steercfg","disable_force_strng","s")%>" == "1"){
      setCheck('disable_force_strng', 1);
    }
    if("<%tcWebApi_get("Mesh_steercfg","disable_force_strng_11v_cli","s")%>" == "1"){
      setCheck('disable_force_strng_11v_cli', 1);
    }
  }
  
  initRSSI();
}

function btnCommit()
{
  var cform = document.ConfigForm;
  if(cform.disable_force_strng.checked == true)
  {
    cform.disable_force_strng_flag.value = "1";
  }
  else
  {
    cform.disable_force_strng_flag.value = "0";
  }
  
  if(cform.disable_force_strng_11v_cli.checked == true)
  {
    cform.disable_force_strng_11v_cli_flag.value = "1";
  }
  else
  {
    cform.disable_force_strng_11v_cli_flag.value = "0";
  }
  
  if (isPlusInteger(cform.LowRSSIAPSteerEdge_RE_flag.value) == false){
    alert("LowRSSIAPSteerEdge RE is invalid.");
    return false;
  }
  
  if (isPlusInteger(cform.LowRSSIAPSteerEdge_root_flag.value) == false){
    alert("LowRSSIAPSteerEdge Root is invalid.");
    return false;
  }
  
  if (isPlusInteger(cform.RSSISteeringEdge_DG_flag.value) == false){
    alert("RSSISteeringEdge DG is invalid.");
    return false;
  }
  
  if (isPlusInteger(cform.RSSISteeringEdge_UG_flag.value) == false){
    alert("RSSISteeringEdge UG is invalid.");
    return false;
  }
  
  cform.save_flag.value = "1";
  cform.submit();
}
</SCRIPT>

      <TABLE id="msgComponent" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
    <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        <TR>
          <TD class="Item_L1_table_td_1_height30">
            <P class=Item_L1>CMDer</P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD class="Item_table_td_3" style="width: 835px;"></TD>
          <TD vAlign=top class="Item_table_td_4" rowSpan=4 style="width: 6px; background-image: url(../img/panel3.gif);">
            <TABLE cellSpacing=0 cellPadding=1 width="100%" border=0 height='100%'>
              <TBODY>
              <TR>
                <TD valign='top'><!--A 
                  href="/cgi-bin/help_content.asp#Telnet" 
                  target=_blank><IMG height=34 src="/img/help.gif" 
                  width=40 border=0></A--></TD></TR>
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
              <TR>
                <TD valign='bottom'><IMG src='/img/tybottom.jpg' height=76 width=112></TD></TR>
<% end if %>
              </TBODY></TABLE></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height30">
            <P class=Item_L2></P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD>
            <!--<FORM name="ConfigForm" action="/cgi-bin/skyw_cmder.asp" method="post">
            <input type="hidden" name="save_flag" value="0">
      <input type="hidden" name="disable_force_strng_flag" value="<%tcWebApi_get("Mesh_steercfg","disable_force_strng","s")%>">
      <input type="hidden" name="disable_force_strng_11v_cli_flag" value="<%tcWebApi_get("Mesh_steercfg","disable_force_strng_11v_cli","s")%>">
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>Disable Force Steering:</TD>
        <TD>
          <INPUT type=checkbox name="disable_force_strng">
        </TD>
        </TR>
        <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>Disable Force Steering 11v cli:</TD>
        <TD>
          <INPUT type=checkbox name="disable_force_strng_11v_cli">
        </TD>
        </TR>
        <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>LowRSSIAPSteerEdge RE:</TD>
        <TD>
          <INPUT style="WIDTH: 135px" size=10 name="LowRSSIAPSteerEdge_RE_flag" value="<%tcWebApi_get("Mesh_steercfg","LowRSSIAPSteerEdge_RE","s")%>">
        </TD>
        <TD width=340>Threshold: (<span id="RE_threshold" style="color:red;">/</span>)</TD>
        </TR>
        <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>LowRSSIAPSteerEdge Root:</TD>
        <TD>
          <INPUT style="WIDTH: 135px" size=10 name="LowRSSIAPSteerEdge_root_flag" value="<%tcWebApi_get("Mesh_steercfg","LowRSSIAPSteerEdge_root","s")%>"> 
        </TD>
        <TD width=340>Threshold: (<span id="root_threshold" style="color:red;">/</span>)</TD>
        </TR>
        <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>RSSISteeringEdge DG:</TD>
        <TD>
          <INPUT style="WIDTH: 135px" size=10 name="RSSISteeringEdge_DG_flag" value="<%tcWebApi_get("Mesh_steercfg","RSSISteeringEdge_DG","s")%>"> 
        </TD>
        <TD width=340>Threshold: (<span id="DG_threshold" style="color:red;">/</span>)</TD>
        </TR>
        <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>RSSISteeringEdge UG:</TD>
        <TD>
          <INPUT style="WIDTH: 135px" size=10 name="RSSISteeringEdge_UG_flag" value="<%tcWebApi_get("Mesh_steercfg","RSSISteeringEdge_UG","s")%>"> 
        </TD>
        <TD width=340>Threshold: (<span id="UG_threshold" style="color:red;">/</span>)</TD>
        </TR>
              </TBODY>
            </TABLE>
            </FORM>
            -->
            <br>
            <form onsubmit="return false;" name="CMDerForm" method="post" style="margin-left: 10px;">
              <button type="button" id="openMapdLogBtn" onclick="openMapdLog()" class="btn-cmder">open mapd log</button>
              <button type="button" id="closeMapdLogBtn" onclick="closeMapdLog()" class="btn-cmder">close mapd log</button>
              <button type="button" id="showMeshSteercfgBtn" onclick="showMeshSteercfg()" class="btn-cmder">show mesh_steercfg</button>
              <button type="button" id="catMeshSteercfgBtn" onclick="catMeshSteercfg()" class="btn-cmder">cat mapd_strng</button>
              <button type="button" id="ifconfigBtn" onclick="ifconfig()" class="btn-cmder">ifconfig</button>
              <br>
              <br>
              <button type="button" id="wlanDATBtn" onclick="WLANDAT()" class="btn-cmder">WLAN dat</button>
              <button type="button" id="WLAN11acDATBtn" onclick="WLAN11acDAT()" class="btn-cmder">WLAN11ac dat</button>
              <button type="button" id="versionBtn" onclick="version()" class="btn-cmder">version</button>
              <br>
              <br>
              <br>
              <input id="hiddenText" type="text" style="display:none" /><!--表单中只有一个input时，焦点在input中点击回车会提交并刷新当前页面--> 
              <input style="width: 450px; height: 30px;" size="10" name="inputCmd" id="inputCmd" value="">
              <button type="button" id="executeCmdBtn" onclick="executeCmd()" class="btn-cmder">send command</button>
              <br>
              <br>
              <br>
              <textarea cols="90" rows="60" name="result" id="result" ></textarea>
            </form>
          </TD>
        </TR>
      <% end if %>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height10"></TD>
          <TD class="Item_table_td_2"></TD>
          <TD></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height0"></TD>
          <TD class="Item_table_td_2"></TD>
      <TD></TD></TR></TBODY></TABLE></TD></TR>
  <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=100% 
        border=0><TBODY>
        <TR>
          <TD class="bottom_table_td_1"></TD>
          <TD class="bottom_table_td_2"></TD>
          <TD class="bottom_table_td_3" style="width: 670px">
            <P align=right style="padding-right:20px;">
            <input type="button" id="btnOK" onclick="btnCommit()" value="Confirm" border="0" style="height:23; width:105;">&nbsp;&nbsp;
            <input type="button" id="btnCancel" onclick="RefreshPage()" value="Cancel" border="0" style="width:105; height:23;">
            </P>
          </TD>
          <TD class="bottom_table_td_4"></TD></TR>
    </TABLE></TD></TR>
    <% end if %>
  </TBODY></TABLE>
  
    <script>
      function openMapdLog(){
        //sendCmder("mapd_cli /tmp/mapd_ctrl set log_level 3");
        var cmd = $("#inputCmd").val("mapd_cli /tmp/mapd_ctrl set log_level 3");
        executeCmd();
      }
      
      function closeMapdLog(){
        //sendCmder("mapd_cli /tmp/mapd_ctrl set log_level 5");
        var cmd = $("#inputCmd").val("mapd_cli /tmp/mapd_ctrl set log_level 5");
        executeCmd();
      }
      
      function showMeshSteercfg(){
        //sendCmder("tcapi show mesh_steercfg");
        var cmd = $("#inputCmd").val("tcapi show mesh_steercfg");
        executeCmd();
      }
      
      function catMeshSteercfg(){
        var cmd = $("#inputCmd").val("cat /etc/mapd_strng.conf");
        executeCmd();
      }
      
      function ifconfig(){
        var cmd = $("#inputCmd").val("ifconfig");
        executeCmd();
      }
      
      function WLANDAT(){
        var cmd = $("#inputCmd").val("cat /etc/Wireless/RT2860AP/RT2860AP.dat");
        executeCmd();
      }
      
      function WLAN11acDAT(){
        var cmd = $("#inputCmd").val("cat /etc/Wireless/RT2860AP_AC/RT2860AP.dat");
        executeCmd();
      }
      
      function version(){
        var cmd = $("#inputCmd").val("cat /userfs/release");
        executeCmd();
      }
      
      function executeCmd(){
        var cmd = $("#inputCmd").val();
        if(cmd != ""){
          sendCmder(cmd);
        }
      }
      
      function sendCmder(data){
        console.log("cmd:" + data);
        $.ajax({
          type:"POST",
          url:"/webapi/cmder",
          data:"cmd=" + data,
          processData:false,
          success:function(res){
            //console.log("response data: " + res)
            //var obj_json = JSON.parse(res);
            if(res.code == 0){
              $.message(res.msg);
              console.log(res.msg);
              $("#result").text(res.data);
              return true;
            }else{
              $.message(res.msg);
              console.log(res.msg);
              $("#result").text(res.msg);
              return false;
            }
          },
          error:function(res){
            alert("execute failed, please try again.");
            //location.reload(true);
            return false;
          }
        });
      }
      
      $("input[name='LowRSSIAPSteerEdge_RE_flag']").bind("input propertychange",function(event){
        var RE_threshold_val = $("input[name='LowRSSIAPSteerEdge_RE_flag']").val();
        if(isPlusInteger(RE_threshold_val)){
          RE_threshold = parseInt(RE_threshold_val);
          var RE_threshold_RSSI = -94 + RE_threshold;
          var RE_threshold_RSSI_2G = -91 + RE_threshold;
          $("#RE_threshold").text("2.4G: " + RE_threshold_RSSI_2G + "db / " + "5G: " + RE_threshold_RSSI + "db");
        }else{
          $("#RE_threshold").text("error");
        }
      });
      
      $("input[name='LowRSSIAPSteerEdge_root_flag']").bind("input propertychange",function(event){
        var RE_threshold_val = $("input[name='LowRSSIAPSteerEdge_root_flag']").val();
        if(isPlusInteger(RE_threshold_val)){
          root_threshold = parseInt(RE_threshold_val);
          var root_threshold_RSSI = -94 + root_threshold;
          var root_threshold_RSSI_2G = -91 + root_threshold;
          $("#root_threshold").text("2.4G: " + root_threshold_RSSI_2G + "db / " + "5G: " + root_threshold_RSSI + "db");
        }else{
          $("#root_threshold").text("error");
        }
      });
      
      $("input[name='RSSISteeringEdge_DG_flag']").bind("input propertychange",function(event){
        var DG_threshold_val = $("input[name='RSSISteeringEdge_DG_flag']").val();
        if(isPlusInteger(DG_threshold_val)){
          DG_threshold = parseInt(DG_threshold_val);
          var DG_threshold_RSSI = -94 + DG_threshold - 8;
          $("#DG_threshold").text(DG_threshold_RSSI + "db");
        }else{
          $("#DG_threshold").text("error");
        }
      });
      
      $("input[name='RSSISteeringEdge_UG_flag']").bind("input propertychange",function(event){
        var UG_threshold_val = $("input[name='RSSISteeringEdge_UG_flag']").val();
        if(isPlusInteger(UG_threshold_val)){
          UG_threshold = parseInt(UG_threshold_val);
          var UG_threshold_RSSI = -91 + UG_threshold + 8;
          $("#UG_threshold").text(UG_threshold_RSSI + "db");
        }else{
          $("#UG_threshold").text("error");
        }
      });
      
      function initRSSI(){
        var RE_threshold_val = $("input[name='LowRSSIAPSteerEdge_RE_flag']").val();
        if(isPlusInteger(RE_threshold_val)){
          RE_threshold = parseInt(RE_threshold_val);
          var RE_threshold_RSSI = -94 + RE_threshold;
          var RE_threshold_RSSI_2G = -91 + RE_threshold;
          $("#RE_threshold").text("2.4G: " + RE_threshold_RSSI_2G + "db / " + "5G: " + RE_threshold_RSSI + "db");
        }else{
          $("#RE_threshold").text("error");
        }
        
        
        var RE_threshold_val = $("input[name='LowRSSIAPSteerEdge_root_flag']").val();
        if(isPlusInteger(RE_threshold_val)){
          root_threshold = parseInt(RE_threshold_val);
          var root_threshold_RSSI = -94 + root_threshold;
          var root_threshold_RSSI_2G = -91 + root_threshold;
          $("#root_threshold").text("2.4G: " + root_threshold_RSSI_2G + "db / " + "5G: " + root_threshold_RSSI + "db");
        }else{
          $("#root_threshold").text("error");
        }
        
        
        var DG_threshold_val = $("input[name='RSSISteeringEdge_DG_flag']").val();
        if(isPlusInteger(DG_threshold_val)){
          DG_threshold = parseInt(DG_threshold_val);
          var DG_threshold_RSSI = -94 + DG_threshold - 8;
          $("#DG_threshold").text(DG_threshold_RSSI + "db");
        }else{
          $("#DG_threshold").text("error");
        }
        
        
        var UG_threshold_val = $("input[name='RSSISteeringEdge_UG_flag']").val();
        if(isPlusInteger(UG_threshold_val)){
          UG_threshold = parseInt(UG_threshold_val);
          var UG_threshold_RSSI = -91 + UG_threshold + 8;
          $("#UG_threshold").text(UG_threshold_RSSI + "db");
        }else{
          $("#UG_threshold").text("error");
        }        
      }

      $(document).keydown(function(event){ 
        if(event.keyCode == 13){
          $("#executeCmdBtn").click()
        }
      });
    </script>
  
  
  </body>
  </HTML>
