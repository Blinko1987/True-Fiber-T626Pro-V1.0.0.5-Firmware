<%
If Request_Form("ping_commitflag") = "1" then
  TCWebApi_set("WebCurSet_Entry","diag_pvc","ping_curSetIndex") 
  TCWebApi_set("Diagnostic_PVC","PingOtherIPaddr","ipaddress")
  TCWebApi_set("Diagnostic_PVC","PingOtherType","ping_PingOtherType") 
  TCWebApi_set("Diagnostic_PVC","PingOtherTimes","Repetitions") 
  TCWebApi_set("Diagnostic_PVC","TestType","ping_TestType")
  TCWebApi_set("Diagnostic_PVC","AddRoute","AddRoute_Ping")	
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
  <title>Diagnostics - Ping</title>
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

    var pingTimer = 0;
    var globalValue = "";
    var pingTimes = 1;
    var end_pingflag = 0;
    var pingundefineTimes = 0;
    var errorTimes = 0;
    var pingFaildText = "Ping fail!";
      
    //sort
    vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
    vEntryValue = SortUtil.SortMyArray( vEntryValue );
    vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
    vNasName = SortUtil.SortMyArray( vNasName );
    var slIFNnme = "<% tcWebApi_get("Diagnostic_PVC","AddRoute","s") %>";

    /*$(function(){
      <% if tcWebApi_get("Diagnostic_PVC","PingOther","h") = "PASS" then %>
        setDisplay('PingResult', 1);
        setDisplay('WaitMsgPing', 0);
      <% elseif tcWebApi_get("Diagnostic_PVC","PingOther","h")="Fail" Then %>
        setDisplay('PingResult', 0);
        setDisplay('WaitMsgPing', 1);
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

    function checkDomain(url)
    {
      //url= 协议://(ftp的登录信息)[IP|域名](:端口号)(/或?请求参数)
      var strRegex = '^((?!-)[A-Za-z0-9-]{1,63}(?<!-)\\.)+[A-Za-z]{2,6}$';
      var strRegex1 = '^(?=^.{3,255}$)((http|https|ftp)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/)?(?:\/(.+)\/?$)?(\/\w+\.\w+)*([\?&]\w+=\w*|[\u4e00-\u9fa5]+)*$';
      var re=new RegExp(strRegex);//i不区分大小写
      //console.log(re);
      //将url做uri转码后再匹配，解除请求参数中的中文和空字符影响
      if (re.test(encodeURI(url))) {
        return (true);
      } else {
        return (false);
      }
    }
    
    function ipv4Check() {
      var ip_text = document.PingForm.ipaddress.value;
      var ip_calltimes = document.PingForm.Repetitions.value;
      if ((ip_calltimes > 10) || (ip_calltimes < 1) || (!isInteger(ip_calltimes)))
      {
        alert('Invalid ping times! Please re-enter!');
        return false;
      }
      
      if(ip_text == "")
      {
        alert('Please enter Host Address!');
        return false;
      }
      if(!isNetIpAddress(ip_text))
      {
        if(!checkDomain(ip_text))
        {
          alert('Please enter correct Host Address!');
          return false;
        }
      }

      return true;
    }

    function startPing()
    {
      var ip_text = document.PingForm.ipaddress.value;
      ip_text = ip_text.trim();
      document.PingForm.ipaddress.value = ip_text;
      var ip_calltimes = document.PingForm.Repetitions.value;
      if ((ip_calltimes > 10) || (ip_calltimes < 1) || (!isInteger(ip_calltimes)))
      {
        alert("Invalid ping times! Please re-enter!");
        return false;
      }
      if(!ipv4Check())
      {
        setDisplay('PingResult', 0);
        //setDisplay('WaitMsgPing', 1);
        return false;
      }
      else
      {
        setDisplay('PingResult', 1);
        //setDisplay('WaitMsgPing', 0);
        if(checkDomain(ip_text))
        {
          var str = document.PingForm.ipaddress.value;
          var i = 0;
          if (-1 != (i = str.indexOf("http")))
          {
            if(-1 != str.indexOf("https"))
              str = str.substring(i+8);
            else
              str = str.substring(i+7);
          }
          document.PingForm.ipaddress.value = str;
        }
        document.PingForm.ping_PingOtherType.value = "Yes";
        document.PingForm.ping_commitflag.value = "1";
        document.PingForm.ping_TestType.value = "2";
        document.PingForm.AddRoute_Ping.value=getElById('pingCurrInterface').value;
        /*var formData = $("#PingForm").serialize();
        var formName = $("#PingForm").attr("action");
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
        postPingRequest();
        globalValue = "";
        pingTimes = 1;
        pingundefineTimes = 0;
        errorTimes = 0;
        end_pingflag = 0;
        pingTimer = window.setInterval(function(){getPingResult()}, 1000);
        setDisable('btnPing',1);
        
      }
    }

    function postPingRequest()
      {
          url = "/webapi/pingrequest";
          $.ajax({
              url: url, 
              type: 'post',
              data:
              {
                  "diag_pvc":document.PingForm.ping_curSetIndex.value ,
                  "PingOtherIPaddr":document.PingForm.ipaddress.value ,
                  "PingOtherType":document.PingForm.ping_PingOtherType.value ,
                  "PingOtherTimes":document.PingForm.Repetitions.value ,
                  "TestType":document.PingForm.ping_TestType.value ,
                  "AddRoute":document.PingForm.AddRoute_Ping.value ,
              },
              success: function(data){
                  //var respondValue = data.data.pingresult;
                  //globalValue += respondValue;
                  //console.log(globalValue);
                  //document.getElementById("PingResult").innerHTML = data.data.pingresult;
              },
              error:function()
              {
                  //document.getElementById("PingResult").innerHTML = "ping faild!";
              }
          });
      }

      function getPingResult()
      {
        
          url = "/webapi/pingresult";
          $.ajax({
              url: url, 
              type: 'post',
              data:
              {
                  "pingNumber":pingTimes,
              },
              success: function(data){
                  var respondValue = data.data.pingresult;
                  //console.log(respondValue);
                  if(respondValue != undefined)
                  {
                      if(respondValue.search("100 packet loss") != -1 || respondValue.search("round-trip") != -1 )
                      {
                          end_pingflag = 1;
                      }
                      
                      if(respondValue.search("packet loss") != -1)//if packet loss enter
                      {
                          respondValue = respondValue.replace(/ packet loss/, "% packet loss");
                      }
                      
                      if(pingTimes == data.ping_number){
                        globalValue += respondValue;
                        document.getElementById('pingdiag').innerHTML = globalValue;
                        document.getElementById('pingdiag').style.color="black";
                        pingTimes ++;
                      }
                  }
                  else{
                      pingundefineTimes ++;
                  }
              },
              error:function()
              {
                  errorTimes ++;
              }
          });

          var row_number = (parseInt(document.PingForm.Repetitions.value) + 5);
          //console.log(pingTimes+":"+row_number+":"+(pingTimes + pingundefineTimes)+":"+errorTimes+":"+parseInt(row_number * 1.2));
          //console.log("end_pingflag: "+end_pingflag);
          if(pingTimes > row_number || end_pingflag == 1 || (pingTimes + pingundefineTimes) > parseInt(row_number * 2))
          {
              clearInterval(pingTimer);
              setDisable('btnPing',0);
          }
          if(errorTimes > 1)
          {
              clearInterval(pingTimer);
              document.getElementById('pingdiag').innerHTML = pingFaildText;
              document.getElementById('pingdiag').style.color="red";
              setDisable('btnPing',0);
          }
      }

    
	</script>
<!-- content -->
  <form id="PingForm" name="PingForm" method="post" action="/cgi-bin/true-page/diagnostics/ping.asp">
  <input type="hidden" name="ping_TestType" value="<%TCWebApi_get("Diagnostic_PVC","TestType","s")%>">
  <input type="hidden" name="ping_curSetIndex" value="0">
  <input type="hidden" name="ping_commitflag" value="0">
  <input type="hidden" name="ping_PingOtherType" value="<%TCWebApi_get("Diagnostic_PVC","PingOtherType","s")%>">
  <input type="hidden" name="AddRoute_Ping" value="">

    <div class="container-full container-resize-height">
      <div class="title-text">Ping Diagnostics</div>
      <div class="title-description-text">This page is used to send ICMP ECHO_REQUEST packets to network host. The diagnostic result will then be displayed.</div>
      <br>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Count:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" id="Repetitions" name="Repetitions" type="text"
          value="<% If TCWebApi_get("Diagnostic_PVC","PingOtherTimes","h") <> "N/A"  then
              TCWebApi_get("Diagnostic_PVC","PingOtherTimes","s")
              end if%>">
        </div>
        <div class="col-3">
          <label class="input-radio">(1-10)</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Host Address:</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" type="text" id="ipaddress" name="ipaddress"
          value="<% If TCWebApi_get("Diagnostic_PVC","PingOtherIPaddr","h") <> "N/A"  then
              TCWebApi_get("Diagnostic_PVC","PingOtherIPaddr","s")
              end if%>">
        </div>
      </div>
      <div class="row p-1"  <% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
        <div class="col-6">
          <div class="title-text-left">WAN Interface:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="pingCurrInterface" size="1" name="pingCurrInterface" > 
            <script language=javascript>listCreate(1);</script>
          </select>
        </div>
      </div>
      <br/>
      <div class="row p-1" id="WaitMsgPing" style="display: none;">
        <div class="col-8">
          <div class="title-text-left" style="color: red; font-size: 16px;">Ping fail! Please check the network connection.</div>
        </div>
      </div>
      
      <div class="row mb-2" id="PingResult" style="display: none;">
        <div class="col-md-1 col-sm-12">
        </div>
        <div class="col-md-10 col-sm-12">
          <div class="row mb-2 justify-content-center">
            <div class="m-auto p-auto" style="min-width: 100%;">
              <textarea cols="70" rows="10" name="pingdiag" id="pingdiag" ></textarea>
            </div>
          </div>
        </div>
        <div class="col-md-1 col-sm-12">
        </div>
      </div>
      <div class="mt-2 center">
          <button type="button" id="btnPing" onclick="startPing()" class="btn-dashboard" name="btnPing">Go</button>
      </div>
    </div>
  </form>
<!-- content -->
</body>

</html>