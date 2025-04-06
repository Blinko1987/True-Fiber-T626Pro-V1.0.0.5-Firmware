<%
if Request_Form("Upnp_Flag") = "1" then
	TCWebApi_set("Upnpd_Entry","Active","Enable_Flag")
	TCWebApi_set("Upnpd_Entry","autoconf","AutoConfig_Flag")	
	TCWebApi_commit("Upnpd_Entry")
	tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>UPnP Configuration</title>
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
</head>

<body>
<!-- content -->
  <div >
      <div class="container-full container-resize-height">
          <div class="title-text">UPnP Configuration</div>
          <div class="title-description-text">This page is used to configure UPnP. The system acts as a daemon when you enable it and select WAN interface (upstream) that will use UPnP.</div>
          <FORM name="ConfigForm" action="/cgi-bin/true-page/service/UPnP-Cinfiguration.asp" method="post">
          <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable UPnP :</div>
                        </div>
                        <div class="col-6">
                            <input id=Enable type=checkbox name="Enable" <%if tcWebApi_get("Upnpd_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> />
                        </div>
                    </div>
                    <div>
                            <input type="hidden" name="Upnp_Flag" value="0">
                            <input type="hidden" name="AutoConfig_Flag" value="<% tcWebApi_get("Upnpd_Entry","autoconf","s") %>">
                            <input type="hidden" name="Enable_Flag" value="<% tcWebApi_get("Upnpd_Entry","Active","s") %>"> 
                                <script language=JavaScript type=text/javascript>
                                
                                    
                                    function btnSaveUpnp()
                                    {
                                        if(document.ConfigForm.Enable.checked)
                                        {
                                            document.ConfigForm.Enable_Flag.value = "Yes";
                                            document.ConfigForm.AutoConfig_Flag.value = "1";
                                        }
                                        else
                                        {
                                            document.ConfigForm.Enable_Flag.value = "No";
                                            document.ConfigForm.AutoConfig_Flag.value = "0";
                                        }
                                        document.ConfigForm.SaveAlter_Flag.value = "1";
                                        document.ConfigForm.Upnp_Flag.value = "1";
                                        document.ConfigForm.submit();
                                    }
                                    function RefreshPage(){
                                        location.reload()
                                    }
                          </script>
                    </div>
           </FORM>     
            <!--
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">UPnP:</div>
              </div>
              <div class="col-6">
                  <input type="radio" value="Enable" name="radio1">
                  <label class="input-radio">Enable</label>
                  <input type="radio" value="Disable" name="radio1" checked="checked">
                  <label class="input-radio">Disable</label>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">TR-064:</div>
              </div>
              <div class="col-6">
                  <input type="radio" value="Enable" name="radio2" checked="checked" disabled>
                  <label class="input-radio">Enable</label>
                  <input type="radio" value="Disable" name="radio2">
                  <label class="input-radio">Disable</label>

              </div>
          </div>
          <div class="row p-1">
              <div class="col-6">
                  <div class="title-text-left">WAN interface:</div>
              </div>
              <div class="col-6">
                  <select class="form-control input-select">
                      <option value="1">----</option>
                      <option value="1">----</option>
                  </select>
              </div>
          </div><br>
          -->
          <div class="mt-2 center">
              <button type="button" class="btn-dashboard" id=btnOK onclick="btnSaveUpnp()">Apply Changes</button>
              <button type="button" class="btn-dashboard" id=refresh onclick="RefreshPage()">Apply Cancel</button>
          </div>
      </div>

  </div>
<!-- content -->
</body>

</html>