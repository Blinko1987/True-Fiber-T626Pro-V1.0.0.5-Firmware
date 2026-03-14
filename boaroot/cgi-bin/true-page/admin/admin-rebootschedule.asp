<%
if Request_Form("saveflag") = "1" then
	TCWebApi_set("System_Entry","reboot_type","rebootflag") 
	TCWebApi_commit("System_Entry")
end if
if Request_Form("addRebootflag") = "1" then
  TCWebApi_set("WebCurSet_Entry","reboot_id","RebootId")
  TCWebApi_set("RebootSchedule_Entry","RebootEnable","RebootEnableFlag")
  TCWebApi_set("RebootSchedule_Entry","RebootTime","RebootTime")
  TCWebApi_set("RebootSchedule_Entry","RebootDay","RebootDay")
  TCWebApi_commit("RebootSchedule_Entry")
  TCWebApi_save()
elseif Request_Form("deleteRebootflag") = "1" then
  if Request_Form("hRebootEntry0") <> "-1" then    
    TCWebApi_unset("RebootSchedule_Entry0")
  end if
  
  if Request_Form("hRebootEntry1") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry1")
  end if
  
  if Request_Form("hRebootEntry2") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry2")
  end if

  if Request_Form("hRebootEntry3") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry3")
  end if

  if Request_Form("hRebootEntry4") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry4")
  end if

  if Request_Form("hRebootEntry5") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry5")
  end if

  if Request_Form("hRebootEntry6") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry6")
  end if

  if Request_Form("hRebootEntry7") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry7")
  end if
  if Request_Form("hRebootEntry8") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry8")
  end if
  
  if Request_Form("hRebootEntry9") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry9")
  end if
  
  if Request_Form("hRebootEntry10") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry10")
  end if

  if Request_Form("hRebootEntry11") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry11")
  end if

  if Request_Form("hRebootEntry12") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry12")
  end if

  if Request_Form("hRebootEntry13") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry13")
  end if

  if Request_Form("hRebootEntry14") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry14")
  end if

  if Request_Form("hRebootEntry15") <> "-1" then
    TCWebApi_unset("RebootSchedule_Entry15")
  end if
  TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - Schedule Reboot</title>
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
<SCRIPT language=JavaScript type=text/javascript>
  function writeTimeList(hasZero,num)
  {   
    for(var i=hasZero?0:1; i<num; i++)
    { 
      if(hasZero && i<10){
        document.writeln("<option value=" + i + ">" + "0" + i + "</option>");
      }else{
        document.writeln("<option value=" + i + ">" + i + "</option>");
      }
    }
  }
  var reboot_Entry = <% tcWebApi_GetTable("RebootSchedule","Entry") %>;
  function getRebootTime(RebootTime)
  {
    var hour ,minute;
    hour = (parseInt(RebootTime)-parseInt(RebootTime)%60)/60;
    minute = parseInt(RebootTime)%60;
    if( hour >=0 && hour < 24)
    {
      if(hour<10)hour = "0"+hour;
      if(minute<10)minute = "0"+minute;
      return hour+":"+minute;
    }else{
      return "-";
    }
  }
