<%
if Request_Form("saveflag")="1" then
	TCWebApi_set("Cwmp_Entry","StunEnable","StunEnableFlag") 
    TCWebApi_set("Cwmp_Entry","StunUrl","STUNServerAddress")
    TCWebApi_set("Cwmp_Entry","StunPort","STUNServerPort")
    TCWebApi_set("Cwmp_Entry","StunUsername","STUNUsername")
    TCWebApi_set("Cwmp_Entry","StunPassword","STUNPassword")
    TCWebApi_set("Cwmp_Entry","StunMinKeepAlivePeriod","STUNMinimumKeepAlivePeriod")
    TCWebApi_set("Cwmp_Entry","StunMaxKeepAlivePeriod","STUNMaximumKeepAlivePeriod")
    TCWebApi_set("Cwmp_Entry","UdpConnReqAddr","UDPConnectionRequestAddress")
    TCWebApi_set("Cwmp_Entry","UDPConnecitionRequestNotificationLimit","UDPConnectionRequestAddressNotificationLimit")
    TCWebApi_commit("Cwmp_Entry")
    TCWebApi_save()
end If
%>

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
    <html lang="en" style="overflow: hidden;">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin - Stun</title>
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
        <%if Request_Form("saveflag")="1" then %>
            <script language=JavaScript type="text/javascript">
                var Tips = applyAlert({
                    "content": "submit successful.",
                    "buttons": {
                    },
                    "autoClose": 2
                });
            </script>
            <% end if %>

<SCRIPT language=JavaScript type=text/javascript>

var stun_enable                                        =    "<% tcWebApi_get("Cwmp_Entry","StunEnable","s") %>";
var nat_detected                                       =    "<% tcWebApi_get("Cwmp_Entry","NatDetected","s") %>";
var stun_server_address                                =    "<% tcWebApi_get("Cwmp_Entry","StunUrl","s") %>";
var stun_server_port                                   =    "<% tcWebApi_get("Cwmp_Entry","StunPort","s") %>";
var stun_username                                      =    "<% tcWebApi_get("Cwmp_Entry","StunUsername","s") %>";
var stun_password                                      =    "<% tcWebApi_get("Cwmp_Entry","StunPassword","s") %>";
var stun_minimum_keepalive_period                      =    "<% tcWebApi_get("Cwmp_Entry","StunMinKeepAlivePeriod","s") %>";
var stun_maximum_keepalive_period                      =    "<% tcWebApi_get("Cwmp_Entry","StunMaxKeepAlivePeriod","s") %>";
var udp_connection_request_address                     =    "<% tcWebApi_get("Cwmp_Entry","UdpConnReqAddr","s") %>";
var udp_connection_request_address_notification_limit  =    "<% tcWebApi_get("Cwmp_Entry","UDPConnecitionRequestNotificationLimit","s") %>";

function LoadFrame()
{

    if(stun_enable == "1"){
		document.StunSetForm.StunEnable.checked=true;
	}else{
		document.StunSetForm.StunEnable.checked=false;
	}

    if(nat_detected != "0"){
		document.StunSetForm.NatDetected.checked=true;
	}else{
		document.StunSetForm.NatDetected.checked=false;
	}

	if(stun_server_address == "N/A"){
		document.StunSetForm.STUNServerAddress.value="";
	}else{
		document.StunSetForm.STUNServerAddress.value=stun_server_address;
	}

    if(stun_server_port == "N/A"){
		document.StunSetForm.STUNServerPort.value="";
	}else{
		document.StunSetForm.STUNServerPort.value=stun_server_port;
	}

    if(stun_username == "N/A"){
		document.StunSetForm.STUNUsername.value="";
	}else{
		document.StunSetForm.STUNUsername.value=stun_username;
	}

    if(stun_password == "N/A"){
		document.StunSetForm.STUNPassword.value="";
	}else{
		document.StunSetForm.STUNPassword.value=stun_password;
	}

    if(stun_minimum_keepalive_period == "N/A"){
		document.StunSetForm.STUNMinimumKeepAlivePeriod.value="";
	}else{
		document.StunSetForm.STUNMinimumKeepAlivePeriod.value=stun_minimum_keepalive_period;
	}

    if(stun_maximum_keepalive_period == "N/A"){
		document.StunSetForm.STUNMaximumKeepAlivePeriod.value="";
	}else{
		document.StunSetForm.STUNMaximumKeepAlivePeriod.value=stun_maximum_keepalive_period;
	}

    if(udp_connection_request_address == "N/A"){
		document.StunSetForm.UDPConnectionRequestAddress.value="";
	}else{
		document.StunSetForm.UDPConnectionRequestAddress.value=udp_connection_request_address;
	}

    if(udp_connection_request_address_notification_limit == "N/A"){
		document.StunSetForm.UDPConnectionRequestAddressNotificationLimit.value="";
	}else{
		document.StunSetForm.UDPConnectionRequestAddressNotificationLimit.value=udp_connection_request_address_notification_limit;
	}
	
}

