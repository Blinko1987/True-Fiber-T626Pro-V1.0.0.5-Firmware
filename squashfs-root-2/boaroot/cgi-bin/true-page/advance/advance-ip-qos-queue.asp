<%
if Request_Form("QoS_Flag") = "1" then
  TCWebApi_set("QoS_Common","Discipline","DiscplineFlag")
  if Request_Form("DiscplineFlag") = "WRR" then
    TCWebApi_set("QoS_Common","QueueSW1","Q1EnableFlag")
    TCWebApi_set("QoS_Common","QueueSW2","Q2EnableFlag")
    TCWebApi_set("QoS_Common","QueueSW3","Q3EnableFlag")
    TCWebApi_set("QoS_Common","QueueSW4","Q4EnableFlag")
  end if
  TCWebApi_commit("QoS_Common")
  TCWebApi_save()
end if

If Request_Form("SaveFlag") = "1" then
    TCWebApi_set("QoS_Common","QoSOptType","QoSRuleFlag")
    TCWebApi_set("QoS_Common","UplinkBandwidth","Bandwidth")
    TCWebApi_set("QoS_Common","Discipline","DiscplineFlag")
    TCWebApi_set("QoS_Common","EnableDSCPMark","EnDscpFlag")
    TCWebApi_set("QoS_Common","En8021PRemark","Enable8021P")
    
    if Request_Form("DiscplineFlag") = "WRR" then
      TCWebApi_set("QoS_Common","QueueBW1","Q1Weight")
      TCWebApi_set("QoS_Common","QueueBW2","Q2Weight")
      TCWebApi_set("QoS_Common","QueueBW3","Q3Weight")
      TCWebApi_set("QoS_Common","QueueBW4","Q4Weight")
      TCWebApi_set("QoS_Common","QueueBWset1","Q1Weight")
      TCWebApi_set("QoS_Common","QueueBWset2","Q2Weight")
      TCWebApi_set("QoS_Common","QueueBWset3","Q3Weight")
      TCWebApi_set("QoS_Common","QueueBWset4","Q4Weight")
      TCWebApi_set("QoS_Common","QueueSW1","Q1EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW2","Q2EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW3","Q3EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW4","Q4EnableFlag")
    elseif Request_Form("DiscplineFlag") = "PQ" then 
      TCWebApi_set("QoS_Common","QueueSW1","Q1EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW2","Q2EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW3","Q3EnableFlag")
      TCWebApi_set("QoS_Common","QueueSW4","Q4EnableFlag")
      TCWebApi_set("QoS_Common","QueueP1","Q1PValue")
      TCWebApi_set("QoS_Common","QueueP2","Q2PValue")
      TCWebApi_set("QoS_Common","QueueP3","Q3PValue")
      TCWebApi_set("QoS_Common","QueueP4","Q4PValue")
    end if
    TCWebApi_commit("QoS_Common")
    TCWebApi_save()
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - Queue</title>
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

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-queue.asp" method="post">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="SaveFlag" value="0">
      <input type="hidden" name="QoS_Flag" value="0">
      <input type="hidden" name="DiscplineFlag" value="<% tcWebApi_get("QoS_Common","Discipline","s") %>">
      <input type="hidden" name="EnDscpFlag" value="No">
      <input type="hidden" name="QoSRuleFlag" value="discRule">

      <input type="hidden" name="Q1EnableFlag" value="<% tcWebApi_get("QoS_Common","QueueSW1","s") %>">
      <input type="hidden" name="Q2EnableFlag" value="<% tcWebApi_get("QoS_Common","QueueSW2","s") %>">
      <input type="hidden" name="Q3EnableFlag" value="<% tcWebApi_get("QoS_Common","QueueSW3","s") %>">
      <input type="hidden" name="Q4EnableFlag" value="<% tcWebApi_get("QoS_Common","QueueSW4","s") %>">

      <input type="hidden" name="Q1PValue" value="1">
      <input type="hidden" name="Q2PValue" value="2">
      <input type="hidden" name="Q3PValue" value="3">
      <input type="hidden" name="Q4PValue" value="4">

      <div class="title-text">IP QoS Queue</div>
      <div class="title-description-text">
        On this page, you can modify the QoS queue parameters.
      </div>

      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Uplink Bandwidth:</div>
        </div>
        <div class="col-6">
          <div class="row">
            <div class="col-7 pl-0">
              <input class="input-textfield" type="text" name="Bandwidth" id="Bandwidth" maxlength="10" value="<%if tcWebApi_get("QoS_Common","UplinkBandwidth","h") <> "N/A" then tcWebApi_get("QoS_Common","UplinkBandwidth","s") else asp_Write("0") end if %>">
            </div>
            <div class="col-5 pl-0 title-text-right">
              <label>(0,8192-1000000000)bps</label>
            </div>
          </div>
        </div>
      </div>

      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Scheduling Strategy:</div>
        </div>
        <div class="col-6">
          <input type="radio" id="Plan" name="Plan" onchange="PlanChange()" value="priority"
            <%if tcWebApi_get("QoS_Common","Discipline","h") = "PQ" then asp_Write("checked") end if%>>
          <label class="input-radio">PQ</label>
          <input type="radio" id="Plan" name="Plan" onchange="PlanChange()" value="weight"
            <%if tcWebApi_get("QoS_Common","Discipline","h") = "WRR" then asp_Write("checked") end if%>>
          <label class="input-radio">WRR</label>
        </div>
      </div>
      
      <div class="row p-1 manual-mode" id="domainnameserver">
        <div class="col-6">
          <div class="title-text-left">Enable 802.1P Flag:</div>
        </div>
        <div class="col-6">
          <div class="row">
            <div class="col-7 pl-0">
              <select id="Enable8021P" size=1 name="Enable8021P" class="form-control input-select"> 
                <option value="0" <%if tcWebApi_get("QoS_Common","En8021PRemark","h") = "0" then asp_Write("selected") end if %>>zero mark</option> 
                <option value="1" <%if tcWebApi_get("QoS_Common","En8021PRemark","h") = "1" then asp_Write("selected") end if %>>pass through</option> 
                <option value="2" <%if tcWebApi_get("QoS_Common","En8021PRemark","h") = "2" then asp_Write("selected") end if %>>remark</option>
              </select>
            </div>
          </div>
        </div>
      </div>

      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Enable DSCP/TC Flag:</div>
          </div>
          <div class="col-6">
              <input id="EnableDSCPMark" type="checkbox" value="0"  name="EnableDSCPMark" <%if tcWebApi_get("QoS_Common","EnableDSCPMark","h") = "Yes" then asp_Write("checked") end if %>>
          </div>
          <div class="col-2"></div>
      </div>

      <div id="QueueEdit">
        <div class="card-table-content" id="PQEdit">
          <div class="table-header">PQ</div>
          <table style="width:100%">
            <tr class="table-header center">
              <th style="width: 10%;" class="p-1">Queue</th>
              <th style="width: 18%;">Priority</th>
              <th style="width: 18%;">Enable</th>
            </tr>
            <tr class="table-content-fist center">
              <td>Q1</td>
              <td>Highest</td>
              <td align=middle><input id="Q1Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW1","h") = "Yes" then asp_Write("checked") end if%>></td>
            </tr>
            <tr class="table-content-second center">
              <td>Q2</td>
              <td>High</td>
              <td align=middle><input id="Q2Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW2","h") = "Yes" then asp_Write("checked") end if%>></td>
            </tr>
            <tr class="table-content-fist center">
              <td>Q3</td>
              <td>Medium</td>
              <td align=middle><input id="Q3Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW3","h") = "Yes" then asp_Write("checked") end if%>></td>
            </tr>
            <tr class="table-content-second center">
              <td>Q4</td>
              <td>Low</td>
              <td align=middle><input id="Q4Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW4","h") = "Yes" then asp_Write("checked") end if%>></td>
            </tr>
          </table>
        </div>
        <div class="card-table-content" id="WRREdit">
          <div class="table-header">WRR</div>
          <table style="width:100%">
            <tr class="table-header center">
              <th style="width: 10%;" class="p-1">Queue</th>
              <th style="width: 18%;">Weight</th>
              <th style="width: 18%;">Enable</th>
            </tr>
            <tr class="table-content-fist center">
              <th style="width: 10%;" class="p-1">Q1</th>
              <td align=middle><input class="form-control input-textfield m-1" id="Q1Weight" name="Q1Weight" size=3 value="<%if tcWebApi_get("QoS_Common","QueueBWset1","h") <> "N/A" then tcWebApi_get("QoS_Common","QueueBWset1","s") end if %>"></td>
              <td align=middle><input id="Q5Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW1","h") = "Yes" then %> <%if tcWebApi_get("QoS_Common","QueueBWset1","h") <> "0" then asp_Write("checked") end if %> <%end if %>></td>
            </tr>
            <tr class="table-content-second center">
              <th style="width: 10%;" class="p-1">Q2</th>
              <td align=middle><input class="form-control input-textfield m-1" id="Q2Weight" name="Q2Weight" size=3 value="<%if tcWebApi_get("QoS_Common","QueueBWset2","h") <> "N/A" then tcWebApi_get("QoS_Common","QueueBWset2","s") end if %>"></td>
              <td align=middle><input id="Q6Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW2","h") = "Yes" then %> <%if tcWebApi_get("QoS_Common","QueueBWset2","h") <> "0" then asp_Write("checked") end if %> <%end if %>></td>
            </tr>
            <tr class="table-content-fist center">
              <th style="width: 10%;" class="p-1">Q3</th>
              <td align=middle><input class="form-control input-textfield m-1" id="Q3Weight" name="Q3Weight" size=3 value="<%if tcWebApi_get("QoS_Common","QueueBWset3","h") <> "N/A" then tcWebApi_get("QoS_Common","QueueBWset3","s") end if %>"></td>
              <td align=middle><input id="Q7Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW3","h") = "Yes" then %> <%if tcWebApi_get("QoS_Common","QueueBWset3","h") <> "0" then asp_Write("checked") end if %> <%end if %>></td>
            </tr>
            <tr class="table-content-second center">
              <th style="width: 10%;" class="p-1">Q4</th>
              <td align=middle><input class="form-control input-textfield m-1" id="Q4Weight" name="Q4Weight" size=3 value="<%if tcWebApi_get("QoS_Common","QueueBWset4","h") <> "N/A" then tcWebApi_get("QoS_Common","QueueBWset4","s") end if %>"></td>
              <td align=middle><input id="Q8Enable" type="checkbox" value="0" <%if tcWebApi_get("QoS_Common","QueueSW4","h") = "Yes" then %> <%if tcWebApi_get("QoS_Common","QueueBWset4","h") <> "0" then asp_Write("checked") end if %> <%end if %>></td>
            </tr>
          </table>
        </div>
      </div>
    </form>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="btnSave()">Apply Changes</button>
    </div>
  </div>
  <!-- content -->
  <script>
    $(document).ready(function()
    {
      CurQoSTableShow();
    });

    function checkboxstatus()
    {
      var  vForm = document.ConfigForm;

      if(vForm.EnableDSCPMark.checked)
        vForm.EnDscpFlag.value = "Yes";
      else
        vForm.EnDscpFlag.value = "No";

      if("priority" == getRadioVal("Plan"))
      {
        vForm.DiscplineFlag.value = "PQ";
        if(vForm.Q1Enable.checked)
          vForm.Q1EnableFlag.value = "Yes";
        else
          vForm.Q1EnableFlag.value = "No";
        
        if(vForm.Q2Enable.checked) 
          vForm.Q2EnableFlag.value = "Yes";
        else
          vForm.Q2EnableFlag.value = "No";
        
        if(vForm.Q3Enable.checked)
          vForm.Q3EnableFlag.value = "Yes";
        else
          vForm.Q3EnableFlag.value = "No";
        
        if(vForm.Q4Enable.checked)
          vForm.Q4EnableFlag.value = "Yes";
        else
          vForm.Q4EnableFlag.value = "No";
      }
      else if("weight" == getRadioVal("Plan"))
      {
        vForm.DiscplineFlag.value = "WRR";
        if(vForm.Q5Enable.checked && vForm.Q1Weight.value != "0")
          vForm.Q1EnableFlag.value = "Yes";
        else
          vForm.Q1EnableFlag.value = "No";
        
        if(vForm.Q6Enable.checked && vForm.Q2Weight.value != "0")
          vForm.Q2EnableFlag.value = "Yes";
        else
          vForm.Q2EnableFlag.value = "No";
        
        if(vForm.Q7Enable.checked && vForm.Q3Weight.value != "0")
          vForm.Q3EnableFlag.value = "Yes";
        else
          vForm.Q3EnableFlag.value = "No";
        
        if(vForm.Q8Enable.checked && vForm.Q4Weight.value != "0")
          vForm.Q4EnableFlag.value = "Yes";
        else
          vForm.Q4EnableFlag.value = "No";
      }
    }

    function CurQoSTableShow()
    {
      with (getElById('ConfigForm'))
      {
        var	vForm = document.ConfigForm;
        if(vForm.DiscplineFlag.value == "PQ")
        {
          setDisplay('PQEdit',1);
          setDisplay('WRREdit',0);
        }
        else if (vForm.DiscplineFlag.value == "WRR")
        {
          setDisplay('PQEdit',0);
          setDisplay('WRREdit',1);
        }
      }
    }

    function PlanChange()
    {
      var Form = new webSubmitForm();
      var url ;
      with (getElById('ConfigForm'))
      {
        var msg=confirm("Do you want to change scheduling strategy?");
        if (false == msg)
        {
          if(DiscplineFlag.value == "PQ")
            Plan[0].checked = true;
          else if((DiscplineFlag.value == "WRR"))
            Plan[1].checked = true;
          return;
        }
        checkboxstatus();
        document.ConfigForm.QoS_Flag.value = "1";
        document.ConfigForm.submit();
        showLoading();
      }
    }

    function convertNullValue()
    {
      var  vForm = document.ConfigForm;
      if(vForm.Q1Weight.value == "")
        vForm.Q1Weight.value = "0";
      if(vForm.Q2Weight.value == "")
        vForm.Q2Weight.value = "0";
      if(vForm.Q3Weight.value == "")
        vForm.Q3Weight.value = "0";
      if(vForm.Q4Weight.value == "")
        vForm.Q4Weight.value = "0";
      return true;
    }

    function checkWeight()
    {
      var vForm = document.ConfigForm;
      var weightArr = new Array(vForm.Q1Weight.value, vForm.Q2Weight.value, vForm.Q3Weight.value, vForm.Q4Weight.value);
      var weightArrST = new Array(vForm.Q5Enable.checked, vForm.Q6Enable.checked, vForm.Q7Enable.checked, vForm.Q8Enable.checked);
      var idx = 0;
      var weightTotal = 0;
      var zeroWeightNum = 0;
      for ( idx = 0; idx < weightArr.length; idx ++ )
      {
        if(weightArr[idx] == "0")
        {
          zeroWeightNum ++;
        }
        if ( false == isPlusInteger(weightArr[idx]))
        {
          alert("Weight is invalid.");
          return false;
        }

        if ( weightArrST[idx] && weightArr[idx] == 0)
        {
          alert("Weight cannot be set to 0.");
          return false;
        }
        weightTotal += parseInt(weightArr[idx]);
      }
      
      if (zeroWeightNum >= 4)
      {
        alert("The weight of all four queues cannot be 0.");
        return false;
      }
      if ( weightTotal > 100 )
      {
        alert('WRR weight must be less than 100 in all.');
        return false;
      }
      return true;
    }

    function checkBandwidth()
    {
      var bdw = document.ConfigForm.Bandwidth.value;
      if (bdw!="0")
      {
        if (parseInt(bdw) < 8192 || parseInt(bdw) > 1000000000 || !isInteger(bdw))
        {
          alert("Upstream bandwidth range from 8192 to 1000000000, or 0(No speed limit).");
          return false;
        }
      }
      return true;
    }

    function btnSave()
    {
      if(!checkBandwidth())
      {
        return false;
      }
      if(document.ConfigForm.DiscplineFlag.value == "WRR")
      {
        if(!checkWeight())
        {
          return false;
        }
      }
      convertNullValue();
      checkboxstatus();
      document.ConfigForm.SaveFlag.value = "1";
      document.ConfigForm.SaveAlter_Flag.value = "1";
      document.ConfigForm.submit();
      //showLoading();
    }
  </script>
</body>

</html>
