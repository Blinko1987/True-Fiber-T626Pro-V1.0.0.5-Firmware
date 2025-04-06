<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>test_version</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="/JS/stylemain_skyw.css?v=2" type=text/css rel=stylesheet>
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
<% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo_skyw.jpg border=0>
<% else %>
      <TABLE height=80 cellSpacing=0 cellPadding=0 width=808 
      background=/img/framelogo_skyw.jpg border=0>
<% end if %> 
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=358>
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
                  class=logout style="color:#ffffff;line-height:40px;">Home Page
      </SPAN></A></TD></TR></TBODY>
	  </TABLE></TD></TR>
	  </TBODY>
	  </TABLE>
      <TABLE id=table2 height=100 cellSpacing=0 cellPadding=0 width=808 
border=0>
        <TBODY>
        <TR>
          <TD class=LocationDisplay id=LocationDisplay align=middle width=164 
          bgColor=#d8d8d8 rowSpan=2></TD>
          <TD id=MenuArea_L1 bgColor=#d8d8d8
          height=40>&nbsp;</TD></TR>
        <TR>
          <TD id=MenuArea_L2 bgColor=#0059A0
      height=60></TD>
</TR></TBODY></TABLE>

      <TABLE id=table3 height=11 cellSpacing=0 cellPadding=0 width=808 border=0 bgColor=#e7e7e7>
        <TBODY>
        <TR>
          <TD height=11><IMG height=11 src="/img/panel1.gif" width=164 border=0> </TD>
          <TD><IMG height=11 src="/img/panel2.gif" width=644 border=0> </TD>
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
      }
      
      </SCRIPT>
     <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD class="Item_L1_table_td_1_height30">
            <P class=Item_L1>Version</P></TD>
          <TD class="Item_table_td_2">　</TD>
          <TD class="Item_table_td_3"></TD>
          <TD vAlign=top class="Item_table_td_4" rowSpan=4>
            &nbsp;
          </TD>
        </TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height30">
            <P class=Item_L2></P></TD>
          <TD class="Item_table_td_2">　</TD>
          <TD>
            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD>
                  <TABLE cellSpacing=0 cellPadding=3 width=400 border=1 class="table2_stytle">
                    <TBODY>
                    <TR>
                      <TD class=table_title>Firmware Version:</TD>
                      <TD width=250>
                        <%If tcWebApi_get("DeviceInfo","FwVer","h") <> "N/A" Then tcWebApi_get("DeviceInfo","FwVer","s") end if%>
                      </TD>
                    </TR>
                    <TR>
                      <TD class=table_title>Software Version:</TD>
                      <TD width=250>
                        <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%>
                      </TD>
                    </TR>
                    <TR>
                      <TD class=table_title>Hardware Version:</TD>
                      <TD width=250>
                        <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s") end if%>
                      </TD>
                    </TR>
                    <!--% if tcWebApi_get("WebCustom_Entry", "isCTPROLINESupported", "h") = "Yes"  then %-->
                    <TR>
                      <TD class=table_title>Build Time:</TD>
                      <TD width=250><!--2018-03-26 15:31:17 -->
                        <%If tcWebApi_get("DeviceInfo","CompileTime","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CompileTime","s") end if%>
                      </TD>
                    </TR>
                    <!--%end if%-->
                    <TR>
                      <TD class=table_title>Reset Flag:</TD>
                      <TD width=300>
                        <%If tcWebApi_get("SysInfo_Entry","ResetFlag","h") <> "N/A" Then 
                            If tcWebApi_get("SysInfo_Entry","ResetFlag","h") = "1" Then
                                 asp_write("Factory_Mode") 
                            else 
                                 asp_write("User_Mode")
                            end if
                        end if%> 
                      </TD>
                    </TR>
                    <TR>
                      <TD class=table_title>MAC:</TD>
                      <TD width=300>
                        <% if TCWebApi_Get("Info_Ether", "mac", "h") <> "N/A" then TCWebApi_Get("Info_Ether", "mac", "s") end if %>
                      </TD>
                    </TR>
                    </TBODY>
                  </TABLE>
                </TD>
                <TD width=10>&nbsp;</TD>
              </TR>
              <TR>
                <TD width=10>&nbsp;</TD>
                <TD></TD>
                <TD width=10>&nbsp;</TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height10"></TD>
          <TD class="Item_table_td_2">　</TD>
          <TD></TD></TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height0"></TD>
          <TD class="Item_table_td_2">　</TD>
          <TD></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=100% 
        border=0><TBODY>
        <TR>
          <TD class="bottom_table_td_1">　</TD>
          <TD class="bottom_table_td_2">　</TD>
          <TD class="bottom_table_td_3">
            <P align=center></P>
          </TD>
          <TD class="bottom_table_td_4">&nbsp;</TD>
        </TR>
      </TABLE>
    </TD>
  </TR>
</TBODY>
</TABLE>
</BODY>
</HTML>