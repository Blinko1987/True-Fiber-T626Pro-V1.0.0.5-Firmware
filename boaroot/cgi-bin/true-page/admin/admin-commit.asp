<%
if Request_Form("saveflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","rebootflag") 
	TCWebApi_commit("System_Entry")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - Commit Reboot</title>
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
<FORM id="rebootForm" name="rebootForm" action="/cgi-bin/true-page/admin/admin-commit.asp" method="post">
   <input type="hidden" name="saveflag" value="0"> 
   <input type="hidden" name="rebootflag" value="0">
  <div class="container-full container-resize-height">
    <div class="title-text">Commit and Reboot</div>
    <div class="title-description-text">This page is used to commit changes to system memory and reboot your system.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Commit and Reboot:</div>
      </div>
      <div class="col-6 left">
        <button id="btnReboot" name="btnReboot" type="button" class="btn-file" onclick="rebootConfirm();">Commit and Reboot</button>
      </div>
    </div>
  </div>
</FORM>
<!-- content -->  
  <SCRIPT language=JavaScript type=text/javascript>
    $(document).ready(function(){
      <% if Request_Form("rebootflag") = "1" then %>
        var rebootTips = simpleAlert({
          "content": "Device reboot, please wait...",
          "autoClose": 80
        });
      <% end if %>
    });
    
    function submitForm(params) {
      document.rebootForm.saveflag.value = "1";
      document.rebootForm.rebootflag.value = "1";
      document.rebootForm.submit();
    }
    
    function rebootConfirm() {
      var rebootAlert = simpleAlert({
        "content":"Are you sure to reboot?",
        "buttons":{
          "OK":function () {
            rebootAlert.close();
            setTimeout("submitForm()",500);
          },
          "Cancel":function () {
            rebootAlert.close();
          }
        }
      });
    }
  </SCRIPT>
</body>

</html>