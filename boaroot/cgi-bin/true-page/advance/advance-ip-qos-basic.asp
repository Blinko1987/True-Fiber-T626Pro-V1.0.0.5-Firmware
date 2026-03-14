<%
If Request_Form("SaveFlag") = "1" then
    TCWebApi_set("QoS_Common","Active","QosFlag")
    TCWebApi_set("QoS_Common","SelectTag","SelectTagFlag")
    TCWebApi_set("QoS_Common","QoSOptType","QoSRuleFlag")
    If Request_Form("TempleteFlag") = "1" then
        TCWebApi_set("QoS_Common","Mode","TempleteString")
    End if
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
  <title>Advance - IP QoS - Basic</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-basic.asp" method="post">
    <input type="hidden" name="SaveFlag" value="0">
    <input type="hidden" name="TempleteString" value="TR069,INTERNET">
    <input type="hidden" name="TempleteFlag" value="0">
    <input type="hidden" name="oldTempleteString" value="<% tcWebApi_get("QoS_Common","Mode","s") %>">
    <input type="hidden" name="SelectTagFlag" value="0">
    <input type="hidden" name="QoSRuleFlag" value="discRule">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">

    <div class="title-text">IP QoS Basic</div>
    <div class="title-description-text">This page is used to configure QoS.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">IP QoS:</div>
      </div>
      <div class="col-6">
        <input type="radio" value="1" id="Enable1" onclick="QoSEnableChange(1)" name="Enable" <% if tcWebApi_get("QoS_Common","Active","h") = "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Enabled</label>
        <input type="radio" value="0" id="Enable2" onclick="QoSEnableChange(0)" name="Enable" <% if tcWebApi_get("QoS_Common","Active","h") <> "Yes" then asp_Write("checked") end if %>>
        <label class="input-radio">Disabled</label>
        <input type="hidden" name="QosFlag" value="Yes">
      </div>
    </div>
    
    <!-- new selection -->
    <div id='Templatepart' class="row p-1" style="display: none;">
      <div class="col-6">
        <div class="title-text-left">QoS Template:</div>
      </div>
      <div class="col-6">
        <select id="Template" class="form-control input-select" name="Template"> 
        </select>
      </div>
    </div>
    <!-- new selection -->
    
    </form>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="btnSave()">Apply Changes</button>
    </div>
  </div>
  <!-- content -->
  <script>
    $(document).ready(function()
    {
      initQoSTemplate();
      var QoSEnable = $("input[name='Enable']:checked").val();
      if("1" == QoSEnable)
      {
        document.ConfigForm.QosFlag.value = "Yes";
         $("#Templatepart").show();
      }
      else
      {
        document.ConfigForm.QosFlag.value = "No";
         $("#Templatepart").hide();
      }
    });
    
    function QoSEnableChange(val)
    {
      with (getElById('ConfigForm'))
      {
        document.ConfigForm.SaveFlag.value = "1";
        if(1 == val)
        {
          if(!confirm("Do you want to enable the Qos?"))
          {
            document.ConfigForm.SaveFlag.value = "0";
            return;
          }
          document.ConfigForm.QosFlag.value = "Yes";
        }
        else
        {
          if(!confirm("Do you want to disable the Qos?"))
          {
            document.ConfigForm.SaveFlag.value = "0";
            return;
          }
          document.ConfigForm.QosFlag.value = "No";
        }
        btnSave();
      }
    }
    
    //init QoS Template options
    function initQoSTemplate()
    {
      var templateName = '<% tcWebApi_get("QoS_Common","Mode","s") %>';
      var templateArray = new Array(
        'TR069,INTERNET'
<% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONCNJSSupported","h") = "Yes" then %>
        , 'VOIP,TR069,INTERNET'
<% else %>
        , 'TR069,VOIP,INTERNET'
<% end if %>
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONJSSupported","h") = "Yes" then %>
        , 'IPTV,TR069,INTERNET'
<% else %>
        , 'TR069,IPTV,INTERNET'
<% end if %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") <> "Yes" then %>
<% if tcwebApi_get("WebCustom_Entry","isCTPONCNJSSupported","h") = "Yes" then %>
        , 'VOIP,IPTV,TR069,INTERNET'
<% else %>
        , 'TR069,VOIP,IPTV,INTERNET'
<% end if %>
<% end if %>
        , 'OTHER');
      var i = 0;
      var cusname = templateName;
      var hascusopt = true;
      var isSel = 0;

      with (getElById('Template'))
      {
        for( i=0; i< templateArray.length; i++)
        {
          var opt = new Option(templateArray[i], templateArray[i]);
          if ( templateName == templateArray[i] )
          {
            opt.selected = true
            isSel = i;
            hascusopt = false;
          }
          options.add ( opt );
          options[isSel].setAttribute('selected', 'true');
        }

        if ( hascusopt)
        {
          isSel = 0;
          options[isSel].setAttribute('selected', 'true');
        }
      }
    }
    
    function btnSave()
    {
      var curTemplete = $("#Template").val();
      document.ConfigForm.TempleteString.value = curTemplete;
      var QoSEnable = $("input[name='Enable']:checked").val();
      if("1" == QoSEnable)
      {
        document.ConfigForm.TempleteFlag.value = "1";
        if(document.ConfigForm.TempleteString.value != document.ConfigForm.oldTempleteString.value)
          document.ConfigForm.SelectTagFlag.value = "1";
      }
      document.ConfigForm.SaveAlter_Flag.value = "1";
      document.ConfigForm.SaveFlag.value = "1";
      document.ConfigForm.submit();
      //showLoading();
    }
  </script>
</body>

</html>
