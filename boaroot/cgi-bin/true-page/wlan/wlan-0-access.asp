<%
if Request_Form("wlanWEPFlag")="1" Then
  TCWebApi_set("WebCurSet_Entry","wlan_ac_id","SSID_INDEX")
  TCWebApi_save()
end if

if Request_Form("btnApply_Flag") = "1" then
  TCWebApi_set("WLan11ac_Entry","AccessPolicy","accessMode")
  TCWebApi_set("WLan11ac_Entry","AccessMode","accessMode")
 
  if tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "1" then
    if Request_Form("W_macIndex_Flag") = "0" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC0","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "1" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC1","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "2" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC2","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "3" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC3","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "4" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC4","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "5" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC5","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "6" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC6","macAddr")
    elseif Request_Form("W_macIndex_Flag") = "7" then
      TCWebApi_set("WLan11ac_Entry","W_WLan_MAC7","macAddr")
    end if
  elseif tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "2" then  
    if Request_Form("B_macIndex_Flag") = "0" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC0","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "1" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC1","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "2" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC2","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "3" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC3","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "4" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC4","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "5" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC5","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "6" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC6","macAddr")
    elseif Request_Form("B_macIndex_Flag") = "7" then
      TCWebApi_set("WLan11ac_Entry","B_WLan_MAC7","macAddr")
    end if
  end if
  
  TCWebApi_commit("WLan11ac_Entry");
  TCWebApi_save();
End If

if Request_Form("AccessMode_Flag") = "1" then
  TCWebApi_set("WLan11ac_Entry","AccessPolicy","accessMode")
  TCWebApi_set("WLan11ac_Entry","AccessMode","accessMode")
  TCWebApi_commit("WLan11ac_Entry");
  TCWebApi_save();
End If

if Request_Form("btnDel_Action") = "1" then
  if Request_Form("accessMode") = "1" then
    if Request_Form("btnDel_Flag0") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC0","")
    end if
    if Request_Form("btnDel_Flag1") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC1","")
    end if
    if Request_Form("btnDel_Flag2") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC2","")
    end if
    if Request_Form("btnDel_Flag3") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC3","")
    end if
    if Request_Form("btnDel_Flag4") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC4","")
    end if
    if Request_Form("btnDel_Flag5") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC5","")
    end if
    if Request_Form("btnDel_Flag6") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC6","")
    end if
    if Request_Form("btnDel_Flag7") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC7","")
    end if
  elseif Request_Form("accessMode") = "2" then
    if Request_Form("btnDel_Flag0") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC0","")
    end if
    if Request_Form("btnDel_Flag1") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC1","")
    end if
    if Request_Form("btnDel_Flag2") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC2","")
    end if
    if Request_Form("btnDel_Flag3") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC3","")
    end if
    if Request_Form("btnDel_Flag4") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC4","")
    end if
    if Request_Form("btnDel_Flag5") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC5","")
    end if
    if Request_Form("btnDel_Flag6") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC6","")
    end if
    if Request_Form("btnDel_Flag7") = "1" then
      tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC7","")
    end if
  end if
    TCWebApi_commit("WLan11ac_Entry");
    TCWebApi_save();
End If

if Request_Form("btnDelAll_Action") = "1" then
  if Request_Form("accessMode") = "1" then 
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC0","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC1","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC2","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC3","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC4","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC5","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC6","")
    tcWebApi_constSet("WLan11ac_Entry","W_WLan_MAC7","")
  elseif Request_Form("accessMode") = "2" then 
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC0","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC1","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC2","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC3","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC4","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC5","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC6","")
    tcWebApi_constSet("WLan11ac_Entry","B_WLan_MAC7","")
  end if
  TCWebApi_commit("WLan11ac_Entry");
  TCWebApi_save();
  
End If

if Request_form("Radio_ONFF_Flag") = "1" then

  if Request_form("WLAN_FltActive") = "0" then
    TCWebApi_set("WLan11ac_Entry","AccessPolicy","WLAN_FltActive")
  else
    TCWebApi_set("WLan11ac_Entry","AccessPolicy","accessMode")
  end if
    TCWebApi_commit("WLan11ac_Entry")
    TCWebApi_save()
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>WLAN - Access Control</title>
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

