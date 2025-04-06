<%
if Request_Form("rebootflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreFlag") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
if Request_Form("defaultflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","restoreflag2") 
	TCWebApi_set("Account_Entry0","Logged","login_init")
	TCWebApi_commit("System_Entry")
end if
if Request_Form("postflag") = "1" then
	tcWebApi_constSet("WebCustom_Entry","web_upgrade","1")
	TCWebApi_set("System_Entry","upgrade_fw","html_header_type")
	TCWebApi_commit("System_Entry")
end if		
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <META http-equiv=Content-Language content=zh-cn>
  <META http-equiv=Content-Type content="text/html; charset=gb2312">
  <META content="MSHTML 6.00.6000.16809" name=GENERATOR>
  <title>Admin - Backup Restore</title>
  <!-- style -->
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/css/style.css">
  <link rel="stylesheet" type="text/css" href="/css/main.css">

  <!-- script -->
  <script language=javascript src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>

  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
</head>

<body>
<!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Backup and Restore Setting</div>
    <div class="title-description-text">This page allows you to backup current settings to a file or restore the settings from the file which was saved previously. Besides, you could reset the current settings to factory default.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Backup Setting to File:</div>
      </div>
      <div class="col-6 left">
        <button id="backupButton" name="backupButton" class="btn-file" onClick='backup_settings()'>Backup</button>
      </div>
      <div class="" style="margin-left: 74px;">	
        <span style="float: left; color: red;  display: none;" id="backupTimeTips">Backup the configurations to local PC, Please wait <span id="backupTime">10</span>S</span>
      </div>
    </div>
    <form ENCTYPE="multipart/form-data" id="ConfigForm" name="ConfigForm" action="/cgi-bin/true-page/admin/admin-backup.asp" method="post" style="margin-bottom: 0px;">
      <input type="hidden" name="postflag" value="0">
      <input type="hidden" name="html_header_type" value="2">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Restore Setting from File:</div>
        </div>
        <div class="col-3">
          <input type="file" id="FW_UploadFile" name="FW_UploadFile" class="input-file">
        </div>
        <div class="col-3 left ml5">
          <button type="button" class="btn-file" onClick="submitRestore()" id="btnOK">Restore</button>
        </div>
        <br style="line-height: 10px;">
        <div style="display: none; color: red; padding-left: 75px;" id = "uploadeTimeTips">
          <img src="/image/progress.gif" width="25px" height="25px" />
          <span>Uploading, please wait <span id="uploadeTime">10</span>S</span>
        </div>
        <div style="display:none;">
          Please specify the upgrade type&nbsp;:&nbsp;&nbsp;
          <input name="upload_type" type="radio" value="4">
          <label id="firmware">Firmware&nbsp;&nbsp;</label>
          <input name="upload_type" type="radio" value="1" checked>
          <label>Configuration</label>
          <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
            <input name="upload_type" type="radio" value="5">tclinux_allinone
          <%end if %>
        </div>
      </div>
    </form>
    <form id="DefaultForm" name="DefaultForm" action="/cgi-bin/true-page/admin/admin-backup.asp" method="post">
      <input type="hidden" name="defaultflag" value="0"> 
      <input type="HIDDEN" name="restoreflag2" value="0">
      <input type="hidden" name="isCUCSupport" value="<%if tcwebApi_get("Info_WLan","isCUCSupport","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Reset Setting to Default:</div>
        </div>
        <div class="col-6 left">
          <button id="buttondefaultbak" name="buttondefaultbak" type="button" class="btn-file" onClick="ReDefaultboot();">Reset</button>
        </div>
      </div>
    </form>
  </div>
