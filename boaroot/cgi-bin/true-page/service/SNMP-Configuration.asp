<%
If Request_Form("Snmpflag")="1" then 
	TCWebApi_set("Snmpd_Entry","Active","SNMP_active")
	TCWebApi_set("Snmpd_Entry","rocommunity","SNMP_get")
	TCWebApi_set("Snmpd_Entry","rwcommunity","SNMP_set")
	
	if Request_Form("SnmpFullflag")="Yes" then 
		if  Request_Form("startTrapflag") <> "Yes" then 
			TCWebApi_set("Snmpd_Entry","sysName","SNMP_sysName")
			TCWebApi_set("Snmpd_Entry","sysContact","SNMP_sysContact")
			TCWebApi_set("Snmpd_Entry","sysLocation","SNMP_sysLocation")
		end if
		TCWebApi_set("Snmpd_Entry","trap2sink","SNMP_trapManagerIP")
		if Request_Form("SnmpIPv6flag")="Yes" then
			TCWebApi_set("Snmpd_Entry","trap2sink_ipv6","SNMP_trapManagerIPv6")
		end if	
	end If

	if Request_Form("trustIPflag") = "Yes" then
		TCWebApi_set("Snmpd_Entry", "trustStartIP", "SNMP_trustStartIP")
		TCWebApi_set("Snmpd_Entry", "trustEndIP", "SNMP_trustEndIP")
		if Request_Form("SnmpIPv6flag") = "Yes" then
			TCWebApi_set("Snmpd_Entry", "trustStartIPv6", "SNMP_trustStartIPv6")
			TCWebApi_set("Snmpd_Entry", "trustEndIPv6", "SNMP_trustEndIPv6")
		end if
	end if
			
	if Request_Form("Snmpv3flag")="Yes" then
		TCWebApi_set("Snmpd_Entry","V3Enable","SNMPv3_enable")
		if Request_Form("SNMPv3_enable")="Yes" then
			TCWebApi_set("Snmpd_Entry","v3Name","SNMPv3_User")
			TCWebApi_set("Snmpd_Entry","access","Access_Permissions")
			TCWebApi_set("Snmpd_Entry","authProto","Auth_Proto")
			TCWebApi_set("Snmpd_Entry","authPasswd","Auth_Passwd")
			TCWebApi_set("Snmpd_Entry","privProto","Privacy_Proto")
			TCWebApi_set("Snmpd_Entry","privPasswd","Privacy_Passwd")
		end if
	end if
				
	tcWebApi_commit("Snmpd_Entry")
	TCWebApi_save()
End If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SNMP Configuration</title>
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
</head>

