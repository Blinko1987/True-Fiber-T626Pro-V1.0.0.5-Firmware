<%
if Request_Form("timerflag") = "1" then
  TCWebApi_set("RebootSchedule_Common","RebootEnable","RebootEnable")
  if Request_Form("setRebootFlag") = "1" then
    TCWebApi_set("RebootSchedule_Common","RebootTime","RebootTime")
    TCWebApi_set("RebootSchedule_Common","RebootDay","RebootDay")
  end if
  TCWebApi_commit("RebootSchedule_Common")
  tcWebApi_Save()
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
  <link rel="stylesheet" href="/css/main.css">
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
</head>
<script language=JavaScript type=text/javascript>
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
</script>
<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/admin/admin-new-rebootschedule.asp" method="post">
    <input type=hidden name="timerflag" id="timerflag" value="0" />
    <input type=hidden name="setRebootFlag" id="setRebootFlag" value="0" />
    <input type=hidden name="RebootEnable" id="RebootEnable" value="<% TCWebApi_get("RebootSchedule_Common","RebootEnable","s");%>" />
    <input type=hidden name="RebootDay" id="RebootDay" value="<% TCWebApi_get("RebootSchedule_Common","RebootDay","s");%>" />
    <input type=hidden name="RebootTime" id="RebootTime" value="<% TCWebApi_get("RebootSchedule_Common","RebootTime","s");%>" />
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">

    <div class="container-full container-resize-height">
      <div class="title-text">Schedule Reboot</div>
      <div class="title-description-text">Users can set the time and the on-off control of schedule reboot.</div>
      <div class="row p-1">
        <div class="col-5">
            <div class="title-text-left">Enable:</div>
        </div>
        <div class="col-6">
          <input type="checkbox" onclick="disableInput()" id="rebootEnable" name="rebootEnable">
        </div>
      </div>
      <div id="inputpart">
        <div class="row p-1">
          <div class="col-5">
            <div class="title-text-left">Days:</div>
          </div>
          <div class="col-6">
            <input type="checkbox" name="EveryDay" id="EveryDay" onclick="setAllDays()"/><label class="input-radio">EveryDay</label>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-5">
          </div>
          <div class="col-6">
            <input type="checkbox" onclick="setEveryDay()" name="sunday" id="day0" value="1"/><label class="input-radio">Sun.</label>
            <input type="checkbox" onclick="setEveryDay()" name="monday" id="day1" value="2"/><label class="input-radio">Mon.</label>
            <input type="checkbox" onclick="setEveryDay()" name="tuesday" id="day2" value="4"/><label class="input-radio">Tues.</label>
            <input type="checkbox" onclick="setEveryDay()" name="wedsday" id="day3" value="8"/><label class="input-radio">Wed.</label>
            <input type="checkbox" onclick="setEveryDay()" name="thursday" id="day4" value="16"/><label class="input-radio">Thur.</label>
            <input type="checkbox" onclick="setEveryDay()" name="friday" id="day5" value="32"/><label class="input-radio">Fri.</label>
            <input type="checkbox" onclick="setEveryDay()" name="sat" id="day6" value="64"/><label class="input-radio">Sat.</label>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-5">
            <div class="title-text-left">Time:</div>
          </div>
          <div class="col-2 pl-2 pr-0" style="max-width:10%">
            <select id="hour" name="hour" class="form-control input-select" style="padding-left: 10px;">
              <SCRIPT language=javascript>
                writeTimeList(true,24);
              </SCRIPT>
            </select>
          </div>
          <label style="width: 20px;text-align:center">:</label>
          <div class="col-2 pl-2 pr-0" style="max-width:10%">
            <select id="minutes" name="minutes" class="form-control input-select" style="padding-left: 10px;">
              <SCRIPT language=javascript>
                writeTimeList(true,60);
              </SCRIPT>
            </select>
          </div>
          <div class="input-radio">
            (Hour/Minutes)
          </div>
        </div>
      </div>
      <div class="mt-2 center">
        <button id="apply" name="apply" type="button" class="btn-dashboard" onclick="submitTimerReboot()">Apply</button>
      </div>
    </div>
    </form>
  </div>
  <!-- content -->
  <script>
  function setSelect(objSelect, objItemtext)
  {
      for (var i = 0; i < objSelect.options.length; i++)
      {
          if (objSelect.options[i].text == objItemtext)
          {
              objSelect.options[i].selected = true; 
              break;
          }
      }
  }
  
  function disableInput()
  {
    if( document.getElementById("rebootEnable").checked )
    {
      setDisplay("inputpart",1);
    }
    else
    {
      setDisplay("inputpart",0);
    }
  }
  
  function LoadFrame()
  {
    var RebootEnable;
    var weekday;
    var RebootTime;
    
    RebootEnable = "<% TCWebApi_get("RebootSchedule_Common","RebootEnable","s");%>";
    weekday = "<% TCWebApi_get("RebootSchedule_Common","RebootDay","s");%>";
    RebootTime = "<% TCWebApi_get("RebootSchedule_Common","RebootTime","s");%>";
    if(RebootEnable == "1")
      document.getElementById("rebootEnable").checked = true;
    else
      document.getElementById("rebootEnable").checked = false;
  
    var days = new Array();
    days = ["day0","day1", "day2", "day3", "day4", "day5", "day6"];
    
    for(var i=0; i<7; i++)
    {
        if( weekday & ( 1 << i) )/*1~7*/
        {
            document.getElementById(days[i]).checked = true;
        }
        else
        {
            document.getElementById(days[i]).checked = false;
        }
    }
    setEveryDay();
    var hour ,minute;
    hour = (parseInt(RebootTime)-parseInt(RebootTime)%60)/60;
    minute = parseInt(RebootTime)%60;
    if( hour >=0 && hour < 24)
    {
        var hourObj = document.getElementById("hour");
        var minuteObj = document.getElementById("minutes");
        setSelect(hourObj, hour);
        setSelect(minuteObj, minute);
    }
    
    disableInput();
  }

  function setAllDays()
  {
    if(document.getElementById("EveryDay").checked)
    {
      for(var i=0; i<7; i++)
      {
        document.getElementById("day"+i).checked = true;
      }
    }
    else
    {
      for(var i=0; i<7; i++)
      {
        document.getElementById("day"+i).checked = false;
      }
    }
  }

  function setEveryDay()
  {
    var count = 0;
    for(var i=0; i<7; i++)
    {
      if(document.getElementById("day"+i).checked)
        ++count;
    }
    if(count == 7)
    {
      document.getElementById("EveryDay").checked = true;
    }
    else
    {
      document.getElementById("EveryDay").checked = false;
    }
  }
  
  function setTimerRebootRebootDay()
  {
      var days = 0;
      var _day;
      var weekdays = 0;
      for(var i=0; i<7; i++)
      {
          _day = "day"+i;
          days = document.getElementById(_day).checked;
          if(days==true)
          {
              weekdays += (1<<i);
          }
      }
      document.getElementById("RebootDay").value=weekdays;
  }
  
  function setTimerRebootRebootTime()
  {
      var hour = document.getElementById("hour").value;
      var minute = document.getElementById("minutes").value;
      var rebootTime = parseInt(hour*60)+parseInt(minute);
      document.getElementById("RebootTime").value=rebootTime;
  } 
  
  function submitTimerReboot()
  {
    document.ConfigForm.timerflag.value = "1";
    if( document.getElementById("rebootEnable").checked )
    {
        document.getElementById("RebootEnable").value = 1;
        document.ConfigForm.setRebootFlag.value = "1";
    }
    else
    {
        document.getElementById("RebootEnable").value = 0;
    }
    setTimerRebootRebootTime();
    setTimerRebootRebootDay();
    document.ConfigForm.SaveAlter_Flag.value = "1";
    document.ConfigForm.submit();
  }
  </script>
</body>

</html>
