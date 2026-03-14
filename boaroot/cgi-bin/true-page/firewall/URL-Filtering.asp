<%
if Request_Form("Save_Flag") = "1" then
  TCWebApi_set("UrlFilter_Common","Action","Actionflag")
  TCWebApi_set("WebCurSet_Entry","url_filter_id","add_num")
  TCWebApi_set("UrlFilter_Entry","Activate","EnableUrlFilterFlag")
  TCWebApi_set("UrlFilter_Entry","URL","urlitem")
  TCWebApi_commit("UrlFilter")
  TCWebApi_save()
elseif Request_Form("Save_Flag") ="2" then
  TCWebApi_set("UrlFilter_Common","Action","Actionflag")
  TCWebApi_set("UrlFilter_Common","Activate","EnableUrlFilterFlag")
  TCWebApi_commit("UrlFilter")
  TCWebApi_save()
elseif Request_Form("Save_Flag") = "3" then
  TCWebApi_set("UrlFilter_Common","Action","Actionflag")
  TCWebApi_set("UrlFilter_Common","DeleteIndex","delnum")
  TCWebApi_commit("UrlFilter")
  TCWebApi_save()
elseif Request_Form("Save_Flag") = "4" then
  TCWebApi_set("UrlFilter_Common","Action","Actionflag")
  TCWebApi_set("UrlFilter_Common","Filter_Policy","FilterMode")
  TCWebApi_commit("UrlFilter")
  TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>URL Filtering</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <script src="/scripts/utils/util_skyw.js"></script>

</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">

<SCRIPT language=javascript>
var urlfltpolicy = "<% tcWebApi_get("UrlFilter_Common","Filter_Policy","s") %>";
var urlEnable = "<% tcWebApi_get("UrlFilter_Common","Activate","s") %>";
var urllistIndex = 0;
var urllist = new Array();
var state = urlEnable;
var enable_state;

function LoadFrame()
{
  document.ConfigForm.delnum.value = "";
  document.ConfigForm.Save_Flag.value = "0";
  var FilterMode = getElById("FilterMode");
  var FilterEnable = getElById("FilterEnable");
  var FilterInfo = getElById("FilterInfo");
  if (urlfltpolicy == "0")
  {
    FilterMode[0].checked = true;
    state = false;
  }
  else
  {
    FilterMode[1].checked = true;
    state = true;
  }
  
  if (urlEnable == 1)
  {
    FilterEnable[0].checked = true;
    enable_state=true;
  }
  else
  {
    FilterEnable[1].checked = true;
    enable_state=false;
  }
}

function SetEnable()
{
  var	Form = document.ConfigForm;
  var FilterEnable = getElById("FilterEnable");
  if ((FilterEnable[0].checked == true) && !enable_state)
  {
    var enableTips = simpleAlert({
      "content": "Are you sure to enable URL filter?",
      "buttons":{
        "OK":function () {
          enableTips.close();
          setTimeout(function () {
            getElement('FilterInfo').style.display = "";
            SubmitForm();
          },200);
        },
        "Cancel":function () {
          enableTips.close();
          FilterEnable[0].checked = false;
          FilterEnable[1].checked = true;
          return;
        }
      }
    });
  }
  else if ((FilterEnable[1].checked == true) && enable_state)
  {
    var enableTips = simpleAlert({
      "content": "Are you sure to disable URL filter?",
      "buttons":{
        "OK":function () {
          enableTips.close();
          setTimeout(function () {
            getElement('FilterInfo').style.display = "none";
            SubmitForm();
          },200);
        },
        "Cancel":function () {
          enableTips.close();
          FilterEnable[0].checked = true;
          FilterEnable[1].checked = false;
          return;
        }
      }
    });
  }
}

function SubmitForm()
{
  var Form = document.ConfigForm;
  var FilterEnable = getElById("FilterEnable")
  Form.Save_Flag.value = "2";
  Form.Actionflag.value = "Status";
  if(FilterEnable[0].checked == true)
  {
    Form.EnableUrlFilterFlag.value = "1";
  }
  else if (FilterEnable[1].checked == true)
  {
    Form.EnableUrlFilterFlag.value = "0";
  }
  Form.submit();
  showLoading();
}

