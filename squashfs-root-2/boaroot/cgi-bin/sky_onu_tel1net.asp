<%
if Request_Form("telnet_flag") = "1" then 
  TCWebApi_set("Account_TelnetEntry","Active","telnetenable_flag")
  TCWebApi_set("Account_TelnetEntry","Interface","telnet_interface")
  TCWebApi_set("Firewall_Entry","lan_telnet_enable","lan_telnet_Flag")
  TCWebApi_set("Firewall_Entry","wan_telnet_enable","wan_telnet_Flag")
  TCWebApi_commit("Firewall_Entry")
  TCWebApi_commit("Account_TelnetEntry")
  TCWebApi_save()
  
end if
if Request_Form("postflag") = "1" then
  TCWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
  TCWebApi_commit("System_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>Telnet</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/ui-dialog.css" type=text/css rel=stylesheet>
<LINK href="/JS/stylemain_skyw.css?v=2" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/jquery-1.11.3.min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/dialog-min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util_skyw.js"></SCRIPT>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR></HEAD>
<BODY style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onload="if(getElById('ConfigForm') != null)LoadFrame()" 
onunload=DoUnload() marginheight="0" marginwidth="0">
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=808 align=center border=0>
  <TBODY>
  <TR>
    <TD height=1>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 border=0>
        <TBODY>
          <TR>
            <TD>
              <a href="/">
                <img src="/image/True-Gigatex1.png" style="width: 200px;">
              </a>
            </TD>
            <TD vAlign=bottom align=right width=358>
              <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0 height="100%">
                <TBODY>
                  <TR>
                    <TD>&nbsp;</TD>
                    <TD>&nbsp;</TD>
                    <TD>&nbsp;</TD>
                  </TR>
                  <TR>
                    <TD  align=right>
                      <SPAN class=curUserName>&nbsp; 
                      </SPAN>
                    </TD>
                    <TD class=welcom vAlign=bottom align=middle width=20 style="color:#ffffff;line-height:40px;"></TD>
                    <TD vAlign=bottom width="150">
                      <A href="/cgi-bin/index.asp" target=_top style="TEXT-DECORATION: none;">
                        <SPAN class=logout style="color:#000000;line-height:40px;">Home Page(<% if tcWebApi_get("WebCurSet_Entry", "CurrentAccess", "h") = "0"  then asp_write("Superadmin") else asp_write("Admin") end if %>)
                        </SPAN>
                      </A>
                    </TD>
                  </TR>
                </TBODY>
              </TABLE>
            </TD>
          </TR>
        </TBODY>
      </TABLE>
      <TABLE id=table2 height=100 cellSpacing=0 cellPadding=0 width=808 border=0>
        <TBODY>
          <TR>
            <TD class=LocationDisplay id=LocationDisplay align=middle width=164 bgColor=#d8d8d8 rowSpan=2></TD>
            <TD id=MenuArea_L1 bgColor=#d8d8d8 height=40>&nbsp;</TD>
          </TR>
          <TR>
            <TD id="MenuArea_L2" bgColor="#3E6CA6" height=60></TD>
          </TR>
        </TBODY>
      </TABLE>
      <TABLE id=table3 height=11 cellSpacing=0 cellPadding=0 width=808 border=0 bgColor=#e7e7e7>
        <TBODY>
          <TR>
            <TD height=11>
              <IMG height=11 src="/img/panel1.gif" width=164 border=0>
            </TD>
            <TD>
              <IMG height=11 src="/img/panel2.gif" width=644 border=0>
            </TD>
          </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD vAlign=top>
<SCRIPT language=JavaScript type=text/javascript>
var enbl = <% if tcWebApi_get("Account_TelnetEntry","Active","h") <> "Yes" then asp_write("0") else asp_write("1") end if %>;
var interfaceName = "<% tcWebApi_get("Account_TelnetEntry","Interface","s") %>";
var flag = 0;
function LoadFrame()
{
  with ( document.forms[0] )
  {
    setCheck('telnetEnbl', enbl);
    if(interfaceName.indexOf("br0")>=0)
    {
      setCheck('lanEnbl', 1);
    }
    if(interfaceName.indexOf("ppp")>=0 || interfaceName.indexOf("nas")>=0)
    {
      setCheck('wanEnbl', 1);
    }
    if(flag == 0)
    {
      setCheck('wanEnbl', 0);
      getElById('wanEnbl').disabled = true;
    }
    tlClickEnble(getElById('telnetEnbl'));
    wanClickEnble(getElById('wanEnbl'));
  }
}

function WriteInterfaceNameSelected()
{
  var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
  var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
  var vEntryName = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
  var vEntryValue = vArrayStr.split(',');
  var curInterfaceName = "<% tcWebApi_get("Account_TelnetEntry","Interface","s") %>";
  flag = 0;
  for (i = 0; i < nEntryNum; i++)
  {
    if( ( vEntryName[i].indexOf('_INTERNET_') >= 0 || vEntryName[i].indexOf('OTHER') >= 0 )
       && vEntryName[i].indexOf('_B_') < 0 )
    {
      if(curInterfaceName.indexOf(vEntryValue[i])>=0)
      {
        document.write('<option value=' + vEntryValue[i] + ' selected>' + vEntryName[i] + '</option>');
      }
      else
      {
        document.write('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
      }
      flag++;
    }
  }
}
function tlClickEnble(telnetEnbl)
{
  if (telnetEnbl.checked == true)
  {
    setDisplay('telnetInfo',1);
  }
  else
  {
    setDisplay('telnetInfo',0);
  }
}
function wanClickEnble(wanEnbl)
{
  if (wanEnbl.checked == true)
  {
    setDisplay('wanInfo',1);
  }
  else
  {
    setDisplay('wanInfo',0);
  }
}
function btnCommit()
{
  var lanEnable;
  var wanEnable;
  var cform = document.ConfigForm;
  if(cform.telnetEnbl.checked == true)
  {
    cform.telnetenable_flag.value = "Yes";
    if(cform.lanEnbl.checked == true)
    {
      cform.lan_telnet_Flag.value = "1";
      lanEnable = "br0";
    }
    else
    {
      lanEnable = "";
    }
    if(cform.wanEnbl.checked == true)
    {
      cform.wan_telnet_Flag.value = "1";
      wanEnable = cform.wanInterface.value;
    }
    else
    {
      wanEnable = "";
    }
    if(lanEnable == "" && wanEnable == "")
    {
      alert("Please select at least one interface to access the ONT through telnet.");
      return false;
    }
    else if(lanEnable == "" && wanEnable != "")
    {
      cform.telnet_interface.value = wanEnable;
    }
    else if(lanEnable != "" && wanEnable == "")
    {
      cform.telnet_interface.value = lanEnable;
    }
    else if(lanEnable != "" && wanEnable != "")
    {
      cform.telnet_interface.value = lanEnable+","+wanEnable;
    }
  }
  else
  {
    cform.telnetenable_flag.value = "No";
    cform.telnet_interface.value = "";
  }
  cform.telnet_flag.value = "1";
  cform.submit();
}
function btnUpload()
{
  var form=document.uploadConfigForm;
  var string = form.FW_UploadFile.value.search(/.sh/);
  if (form.FW_UploadFile.value==""){
    alert("Please choose a upload file!");
  }
  if (string >= 0){
    document.getElementById("uiStatus").innerHTML = "Uploading, please wait...";
    form.postflag.value = "1";
    form.submit();
  }else{
    alert("File format is wrong!");
  }
}
</SCRIPT>

      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD class="Item_L1_table_td_1_height30">
            <P class=Item_L1>Telnet Management</P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD class="Item_table_td_3"></TD>
          <TD vAlign=top class="Item_table_td_4" rowSpan=6>
            <TABLE cellSpacing=0 cellPadding=1 width="100%" border=0 height='100%'>
              <TBODY>
              <TR>
                <TD valign='top' bgColor="#3E6CA6"></TD></TR>
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
            <FORM name="ConfigForm" action="/cgi-bin/sky_onu_tel1net.asp" method="post">
            <input type="hidden" name="telnet_flag" value="0">
      <input type="hidden" name="telnetenable_flag" value="<% tcWebApi_get("Account_TelnetEntry","Active","s") %>">
      <input type="hidden" name="telnet_interface" value="<% tcWebApi_get("Account_TelnetEntry","Interface","s") %>">
      <input type="hidden" name="lan_telnet_Flag" value="0">
      <input type="hidden" name="wan_telnet_Flag" value="0">

            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD>Enable:
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT onclick=tlClickEnble(this) type=checkbox value=ON name=telnetEnbl>
        </TD>
        </TR>
              </TBODY>
            </TABLE>
            <TABLE id="telnetInfo" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>Enable the LAN-side PC to access the ONT:</TD>
        <TD>
          <INPUT type=checkbox value=ON name=lanEnbl>
        </TD>
              </TR>
              <TR height=40>
                <TD width=10>&nbsp;</TD>
                <TD width=240>Enable the WAN-side PC to access the ONT:</TD>
        <TD>
          <INPUT onclick=wanClickEnble(this) type=checkbox value=ON name=wanEnbl>
        </TD>
              </TR>
              <TR id="wanInfo" height=40>
                <TD width=10>&nbsp;</TD>
                <TD colspan="2">WAN Interface:
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SELECT id="wanInterface" name="wanInterface">
            <script language="JavaScript" type="text/javascript">
              WriteInterfaceNameSelected();
            </script>
          </SELECT>
        </TD>
              </TR>
              </TBODY>
            </TABLE>
            </FORM>
          </TD>
        </TR>
        <TR>
          <TD class="Item_table_td_1_height30">
            <P class=Item_L1>Syslog Diagnostic</P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height30">
            <P class=Item_L2></P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD>
            <FORM ENCTYPE="multipart/form-data" name="uploadConfigForm" method="post">
              <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 id="upgrade_section">
              <TBODY>
                <TR style="display:none;">
                <TD width=10>&nbsp;</TD>
                <TD width="447">
                  <INPUT TYPE="HIDDEN" NAME="postflag" VALUE="0">
          <INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="4">
                </TD>
                <TD width=10>&nbsp;</TD></TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
          File Name:&nbsp;&nbsp;&nbsp;<INPUT TYPE="FILE" NAME="FW_UploadFile" SIZE="30" MAXLENGTH="128">
          <BUTTON onclick="btnUpload()" name=upload value="Upload">Upload</BUTTON>
        </TD>
                <TD width=10>&nbsp;</TD></TR>
        <TR>
                <TD width=10>&nbsp;</TD>
                <TD width="447">
          <p color="#FF0000" id=uiStatus><% if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then asp_Write("") elseif tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then asp_Write("Upgrade failed, please try it again!") end if%></p>
                </TD>
                <TD width=10>&nbsp;</TD></TR>
                <!--<TR>
                <TD width=10>&nbsp;</TD>
                <TD align=center>
          <BUTTON onclick="btnUpload()" name=upload value="Upload">Upload</BUTTON>
        </TD>
                <TD width=10>&nbsp;</TD></TR>-->
        </TBODY></TABLE>
      </FORM></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height10"></TD>
          <TD class="Item_table_td_2"></TD>
          <TD></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height0"></TD>
          <TD class="Item_table_td_2"></TD>
      <TD></TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=100% 
        border=0><TBODY>
        <TR>
          <TD class="bottom_table_td_1"></TD>
          <TD class="bottom_table_td_2"></TD>
          <TD class="bottom_table_td_3">
            <P align="center"><IMG id="btnOK" onclick="btnCommit()" height="23"
            src="/img/ok_skyw.gif" width="80" border="0">&nbsp;&nbsp;<IMG 
            id="btnCancel" onclick="RefreshPage()" height="23" src="/img/cancel_skyw.gif" 
            width="80" border="0"> </P></TD>
          <TD class="bottom_table_td_4"></TD></TR>
    </TABLE></TD></TR>
  </TBODY></TABLE></BODY></HTML>