<body onload="on_load()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/wlan/wlan-0-access.asp" method="post" >
    <input type="hidden" name="wlanWEPFlag" value="0" >
    <input type="hidden" name="btnApply_Flag" value="0">
    <input type="hidden" name="macIndex_Flag" value="-1">
    <input type="hidden" name="W_macIndex_Flag" value="-1">
    <input type="hidden" name="B_macIndex_Flag" value="-1">
    <input type="hidden" name="btnDel_Action" value="0">
    <input type="hidden" name="btnDelAll_Action" value="0">
    <input type="hidden" name="btnDel_Flag0" value="0">
    <input type="hidden" name="btnDel_Flag1" value="0">
    <input type="hidden" name="btnDel_Flag2" value="0">
    <input type="hidden" name="btnDel_Flag3" value="0">
    <input type="hidden" name="btnDel_Flag4" value="0">
    <input type="hidden" name="btnDel_Flag5" value="0">
    <input type="hidden" name="btnDel_Flag6" value="0">
    <input type="hidden" name="btnDel_Flag7" value="0">
    <input type="hidden" name="Radio_ONFF_Flag" value="0">
    <input type="hidden" name="AccessMode_Flag" value="0">
    <input type="hidden" name="macTmp" value="">

    <div class="title-text">WLAN Access Control</div>
    <div class="title-description-text">If you choose 'Allowed Listed', only those WLAN clients whose MAC addresses are in the access control list will be able to connect to your Access Point. When 'Deny Listed' is selected, these WLAN clients on the list will not be able to connect the Access Point.</div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">SSID Index:</div>
      </div>
      <div class="col-6">
        <select class="form-control input-select" name="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
          <option value="1" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "1" then asp_write("selected") end if %> >SSID1 ( <% TCWebApi_get("WLan11ac_Entry1","SSID","s") %> )</option>
          <option value="2" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "2" then asp_write("selected") end if %> >SSID2 ( <% TCWebApi_get("WLan11ac_Entry2","SSID","s") %> )</option>
<% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
          <option value="3" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "3" then asp_write("selected") end if %> >SSID3 ( <% TCWebApi_get("WLan11ac_Entry3","SSID","s") %> )</option>