function ChangeMode()
{
  var	Form = document.ConfigForm;
  var FilterMode = getElById("FilterMode");
  if (urlfltpolicy == getRadioVal('FilterMode'))
  {
    return;
  }
  if (FilterMode[0].checked == true)
  {
    var blackTips = simpleAlert({
      "content": "Changing the filter mode will switch all filter rules. Are you sure to change the filter mode to the blacklist?",
      "buttons":{
        "OK":function () {
          blackTips.close();
          setTimeout(function () {
            Form.Save_Flag.value = "4";
            Form.Actionflag.value = "Filter";
            Form.submit();
            showLoading();
          },200);
        },
        "Cancel":function () {
          blackTips.close();
          FilterMode[0].checked = false;
          FilterMode[1].checked = true;
          return;
        }
      }
    });
  }
  else if (FilterMode[1].checked == true)
  {
    var whiteTips = simpleAlert({
      "content": "Changing the filter mode will switch all filter rules. Are you sure to change the filter mode to the whitelist?",
      "buttons":{
        "OK":function () {
          whiteTips.close();
          setTimeout(function () {
            Form.Save_Flag.value = "4";
            Form.Actionflag.value = "Filter";
            Form.submit();
            showLoading();
          },200);
        },
        "Cancel":function () {
          whiteTips.close();
          FilterMode[0].checked = true;
          FilterMode[1].checked = false;
          return;
        }
      }
    });
  }
}


var nCount = 6;
//var MacFilterRuleIndex = "<% tcWebApi_get("IpMacFilter","mac_num","s") %>";
var UrlFilterRule = new Array(nCount);

function GetUrlFilterTable()
{
  UrlFilterRule[0] = "<% tcWebApi_get("UrlFilter_Entry0","URL","s") %>";
  UrlFilterRule[1] = "<% tcWebApi_get("UrlFilter_Entry1","URL","s") %>";
  UrlFilterRule[2] = "<% tcWebApi_get("UrlFilter_Entry2","URL","s") %>";
  UrlFilterRule[3] = "<% tcWebApi_get("UrlFilter_Entry3","URL","s") %>";
  UrlFilterRule[4] = "<% tcWebApi_get("UrlFilter_Entry4","URL","s") %>";
  UrlFilterRule[5] = "<% tcWebApi_get("UrlFilter_Entry5","URL","s") %>";
}

