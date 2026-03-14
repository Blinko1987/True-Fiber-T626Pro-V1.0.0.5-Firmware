<%
if Request_Form("Speedlimit_flag") = "1" then
  if Request_Form("Speedlimitup_flag") = "3" then
    TCWebApi_set("DataSpeedLimit_Entry","IPLimitUP","vIplimitUP")
    TCWebApi_set("DataSpeedLimit_Entry","SpeedLimitModeUP","modeswitch")
  end if

  if Request_Form("Speedlimitdown_flag") = "3" then
    TCWebApi_set("DataSpeedLimit_Entry","IPLimitDOWN","vIplimitDOWN")
    TCWebApi_set("DataSpeedLimit_Entry","SpeedLimitModeDOWN","modeswitch")
  end if

  TCWebApi_commit("DataSpeedLimit_Entry")
  TCWebApi_save()
end if

if Request_Form("Speedlimit_flag") = "2" then
  TCWebApi_set("QoS_Common","UplinkBandwidth","vBandwidthValue")
  TCWebApi_set("DataSpeedLimit_Entry","SpeedLimitModeUP","modeswitch")
  TCWebApi_set("DataSpeedLimit_Entry","SpeedLimitModeDOWN","modeswitch")
  TCWebApi_commit("DataSpeedLimit_Entry")
  TCWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - IP QoS - Traffic Shaping</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/advance/advance-ip-qos-traffic-shaping.asp" method="post">
      <input type="hidden" name="vIplimitUP" value="">
      <input type="hidden" name="Speedlimitup_flag" value="0">
      <input type="hidden" name="Speedlimit_flag" value="0">
      <input type="hidden" name="vIplimitDOWN" value="">
      <input type="hidden" name="Speedlimitdown_flag" value="0">
      <input type="hidden" name="vBandwidthValue" value="1000000000">
      <div class="title-text">IP QoS Traffic Shaping</div>
      <div class="title-description-text">This page is used to configure IP QoS Traffic Shaping.</div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Uplink Bandwidth Limit:</div>
        </div>
        <div class="col-3">
          <input class="form-control input-textfield" id="Bandwidth" name="Bandwidth" maxlength=10 size=16>
        </div>
        <div class="col-3 left">
          <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;">[0, 8-1000000] Kbps</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
        </div>
        <div class="col-6 left">
          <label class="input-radio" style="margin-bottom: 0px; margin-left: 5px;">0: No speed limit</label>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Data Rate Limit Model:</div>
        </div>
        <div class="col-6">
          <select class="form-control input-select" id="modeswitch" name="modeswitch" onChange="modeChange()" size=1>
            <option value="0" <%if tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","h") = "0" then asp_Write("selected") end if%>>Close</option>
            <!--暂时不做基于接口和vlan限速
            <option value="1" <%if tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","h") = "1" then asp_Write("selected") end if%>>Speed limit based on interface</option> 
            <option value="2" <%if tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","h") = "2" then asp_Write("selected") end if%>>Speed limit Based on user side VLAN</option>
            -->
            <option value="3" <%if tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","h") = "3" then asp_Write("selected") end if%>>Speed limit based on user side equipment IP</option>
          </select>
        </div>
      </div>
      <div class="mt-2 center">
        <button type="button" class="btn-dashboard" onclick="applyChanges()">Apply Changes</button>
      </div>
      <br>

      <div id="close_rate_limit">
        <div class="row p-1" id="interface_rule" style="display: none;">
          <div class="col-6">
            <div class="title-text-left">LAN/SSID:</div>
          </div>
          <div class="col-3">
            <select class="form-control input-select" id="AppName" name="AppName" size=1>
              <option value="LAN1" >LAN1</option>
              <% if tcwebApi_get("WebCustom_Entry","isCT1PORTSupported","h") <> "Yes" then %>
              <option value="LAN2" >LAN2</option>
              <% end if %>
              <% if tcwebApi_get("WebCustom_Entry","isCT2PORTSSupported","h") <> "Yes" then %>
              <option value="LAN3" >LAN3</option>
              <option value="LAN4" >LAN4</option>
              <% end if %>
              <% if tcwebApi_get("WebCustom_Entry","isWLanSupported","h") = "Yes" then %>
              <option value="SSID1" >SSID1</option>
              <option value="SSID2" >SSID2</option>
              <option value="SSID3" >SSID3</option>
              <option value="SSID4" >SSID4</option>
              <%end if%>
            </select>
          </div>
        </div>
    
        <div class="row p-1" id="vlan_rule" style="display: none;">
          <div class="col-6">
            <div class="title-text-left">VLAN:</div>
          </div>
          <div class="col-3">
            <input class="form-control input-textfield" name="VlanName" type="text" id="VlanName" value="0" size="15" maxlength="15">
          </div>
        </div>
    
        <div class="row p-1" id="ip_rule">
          <div class="col-6">
            <div class="title-text-left">IP Range:</div>
          </div>
          <div class="col-6">
            <div class="row" style="margin-left: 0px;">
              <input class="input-textfield-21" style="width: 41% !important;" type="text" id="Ip_Start" name="Ip_Start" size="15" maxlength="15">
              <div class="title-text-right pr5 pl5" id="ipstr2"> - </div>
              <input class="input-textfield-21" style="width: 41% !important;" type="text" id="Ip_End" name="Ip_End" size="15" maxlength="15">
            </div>
          </div>
        </div>
    
        <div class="row p-1" id="uplink_speed_limit">
          <div class="col-6">
            <div class="title-text-left">Uplink Speed Limit</div>
          </div>
          <div class="col-3">
            <input class="form-control input-textfield" name="uplinkSpeedLimit" type="text" id="uplinkSpeedLimit" value="0" size="10" maxlength="10">
          </div>
          <div class="col-3 left">
            <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;">Mbps</label>
          </div>
        </div>
        <div class="row p-1" id="downlink_speed_limit">
          <div class="col-6">
            <div class="title-text-left">Downlink Speed Limit</div>
          </div>
          <div class="col-3">
            <input class="form-control input-textfield" name="downlinkSpeedLimit" type="text" id="downlinkSpeedLimit" value="0" size="10" maxlength="10">
          </div>
          <div class="col-3 left">
            <label class="input-radio" style="line-height: 24px; margin-bottom: 0px;">Mbps</label>
          </div>
        </div>
        <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onclick="addSubmit()">Add / Modify</button>
        </div>
        <br>
    
        <div class="card-table">
          <table style="width:100%">
            <tr class="table-header center">
              <th style="width: 30%; display: none;" id="interface_header">LAN/SSID</th>
              <th style="width: 30%; display: none;" id="vlan_header">VLAN</th>
              <th style="width: 30%;" id="ip_header">IP range</th>
              <th style="width: 20%;">Uplink speed limit(Mbps)</th>
              <th style="width: 20%;">Downlink speed limit(Mbps)</th>
              <th style="width: 15%;">Modify</th>
              <th style="width: 15%;">Delete</th>
            </tr>
          </table>
          <table style="width:100%" id="speedLimitList">  
            <script type="text/template" data-id="speedLimitList">
              <tr class="table-content-fist center">
                <td style="width: 30%;">{ipRange}</td>
                <td style="width: 20%;" class="p-1">{uplinkSpeed}</td>
                <td style="width: 20%;" id="devMac{index}">{downlinkSpeed}</td>
                <td style="width: 15%;" class="p-1">
                  <img id="edit{index}" src="/image/icon/edit.svg" width="15" height="15" class="icon-svg" onclick="changeRules({index})">
                </td>
                <td style="width: 15%;" id="devMac{index}">
                  <input type="button" class="btn-file btn-a" id="delete{index}" value="Delete" onclick="deleteRules({index})"/>
                </td>
              </tr>
            </script>
          </table>
        </div>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    var total_bandwidth = '<% tcWebApi_get("QoS_Common","UplinkBandwidth","s") %>';
    if(total_bandwidth == "N/A")
      total_bandwidth = 0;

    var i=0;
    var j=0;
    var ipx = new Array();
    var ipxa = new Array();
    var ipx_down = new Array();
    var ipxa_down = new Array();

    var iplimitup = '<%tcWebApi_get("DataSpeedLimit_Entry","IPLimitUP","s")%>';
    var iplimitdown = '<%tcWebApi_get("DataSpeedLimit_Entry","IPLimitDOWN","s")%>';
    var firstindex = '<%tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","s")%>';
    var policy = '<%tcWebApi_get("QoS_Common","Discipline","s") %>';

    ipx = iplimitup.split(',');
    for(i = 0 ; i < ipx.length; i++)
    {
      ipxa[i] = ipx[i].split('/');
    }
    console.log(ipxa);

    ipx_down = iplimitdown.split(',');
    for(i = 0 ; i < ipx_down.length; i++)
    {
      ipxa_down[i] = ipx_down[i].split('/');
    }
    console.log(ipxa_down);

    var ipLimitListArray = new Array();
    for(i = 0 ; i < ipxa.length; i++){
      var ipLimitListObj = {};
      if((ipxa[i][0] == "") || (ipxa[i][0] == "N") || (ipxa[i][0] == "NaN"))
        continue;
      ipLimitListObj.ipRange = ipxa[i][0];
      var uplinkSpeed = Number(ipxa[i][1]) / 2;
      if(!isNaN(uplinkSpeed)){
        ipLimitListObj.uplinkSpeed = uplinkSpeed;
      }else{
        ipLimitListObj.uplinkSpeed = "";
      }
      ipLimitListArray.push(ipLimitListObj);
    }
    
    for(i = 0 ; i < ipxa_down.length; i++){
      var ipLimitListObj = {};
      for(j = 0; j < ipxa.length; j++){
        if((ipxa_down[i][0] == ipxa[j][0]) && (ipxa_down[i][0] != "")){
          var downlinkSpeed = Number(ipxa_down[i][1]) / 2;
          if(!isNaN(downlinkSpeed)){
            ipLimitListArray[j].downlinkSpeed = downlinkSpeed;
          }else{
            ipLimitListArray[j].downlinkSpeed = "";
          }
          break;
        }
      }
      if((j == ipxa.length) && (ipxa_down[i][0] != "")){
        ipLimitListObj.ipRange = ipxa_down[i][0];
        var downlinkSpeed = Number(ipxa_down[i][1]) / 2;
        if(!isNaN(downlinkSpeed)){
          ipLimitListObj.downlinkSpeed = downlinkSpeed;
        }else{
          ipLimitListObj.downlinkSpeed = "";
        }
        ipLimitListArray.push(ipLimitListObj);
      }
    }
    console.log(ipLimitListArray);

    $(document).ready(function () {
      var initMode = '<% tcWebApi_get("DataSpeedLimit_Entry","SpeedLimitModeUP","s") %>';
      setMode(initMode);
      var tmpContent = $("script[data-id='speedLimitList']").html();
      renderList(tmpContent, ipLimitListArray, document.querySelector("#speedLimitList"));
      $("#Bandwidth").val(total_bandwidth/1024);
    });

    var renderList = function(tmpContent, renderData, wrappers){
      var rederHtml = '';
      $.each(renderData, function(i, object) {
        object.index= i;
        if(typeof(object.uplinkSpeed) == "undefined"){
          object.uplinkSpeed = "";
        }
        if(typeof(object.downlinkSpeed) == "undefined"){
          object.downlinkSpeed = "";
        }
        rederHtml += tmpContent.tmp(object);
      });
      if (wrappers) {
        while(wrappers.hasChildNodes()){
          wrappers.removeChild(wrappers.firstChild);
        }
        wrappers.appendHTML(rederHtml);
      }
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

    function changeRules(index) {
      var tmp_ip_obj = ipLimitListArray[index].ipRange.split('-');
      var tmp_ip_start = tmp_ip_obj[0];
      var tmp_ip_end = tmp_ip_obj[1];
      $("#Ip_Start").val(tmp_ip_start);
      $("#Ip_End").val(tmp_ip_end);
      $("#uplinkSpeedLimit").val(ipLimitListArray[index].uplinkSpeed);
      $("#downlinkSpeedLimit").val(ipLimitListArray[index].downlinkSpeed);
    }

    function deleteRules(index) {
      var k = 0;
      var str_uplink = "";
      var str_downlink = "";
      for(k = 0; k < ipLimitListArray.length; k++){
        if(k == index){
          continue;
        }
        if(ipLimitListArray[k].uplinkSpeed != ""){
          str = ipLimitListArray[k].ipRange + '/' + ipLimitListArray[k].uplinkSpeed * 2;
        }else{
          str = "";
        }
        if(ipLimitListArray[k].downlinkSpeed != ""){
          str_down = ipLimitListArray[k].ipRange + '/' + ipLimitListArray[k].downlinkSpeed * 2;
        }else{
          str_down = "";
        }

        //为空时或添加的是第一个元素则不需要加','
        if((str == "") || (0 == str_uplink.length)){
          str_uplink += str;
        }else{
          str_uplink += ',' + str;
        }

        if((str_down == "") || (0 == str_downlink.length)){
          str_downlink += str_down;
        }else{
          str_downlink += ',' + str_down;
        }
      }

      console.log("str_uplink:" + str_uplink);
      console.log("str_downlink:" + str_downlink);

      var deleteTips = simpleAlert({
        "content": "Are you sure to delete this rules?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            setTimeout(function () {
              document.ConfigForm.vIplimitUP.value = str_uplink;
              document.ConfigForm.vIplimitDOWN.value = str_downlink;
              document.ConfigForm.Speedlimitup_flag.value = "3";
              document.ConfigForm.Speedlimitdown_flag.value = "3";
              document.ConfigForm.Speedlimit_flag.value = 1;
              document.ConfigForm.submit();
              showLoading();
            },200);
          },
          "Cancel":function () {
            deleteTips.close();
          }
        }
      });
    }

    function applyChanges() {
      var vForm = document.ConfigForm;
      var BandwidthValue = vForm.Bandwidth.value;
      var uplink_total_bandwidth = parseInt(BandwidthValue) * 1024;
      if ((uplink_total_bandwidth == 0) || (uplink_total_bandwidth > 1024000000)){
        $("input[name=vBandwidthValue]").val("1024000000");
      }else{
        if (parseInt(BandwidthValue) < 8 || parseInt(BandwidthValue) > 1000000 || !isInteger(uplink_total_bandwidth))
        {
          alert('Upstream bandwidth range from 8 to 1000000, or 0(No speed limit)');
          return false;
        }
        $("input[name=vBandwidthValue]").val(uplink_total_bandwidth);
      }
      document.ConfigForm.Speedlimit_flag.value = 2;
      document.ConfigForm.submit();
      showLoading();
    }

    function addSubmit()
    {
      var str = '';
      var str_down = '';
      var dif_elements = new Array();
      var tempbuf = '';
      var bandwidth = 0;
      var Queue;
      
      with(getElById('ConfigForm'))
      {
        if(isIpv6Address(Ip_Start.value) == true  || isIpv6Address(Ip_End.value) == true)
        {
          if(Ip_Start.value != Ip_End.value)
          {
            alert("The minimum and maximum value of the IPv6 address must be the same");
            return false;
          }
        }
        else{
          if(!isValidIpAddress(Ip_Start.value) || !isValidIpAddress(Ip_End.value))
          {
            alert("The IP address format is incorrect. Please fill in the correct IP address");	
            return false;
          }
          
          if(cmpIpAddress(Ip_End.value,Ip_Start.value) != true)
          {
            alert("End IP address must be equal to or greater than the Start IP address.");	
            return false;
          }
        }
        for( i = 0 ; i< ipxa.length -1 ; i ++)
        {
          tempbuf += ipxa[i][1] + ',';
        }
        if(iplimitup != '')
          tempbuf += ipxa[ipxa.length -1][1] ;
        else
          tempbuf += '';
        
        dif_elements = different(tempbuf);
        if((issame(uplinkSpeedLimit.value , dif_elements) == false && dif_elements.length >= 6) || dif_elements.length > 6)
        {
          alert("There are at most 6 queues on the uplink speed limit, please adjust");
          return;	
        }
        if(isNumber(uplinkSpeedLimit.value) == false)
        {
          alert("Please fill in the number.");
          return;
        }
        if(iplimitup == '')
        {
          bandwidth = parseInt(uplinkSpeedLimit.value)+ parseInt(bandwidth);
        }
        else if(ipx.length == 1)
        {
          if(parseInt(uplinkSpeedLimit.value) != ipxa[0][1])
            bandwidth = parseInt(uplinkSpeedLimit.value)+ parseInt(ipxa[0][1]);
          else
            bandwidth = parseInt(ipxa[0][1]);
        }
        else{
          if(issame(uplinkSpeedLimit.value , dif_elements) == false )
          {
            for(i = 0; i< dif_elements.length;i++)
            {
              bandwidth = parseInt(dif_elements[i] )+ parseInt(bandwidth);
            }
            bandwidth = parseInt(uplinkSpeedLimit.value)+ parseInt(bandwidth);
          }
          else
          {
            for(i = 0; i< dif_elements.length;i++)
            {
              bandwidth = parseInt(dif_elements[i] )+ parseInt(bandwidth);
            }
          }
        }
        if(parseInt(total_bandwidth) != 0)
        {
          if(parseInt(bandwidth*1024*1024) > parseInt(total_bandwidth))
          {
            alert("The sum of bandwidths cannot be greater than the upstream total bandwidth. Please adjust.");	
            return;
          }
        }
        else
        {
          if(parseInt(bandwidth*1024*1024) > 1000000000)
          {
            alert("The sum of bandwidths cannot be greater than the upstream total bandwidth. Please adjust.");	
            return;
          }
        }

        tempbuf = '';
        for( i = 0 ; i< ipxa_down.length -1 ;  i ++)
        {
          tempbuf += ipxa_down[i][1] + ',';
        }
        if(iplimitdown != '')
          tempbuf += ipxa_down[ipxa_down.length -1][1];
        else
          tempbuf += '';
          
        dif_elements = different(tempbuf);
        if(issame(downlinkSpeedLimit.value , dif_elements) == false && dif_elements.length >= 6 || dif_elements.length > 6)
        {
          alert("There are at most 6 queues on the downlink speed limit, please adjust.");
          return;
        }
        if(isNumber(downlinkSpeedLimit.value) == false)
        {
          alert("Please fill in the number.");
          return;
        }

        var k = 0;
        var tmp_ip_range = Ip_Start.value + '-' + Ip_End.value;
        var tmp_uplink_speed = uplinkSpeedLimit.value;
        var tmp_downlink_speed = downlinkSpeedLimit.value;

        if(tmp_uplink_speed == "")
          tmp_uplink_speed = "0";
        if(tmp_downlink_speed == "")
        tmp_downlink_speed = "0";

        if((tmp_uplink_speed == "0") && (tmp_downlink_speed == "0"))
        {
          alert("Please enter a number for uplink speed limit or downlink speed limit.");
          return;
        }

        for(k = 0; k < ipLimitListArray.length; k++){
          if(ipLimitListArray[k].ipRange == tmp_ip_range){
            if(tmp_uplink_speed != "0"){
              ipLimitListArray[k].uplinkSpeed = tmp_uplink_speed;
            }else{
              ipLimitListArray[k].uplinkSpeed = "";
            }

            if(tmp_downlink_speed != "0"){
              ipLimitListArray[k].downlinkSpeed = tmp_downlink_speed;
            }else{
              ipLimitListArray[k].downlinkSpeed = "";
            }
            break;
          }
        }

        //添加一个新的数组元素
        if((0 == ipLimitListArray.length) || (k == ipLimitListArray.length))
        {
          var newEntryObj = {};
          newEntryObj.ipRange = tmp_ip_range;
          if(tmp_downlink_speed != "0"){
            newEntryObj.downlinkSpeed = tmp_downlink_speed;
          }else{
            newEntryObj.downlinkSpeed = "";
          }
          if(tmp_uplink_speed != "0"){
            newEntryObj.uplinkSpeed = tmp_uplink_speed;
          }else{
            newEntryObj.uplinkSpeed = "";
          }
          ipLimitListArray.push(newEntryObj);
        }

        var str_uplink = "";
        var str_downlink = "";
        for(k = 0; k < ipLimitListArray.length; k++){
          if(ipLimitListArray[k].uplinkSpeed != ""){
            str = ipLimitListArray[k].ipRange + '/' + ipLimitListArray[k].uplinkSpeed * 2;
          }else{
            str = "";
          }
          if(ipLimitListArray[k].downlinkSpeed != ""){
            str_down = ipLimitListArray[k].ipRange + '/' + ipLimitListArray[k].downlinkSpeed * 2;
          }else{
            str_down = "";
          }

          //为空时或添加的是第一个元素则不需要加','
          if((str == "") || (0 == str_uplink.length)){
            str_uplink += str;
          }else{
            str_uplink += ',' + str;
          }

          if((str_down == "") || (0 == str_downlink.length)){
            str_downlink += str_down;
          }else{
            str_downlink += ',' + str_down;
          }
        }
        vIplimitUP.value = str_uplink;
        vIplimitDOWN.value = str_downlink;
        document.ConfigForm.Speedlimitup_flag.value = "3";
        document.ConfigForm.Speedlimitdown_flag.value = "3";

        console.log("str_uplink:" + str_uplink);
        console.log("str_downlink:" + str_downlink);
      }
      
      document.ConfigForm.Speedlimit_flag.value = 1;
      document.ConfigForm.submit();
      showLoading();
    }

    function cmpIpAddress(address1,address2)
    {
      var Lnum = 0;
      var Snum = 0;
      var addrParts1 = address1.split('.');
      var addrParts2 = address2.split('.');
      for (i = 0; i <= 3; i++)
      {
        Lnum = parseInt(addrParts1[i]);
        Snum = parseInt(addrParts2[i]);
        if (Lnum < Snum)
        {
            return false;
        }
      }
      return true;
    }

    function different(str)
    {
      if(str == '')
      {
        return '';
      }
      var tempArray = str.split(',');
      var tempbuf;
      var index = 0;
      var resultArray = new Array();
      for(i = 0; i < tempArray.length-1; i++)
      {
        for(j =0;j < tempArray.length-i-1;j++)
        {
          if(tempArray[j] > tempArray[parseInt(j)+1 ])
          {
            tempbuf = tempArray[j];
            tempArray[j] = tempArray[parseInt(j)+1];
            tempArray[parseInt(j)+1] = tempbuf;
          }
        }
      }
      resultArray[0] = tempArray[0];
      for(i = 1; i< tempArray.length; i++)
      {
        if(tempArray[i] != tempArray[i - 1])
        {
          index ++;
          resultArray[index] =  tempArray[i];
        }
      }
      return resultArray;
    }

    function issame(str1,tempArray)
    {
      for(i = 0 ; i<tempArray.length; i ++)
      {
        if(parseInt(str1) == parseInt(tempArray[i]))
        {
          return true;
        }
      }
      return false;
      
    }

    function isNumber(c)
    {
      for(var i=0; i < c.length;i ++ )
      {
        if (c.charAt(i) < "0" || c.charAt(i) > "9")
        {
          return false;
        }
      }
      return true;
    }


    function modeChange() {
      var modeselect = $("select[name='modeswitch']").val();
      setMode(modeselect);
    }

    function setMode(mode) {
      if(mode == "0"){
        $("select[name='modeswitch']").val(0);
        $("#close_rate_limit").hide();
      }
      /*
      else if(mode == "1"){
        $("select[name='modeswitch']").val(1);
        $("#close_rate_limit").show();
        $("#interface_rule").show();
        $("#vlan_rule").hide();
        $("#ip_rule").hide();
        $("#interface_header").show();
        $("#vlan_header").hide();
        $("#ip_header").hide();
      }else if(mode == "2"){
        $("select[name='modeswitch']").val(2);
        $("#close_rate_limit").show();
        $("#interface_rule").hide();
        $("#vlan_rule").show();
        $("#ip_rule").hide();
        $("#interface_header").hide();
        $("#vlan_header").show();
        $("#ip_header").hide();
      }
      */
      else if(mode == "3"){
        $("select[name='modeswitch']").val(3);
        $("#close_rate_limit").show();
        $("#interface_rule").hide();
        $("#vlan_rule").hide();
        $("#ip_rule").show();
        $("#interface_header").hide();
        $("#vlan_header").hide();
        $("#ip_header").show();
      }
    }
  </script>
</body>

</html>