</SCRIPT>
<body>
<!-- content -->
<FORM id="rebootForm" name="rebootForm" action="/cgi-bin/true-page/admin/admin-rebootschedule.asp" method="post">
  <input type="hidden" name="saveflag" value="0"> 
  <input type="hidden" name="rebootflag" value="0">
  <input type="hidden" name="addRebootflag" value="0" />
  <input type="hidden" name="deleteRebootflag" value="0" />
  <input type=hidden name="RebootTime" id="RebootTime" value="0" />
  <input type=hidden name="RebootId" id="RebootId" value="<%TcWebApi_get("RebootSchedule","Empty_Entry","s")%>" />
  <input type=hidden name="RebootEnableFlag" id="RebootEnableFlag" value="0" />
  <input type="hidden" name="hRebootEntry0" value="-1">
  <input type="hidden" name="hRebootEntry1" value="-1">
  <input type="hidden" name="hRebootEntry2" value="-1">
  <input type="hidden" name="hRebootEntry3" value="-1">
  <input type="hidden" name="hRebootEntry4" value="-1">
  <input type="hidden" name="hRebootEntry5" value="-1">
  <input type="hidden" name="hRebootEntry6" value="-1">
  <input type="hidden" name="hRebootEntry7" value="-1">
  <input type="hidden" name="hRebootEntry8" value="-1">
  <input type="hidden" name="hRebootEntry9" value="-1">
  <input type="hidden" name="hRebootEntry10" value="-1">
  <input type="hidden" name="hRebootEntry11" value="-1">
  <input type="hidden" name="hRebootEntry12" value="-1">
  <input type="hidden" name="hRebootEntry13" value="-1">
  <input type="hidden" name="hRebootEntry14" value="-1">
  <input type="hidden" name="hRebootEntry15" value="-1">
  <div class="container-full container-resize-height">
    <div class="title-text">Schedule Reboot</div>
    <div class="title-description-text">Users can set the time and the on-off control of schedule reboot.</div>
    <div class="row p-1">
      <div class="col-5">
          <div class="title-text-left">Auto Reboot:</div>
      </div>
      <div class="col-6 pl-0">
          <input type="radio" value="enabled" name="rebootEnable">
          <label class="input-radio">Enable</label>
          <input type="radio" value="disabled" name="rebootEnable" checked>
          <label class="input-radio">Disable</label>
      </div>
    </div>
	<div class="row p-1">
      <div class="col-5">
          <div class="title-text-left">Date:</div>
      </div>
      <div class="col-1 pl-0 pr-0">
        <select name="RebootDay" class="form-control input-select" style="padding-left: 10px;">
          <SCRIPT language=javascript>
            writeTimeList(false,32);  
          </SCRIPT>
        </select>
      </div>
    </div>
	<div class="row p-1">
      <div class="col-5">
          <div class="title-text-left">Time:</div>
      </div>
      <div class="col-1 pl-0 pr-0">
        <select id="hour" name="hour" class="form-control input-select" style="padding-left: 10px;">
          <SCRIPT language=javascript>
            writeTimeList(true,24);
          </SCRIPT>
        </select>
      </div>
      <label style="width: 20px;text-align:center">:</label>
      <div class="col-1 pl-0 pr-0">
        <select id="minutes" name="minutes" class="form-control input-select" style="padding-left: 10px;">
          <SCRIPT language=javascript>
            writeTimeList(true,60);
          </SCRIPT>
        </select>
      </div>
      <div class="col-3 title-text-right2">
        (Hour/Minutes)
      </div>
    </div>
    <div class="row p-1">
      <div class="col-5">
        <div class="title-text-left">&nbsp;</div>
      </div>
      <div class="col-6 pl-0">
        <button class="btn-dashboard" type="button" onclick=AddAutoReboot()>Add</button>

      </div>
    </div>
    <hr>
    <table style="width:100%">
      <tr class="table-header center">
        <th style="width: 20%;">Index</th>
        <th style="width: 20%;">Switch</th>
        <th style="width: 20%;">Time</th>
        <th style="width: 20%;">Date</th>
        <th style="width: 20%;">Select</th>
      </tr>
      <SCRIPT language=JavaScript type=text/javascript>
      var z=0;
      for(i = 0; i < reboot_Entry.length; i++)
      {
        if(reboot_Entry[i].RebootEnable != "N/A")
        {
          var rowCss=z%2==0?"table-content-fist":"table-content-second";
          var rowEnable=reboot_Entry[i].RebootEnable=="1"?"Enable":"Disable";
          document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
          document.write('<TD>' + parseInt(i+1) + '&nbsp;</TD>');
          document.write('<TD>' + rowEnable + '&nbsp;</TD>');
          document.write('<TD>' + getRebootTime(reboot_Entry[i].RebootTime) + '&nbsp;</TD>');
          document.write('<TD>' + reboot_Entry[i].RebootDay + '&nbsp;</TD>');
          document.write('<TD><INPUT type=\"checkbox\" name=\"rebootDel_' + reboot_Entry[i].EntryIndex + '\"&nbsp;</TD>');
          document.write('</TR>');
          z++;
        }           
      }
      </SCRIPT>
    </table>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" id='Del_Button' onclick="delConfirm(false)" name='Del_Button'>Delete</button>
      <button type="button" class="btn-dashboard" id='DelAll_Button' onclick="delAllSubmit()" name='DelAll_Button'>Delete All</button>
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
    

    function setTimerRebootRebootTime()
    {
      var hour = document.getElementById("hour").value;
      var minute = document.getElementById("minutes").value;
      var rebootTime = parseInt(hour*60)+parseInt(minute);
      document.getElementById("RebootTime").value=rebootTime;
    } 
    function delConfirm(isDelAll){
      var del_list = new Array();
      var i, count = 0;
      var chkboxlist = $('table input[type=checkbox]');   
      for(i = 0; i < chkboxlist.length; i++){
        var boxName = chkboxlist[i].name;
        var selectIndex = boxName.substring(10);
        if(isDelAll){
          count++;
          del_list.push(selectIndex);
        }else{            
          if(chkboxlist[i].checked){
              count++;
              del_list.push(selectIndex);
          }
        }      
      }   
      //console.log(del_list,'del_list>>>')
      if( !count ){
        alert("Please select at least one item.");
        return false;
      }else{
        var deleteTips = simpleAlert({
        "content": isDelAll?"Are you sure to delete all items?":"Are you sure to delete checked items?",
        "buttons":{
            "OK":function () {
                deleteTips.close();
                setTimeout(function () {
                    setDelBtnFlag(del_list);
                    document.rebootForm.deleteRebootflag.value = "1";
                    document.rebootForm.submit();
                },500);
                
            },
            "Cancel":function () {
              if(isDelAll){
                selectChkBox(false);
              }
              deleteTips.close();
            }
        }
        });
      }
    }
    
    function setDelBtnFlag(del_list){
    
      for(i = 0; i < del_list.length; i++){ 
        $("input[name='hRebootEntry"+ del_list[i] +"']").val(1);
      } 
    }
    function selectChkBox(isChecked)
    {
      var chkboxlist = $('table input[type=checkbox]');
      for(i = 0; i < chkboxlist.length; i++){
        chkboxlist[i].checked = isChecked;
      }
    }
    function delAllSubmit()
    {
      selectChkBox(true);
      setTimeout("delConfirm("+true+")",100);
    } 
    function AddAutoReboot() {
      var vForm = document.rebootForm;
      if (vForm.rebootEnable.value === "enabled")
        vForm.RebootEnableFlag.value = "1";
      else
        vForm.RebootEnableFlag.value = "0";
      setTimerRebootRebootTime();
      if(reboot_Entry.length >= 16){
        var rebootAlert = simpleAlert({
          "content":"Reboot schedule no more than 16 items!",
          "buttons":{
            "OK":function () {
              rebootAlert.close();
            }
          }
        });
        return;
      }
      vForm.addRebootflag.value = "1";
      vForm.submit();
    }
  </SCRIPT>
</body>

</html>