function CheckForm()
{
  with (getElById('ConfigForm'))
  {
    if (urlitem.value == '')
    {
      var Tips = simpleAlert({
        "content": "URL address cannot be empty!",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }
    if (urlitem.value.length > 31)
    {
      var Tips = simpleAlert({
        "content": "URL length must be less than 31.",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }
    if (Check_URL(urlitem.value) == false)
    {
      var Tips = simpleAlert({
        "content": "Invalid URL address.",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }
    var str = urlitem.value;
    var i;
    if (-1 != (i = str.indexOf("http")))
    {
      if(-1 != str.indexOf("https"))
        str = str.substring(i+8);
      else str = str.substring(i+7);
    }
    urlitem.value = str;
    
    GetUrlFilterTable();
    for(var i=0; i < nCount; i++)
    {
      if(UrlFilterRule[i] != "N/A")
      {  
        var tmpstr = UrlFilterRule[i];
        if(str.toLowerCase() == tmpstr.toLowerCase())
        {
          var Tips = simpleAlert({
            "content": "The same URL filter rule has already existed!",
            "buttons":{
              "OK":function () {
                Tips.close();
              }
            }
          });
          return false;
        }
      }
    }
  }
  return true;
}

function addClick()
{
  var Form = document.ConfigForm;

  if(parseInt(Form.Url_num.value) >= 6)
  {
    var Tips = simpleAlert({
      "content": "The number of URL must be less than 6.",
      "buttons":{
        "OK":function () {
          Tips.close();
        }
      }
    });
    return;
  }
  if(CheckForm() == false)
  {
    return;
  }
  Form.Actionflag.value = "Add";
  Form.Save_Flag.value = "1";
  Form.submit();
  showLoading();
}

var DelArray = [0,0,0,0,0,0];

function doDel(id)
{
  var checkbox = getElById("UrlFilter_" + id);
  if(true == checkbox.checked)
  {
    DelArray[id] = "1";
  }
  else
  {
    DelArray[id] = "0";
  }
}

function RemoveSelect()
{
  var i = 0;
  var tempstr;
  var hasEntry = false;
  var	Form = document.ConfigForm;
  Form.Actionflag.value = "Del";
  Form.Save_Flag.value = "3";
  for(i = 0; i < nCount; i++)
  {
    if(UrlFilterRule[i] != "N/A" && DelArray[i] == "1")
    {
      hasEntry = true;
      tempstr = i + ",";
      Form.delnum.value = Form.delnum.value + tempstr;
    }
  }
  
  if(hasEntry == true){
    Form.submit();
    showLoading();
  }else{
    var Tips = simpleAlert({
      "content": "Please select at least one item.",
      "buttons":{
        "OK":function () {
          Tips.close();
        }
      }
    });
    return false;
  }
}

function RemoveAll()
{
  var i = 0;
  var tempstr;
  var hasEntry = false;
  var	Form = document.ConfigForm;
  for(i = 0; i < nCount; i++)
  {
    if(UrlFilterRule[i] != "N/A")
    {
      hasEntry = true;
      tempstr = i + ",";
      Form.delnum.value = Form.delnum.value + tempstr;
    }
  }

  if(hasEntry == true){
    var deleteTips = simpleAlert({
      "content": "Are you sure to delete all items?",
      "buttons":{
        "OK":function () {
          deleteTips.close();
          setTimeout(function () {
            Form.Actionflag.value = "Del";
            Form.Save_Flag.value = "3";
            Form.submit();
            showLoading();
          },200);
        },
        "Cancel":function () {
          deleteTips.close();
          return false;
        }
      }
    });
  }else{
    var Tips = simpleAlert({
      "content": "Current Filter Table is empty!",
      "buttons":{
        "OK":function () {
          Tips.close();
        }
      }
    });
    return false;
  }
}
</SCRIPT>
<!-- content -->
<div class="container-full container-resize-height">
  <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/URL-Filtering.asp" method="post">
  <input type="hidden" name="Save_Flag" value="0">
  <input type="hidden" name="Actionflag" value="Del">
  <input type="hidden" name="EnableUrlFilterFlag" value="<% tcWebApi_get("UrlFilter_Common","Activate","s") %>">
  <input type="hidden" name="delnum" value="">
  <input type="hidden" name="add_num" value="<% tcWebApi_get("UrlFilter","add_num","s") %>">
  <input type="hidden" name="Url_num" value="<% tcWebApi_get("UrlFilter","Url_num","s") %>">
  <div class="title-text">URL Filtering</div>
  <div class="title-description-text">This page is used to configure the Blocked FQDN(Such as tw.yahoo.com) and filtered keyword. Here you can add/delete FQDN and filtered keyword.</div>
  <div class="row p-1">
    <div class="col-6">
      <div class="title-text-left">URL Filtering</div>
    </div>
    <div class="col-6">
      <input id="FilterEnable" onclick="SetEnable()" type="radio" value="1" name="FilterEnable" <% If tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then asp_Write("checked") end if %> >
      <label class="input-radio">Enable</label>
      <input id="FilterEnable" onclick="SetEnable()" type="radio" value="0" name="FilterEnable" <% If tcWebApi_get("UrlFilter_Common","Activate","h") = "0" then asp_Write("checked") end if %> >
      <label class="input-radio">Disable</label>
    </div>
  </div>
  <div id="FilterInfo">
<SCRIPT language=JavaScript type=text/javascript>
if (urlEnable == 0)
{
  getElById("FilterInfo").style.display = "none";
}
</SCRIPT>
      <hr>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Mode:</div>
      </div>
      <div class="col-3">
        <input id="FilterMode" type="radio" value="0" name="FilterMode" <% If tcWebApi_get("UrlFilter_Common","Filter_Policy","h") = "0"  then asp_Write("checked") end if %> >
        <label class="input-radio">BlackList</label>
        <input id="FilterMode" type="radio" value="1" name="FilterMode" <% If tcWebApi_get("UrlFilter_Common","Filter_Policy","h") = "1" then asp_Write("checked") end if %> >
        <label class="input-radio">Whitelist</label>
      </div>
      <div class="col-3">
        <button class="btn-file" type="button" onclick="ChangeMode()">Apply Changes</button>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">URL :</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" type='text' name="urlitem" id="urlitem" maxlength='30' />
      </div>
    </div>

    <div class="mt-2 center">
      <button id="btnAdd" type="button" name="btnAdd" class="btn-dashboard" onclick="addClick()">Add</button>
    </div>
    <hr>
    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 35%;" class="p-1">URL Filtering Table</th>
          <th style="width: 40%;"></th>
        </tr>
        <tr class="table-header center">
          <td class="p-1">Select</td>
          <td class="p-1">URL Address</td>
        </tr>
        <SCRIPT language=JavaScript type=text/javascript>
          GetUrlFilterTable();
        var z=0;
        for(i = 0; i < nCount; i++)
        {
          if(UrlFilterRule[i] != "N/A")
          {  
            var rowCss=z%2==0?"table-content-fist":"table-content-second";
            document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
            document.write('<TD><INPUT type=\"checkbox\" id=\"UrlFilter_' + i + '\" onclick=\"doDel(' + i + ');\"></TD>');
            document.write('<TD>' + UrlFilterRule[i] + '&nbsp;</TD>');
            document.write('</TR>');
            z++;
          }						
        }
        </SCRIPT>
      </table>
    </div>
    <div class="mt-2 center">
      <button id="btnDelSelect" type="button" class="btn-dashboard" onclick="RemoveSelect();">Delete Selected</button>
      <button id="btnDelAll" type="button" class="btn-dashboard" onclick="RemoveAll();">Delete All</button>
    </div>
  </div>
  </form>
</div>
<!-- content -->
</body>

</html>