<!-- content -->
<SCRIPT language=JavaScript type=text/javascript>
  $(document).ready(function(){
    <%if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then%>
      //do something
    <% elseif tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then%>
      $("#upgrade_fail").show();
    <% else %>//SUCCESS
      var rebootAlert = simpleAlert({
        "content": "configurations upgrading. Do not turn off or reboot the Device during this time!",
        "autoClose": 115
      });
    <% end if %>

    <% if Request_Form("defaultflag") = "1" then %>
      var rebootTips = simpleAlert({
        "content": "Device reset, please wait...",
        "autoClose": 80
      });
    <% end if %>
  });

  function submitForm() {
    document.DefaultForm.defaultflag.value = "1";
    <% if TCWebApi_get("WebCustom_Entry","isCTGDSupported","h" ) = "Yes" then %>
      document.DefaultForm.restoreflag2.value = "4";
    <%else%>
      document.DefaultForm.restoreflag2.value = "2";
    <% end if %>
    //document.DefaultForm.submit();
    var formName = $("#DefaultForm").attr("action");
    var formData = $("#DefaultForm").serialize();
    //console.log(formName);
    deferAjax(formName, formData)
    .done(function(_html){
      //console.log(_html);
      document.write(_html);
      document.close();
    })
    .fail(function(fail){
      //console.log(fail);
      alert("Request error! Please try again.");
    });
  }

  function ReDefaultboot() {
    var rebootAlert = simpleAlert({
      "content":"Are you sure to reset factory settings?",
      "buttons":{
        "OK":function () {
          rebootAlert.close();
          submitForm();
        },
        "Cancel":function () {
          rebootAlert.close();
        }
      }
    });
  }

  function submitRestore() {
    var form=document.ConfigForm;
    var string3 = form.FW_UploadFile.value.search(/romfile/);
    var string4 = form.FW_UploadFile.value.search(/tclinux/);
    <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
    var string5 = form.FW_UploadFile.value.search(/tclinux_allinone/);
    <%end if %>
    if (form.FW_UploadFile.value=="") {
      alert("Please choose a upgrade file!");
    }
    else {
      if (((form.upload_type[1].checked) && (string3 >= 0))
      <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
        || ((form.upload_type[0].checked) && (string4 >= 0 && string5<0))
        || ((form.upload_type[2].checked) && (string5 >= 0))
      <% else %>
        || ((form.upload_type[0].checked) && (string4 >= 0))
      <%end if %>
      ) {
        RestoreConfirm();
      }
      else
        alert("File format is wrong!");
    }
  }

  function RestoreConfirm() {
    var rebootAlert = simpleAlert({
      "content":"Are you sure to restore setting from file?",
      "buttons":{
        "OK":function () {
          rebootAlert.close();
          setTimeout(function(){
            document.ConfigForm.postflag.value = "1";
            //document.ConfigForm.submit();
            var formName = $("#ConfigForm").attr("action");
            var formObj = document.getElementById("ConfigForm");
            var formData = new FormData(formObj);
            //console.log(formName);
            deferAjaxForUpload(formName, formData)
            .done(function(_html){
              //console.log(_html);
              document.write(_html);
              document.close();
            })
            .fail(function(fail){
              //console.log(fail);
              alert("Request error! Please try again.");
            });
            uploade_timer();
          },500);
        },
        "Cancel":function () {
          rebootAlert.close();
        }
      }
    });
  }

  var upload_timer;
  function uploade_timer()
  {
    $('#uploadeTimeTips').css("display", "block");
    $("#uploadeTime").text("10");
    $("#btnOK").attr("disabled", true);
    upload_timer = window.setInterval("upload_run();", 1000);
  }

  function upload_run(){
    var time = $("#uploadeTime").text();
    if(time == 0){
      $('#uploadeTimeTips').css("display", "none");
      $("#btnOK").attr("disabled", false);
      clearInterval(upload_timer)
      return false;
    }
    $("#uploadeTime").text(time * 1 - 1);
  }

  var backup_timer;
  function backup_settings()
  {
    var cfg = '/romfile.cfg';
    var code = 'location.assign("' + cfg + '")';
    eval(code);
    $('#backupTimeTips').css("display", "block");
    $("#backupTime").text("10");
    $("#backupButton").attr("disabled", true);
    backup_timer = window.setInterval("backup_run();", 1000);
  }

  function backup_run(){
    var time = $("#backupTime").text();
    if(time == 0){
      $('#backupTimeTips').css("display", "none");
      $("#backupButton").attr("disabled", false);
      clearInterval(backup_timer)
      return false;
    }
    $("#backupTime").text(time * 1 - 1);
  }
</SCRIPT>
</body>

</html>