<% end if %>
          <option value="4" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "4" then asp_write("selected") end if %> >SSID4 ( <% TCWebApi_get("WLan11ac_Entry4","SSID","s") %> )</option>
          <%if 1 <> 1 then%>
          <option value="5" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "5" then asp_write("selected") end if %> >SSID5</option>
          <option value="6" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "6" then asp_write("selected") end if %> >SSID6</option>
          <option value="7" <% if TCWebApi_get("WebCurSet_Entry","wlan_ac_id","h") = "7" then asp_write("selected") end if %> >SSID7</option>
          <% end if %>
        </select>
      </div>
    </div>

    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Active:</div>
      </div>
      <div class="col-6">
        <input TYPE="RADIO" id="btnRadio1" onclick="typeClick()" NAME="WLAN_FltActive" VALUE="1" <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") <> "0" then asp_Write("checked") end if %> >
        <label class="input-radio">Enable</label>
        <input TYPE="RADIO" id="btnRadio2" onclick="typeClick()" NAME="WLAN_FltActive" VALUE="0" <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "0" then asp_Write("checked") end if %> <% If tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "N/A" then asp_Write("checked") end if %> >
        <label class="input-radio">Disable</label>
      </div>
    </div>

    <div id="cfg_list" class="container-resize-height element-hide" >
      <hr>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Mode:</div>
        </div>
        <div class="col-3">
          <!--
          <select class="form-control input-select" NAME="accessMode" size="1" >
            <option value="1" <% if tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "1" then asp_Write("selected") end if %>>BlackList</option>
            <option value="2" <% if tcWebApi_get("WLan11ac_Entry","AccessPolicy","h") = "2" then asp_Write("selected") end if %>>WhiteList</option>
          </select>
          -->
          <input type="radio" value="1" name="accessMode" onclick="ChangeShowList(this.value)" <% if tcWebApi_get("WLan11ac_Entry","AccessMode","h") = "1" then asp_Write("checked") end if %>>
          <label class="input-radio">WhiteList</label>
          <input type="radio" value="2" name="accessMode" onclick="ChangeShowList(this.value)" <% if tcWebApi_get("WLan11ac_Entry","AccessMode","h") = "2" then asp_Write("checked") end if %>>
          <label class="input-radio">BlackList</label>
        </div>
        <div class="col-3">
          <button class="btn-file" type="button" onclick="changeAccessMode()">Apply Changes</button>
        </div>
      </div>
    
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">MAC Address:</div>
        </div>
        <div class="col-4">
          <input class="form-control input-textfield" id="macAddr" type="text" NAME="macAddr"> 
        </div>
        <div class="col-2 col-sx-4 left" style="line-height: 30px;margin-left: -40px;">
          <label class="input-radio">(ex.00:E8:67:10:50:20)</label>
        </div>
      </div>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" onclick="btnAdd()">Add</button>
        <button class="btn-dashboard" type="reset" >Reset</button>
      </div>
      <hr>
      <div class="card-table-content">
        <div class="table-header">Current Access Control List</div>
          <table style="width:100%">
            <tr class="table-header center">
              <th style="width: 20%;">Select</th>
              <th style="width: 30%;" class="p-1">Mode</th>
              <th style="width: 50%;">MAC Address</th>
            </tr>
          </table>
          <table style="width:100%" id="macListContainer">  
            <script type="text/template" data-id="macList">
              <tr class="table-content-fist center">
                <td style="width: 20%;">
                  <input type="checkbox" id="chkbox{index}" name="chkbox{index}" value="{chkSwitch}" {chkSelect} ONCLICK=onClickChkbox({index})>
                </td>
                <td style="width: 30%;" class="p-1">{modeValue}</td>
                <td style="width: 50%;" id="devMac{index}">{mac}</td>
              </tr>
            </script>
          </table>
      </div>
      <div class="mt-2 center">
        <button class="btn-dashboard" type="button" onClick="delConfirm()" >Delete Selected</button>
        <button class="btn-dashboard" type="button" onClick="delAllSubmit()">Delete All</button>
      </div>
    </div>
    </form>
  </div>
  <!-- content -->
  

  
  <script language="JavaScript" type="text/JavaScript">
    var modeEn = '<% tcWebApi_get("WLan11ac_Entry","AccessPolicy","s") %>';
    var enable_state = false;
    var W_macListObj = [
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC0","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC1","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC2","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC3","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC4","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC5","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC6","s") %>',
      },
      {
        modeValue: "WhiteList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","W_WLan_MAC7","s") %>',
      }
    ];
      
    var B_macListObj = [
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC0","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC1","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC2","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC3","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC4","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC5","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC6","s") %>',
      },
      {
        modeValue: "BlackList",
        mac: '<% tcWebApi_get("WLan11ac_Entry","B_WLan_MAC7","s") %>',
      }
    ];
    var tmpContent = $("script[data-id='macList']").html();
    $(document).ready(function(){
      $.each(W_macListObj, function(i, object) {
      if((object.mac == "") || (object.mac == "N/A"))
      {
        $("input[name='W_macIndex_Flag']").val(i);
        return false;
      }
    });

    $.each(B_macListObj, function(i, object) {
      if((object.mac == "") || (object.mac == "N/A"))
      {
        $("input[name='B_macIndex_Flag']").val(i);
        return false;
      }
    });
    
    //console.log(tmpContent);
    if(modeEn == 1)
      renderList(tmpContent, W_macListObj, document.querySelector("#macListContainer"));
    else if(modeEn == 2)
      renderList(tmpContent, B_macListObj, document.querySelector("#macListContainer"));
    });
    
    var renderList = function(tmpContent, renderData, wrappers){
      var rederHtml = '';
      $.each(renderData, function(i, object) {
        object.index= i;
        if((object.mac == "") || (object.mac == "N/A"))
          return true;
        rederHtml += tmpContent.tmp(object);
      });
      if (wrappers) {
        while(wrappers.hasChildNodes()){
          wrappers.removeChild(wrappers.firstChild);
        }
        wrappers.appendHTML(rederHtml);
      }
    }
    function ChangeShowList(checkMode){
      if (checkMode == 1)
        renderList(tmpContent, W_macListObj, document.querySelector("#macListContainer"));
      else
        renderList(tmpContent, B_macListObj, document.querySelector("#macListContainer"));
    }
    String.prototype.tmp = function(obj) {
      var format = {
        name: function(x) {
          return x ;
        }
      };
      return this.replace(/{(\w+)}/g, function(m1, m2) {  
        if (!m2)
          return "";
        return (format && format[m2]) ? format[m2](obj[m2]) : obj[m2];  
      });
    };
    
    HTMLElement.prototype.appendHTML = function(html) {
      var divTemp = document.createElement("table");
      nodes = null,

      fragment = document.createDocumentFragment();
      divTemp.innerHTML = html;
      nodes = divTemp.childNodes;
      for (var i=0, length=nodes.length; i<length; i+=1) {  
        fragment.appendChild(nodes[i].cloneNode(true));  
      }
      this.appendChild(fragment);
      nodes = null;
      fragment = null;
    };

  function CheckForm()
  {
    with(document.forms[0])
    {
      var macObj = document.ConfigForm.macAddr;
      var macStr = document.ConfigForm.macAddr.value;
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
    }
    
    var chkboxlist = $('input[type=checkbox]');
    if(chkboxlist.length > 7)
    {
      var Tips = simpleAlert({
        "content": "Cannot add new entry! More than 8 itmes.",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }
    
    
    var macFlag = 0;
	var NewMode = $('input:radio[name="accessMode"]:checked').val();
    if(NewMode == 1)
    {
      $.each(W_macListObj, function(i, object) {
        if(object.mac.toUpperCase() == $("input[name='macAddr']").val().toUpperCase()) 
        {
          var Tips = simpleAlert({
            "content": "The same MAC address has already existed!",
            "buttons":{
              "OK":function () {
                Tips.close();
              }
            }
          });
          macFlag = 1;
          return false;
        }
      });
    }
    else if(NewMode == 2)
    {
      $.each(B_macListObj, function(i, object) {
        if(object.mac.toUpperCase() == $("input[name='macAddr']").val().toUpperCase()) 
        {
          var Tips = simpleAlert({
            "content": "The same MAC address has already existed!",
            "buttons":{
              "OK":function () {
                Tips.close();
              }
            }
          });
          macFlag = 1;
          return false;
        }
      });
    }
    
    if(1 == macFlag){
      return false;
    }
    
    return true;
  }
  
  function doSSIDChange()
  {
    $("input[name='wlanWEPFlag']").val(1);
    document.ConfigForm.submit();
    showLoading();
  }
  
  function btnAdd()
  {
    /*
    var macValue = $("#macAddr").val();
    console.log("macValue: " + macValue);
    if(macValue == null || macValue == undefined || macValue == ''){
        document.ConfigForm.macAddr.value = "";
    }else{
      if(!CheckForm())
        return false;
    }
    */
    if(!CheckForm()){
      return false;
    }
    else{
      $("input[name='btnApply_Flag']").val(1);
      document.ConfigForm.submit();
      showLoading();
    }
  }
  
  function setDelBtnFlag(del_list){
    
    for(i = 0; i < del_list.length; i++){	
      $("input[name='btnDel_Flag"+ del_list[i] +"']").val(1);
    }	
  }
  
  function onClickChkbox(index){
    var chkSwitch = $("#chkbox" + index).val();
    if(chkSwitch == "ON"){
      $("#chkbox" + index).val("OFF");
    }else{
      $("#chkbox" + index).val("ON");
    }
    //console.log("index"+index);
  }	
  
    
  function delConfirm(){

    var del_list = new Array();
    
    var i, count = 0;
    var chkboxlist = $('input[type=checkbox]');
    
    for(i = 0; i < chkboxlist.length; i++){
      var boxName = chkboxlist[i].name;
      var selectIndex = boxName.charAt(boxName.length-1);
      //console.log("selectIndex:" + selectIndex);
      var devMac = $("#devMac" + selectIndex).text();
        
      if(chkboxlist[i].checked){
        count++;
        del_list.push(selectIndex);
      }
    }
    
    //console.log(del_list);
    
    if( !count ){
      var Tips = simpleAlert({
        "content": "Please select at least one item.",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
      return false;
    }else{
      var deleteTips = simpleAlert({
        "content": "Are you sure to delete checked items?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            //setTimeout("delSubmit(del_list)",500);
            setTimeout(function () {
              document.ConfigForm.btnDel_Action.value = "1";
              setDelBtnFlag(del_list);
              document.ConfigForm.submit();
            },500);
          },
          "Cancel":function () {
            deleteTips.close();
          }
        }
      });
    }
  }
  
  function selectChkBox(isChecked)
  {
    var chkboxlist = $('input[type=checkbox]');
        
    for(i = 0; i < chkboxlist.length; i++){
      var boxName = chkboxlist[i].name;
      var selectIndex = boxName.charAt(boxName.length-1);
      $("#chkbox" + selectIndex).prop("checked",isChecked);
    }
  }
  
  function delAllConfirm(){
    var	vForm = document.ConfigForm;
    var deleteTips = simpleAlert({
      "content": "Are you sure to delete all items?",
      "buttons":{
        "OK":function () {
          deleteTips.close();
          setTimeout(function () {
            document.ConfigForm.btnDelAll_Action.value = "1";
            document.ConfigForm.submit();
          },500);
        },
        "Cancel":function () {
          deleteTips.close();
          selectChkBox(false);
          return false;
        }
      }
    });
  }

  function delAllSubmit()
  {
    if($('input[type=checkbox]').length > 0){
      selectChkBox(true);
      setTimeout("delAllConfirm()",100);
    }else{
      var Tips = simpleAlert({
        "content": "Current Access Control List is empty!",
        "buttons":{
          "OK":function () {
            Tips.close();
          }
        }
      });
    }
  }
  
  
  function typeClick()
  {
    with (document.forms[0])
    {
      if ((WLAN_FltActive[0].checked == true) && !enable_state) //on
      {
        var enableTips = simpleAlert({
          "content": "Are you sure to enable WLAN Access Control?",
          "buttons":{
            "OK":function () {
              enableTips.close();
              setTimeout(function () {
                $("#cfg_list").show();
                document.ConfigForm.Radio_ONFF_Flag.value = "1";
                document.ConfigForm.submit();
                showLoading();
              },200);
            },
            "Cancel":function () {
              enableTips.close();
              WLAN_FltActive[0].checked = false;
              WLAN_FltActive[1].checked = true;
              return;
            }
          }
        });
      }
      else if ((WLAN_FltActive[1].checked == true) && enable_state) //off
      {
        var disableTips = simpleAlert({
          "content": "Are you sure to disable WLAN Access Control?",
          "buttons":{
            "OK":function () {
              disableTips.close();
              setTimeout(function () {
                $("#cfg_list").hide();
                document.ConfigForm.Radio_ONFF_Flag.value = "1";
                document.ConfigForm.submit();
                showLoading();
              },200);
            },
            "Cancel":function () {
              disableTips.close();
              WLAN_FltActive[0].checked = true;
              WLAN_FltActive[1].checked = false;
              return;
            }
          }
        });
      }
    }
  }

  function changeAccessMode() {
    document.ConfigForm.AccessMode_Flag.value = "1";
    document.ConfigForm.submit();
    showLoading();
  }
  
  function on_load()
  {
    var show = '<% tcWebApi_get("WLan11ac_Entry","AccessPolicy","s") %>';
    
    if(show == '0')
    {
      $("#cfg_list").hide();
      $("#btnRadio1").prop("checked",false);
      $("#btnRadio2").prop("checked",true);
      enable_state=false;
    }
    else
    {
      $("#cfg_list").show();
      $("#btnRadio1").prop("checked",true);
      $("#btnRadio2").prop("checked",false);
      enable_state=true;
    }
  }

  </script>
</body>

</html>
