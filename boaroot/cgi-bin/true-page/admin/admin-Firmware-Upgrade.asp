<%
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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - Firmware Upgrade</title>
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
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
</head>
<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <div id="upgrade_ready" style="display: block;">
      <form ENCTYPE="multipart/form-data" id="ConfigForm" name="ConfigForm" action="/cgi-bin/true-page/admin/admin-Firmware-Upgrade.asp" method="post">
        <input type="hidden" name="postflag" value="0">
        <input type="hidden" name="html_header_type" value="2">
        <div class="title-text">Firmware Upgrade</div>
        <div class="title-description-text">This page allows you upgrade the firmware to the newer version. Please note that do not power off the device during the upload because this make the system unbootable.</div>
        <br>
        <div style="display:none;">
          Please specify the upgrade type&nbsp;:&nbsp;&nbsp;
          <input name="upload_type" type="radio" value="4" checked>
          <label id="firmware">Firmware&nbsp;&nbsp;</label>
          <input name="upload_type" type="radio" value="1">
          <label>Configuration</label>
          <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
            <input name="upload_type" type="radio" value="5">tclinux_allinone
          <%end if %>
        </div>
        <div class="row title-text">
            <div class="col-6">
                <input type="file" name="FW_UploadFile" class="input-file">
            </div>
        </div>
        <br style="line-height: 10px;">
        <div class="upgrade-div-text" style="display: none; color: red;" id = "uploadeTimeTips">
          <img src="/image/progress.gif" width="25px" height="25px" />
          <span>Uploading, please wait <span id="uploadeTime">40</span>S</span>
        </div>
        <br style="line-height: 10px;">
        <div id="upgrade_fail" class="upgrade-div-text" style="display: none;">
          <span style="color: red;">Upgrade failed, please try it again!</span>
        </div>
        <br style="line-height: 10px;">
        <div class="upgrade-div-text">
          <span style="font-size: 10px; color: #888888; padding-top: 5px; padding-left: 5px;">
            Note:The upgrade process takes about 2 minutes, and device will reboot after upgrade complete.<br/>
            &nbsp;&nbsp;Please do NOT power OFF the device!
          </span>
        </div>
        <div class="mt-2 center">
            <button type="button" id="btnOK" onclick="btnCommit()" class="btn-dashboard">Upgrade</button>
            <button type="button" id="btnCancel" onclick="RefreshPage()" class="btn-dashboard">Reset</button>
        </div>
      </form>
    </div>
  </div>
  <!-- content -->
  <script>

    $(document).ready(function(){
      <%if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then%>
        //do something
      <% elseif tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then%>
        $("#upgrade_fail").show();
      <% else %>//SUCCESS
        var rebootAlert = simpleAlert({
          "content": "System upgrading. Do not turn off the Device during this time!",
          "autoClose": 115
        });
      <% end if %>
    });

    function RefreshPage(){
      location.reload();
    }

    function btnCommit()
    {
      var form=document.ConfigForm;
      var str_romfile = form.FW_UploadFile.value.search(/romfile/);
      var str_tclinux = form.FW_UploadFile.value.search(/tclinux/);
      console.log("str_romfile: " + str_romfile);
      console.log("str_tclinux: " + str_tclinux);
      <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
        var str_allinone = form.FW_UploadFile.value.search(/tclinux_allinone/);
      <%end if %>

      if (form.FW_UploadFile.value=="") {
        alert("Please choose a upgrade file!");
      }
      else {
        if(((form.upload_type[1].checked) && (str_romfile >= 0))
          <% if tcwebApi_get("WebCustom_Entry","isAllinoneUploadSupported","h") ="Yes" then %>
            || ((form.upload_type[0].checked) && (str_tclinux >= 0 && str_allinone<0))
            || ((form.upload_type[2].checked) && (str_allinone >= 0))
          <% else %>
            || ((form.upload_type[0].checked) && (str_tclinux >= 0))
          <%end if %>
          ) {
            form.postflag.value = "1";
            var formName = $("#ConfigForm").attr("action");
            var formObj = document.getElementById("ConfigForm");
            var formData = new FormData(formObj);
            //console.log(formName);
            //showLoading()
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
          }
        else
          alert("File format is wrong!");
      }
    }

    var timer;
    function uploade_timer()
    {
      $('#uploadeTimeTips').css("display", "block");
      $("#uploadeTime").text("40");
      $("#btnOK").attr("disabled", true);
      timer = window.setInterval("run();", 1000);
    }

    function run(){
      var time = $("#uploadeTime").text();
      if(time == 0){
        $('#uploadeTimeTips').css("display", "none");
        $("#btnOK").attr("disabled", false);
        clearInterval(timer)
        return false;
      }
      $("#uploadeTime").text(time * 1 - 1);
    }
  </script>
</body>

</html>