<%
If Request_Form("Tracert_commitflag") = "1" then
  TCWebApi_set("WebCurSet_Entry","diag_pvc","Tracert_curSetIndex") 
  TCWebApi_set("Diagnostic_PVC","TraceIPaddr","ipaddress1")
  TCWebApi_set("Diagnostic_PVC","TestType","Tracert_TestType")
  TCWebApi_set("Diagnostic_PVC","AddRoute","AddRoute_Tracert")
  TCWebApi_commit("Diagnostic_PVC")
  TCWebApi_commit("WebCurSet_Entry")
else
  TCWebApi_unset("Diagnostic_PVC")
End If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Diagnostics - Tracert6</title>
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
  <script language=JavaScript type=text/javascript>
  var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
  var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
  var vEntryName = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
  var vEntryValue = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
  var vEntryIndex = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanNasName","s") %>";
  var vNasName = vArrayStr.split(',');

  var tracertTimer = 0;
  var tracertValue = "";
  var tracertTimes = 1;
  var errorTimes = 0;
  var tracertFaildText = "Tracert fail!";

  //sort
  vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
  vEntryValue = SortUtil.SortMyArray( vEntryValue );
  vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
  vNasName = SortUtil.SortMyArray( vNasName );
  var slIFNnme = "<% tcWebApi_get("Diagnostic_PVC","AddRoute","s") %>";

  /*$(function(){
    <% if tcWebApi_get("Diagnostic_PVC","TraceResult","h") = "PASS" then %>
      setDisplay('TracertResults', 1);
      setDisplay('WaitMsgTracert', 0);
    <% elseif tcWebApi_get("Diagnostic_PVC","TraceResult","h")="Fail" Then %>
      setDisplay('TracertResults', 0);
      setDisplay('WaitMsgTracert', 1);
    <% end if %>
  });*/

  function listCreate(l_flag)
  {
    for (i = 0; i < nEntryNum; i++)
    {
      if(vEntryName[i].indexOf('_R_') > 0){
        if(slIFNnme == vEntryValue[i])
        {
          document.write('<option value=' + vEntryValue[i] + ' selected>'	+ vEntryValue[i] + '</option>');
        }
        else
        {
          document.write('<option value=' + vEntryValue[i] + '>'	+ vEntryValue[i] + '</option>');
        }
      }
    }
  }
  
  function checkDomain(URL)
  {
    var strRegex = '^((?!-)[A-Za-z0-9-]{1,63}(?<!-)\\.)+[A-Za-z]{2,6}$';
	  var re=new RegExp(strRegex); 
    if (re.test(encodeURI(URL))) { 
      return (true); 
    } else { 
      return (false); 
    } 
  }
  function tracert6Check() {
    var tracert_text = document.TracertForm.ipaddress1.value;

    if(tracert_text == "")
    {
      alert('Please enter Host Address!');
      return false;
    }
    if(!isGlobalIpv6Address(tracert_text))
    {
      if(!checkDomain(tracert_text))
      {
          alert('Please enter correct Domain name.');
          return false;
      }

    return true;
  }

  function startTracert()
  {
    var tracert_text = document.TracertForm.ipaddress1.value;
    tracert_text = tracert_text.trim();
    document.TracertForm.ipaddress1.value = tracert_text;
      if(false == tracert6Check()){
        setDisplay('TracertResults', 0);
        setDisplay('WaitMsgTracert', 1);
        alert("Host Address\"" + tracert_text + "\"is not a valid IPv6 address.");
        return false;
    }else{
      setDisplay('TracertResults', 1);
      setDisplay('WaitMsgTracert', 0);
      document.TracertForm.Tracert_commitflag.value = "1";
      document.TracertForm.Tracert_TestType.value = "3";
      document.TracertForm.AddRoute_Tracert.value=getElById('tracertCurrInterface').value;
      /*var formData = $("#TracertForm").serialize();
      var formName = $("#TracertForm").attr("action");
      showLoading();
      deferAjax(formName, formData)
      .done(function(_html){
        //console.log(_html);
        document.write(_html);
        document.close();
      })
      .fail(function(fail){
        //console.log(fail);
        alert("Request error! Please try again.");
      });*/
      postTracertRequest();
      tracertValue = "";
      tracertTimes = 1;
      errorTimes = 0;
      tracertTimer = window.setInterval(function(){getTracertResult()}, 1000);
      setDisable("btnTracert",1);
    }
  }

  function postTracertRequest()
      {
          url = "/webapi/tracertrequest";
          $.ajax({
              url: url, 
              type: 'post',
              data:
              {
                  "diag_pvc":document.TracertForm.Tracert_curSetIndex.value ,
                  "TraceIPaddr":document.TracertForm.ipaddress1.value ,
                  "TestType":document.TracertForm.Tracert_TestType.value ,
                  "AddRoute":document.TracertForm.AddRoute_Tracert.value ,
              },
              success: function(data){
                  //document.getElementById("tracertresult").innerHTML = data.data.tracertresult;
              },
              error:function()
              {
                  //document.getElementById("tracertresult").innerHTML = "tracert faild!";
              }
          });
      }


  function getTracertResult()
      {
          //console.log("errorTimes:" + errorTimes + "\t" + "tracertTimes:" + tracertTimes);
          url = "/webapi/tracertresult";
          $.ajax({
              url: url, 
              type: 'get',
              success: function(data){
                  var respondValue = data.data.tracertresult;
                  if((respondValue != undefined) && (respondValue != tracertValue))
                  {
                      tracertValue = respondValue;
                      document.getElementById('tracertdiag').innerHTML = respondValue;
                      document.getElementById('tracertdiag').style.color="black";
                  }
                  tracertTimes ++;
              },
              error:function()
              {
                  //document.getElementById("tracertresult").innerHTML = "tracert faild!";
                  errorTimes ++;
              }
          });

          if(tracertTimes > 20 || (tracertTimes + errorTimes) > 25)
          {
              clearInterval(tracertTimer);
              setDisable("btnTracert",0);
          }  
          if(errorTimes > 5 && tracertTimes == 1 )
          {
              clearInterval(tracertTimer);
              document.getElementById('tracertdiag').innerHTML = tracertFaildText;
              document.getElementById('tracertdiag').style.color="red";
              setDisable("btnTracert",0);
          }
      }
  
  </script>
</head>

<body>
<!-- content -->
  <form id="TracertForm" name="TracertForm" method="post" action="/cgi-bin/true-page/diagnostics/tracert-6.asp">
  <input type="hidden" name="Tracert_TestType" value="<%TCWebApi_get("Diagnostic_PVC","TestType","s")%>">
  <input type="hidden" name="Tracert_curSetIndex" value="0">
  <input type="hidden" name="Tracert_commitflag" value="0">
  <input type="hidden" name="Tracert_Ressult" value="<%TCWebApi_get("Diagnostic_PVC","TraceResult","s")%>">
  <input type="hidden" name="Tracert_PingOtherType" value="<%TCWebApi_get("Diagnostic_PVC","PingOtherType","s")%>">
  <input type="hidden" name="AddRoute_Tracert" value="">
    <div class="container-full container-resize-height">
      <div class="title-text">Traceroute6 Diagnostics</div>
      <div class="title-description-text">This page is used to print the route packets trace to network host. The diagnostic result will then be displayed.</div>
      <br>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Host Address:</div>
        </div>
        <div class="col-6">
        <input class="form-control input-textfield" type="text" id="ipaddress1" name="ipaddress1"
          value="<% If TCWebApi_get("Diagnostic_PVC","TraceIPaddr","h") <> "N/A" then
          TCWebApi_get("Diagnostic_PVC","TraceIPaddr","s")
          end if%>">
        </div>
      </div>
      <div class="row p-1" <% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
        <div class="col-6">
            <div class="title-text-left">WAN Interface:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="tracertCurrInterface" size="1" name="tracertCurrInterface" > 
          <script language=javascript>listCreate(2);</script>
          </select>
        </div>
        <br/>
        <div class="row p-1" id="WaitMsgTracert" style="display: none;">
          <div class="col-8">
            <div class="title-text-left" style="color: red; font-size: 16px;">Tracert fail! Please check the network connection.</div>
          </div>
        </div>
      </div>
      <div class="row mb-2" id="TracertResults" style="display: none;">
        <div class="col-md-1 col-sm-12">
        </div>
        <div class="col-md-10 col-sm-12">
          <div class="row mb-2 justify-content-center">
            <div class="m-auto p-auto" style="min-width: 100%;">
              <textarea cols="70" rows="10" name="tracertdiag" id="tracertdiag" ></textarea>
            </div>
          </div>
        </div>
        <div class="col-md-1 col-sm-12">
        </div>
      </div>
      <div class="mt-2 center">
        <button type="button" id="btnTracert" onclick="startTracert()" class="btn-dashboard">Go</button>
      </div>
    </div>
  </form>
<!-- content -->
</body>

</html>