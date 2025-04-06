<%
if Request_Form("Mac_Flag") = "3" then
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","DeleteIndex","delnum")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
elseif Request_Form("Mac_Flag") ="2" then
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","ActiveMac","EnMacFilter_Flag")
  TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
elseif Request_Form("Mac_Flag") ="4" then
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","ListTypeMac","ListType_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()	
end if	

if Request_Form("Add_Flag") = "1" then 
  TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Entry","Active","EnableMac_Flag")
  TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
  TCWebApi_set("IpMacFilter_Entry","MacName","SourceMACAddress")
  TCWebApi_set("IpMacFilter_Entry","MacAddr","SourceMACAddress")
  TCWebAPI_set("IpMacFilter_Entry","Interface","Interface_Flag")
  TCWebAPI_set("IpMacFilter_Entry","Direction","Direction_Flag")
  
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Firewall-MAC Filterring</title>
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
var enableFilter = "<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s") %>";
var Mode = "<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>";
var state;
var enable_state = false;

function LoadFrame()
{
  document.ConfigForm.delnum.value = "";
  document.ConfigForm.Mac_Flag.value = "0";
  var FilterMode = getElById("FilterMode");
  var FilterEnable = getElById("FilterEnable");
  var FilterInfo = getElById("FilterInfo");
  if (Mode == "Black")
  {
    FilterMode[0].checked = true;
    state = false;
  }
  else
  {
    FilterMode[1].checked = true;
    state = true;
  }
  
  if (enableFilter == 1)
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
  var FilterEnable = getElById("FilterEnable");
  if ((FilterEnable[0].checked == true) && !enable_state)
  {
    var enableTips = simpleAlert({
      "content": "Are you sure to enable MAC filter?",
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
    var disableTips = simpleAlert({
      "content": "Are you sure to disable MAC filter?",
      "buttons":{
        "OK":function () {
          disableTips.close();
          setTimeout(function () {
            getElement('FilterInfo').style.display = "none";
            SubmitForm();
          },200);
        },
        "Cancel":function () {
          disableTips.close();
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
  Form.Actionflag.value = "Add";
  Form.Mac_Flag.value = "2";
  if(FilterEnable[0].checked == true)
  {
    Form.EnMacFilter_Flag.value = "1";
    if((enable_state && parseInt(Form.mac_num.value)==0) || (enable_state==false))
    {
      Form.ListType_Flag.value = "Black";
    }
  }
  else if (FilterEnable[1].checked == true)
  {
    Form.EnMacFilter_Flag.value = "0";
    Form.ListType_Flag.value = "Black";
  }
  Form.submit();
  showLoading();
}

function ChangeMode()
{
  var	Form = document.ConfigForm;
  var FilterMode = getElById("FilterMode");
  if (FilterMode[0].checked == true && state)
  {
    var blackTips = simpleAlert({
      "content": "Changing the filter mode will switch all filter rules. Are you sure to change the filter mode to the blacklist?",
      "buttons":{
        "OK":function () {
          blackTips.close();
          setTimeout(function () {
            state = false;
            Form.ListType_Flag.value = "Black";
            Form.Mac_Flag.value = "4";
            Form.Actionflag.value = "Mod";
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
  else if (FilterMode[1].checked == true && !state)
  {
    var whiteTips = simpleAlert({
      "content": "Changing the filter mode will switch all filter rules. Are you sure to change the filter mode to the whitelist?",
      "buttons":{
        "OK":function () {
          whiteTips.close();
          setTimeout(function () {
            state = true;
            Form.ListType_Flag.value = "White";
            Form.Mac_Flag.value = "4";
            Form.Actionflag.value = "Mod";
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


var nCount = 40;
var MacFilterRuleIndex = "<% tcWebApi_get("IpMacFilter","mac_num","s") %>";
var MacFilterRule = new Array(nCount);

function GetMacFilterTable()
{
  MacFilterRule[0] = "<% tcWebApi_get("IpMacFilter_Entry0","MacAddr","s") %>";
  MacFilterRule[1] = "<% tcWebApi_get("IpMacFilter_Entry1","MacAddr","s") %>";
  MacFilterRule[2] = "<% tcWebApi_get("IpMacFilter_Entry2","MacAddr","s") %>";
  MacFilterRule[3] = "<% tcWebApi_get("IpMacFilter_Entry3","MacAddr","s") %>";
  MacFilterRule[4] = "<% tcWebApi_get("IpMacFilter_Entry4","MacAddr","s") %>";
  MacFilterRule[5] = "<% tcWebApi_get("IpMacFilter_Entry5","MacAddr","s") %>";
  MacFilterRule[6] = "<% tcWebApi_get("IpMacFilter_Entry6","MacAddr","s") %>";
  MacFilterRule[7] = "<% tcWebApi_get("IpMacFilter_Entry7","MacAddr","s") %>";
  MacFilterRule[8] = "<% tcWebApi_get("IpMacFilter_Entry8","MacAddr","s") %>";
  MacFilterRule[9] = "<% tcWebApi_get("IpMacFilter_Entry9","MacAddr","s") %>";
  MacFilterRule[10] = "<% tcWebApi_get("IpMacFilter_Entry10","MacAddr","s") %>";
  MacFilterRule[11] = "<% tcWebApi_get("IpMacFilter_Entry11","MacAddr","s") %>";
  MacFilterRule[12] = "<% tcWebApi_get("IpMacFilter_Entry12","MacAddr","s") %>";
  MacFilterRule[13] = "<% tcWebApi_get("IpMacFilter_Entry13","MacAddr","s") %>";
  MacFilterRule[14] = "<% tcWebApi_get("IpMacFilter_Entry14","MacAddr","s") %>";
  MacFilterRule[15] = "<% tcWebApi_get("IpMacFilter_Entry15","MacAddr","s") %>";
  MacFilterRule[16] = "<% tcWebApi_get("IpMacFilter_Entry16","MacAddr","s") %>";
  MacFilterRule[17] = "<% tcWebApi_get("IpMacFilter_Entry17","MacAddr","s") %>";
  MacFilterRule[18] = "<% tcWebApi_get("IpMacFilter_Entry18","MacAddr","s") %>";
  MacFilterRule[19] = "<% tcWebApi_get("IpMacFilter_Entry19","MacAddr","s") %>";
  MacFilterRule[20] = "<% tcWebApi_get("IpMacFilter_Entry20","MacAddr","s") %>";
  MacFilterRule[21] = "<% tcWebApi_get("IpMacFilter_Entry21","MacAddr","s") %>";
  MacFilterRule[22] = "<% tcWebApi_get("IpMacFilter_Entry22","MacAddr","s") %>";
  MacFilterRule[23] = "<% tcWebApi_get("IpMacFilter_Entry23","MacAddr","s") %>";
  MacFilterRule[24] = "<% tcWebApi_get("IpMacFilter_Entry24","MacAddr","s") %>";
  MacFilterRule[25] = "<% tcWebApi_get("IpMacFilter_Entry25","MacAddr","s") %>";
  MacFilterRule[26] = "<% tcWebApi_get("IpMacFilter_Entry26","MacAddr","s") %>";
  MacFilterRule[27] = "<% tcWebApi_get("IpMacFilter_Entry27","MacAddr","s") %>";
  MacFilterRule[28] = "<% tcWebApi_get("IpMacFilter_Entry28","MacAddr","s") %>";
  MacFilterRule[29] = "<% tcWebApi_get("IpMacFilter_Entry29","MacAddr","s") %>";
  MacFilterRule[30] = "<% tcWebApi_get("IpMacFilter_Entry30","MacAddr","s") %>";
  MacFilterRule[31] = "<% tcWebApi_get("IpMacFilter_Entry31","MacAddr","s") %>";
  MacFilterRule[32] = "<% tcWebApi_get("IpMacFilter_Entry32","MacAddr","s") %>";
  MacFilterRule[33] = "<% tcWebApi_get("IpMacFilter_Entry33","MacAddr","s") %>";
  MacFilterRule[34] = "<% tcWebApi_get("IpMacFilter_Entry34","MacAddr","s") %>";
  MacFilterRule[35] = "<% tcWebApi_get("IpMacFilter_Entry35","MacAddr","s") %>";
  MacFilterRule[36] = "<% tcWebApi_get("IpMacFilter_Entry36","MacAddr","s") %>";
  MacFilterRule[37] = "<% tcWebApi_get("IpMacFilter_Entry37","MacAddr","s") %>";
  MacFilterRule[38] = "<% tcWebApi_get("IpMacFilter_Entry38","MacAddr","s") %>";
  MacFilterRule[39] = "<% tcWebApi_get("IpMacFilter_Entry39","MacAddr","s") %>";
}

function CheckForm()
{
  with (getElById('ConfigForm'))
  {
    var macObj = document.ConfigForm.SourceMACAddress;
    var macStr = document.ConfigForm.SourceMACAddress.value;
    //console.log("before: " + macStr);
    if(macStr.length > 0){
      var tmpStr = macStr.split(':');
      macStr = tmpStr.join('');
      document.ConfigForm.macTmp.value = macStr;
    }else{
      var Tips = simpleAlert({
        "content": "Error! mac address cannot be empty!",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }
    //console.log("after: " + macStr);

    if(macStr.length != 12){
      var Tips = simpleAlert({
        "content": "Error! Invalid MAC address. Format is (AA:BB:CC:DD:EE:FF)",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }

    if(!checkMacAddr(document.ConfigForm.macTmp))
      return false;

    var len = macObj.value.length;
    //console.log("len: " + len);
    if ( len == 12 )
    {
      var newAddr = "";
      var i = 0;

      for ( i = 0; i < len; i++ )
      {
        var c = macObj.value.charAt(i);
        if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
          newAddr = newAddr + ":";
        newAddr = newAddr + c;
      }
      macObj.value = newAddr;
    }
    
    GetMacFilterTable();
    for(var i=0; i < nCount; i++)
    {
      if(MacFilterRule[i] != "N/A")
      {  
        var str = MacFilterRule[i];
        if(SourceMACAddress.value.toLowerCase() == str.toLowerCase())
        {
          var Tips = simpleAlert({
            "content": "The same MAC address has already existed!",
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

  if(parseInt(Form.mac_num.value) >= 40)
  {
    var Tips = simpleAlert({
      "content": "The number of rules must be less than 40.",
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
  Form.Add_Flag.value = "1";
  Form.submit();
  showLoading();
}

var DelArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];

function doDel(id)
{
  var checkbox = getElById("MacFilter_" + id);
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
  Form.Mac_Flag.value = "3";
  for(i = 0; i < nCount; i++)
  {
    if(MacFilterRule[i] != "N/A" && DelArray[i] == "1")
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
  var Form = document.ConfigForm;
  for(i = 0; i < nCount; i++)
  {
    if(MacFilterRule[i] != "N/A")
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
            Form.Mac_Flag.value = "3";
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
  <FORM name="ConfigForm" action="/cgi-bin/true-page/firewall/Firewall-MAC-Filtering.asp" method="post">
  <input type="hidden" name="ListType_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeMac","s") %>">
  <input type="hidden" name="Mac_Flag" value="0">
  <input type="hidden" name="delnum" value="">
  <input type="hidden" name="EnMacFilter_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActiveMac","s") %>">
  <input type="hidden" name="mac_num" value="<% tcWebApi_get("IpMacFilter","mac_num","s") %>">
  <input type="hidden" name="Add_Flag" value="0">
  <input type="hidden" name="EnableMac_Flag" value="Yes">
  <input type="hidden" name="curNum" value="<% tcWebApi_get("IpMacFilter","add_macnum","s") %>">
  <input type="hidden" name="RuleType_Flag" value="MAC">
  <input type="hidden" name="Direction_Flag" value="Incoming">
  <input type="hidden" name="IpMacType_Flag" value="Mac">
  <input type="hidden" name="Actionflag" value="Add">
  <input type="hidden" name="Interface_Flag" value="br0"> 
  <input type="hidden" name="macTmp" value="">
  <div class="title-text">MAC Filtering</div>
  <div class="title-description-text">Entries in this table are used to restrict certain types of data packets from your local network to Internet through the Gateway. Use of such filters can be helpful in securing or restricting your local network.</div>
  <div class="row p-1">
    <div class="col-6">
      <div class="title-text-left">MAC Filtering:</div>
    </div>
    <div class="col-6">
      <input id="FilterEnable" onclick="SetEnable()" type="radio" value="1" name="FilterEnable" <% If tcWebApi_get("IpMacFilter_Common","ActiveMac","h") = "1" then asp_Write("checked") end if %> >
      <label class="input-radio">Enable</label>
      <input id="FilterEnable" onclick="SetEnable()" type="radio" value="0" name="FilterEnable" <% If tcWebApi_get("IpMacFilter_Common","ActiveMac","h") = "0" then asp_Write("checked") end if %> >
      <label class="input-radio">Disable</label>
    </div>
  </div>
  <div id="FilterInfo">
<SCRIPT language=JavaScript type=text/javascript>
if (enableFilter == 0)
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
        <input id="FilterMode" type="radio" value="0" name="FilterMode" <% If tcWebApi_get("IpMacFilter_Common","ListTypeMac","h") = "Black"  then asp_Write("checked") end if %> >
        <label class="input-radio">BlackList</label>
        <input id="FilterMode" type="radio" value="1" name="FilterMode" <% If tcWebApi_get("IpMacFilter_Common","ListTypeMac","h") = "White" then asp_Write("checked") end if %> >
        <label class="input-radio">Whitelist</label>
      </div>
      <div class="col-3">
        <button class="btn-file" type="button" onclick="ChangeMode()">Apply Changes</button>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">MAC Address :</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" type='text' name="SourceMACAddress" id="SourceMACAddress" maxlength='17' />
      </div>
    </div>

    <div class="mt-2 center">
      <button id="btnAdd" type="button" name="btnAdd" class="btn-dashboard" onclick="addClick()">Add</button>
    </div>
    <hr>
    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 35%;" class="p-1">Current Filter Table</th>
          <th style="width: 40%;"></th>
        </tr>
        <tr class="table-header center">
          <td class="p-1">Select</td>
          <td class="p-1">MAC Address</td>
        </tr>
        <SCRIPT language=JavaScript type=text/javascript>
          GetMacFilterTable();
        var z=0;
        for(i = 0; i < nCount; i++)
        {
          if(MacFilterRule[i] != "N/A")
          {  
            var rowCss=z%2==0?"table-content-fist":"table-content-second";
            document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
            document.write('<TD><INPUT type=\"checkbox\" id=\"MacFilter_' + i + '\" onclick=\"doDel(' + i + ');\"></TD>');
            document.write('<TD>' + MacFilterRule[i] + '&nbsp;</TD>');
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