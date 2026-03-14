<%
If Request_Form("QoS_Flag") = "1" then 
  TCWebApi_set("QoS_Common", "QoSOptType","AppRuleFlag")
  if Request_Form("AppAddNo10") = "Yes" then
    TCWebApi_set("QoS_Entry10","Active","App_Flag")
    TCWebApi_set("QoS_Entry10","AppName","AppName")
    TCWebApi_set("QoS_Entry10","ActQueue","AppQueueFlag")
    TCWebApi_commit("QoS_Entry10")
  end if
  if Request_Form("AppAddNo11") = "Yes" then
    TCWebApi_set("QoS_Entry11","Active","App_Flag")
    TCWebApi_set("QoS_Entry11","AppName","AppName")
    TCWebApi_set("QoS_Entry11","ActQueue","AppQueueFlag")
    TCWebApi_commit("QoS_Entry11")
  end if
  if Request_Form("AppAddNo12") = "Yes" then
    TCWebApi_set("QoS_Entry12","Active","App_Flag")
    TCWebApi_set("QoS_Entry12","AppName","AppName")
    TCWebApi_set("QoS_Entry12","ActQueue","AppQueueFlag")
    TCWebApi_commit("QoS_Entry12")
  end if
  if Request_Form("AppAddNo13") = "Yes" then
    TCWebApi_set("QoS_Entry13","Active","App_Flag")
    TCWebApi_set("QoS_Entry13","AppName","AppName")
    TCWebApi_set("QoS_Entry13","ActQueue","AppQueueFlag")
    TCWebApi_commit("QoS_Entry13")
  end if
  TCWebApi_save()
elseif Request_Form("QoS_Flag") = "2" then
  TCWebApi_set("QoS_Common", "QoSOptType","AppRuleFlag")
  if Request_Form("AppDelNo10") = "Yes" then
    TCWebApi_unset("QoS_Entry10")
    TCWebApi_commit("QoS_Entry10")
  end if
  if Request_Form("AppDelNo11") = "Yes" then
    TCWebApi_unset("QoS_Entry11")
    TCWebApi_commit("QoS_Entry11")
  end if	
  if Request_Form("AppDelNo12") = "Yes" then
    TCWebApi_unset("QoS_Entry12")
    TCWebApi_commit("QoS_Entry12")
  end if
  if Request_Form("AppDelNo13") = "Yes" then
    TCWebApi_unset("QoS_Entry13")
    TCWebApi_commit("QoS_Entry13")
  end if
  TCWebApi_save()
elseif Request_Form("QoS_Flag") = "3" then
  TCWebApi_set("QoS_Common", "QoSOptType","AppRuleFlag")
  TCWebApi_unset("QoS_Entry10")
  TCWebApi_unset("QoS_Entry11")
  TCWebApi_unset("QoS_Entry12")
  TCWebApi_unset("QoS_Entry13")
  
  TCWebApi_commit("QoS_Entry10")
  TCWebApi_commit("QoS_Entry11")
  TCWebApi_commit("QoS_Entry12")
  TCWebApi_commit("QoS_Entry13")
  TCWebApi_save()