function check_stun_page_input()
{
   var port = document.StunSetForm.STUNServerPort.value;

   if (isNaN(port) || port < 1 || port > 65535) {
    alert("Incorrect input of 'STUNServerPort'!");
    return false;
  }

  return true;
}



function OnOK()
{
    if(document.StunSetForm.StunEnable.checked == true)
    {
        document.StunSetForm.StunEnableFlag.value = 1;
    }
    else
    {
        document.StunSetForm.StunEnableFlag.vale = 0;
    }


    if(check_stun_page_input() == false)
       return;
       
    document.StunSetForm.saveflag.value = 1;
    document.StunSetForm.submit();
}

</SCRIPT>
    </head>

    <body onload="if(getElById('StunSetForm') != null)LoadFrame()">
        <!-- content -->
        <div class="container-full container-resize-height">
            <div class="title-text">STUN Setting</div>
            <div class="title-description-text">STUN is a kind of network protocol,which allows clients behind nat(or
                multiple NATs) to find out their public port that NAT is bound to for a local port.</div>
            <form name="StunSetForm" action="/cgi-bin/true-page/admin/admin-Stun.asp" method="post">
                <input TYPE="HIDDEN" NAME="saveflag" VALUE="0">
                <input TYPE="HIDDEN" NAME="StunEnableFlag" VALUE="0">
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNEnable</div>
                    </div>
                    <div class="col-5">
                        <input type="checkbox" value="1" name="StunEnable">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">NATDetected</div>
                    </div>
                    <div class="col-5">
                        <input type="checkbox" value="1" name="NatDetected" disabled>
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNServerAddress</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNServerAddress" name="STUNServerAddress" class="form-control input-textfield"
                            type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNServerPort</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNServerPort" name="STUNServerPort" class="form-control input-textfield"
                            type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNUsername</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNUsername" name="STUNUsername" class="form-control input-textfield" type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNPassword</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNPassword" name="STUNPassword" class="form-control input-textfield" type="password">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNMinimumKeepAlivePeriod</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNMinimumKeepAlivePeriod" name="STUNMinimumKeepAlivePeriod"
                            class="form-control input-textfield" type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">STUNMaximumKeepAlivePeriod</div>
                    </div>
                    <div class="col-5">
                        <input id="STUNMaximumKeepAlivePeriod" name="STUNMaximumKeepAlivePeriod"
                            class="form-control input-textfield" type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">UDPConnectionRequestAddress</div>
                    </div>
                    <div class="col-5">
                        <input id="UDPConnectionRequestAddress" name="UDPConnectionRequestAddress"
                            class="form-control input-textfield" type="text">
                    </div>
                </div><br>
                <div class="row p-1">
                    <div class="col-6">
                        <div class="title-text-left">UDPConnectionRequestAddressNotificationLimit</div>
                    </div>
                    <div class="col-5">
                        <input id="UDPConnectionRequestAddressNotificationLimit"
                            name="UDPConnectionRequestAddressNotificationLimit" class="form-control input-textfield"
                            type="text">
                    </div>
                </div><br>

                <div class="mt-2 center">
                    <button id="apply" name="apply" type="button" class="btn-dashboard" onclick="OnOK();">Apply</button>
                </div>
            </form>
        </div>
        <!-- content -->
    </body>

    </html>