<body>
    <!-- content -->
    <div class="col-md-12 col-sm-12">
        <div class="container-full container-resize-height">
            <form name="SNMP_form" method="post" action="/cgi-bin/true-page/service/SNMP-Configuration.asp">
                <INPUT TYPE="hidden" NAME="IpVersion0" VALUE='<%if tcWebApi_get("Wan_PVC0","Active","h") = "Yes" then tcWebApi_get("Wan_PVC0","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion1" VALUE='<%if tcWebApi_get("Wan_PVC1","Active","h") = "Yes" then tcWebApi_get("Wan_PVC1","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion2" VALUE='<%if tcWebApi_get("Wan_PVC2","Active","h") = "Yes" then tcWebApi_get("Wan_PVC2","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion3" VALUE='<%if tcWebApi_get("Wan_PVC3","Active","h") = "Yes" then tcWebApi_get("Wan_PVC3","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion4" VALUE='<%if tcWebApi_get("Wan_PVC4","Active","h") = "Yes" then tcWebApi_get("Wan_PVC4","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion5" VALUE='<%if tcWebApi_get("Wan_PVC5","Active","h") = "Yes" then tcWebApi_get("Wan_PVC5","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion6" VALUE='<%if tcWebApi_get("Wan_PVC6","Active","h") = "Yes" then tcWebApi_get("Wan_PVC6","IPVERSION","s") else asp_write("0") end if%>'>
                <INPUT TYPE="hidden" NAME="IpVersion7" VALUE='<%if tcWebApi_get("Wan_PVC7","Active","h") = "Yes" then tcWebApi_get("Wan_PVC7","IPVERSION","s") else asp_write("0") end if%>'>
        
                <INPUT TYPE="hidden" NAME="Snmpflag" VALUE="0">
                <INPUT TYPE="hidden" NAME="Snmpv3flag" VALUE="<%tcWebApi_get("WebCustom_Entry","isSNMPV3Supported","s")%>">
                <INPUT TYPE="hidden" NAME="SnmpIPv6flag" VALUE="<%tcWebApi_get("WebCustom_Entry","isSNMPIPv6Supported","s")%>">
                <INPUT TYPE="hidden" NAME="SnmpFullflag" VALUE="<%tcWebApi_get("WebCustom_Entry","isSNMPFullSupported","s")%>">
                <INPUT TYPE="hidden" NAME="startTrapflag" VALUE="<%tcWebApi_get("WebCustom_Entry","isStartTrap","s")%>">
                <INPUT TYPE="hidden" NAME="trustIPflag" VALUE="<%tcWebApi_get("WebCustom_Entry","isSnmpTrustIp","s")%>">
                <div class="title-text">SNMP Configuration</div>
                <div class="title-description-text">This page is used to configure SNMP.</div>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">SNMP:</div>
                    </div>
                    <div class="col-6">
                        <input type="radio" value="Yes" name="SNMP_active" onClick="snmpOff(0)"
                            <% If TCWebApi_get("Snmpd_Entry","Active","h") = "Yes" then asp_Write("checked") end if%>>
                        <label class="input-radio">Activated</label>
                        <input type="radio" value="No" name="SNMP_active" onClick="snmpOff(1)"
                            <% If TCWebApi_get("Snmpd_Entry","Active","h") = "No" then asp_Write("checked") end if%>>
                        <label class="input-radio">Deactivated</label>
                    </div>
                </div>
                <div id="SNMP_content">
                <% if tcWebApi_get("WebCustom_Entry","isSNMPV3Supported","h") = "Yes" then %>
                  <div class="row p-1">
                      <div class="col-6">
                          <div class="title-text-left">SNMPv3:</div>
                      </div>
                      <div class="col-6">
                          <input type="radio" value="Yes" name="SNMPv3_enable" onClick="snmpv3Off(0)"
                              <% If TCWebApi_get("Snmpd_Entry","V3Enable","h") = "Yes" then asp_Write("checked") end if%>>
                          <label class="input-radio">Enable</label>
                          <input type="radio" value="No" name="SNMPv3_enable" onClick="snmpv3Off(1)"
                              <% If TCWebApi_get("Snmpd_Entry","V3Enable","h") = "No" then asp_Write("checked") end if If TCWebApi_get("Snmpd_Entry","V3Enable","h") = "N/A" then asp_Write("checked") end if%>>
                          <label class="input-radio">Disable</label>
                      </div>
                  </div>
                <% end if %>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">Get Community:</div>
                    </div>
                    <div class="col-6">
                        <input class="form-control input-textfield" type="text" name="SNMP_get" size="20" maxLength="15"
                            value="<% If TCWebApi_get("Snmpd_Entry","rocommunity","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","rocommunity","s") end if%>">
                    </div>
                </div>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">Set Community:</div>
                    </div>
                    <div class="col-6">
                        <input class="form-control input-textfield" type="text" name="SNMP_set" size="20" maxLength="15"
                            value="<% If TCWebApi_get("Snmpd_Entry","rwcommunity","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","rwcommunity","s") end if%>">
                    </div>
                </div>
                <% if tcWebApi_get("WebCustom_Entry","isSnmpTrustIp","h") = "Yes" then %>
                  <div class="row p-1">
                      <div class="col-6">
                          <div class="title-text-left">Trust Start IP:</div>
                      </div>
                      <div class="col-6">
                          <input class="form-control input-textfield" type="text" name="SNMP_trustStartIP" size="20" maxLength="15"
                              value="<% If TCWebApi_get("Snmpd_Entry","trustStartIP","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trustStartIP","s") else asp_Write("0.0.0.0") end if%>">
                      </div>
                  </div>
                  <div class="row p-1">
                      <div class="col-6">
                          <div class="title-text-left">Trust End IP:</div>
                      </div>
                      <div class="col-6">
                          <input class="form-control input-textfield" type="text" name="SNMP_trustEndIP" size="20" maxLength="15"
                              value="<% If TCWebApi_get("Snmpd_Entry","trustEndIP","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trustEndIP","s") else asp_Write("0.0.0.0") end if%>">
                      </div>
                  </div>
                  <% if tcWebApi_get("WebCustom_Entry","isSNMPIPv6Supported","h") = "Yes" then %>	 
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">Trust Start IPv6:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_trustStartIPv6" size="20" maxLength="45"
                                  value="<% If TCWebApi_get("Snmpd_Entry","trustStartIPv6","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trustStartIPv6","s") else asp_Write("") end if%>">
                          </div>
                      </div>
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">Trust End IPv6:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_trustEndIPv6" size="20" maxLength="45"
                                  value="<% If TCWebApi_get("Snmpd_Entry","trustEndIPv6","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trustEndIPv6","s") else asp_Write("") end if%>">
                          </div>
                      </div>
                  <%end if%>
                <%end if%>
                <% if tcWebApi_get("WebCustom_Entry","isSNMPFullSupported","h") = "Yes" then %>
                  <% if tcWebApi_get("WebCustom_Entry","isStartTrap","h") <> "Yes" then %>	
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">System Name:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_sysName" size="20" maxLength="15"
                                  value="<% If TCWebApi_get("Snmpd_Entry","sysName","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","sysName","s") end if%>">
                          </div>
                      </div>
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">System Contact:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_sysContact" size="20" maxLength="15"
                                  value="<% If TCWebApi_get("Snmpd_Entry","sysContact","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","sysContact","s") end if%>">
                          </div>
                      </div>
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">System Location:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_sysLocation" size="20" maxLength="15"
                                  value="<% If TCWebApi_get("Snmpd_Entry","sysLocation","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","sysLocation","s") end if%>">
                          </div>
                      </div>
                  <%end if %>
                  <div class="row p-1">
                      <div class="col-6">
                          <div class="title-text-left">Trap Manager IP:</div>
                      </div>
                      <div class="col-6">
                          <input class="form-control input-textfield" type="text" name="SNMP_trapManagerIP" size="20" maxLength="15"
                              value="<% If TCWebApi_get("Snmpd_Entry","trap2sink","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trap2sink","s") else asp_Write("0.0.0.0") end if%>">
                      </div>
                  </div>
                  <% if tcWebApi_get("WebCustom_Entry","isSNMPIPv6Supported","h") = "Yes" then %>
                      <div class="row p-1">
                          <div class="col-6">
                              <div class="title-text-left">Trap Manager IPv6:</div>
                          </div>
                          <div class="col-6">
                              <input class="form-control input-textfield" type="text" name="SNMP_trapManagerIPv6" size="20" maxLength="50"
                                  value="<% If TCWebApi_get("Snmpd_Entry","trap2sink_ipv6","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","trap2sink_ipv6","s") else asp_Write("::") end if%>">
                          </div>
                      </div>
                  <%end if %>
                <%end if %>
                <% if tcWebApi_get("WebCustom_Entry","isSNMPV3Supported","h") = "Yes" then %>
                  <div id="snmpv3_L1" class="row" style="display: none;">
                      <div class="col-12">
                          <hr>
                          <div class="title-text">SNMPv3</div>

                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">User Name:</div>
                              </div>
                              <div class="col-6">
                                  <input class="form-control input-textfield" type="text" name="SNMPv3_User" SIZE="20"
                                      MAXLENGTH="60"
                                      value='<% If TCWebApi_get("Snmpd_Entry","v3Name","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","v3Name","s") end if%>'>
                              </div>
                          </div>
                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">Access Permissions:</div>
                              </div>
                              <div class="col-6">
                                  <select class="form-control input-select" name="Access_Permissions">
                                      <option value="RO" <% if tcWebApi_get("Snmpd_Entry","access","h") = "RO" then asp_Write("selected") end if %>>RO</option>
                                      <option value="RW" <% if tcWebApi_get("Snmpd_Entry","access","h") = "RW" then asp_Write("selected") end if %>>RW</option>
                                  </select>
                              </div>
                          </div>
                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">Auth Protocol:</div>
                              </div>
                              <div class="col-6">
                                  <select class="form-control input-select" name="Auth_Proto">
                                      <option value="MD5" <% if tcWebApi_get("Snmpd_Entry","authProto","h") = "MD5" then asp_Write("selected") end if %>>MD5</option>
                                      <option value="SHA" <% if tcWebApi_get("Snmpd_Entry","authProto","h") = "SHA" then asp_Write("selected") end if %>>SHA</option>
                                  </select>
                              </div>
                          </div>
                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">Auth Password:</div>
                              </div>
                              <div class="col-6">
                                  <div class="row">
                                      <div class="col-7 pr-0">
                                          <input class="form-control input-textfield" type="text" name="Auth_Passwd" size="20" maxLength="60"
                                              value="<% If TCWebApi_get("Snmpd_Entry","authPasswd","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","authPasswd","s") end if%>">
                                      </div>
                                      <div class="col-5 pl-0 title-text-right">
                                          <label>[8 - 31 characters]</label>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">Privacy Protocol:</div>
                              </div>
                              <div class="col-6">
                                  <select class="form-control input-select" name="Privacy_Proto">
                                      <option value="DES" <% if tcWebApi_get("Snmpd_Entry","privProto","h") = "DES" then asp_Write("selected") end if %>>DES</option>
                                      <option value="AES" <% if tcWebApi_get("Snmpd_Entry","privProto","h") = "AES" then asp_Write("selected") end if %>>AES</option>
                                  </select>
                              </div>
                          </div>
                          <div class="row p-1">
                              <div class="col-6">
                                  <div class="title-text-left">Privacy Password:</div>
                              </div>
                              <div class="col-6">
                                  <div class="row">
                                      <div class="col-7 pr-0">
                                          <input class="form-control input-textfield" type="text" name="Privacy_Passwd" size="20" maxLength="60"
                                              value="<% If TCWebApi_get("Snmpd_Entry","privPasswd","h") <> "N/A" then TCWebApi_get("Snmpd_Entry","privPasswd","s") end if%>">
                                      </div>
                                      <div class="col-5 pl-0 title-text-right">
                                          <label>[8 - 31 characters]</label>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
                <% end if %>
                </div>

                <div class="mt-2 center">
                    <button id="btnOK" class="btn-dashboard" onclick="javascript: return SNMPsave();">Apply</button>
                    <!-- 调用在util_skyw.js中的refreshPage()事件 -->
                    <button id="btnCancel" class="btn-dashboard" onclick="javascript: RefreshPage();">Cancel</button>
                </div>
            </form>
        </div>
    </div>
    <!-- content -->

    <script>
        /** SNMP表单项点击事件  **/
        function snmpOff(off) {
            if (off) {
              $("#SNMP_content").hide();
            }else{
              $("#SNMP_content").show();
            }
        }

        /** SNMPv3表单项点击事件  **/
        function snmpv3Off(off) {
            if (off) {
                setDisplay('snmpv3_L1', 0);
            } else {
                setDisplay('snmpv3_L1', 1);
            }
        }

        /** 表单按钮Apply提交事件  **/
        function SNMPsave() 
        {
            var setCOM = document.SNMP_form.SNMP_set.value;
            var getCOM = document.SNMP_form.SNMP_get.value;
            
            var ipversion = ipv4OnlyOrIpv6OnlyCheck();
            <%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
                if(!confirm("Are you sure to save configuration?"))
                    return;
            <%end if%>	
            
            if(document.SNMP_form.SNMP_get.value.length <= 0 
                || document.SNMP_form.SNMP_set.value.length <= 0
                || document.SNMP_form.SNMP_trustStartIP.value.length <= 0
                || document.SNMP_form.SNMP_trustEndIP.value.length <= 0)
            {
                alert("All of the fields should be filled");
                return false;
            }
            
                if(CheckCommunityVlaue(setCOM) == false || CheckCommunityVlaue(getCOM) == false)
            {
                alert("Community Vlaue is invalid."); 
                return false;
            }

            if(document.SNMP_form.SnmpFullflag.value == "Yes")
            {  
                if (document.SNMP_form.startTrapflag.value != "Yes") 
                {
                        if(document.SNMP_form.SNMP_sysName.value.length <= 0 
                            || document.SNMP_form.SNMP_sysContact.value.length <= 0
                            ||document.SNMP_form.SNMP_sysLocation.value.length <= 0)
                    {
                        alert("All of the fields should be filled");
                        return false;
                    }
                    if(document.SNMP_form.SNMP_sysName.value.indexOf("\"") >= 0)
                    {
                        alert("Invalid system name");
                        return false;
                    }
                    if(document.SNMP_form.SNMP_sysContact.value.indexOf("\"") >= 0)
                    {
                        alert("Invalid system contact");
                        return false;
                    }
                    if(document.SNMP_form.SNMP_sysLocation.value.indexOf("\"") >= 0)
                    {
                        alert("Invalid system location");
                        return false;
                    }
                }

                if(ipversion==1 && (SNMP_form.SNMP_trapManagerIP.value=="0.0.0.0" || SNMP_form.SNMP_trapManagerIP.value==""))
                {
                    // WAN ipv6 only  
                }
                else
                {
                    if(inValidIPAddr(SNMP_form.SNMP_trapManagerIP.value))
                    {
                        return false;
                    }
                }
                if(document.SNMP_form.SnmpIPv6flag.value == "Yes")
                {
                    //	if(document.SNMP_form.SNMP_trapManagerIPv6.value.length > 0)
                    //		{
                    if(ipversion!=1 && (SNMP_form.SNMP_trapManagerIPv6.value == "::" || SNMP_form.SNMP_trapManagerIPv6.value == ""))
                    {
                        // WAN not ipv6 only
                    }
                    else
                    {
                        if(SNMP_form.SNMP_trapManagerIPv6.value == "::")
                        {
                            alert("Invalid IPv6 Address: ::");
                            return false;
                        }
                        if(inValidIPv6Addr(SNMP_form.SNMP_trapManagerIPv6.value))
                            return false;
                        //	}
                    }
                }
            }
        
            if (SNMP_form.trustIPflag.value == "Yes")
            {  
                if(ipversion ==1 && (document.forms[0].SNMP_trustStartIP.value=="0.0.0.0" 
                    || document.forms[0].SNMP_trustStartIP.value=="" ) && (document.forms[0].SNMP_trustEndIP.value == "0.0.0.0" 
                    || document.forms[0].SNMP_trustEndIP.value == ""))
                {
                    //WAN ipv6 only
                }
                else
                {	
                    if(ipCheck())
                        return;
                }
            
                if (SNMP_form.SnmpIPv6flag.value == "Yes")  
                {
                    if(ipversion!=1 && document.SNMP_form.SNMP_trustStartIPv6.value=="" && document.SNMP_form.SNMP_trustEndIPv6.value=="")
                    {
                        //WAN ipv4 only
                    }
                    else
                    {
                        if(ipv6Check())
                            return;		
                    }
                }
            }
            
            if(quotationCheck(document.SNMP_form.SNMP_get, 29) ) 
                return false;
                
            if(quotationCheck(document.forms[0].SNMP_set, 29) ) 
                return false;
            
            if(document.SNMP_form.Snmpv3flag.value == "Yes")
            {
                if(document.SNMP_form.SNMPv3_enable[0].checked)
                {
                    if(document.SNMP_form.SNMPv3_User.value.length <= 0 )
                    {
                        alert("The user name field should be filled!!");
                        return false;
                    }
                    if(document.SNMP_form.SNMPv3_User.value.length > 31 )
                    {
                        alert("The user name length more than 31!!");
                        return false;
                    }
                    if (document.SNMP_form.SNMPv3_User.value.indexOf("\"") >= 0 )
                    {
                        alert("Invalid user name!!");
                        return false;
                    }
                    if(document.SNMP_form.Auth_Passwd.value.length < 8 )
                    {
                        alert("Auth password must 8 characters at least!!");
                        return false;
                    }
                    if(document.SNMP_form.Auth_Passwd.value.length > 31 )
                    {
                        alert("Auth password length more than 31!!");
                        return false;
                    }
                    if(PasswdCheck(document.SNMP_form.Auth_Passwd))
                        return false;
                        
                    if(document.SNMP_form.Privacy_Passwd.value.length < 8 )
                    {
                        alert("Privacy password must 8 characters at least!!");
                        return false;
                    }
                    if(document.SNMP_form.Privacy_Passwd.value.length > 31 )
                    {
                        alert("Privacy password length more than 31!!");
                        return false;
                    }
                    if(PasswdCheck(document.SNMP_form.Privacy_Passwd))
                        return false;
                }
            }
            
            document.SNMP_form.Snmpflag.value = 1;
            document.SNMP_form.submit();
        }

        /** 表单提交事件检查变量值  */
        function ipv4OnlyOrIpv6OnlyCheck() 
        {
            var i = 0;
            var j = 0;
            var form=document.SNMP_form;
            
            if(form.IpVersion0.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion0.value=="IPv4")
                i++;
            if(form.IpVersion0.value=="IPv6")
                j++;
                
            if(form.IpVersion1.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion1.value=="IPv4")
                i++;
            if(form.IpVersion1.value=="IPv6")
                j++;
            
            if(form.IpVersion2.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion2.value=="IPv4")
                i++;
            if(form.IpVersion2.value=="IPv6")
                j++;
            
            if(form.IpVersion3.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion3.value=="IPv4")
                i++;
            if(form.IpVersion3.value=="IPv6")
                j++;
            
            if(form.IpVersion4.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion4.value=="IPv4")
                i++;
            if(form.IpVersion4.value=="IPv6")
                j++;
            
            if(form.IpVersion5.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion5.value=="IPv4")
                i++;
            if(form.IpVersion5.value=="IPv6")
                j++;
            
            if(form.IpVersion6.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion6.value=="IPv4")
                i++;
            if(form.IpVersion6.value=="IPv6")
                j++;
            
            if(form.IpVersion7.value=="IPv4/IPv6")
                return 2;
            if(form.IpVersion7.value=="IPv4")
                i++;
            if(form.IpVersion7.value=="IPv6")
                j++;

            if(i!=0 && j==0)
                return 0;

            if(j!=0 && i==0)
                return 1;
                
            if(i==0 && j==0)
                return 2;
        }

        /** 表单提交事件检查变量值  */
        function CheckCommunityVlaue(COM)
        {
            if(COM.indexOf(" ") == -1 && COM.indexOf("\"") == -1)
            {
                return true;
            }
            else
            {
                return false;
            }	
        }

        /** 表单提交事件检查变量值  */
        function ipCheck() 
        {
            var IP = document.forms[0].SNMP_trustStartIP.value;
            /* trust start ip and trust end ip can be null */
            if (document.forms[0].SNMP_trustStartIP.value == "" || document.forms[0].SNMP_trustEndIP.value == "") 
            {
                if((document.forms[0].SNMP_trustStartIP.value != "") && inValidIPAddr(document.forms[0].SNMP_trustStartIP.value))	
                    return true;
                    
                if((document.forms[0].SNMP_trustEndIP.value != "") && inValidIPAddr(document.forms[0].SNMP_trustEndIP.value))	
                    return true;
            
                return false;
            }
            
            if(inValidIPAddr(IP))
                return true;
            
            if(document.forms[0].SNMP_trustStartIP!=null)
            {	
                var IP_SRC_END = document.forms[0].SNMP_trustEndIP.value;		
                if((IP_SRC_END != "255.255.255.255") && (inValidIPAddr(IP_SRC_END)))
                    return true;
            
                var startIp = IP.split(".");
                var endIp = IP_SRC_END.split(".");
                var stIP = parseInt(startIp[0])<<24 | parseInt(startIp[1])<<16 | parseInt(startIp[2])<<8 | parseInt(startIp[3]);
                var edIP = parseInt(endIp[0])<<24 | parseInt(endIp[1])<<16 | parseInt(endIp[2])<<8 | parseInt(endIp[3]);
                stIP = stIP >>> 0;
                edIP = edIP >>> 0;									
                if(stIP > edIP)
                {	                 
                        alert("Start IP address must be less than End IP address!");
                    return true;
                }				
            }
            
            return false;	
        }	

        /** 表单提交事件检查变量值  */
        function quotationCheck(object, limit_len) 
        {
            var len = object.value.length;
            var c;
            var i, j = 0;
            for (i = 0; i < len; i++)
            {
                var c = object.value.charAt(i);
                if (c == '"')
                {
                    j += 6;
                }
                else
                    j++;
            }
            if(j > limit_len)
            {
                alert('Input too many characters!!'); 	  								    	    	   		
                return true;
            }	
            
            return false;
        }	

        /** 表单提交事件检查变量值  */
        function PasswdCheck(object)
        {
            var len = object.value.length;
            var c;
            var i = 0;
            for(i=0; i<len; i++)
            {
                var c = object.value.charAt(i);
                if(doNonSympolCheck(c) == -1)   // 调用Configuration.asp内方法
                {
                    alert("Password include invalid character:  " + c);
                    return true;
                }
            }
            
            return false;
        }

        /** 表单提交事件检查变量值  */
        function doNonSympolCheck(c)
        {
            if ((c >= "0")&&(c <= "9"))
            {
                return 1;
            }
            else if ((c >= "A")&&(c <= "Z"))
            {
                return 1;
            }
            else if ((c >= "a")&&(c <= "z"))
            {
                return 1;
            }

            return -1;
        }

        // 初始化加载时调用方法显示对应内容
        function snmpShow()
        {	
            if(document.SNMP_form.SNMP_active[0].checked) 
                snmpOff(0); 
            else 
                snmpOff(1);
            if(document.SNMP_form.Snmpv3flag.value == "Yes")
            {
                if(document.SNMP_form.SNMPv3_enable[0].checked)
                    snmpv3Off(0);
                else
                    snmpv3Off(1);
            }	
        }

        $(document).ready(function() {
            snmpShow();
        });
    </script>
</body>

</html>