End if

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - Service</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-service.asp" method="post">
      <input type="hidden" name="QoS_Flag" value="0">
      <input type="hidden" name="App_Flag" value="Yes">
      <input type="hidden" name="AppQueueFlag" value="1">
      <input type="hidden" name="AppRuleFlag" value="appRule">
      <input type="hidden" name="curMode" value="<% tcWebApi_get("QoS_Common","Mode","s") %>">
      
      <input type="hidden" name="AppAddNo10" value="No">
      <input type="hidden" name="AppAddNo11" value="No">
      <input type="hidden" name="AppAddNo12" value="No">
      <input type="hidden" name="AppAddNo13" value="No">

      <input type="hidden" name="AppDelNo10" value="No">
      <input type="hidden" name="AppDelNo11" value="No">
      <input type="hidden" name="AppDelNo12" value="No">
      <input type="hidden" name="AppDelNo13" value="No">

      <div class="title-text">IP QoS Service</div>
      <div class="title-description-text">This page is used to modify the QoS service parameters.Note:Up to 4 QoS services can be configured.</div>

      <div id='AppNamepart' class="row p-1 auto-mode">
        <div class="col-6">
          <div class="title-text-left">App Name:</div>
        </div>
        <div class="col-6">
          <select id="AppName" class="form-control input-select" name="AppName">
          </select>
        </div>
      </div>

      <div id='ClassQueuepart' class="row p-1 auto-mode">
        <div class="col-6">
          <div class="title-text-left">Class Queue:</div>
        </div>
        <div class="col-6">
          <select id="ClassQueue" class="form-control input-select" name="ClassQueue">
            <option value="1" selected>1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
          </select>
        </div>
      </div>

      <div class="mt-3 mb-3 center">
        <button type="button" class="btn-dashboard" onclick="QoSAppSubmit()">Add</button>
      </div>

      <div class="card-table-content" id='AppTable'></div>

      <div class="mt-2 center">
        <button type="button" class="btn-dashboard" onclick="QoSAppDelSubmit()">Delete Selected</button>
        <button type="button" class="btn-dashboard" onclick="QoSAppDelAllSubmit()">Delete All</button>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    var CurApp = checkAppActive();
    var CurEditAppIndex = 0;
    
    $(document).ready(function()
    {
      writeAppOption();
      writeAppTable();
    });

    function QosAppConstruction(domain,AppName,ClassQueue)
    {
      this.domain = domain;
      this.AppName = AppName;
      this.ClassQueue = ClassQueue;
    }

    function checkAppActive()
    {
      var ClsCnttemp = 0;
      var vActQueue = new Array(4);
      var vActObj = new Array(4);
      vActQueue[0] = "<% tcWebApi_get("QoS_Entry10","ActQueue","s") %>";
      vActQueue[1] = "<% tcWebApi_get("QoS_Entry11","ActQueue","s") %>";
      vActQueue[2] = "<% tcWebApi_get("QoS_Entry12","ActQueue","s") %>";
      vActQueue[3] = "<% tcWebApi_get("QoS_Entry13","ActQueue","s") %>";

      for(var i = 0 ; i < 4; i++)
      {
        switch(i)
        {
          case 0:
            if(vActQueue[i] != "N/A") 
              vActObj[ClsCnttemp++] = new QosAppConstruction("10","<% tcWebApi_get("QoS_Entry10","AppName","s") %>","<% tcWebApi_get("QoS_Entry10","ActQueue","s") %>");
            break;
          case 1:
            if(vActQueue[i] != "N/A") 
              vActObj[ClsCnttemp++] = new QosAppConstruction("11","<% tcWebApi_get("QoS_Entry11","AppName","s") %>","<% tcWebApi_get("QoS_Entry11","ActQueue","s") %>");
            break;
          case 2:
            if(vActQueue[i] != "N/A") 
              vActObj[ClsCnttemp++] = new QosAppConstruction("12","<% tcWebApi_get("QoS_Entry12","AppName","s") %>","<% tcWebApi_get("QoS_Entry12","ActQueue","s") %>");
            break;
          case 3:
            if(vActQueue[i] != "N/A") 
              vActObj[ClsCnttemp++] = new QosAppConstruction("13","<% tcWebApi_get("QoS_Entry13","AppName","s") %>","<% tcWebApi_get("QoS_Entry13","ActQueue","s") %>");
            break;
        }
      }
      var	vObjRet = new Array(ClsCnttemp+1);
      for(var m=0; m<ClsCnttemp; m++)
      {
      	vObjRet[m] = vActObj[m];
      }
      vObjRet[ClsCnttemp] = null;
      return vObjRet;
    }
    
    function AppCheck()
    {
      with (getElById('ConfigForm'))
      {
        if(CurApp.length >= 5)
        {
          alert("The number of APP must be less than 5.");
          return false;
        }
        if(getValue('AppName')=='')
        {
          alert("AppName must not be empty.");
          return false;
        }
        for(var i = 0; i < CurApp.length - 1; i++)
        {
          if(getValue('AppName') == CurApp[i].AppName)
          {
            alert("The APP has already existed.");
            return false;
          }
        }
        var tmpQueue = $("#ClassQueue").val();
        for(var i = 0; i < CurApp.length - 1; i++)
        {
          if(tmpQueue == CurApp[i].ClassQueue)
          {
            alert("The Class Queue has already existed.");
            return false;
          }
        }
      }
      return true;
    }

    function QoSAppSubmit()
    {
      if(false == AppCheck())
      {
        return false;
      }
      document.ConfigForm.QoS_Flag.value = "1";
      document.ConfigForm.App_Flag.value = "Yes";
      var tmpQueue = $("#ClassQueue").val();
      document.ConfigForm.AppQueueFlag.value = tmpQueue;
      switch(tmpQueue)
      {
        case "1":
          document.ConfigForm.AppAddNo10.value = "Yes";
          break;
        case "2":
          document.ConfigForm.AppAddNo11.value = "Yes";
          break;
        case "3":
          document.ConfigForm.AppAddNo12.value = "Yes";
          break;
        case "4":
          document.ConfigForm.AppAddNo13.value = "Yes";
          break;
        default:
          break;
      }
      document.ConfigForm.submit();
      showLoading();
    }

    function QoSAppDelSubmit()
    {
      var Rmapp ;
      var Rmcls ;
      var k = 0;
      var DelClsCount = 0;
      var Domainstr ;
      var indexstr;
      with (getElById('ConfigForm'))
      {
        Rmapp = getElById('rmapp');
        if(Rmapp!=null)
        {
          if(Rmapp.length > 0)
          {
            for(k=0; k < Rmapp.length ; k++ )
            {
              if(Rmapp[k].checked == true )
              {
                if(CurApp[k].domain=="10")
                  {AppDelNo10.value = "Yes";}
                else if(CurApp[k].domain=="11")
                  {AppDelNo11.value = "Yes";}
                else if(CurApp[k].domain=="12")
                  {AppDelNo12.value = "Yes";}
                else if(CurApp[k].domain=="13")
                  {AppDelNo13.value = "Yes";}
                DelClsCount++;
              }
            }
          }
          else
          {
            if(Rmapp.checked == true )
            {
              if(CurApp[0].domain=="10")
                {AppDelNo10.value = "Yes";}							
              else if(CurApp[0].domain=="11")
                {AppDelNo11.value = "Yes";}							
              else if(CurApp[0].domain=="12")
                {AppDelNo12.value = "Yes";}							
              else if(CurApp[0].domain=="13")
                {AppDelNo13.value = "Yes";}
              DelClsCount++;
            }
          }
        }
        if(DelClsCount==0)
        {
          alert("No class was selected.");
          return;
        }
        if(!confirm("Are you sure to delete the selected class?"))
        {
          return;
        }
        QoS_Flag.value = "2";
        App_Flag.value = "No";
        document.ConfigForm.submit();	
        showLoading();
      }
    }

    function QoSAppDelAllSubmit()
    {
      with (getElById('ConfigForm'))
      {
        QoS_Flag.value = "3";
        App_Flag.value = "No";
        document.ConfigForm.submit();	
        showLoading();
      }
    }

    function writeAppOption()
    {
      with (getElById('ConfigForm'))
      {
        if(curMode.value.indexOf('TR069') != -1)
          $('#AppName').append(new Option("TR069", "TR069"));
        if(curMode.value.indexOf('IPTV') != -1)
          $('#AppName').append(new Option("IPTV", "IPTV"));
      }
    }

    function writeAppTable()
    {
      var	vForm = document.ConfigForm;
      var k,loc,QIndex = 0;
      if ( CurApp == null )
      {
        return;
      }
      loc = '<div class="table-header">QoS Service</div>';
      loc += '<table style="width:100%">';
      loc += '<tr class="table-header center">';
      loc += '<th style="width: 10%;" class="p-1">App Name</th>';
      loc += '<th style="width: 18%;">Queue</th>';
      loc += '<th style="width: 18%;">Operation</th>';
      loc += '</tr>';
      for(k=0; k < CurApp.length - 1; k++)
      {
        if(k%2==0)
          loc += '<tr class="table-content-fist center">';
        else
          loc += '<tr class="table-content-second center">';
        if (CurApp[k].AppName == "")
        {
          loc += '<td>&nbsp;</td>';
        }
        else
        {
          loc += '<td>' + CurApp[k].AppName + '</td>';
        }
        loc += '<td>' + CurApp[k].ClassQueue + '</td>';
        loc += '<td><input type="checkbox" id="rmapp" name="rmapp" value="false"></td>\n';
        loc += '</tr>';
      }
      loc += '</table >';
      getElById('AppTable').innerHTML = loc;
    }
  </script>
</body>

</html>
