<%
if Request_Form("loidSetFlag") = "1" then 
  TCWebApi_set("GPON_LOIDAuth","LOID","Loid")
  TCWebApi_set("GPON_LOIDAuth","Password","password")
  TCWebApi_commit("GPON_LOIDAuth")
  TCWebApi_save()
end if
if Request_Form("gponSetFlag")="1" then
  TCWebApi_set("GPON_ONU","Password","GponPassword") 
  TCWebApi_commit("GPON_ONU")
  TCWebApi_save()
end If
if Request_Form("rebootflag")="1" then
  TCWebApi_set("System_Entry","reboot_type","rebootflag") 
  TCWebApi_commit("System_Entry")
end If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - GPON Setting</title>
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
var xpon_up = "<% tcWebApi_get("XPON_Common","xpon_up","s") %>";
var gponPassword="<% tcWebApi_get("GPON_ONU","Password","s") %>";
var gponLOID="<% tcWebApi_get("GPON_LOIDAuth","LOID","s") %>";

function LoadFrame()
{
  if(gponPassword == "N/A"){
    document.GponSetForm.GponPassword.value="";
  }else{
    document.GponSetForm.GponPassword.value=gponPassword;
  }
  
  <% if tcwebApi_get("WebCustom_Entry","isLoidSetSupported","h") = "Yes" then %>
  //loidset 
  var loid="<% tcWebApi_get("GPON_LOIDAuth","LOID","s") %>";
  var Password="<% tcWebApi_get("GPON_LOIDAuth","Password","s") %>";
  if(loid == "N/A"){
    document.GponSetForm.Loid.value="";
  }else{
    document.GponSetForm.Loid.value=loid;
  }
  if(Password == "N/A"){
    document.GponSetForm.password.value="";
  }else{
    document.GponSetForm.password.value=Password;
  }
  <%end if%>
  if (curUserName != sptUserName && xpon_up == "0"){
    //setDisable('GponPassword',1);
    //setDisable('apply',1);
    //setDisable('Loid',1);
    //setDisable('password',1);
    //setDisable('loidBtn',1);
  }
}

<% if Request_Form("rebootflag") = "1" then %>
  var rebootTips = simpleAlert({
    "content": "Device reboot, please wait...",
    "autoClose": 60
  });
<% end if %>

function submitForm(saveFlag) {
  if (saveFlag == 0) {//nothing change
    // do nothing
  } else if (saveFlag == 1) { //LOIDAuth change
    document.GponSetForm.loidSetFlag.value = "1";
  } else if (saveFlag == 2) { //GponPassword change
    document.GponSetForm.gponSetFlag.value = "1";
    //document.GponSetForm.rebootflag.value = "1";
  }
  document.GponSetForm.SaveAlter_Flag.value = "1";
  document.GponSetForm.submit();
}

function rebootConfirm() {
  if(gponPassword != $("#GponPassword").val()){
    var rebootAlert = simpleAlert({
      "content":"Change PLOAM Password need reboot, Are you sure?",
      "buttons":{
        "OK":function () {
          rebootAlert.close();
          setTimeout("submitForm(2)",500);
        },
        "Cancel":function () {
          rebootAlert.close();
        }
      }
    });
  }
  else
  {
    submitForm(0);
  }
}

function CheckLegitimacy()
{
  if(document.GponSetForm.password.value != "" && document.GponSetForm.Loid.value == "")
  {
    alert("GPON LOID must not be empty.");
    return false;
  }
  if(document.GponSetForm.Loid.value != "" && document.GponSetForm.GponPassword.value != "")
  {
    alert("GPON LOID, PLOAM password cannot be configured at the same time.Please ensure that only one of them has value.");
    return false;
  }
  if (($("#Loid").val() != gponLOID) && ($("#GponPassword").val() != gponPassword)) { //LOID status change  or  GponPassword status change
    alert("GPON LOID, PLOAM password cannot be configured at the same time.Please apply one of them separately before apply the other.");
    return false;
  }
  
  return true;
}

function OnOK()
{
    /*
  if(document.GponSetForm.Loid.value == ""){
    alert("GPON LOID must not be empty.");
    return false;
  }
  */
  if(CheckLegitimacy() == false)
  {
    return false;
  }
  if(document.GponSetForm.Loid.value.indexOf(" ") != -1){
    alert("GPON LOID must not contain blank space characters. ");
    return false;
  }
  if(document.GponSetForm.password.value != "" && document.GponSetForm.password.value.indexOf(" ") != -1){
    alert("LOID Password must not contain blank space characters. ");
    return false;
  }
  if(document.GponSetForm.GponPassword.value.indexOf("\"") != -1){
    alert("PLOAM Password must not contain double quotation marks.");
    return false;
  }

  if (($("#Loid").val() != "") || (gponLOID != "")) //set LOID  or  cleared LOID
  {
    submitForm(1);
  } else if (($("#GponPassword").val() != "") || (gponPassword != "")) { //set GponPassword  or  cleared GponPassword
    //rebootConfirm();
    submitForm(2);
  } else {
    submitForm(0);
  }
}
function PasswordVisible() {
  if($("#password").prop("type") == "password"){
    $('#password').prop('type','text');
  }else{
    $('#password').prop('type','password');
  };
}
function GponPasswordVisible() {
  if($("#GponPassword").prop("type") == "password"){
    $('#GponPassword').prop('type','text');
  }else{
    $('#GponPassword').prop('type','password');
  };
}
</SCRIPT>
</head>

<body onload="if(getElById('GponSetForm') != null)LoadFrame()">
<!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">GPON Setting</div>
    <div class="title-description-text">This page is used to configure the parameters for your GPON network access.</div>
    <form name="GponSetForm" action="/cgi-bin/true-page/admin/admin-gpon.asp" method="post">
      <input TYPE="HIDDEN" NAME="rebootflag" VALUE="0">
      <input TYPE="HIDDEN" NAME="gponSetFlag" VALUE="0">
      <input TYPE="HIDDEN" NAME="loidSetFlag" VALUE="0">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <div class="row p-1">
          <div class="col-4">
              <div class="title-text-left">LOID:</div>
          </div>
          <div class="col-6">
              <input id="Loid" name="Loid" class="form-control input-textfield" type="text">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
              <div class="title-text-left">LOID Password:</div>
          </div>
          <div class="col-4">
              <input id="password" name="password" class="form-control input-textfield" type="password">
          </div>
          <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="PasswordVisible()">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
              <div class="title-text-left">PLOAM Password:</div>
          </div>
          <div class="col-4">
              <input id="GponPassword" name="GponPassword" class="form-control input-textfield" type="password">
          </div>
          <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="GponPasswordVisible()">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-4">
              <div class="title-text-left">Serial Number:</div>
          </div>
          <div class="col-6">
              <div class="title-text-right"><%If tcWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" Then tcWebApi_get("GPON_ONU","SerialNumber","s") end if%></div>
          </div>
      </div>
      <div class="mt-2 center">
          <button id="apply" name="apply" type="button" class="btn-dashboard" onclick="OnOK();">Apply</button>
      </div>
    </form>
  </div>
<!-- content -->
</body>
</html>