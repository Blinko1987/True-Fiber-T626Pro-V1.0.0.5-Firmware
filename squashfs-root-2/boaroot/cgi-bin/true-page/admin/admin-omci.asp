<%
if Request_Form("venderflag")="1" then
  TCWebApi_set("GPON_ONU","VendorId","OmciVender") 
  TCWebApi_commit("GPON_ONU")
  TCWebApi_save()
end If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin - OMCI Information</title>
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
  
<SCRIPT language=JavaScript type=text/javascript>
var curUser = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
  
function LoadFrame()
{
  var vender = "<% TCWebApi_get("GPON_ONU","VendorId","s") %>";
  document.OmciSetForm.OmciVender.value = vender;
  
  if(curUser != "0")
  {
    setDisable('OmciVender',1);
    document.OmciSetForm.apply.className="btn-dashboard button-disable-gray";
  }
}

function submitForm()
{
  if(curUser != "0")
  {
    return false;
  }
  document.OmciSetForm.venderflag.value = "1";
  document.OmciSetForm.SaveAlter_Flag.value = "1";
  document.OmciSetForm.submit();
  //showLoading();
}
</SCRIPT>
</head>

<body onload="if(getElById('OmciSetForm') != null)LoadFrame()">
<!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">OMCI Information</div>
    <div class="title-description-text">This page is used to view OMCI Information.</div>
    <form name="OmciSetForm" action="/cgi-bin/true-page/admin/admin-omci.asp" method="post">
    <INPUT TYPE="HIDDEN" NAME="venderflag" VALUE="0">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">OMCI Vendor ID:</div>
      </div>
      <div class="col-6">
        <input id=OmciVender name=OmciVender class="form-control input-textfield" type="text" disabled>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">Taffic Management Option:</div>
      </div>
      <div class="col-6">
        <div class="title-text-right">2</div>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">CWMP Product Class:</div>
      </div>
      <div class="col-6">
        <div class="title-text-right"><%If tcWebApi_get("DeviceInfo_devParaStatic","ModelName","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s") end if%></div>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-4">
        <div class="title-text-left">HW Version:</div>
      </div>
      <div class="col-6">
        <div class="title-text-right"><%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s") end if%></div>
      </div>
    </div>
    <div class="mt-2 center">
      <button id="apply" name="apply" type="button" class="btn-dashboard" onclick="submitForm();">Apply</button>
    </div>
    </form>
  </div>
<!-- content -->
</body>

</html>