<!-- 管理ip/port filtering时逻辑（sec-portfilter.asp）-->
<%
if Request_Form("Port_Flag") = "5" then
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","ActivePortOut","EnPortFilterOut_Flag")
  TCWebApi_set("IpMacFilter_Common","ListTypeIpUp","PortListType_Up_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()

elseif Request_Form("Port_Flag") = "6" then
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","ActivePortIn","EnPortFilterIn_Flag")
  TCWebApi_set("IpMacFilter_Common","ListTypeIpDown","PortListType_Down_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
  
elseif Request_Form("Port_Flag") = "2" then
  if Request_Form("delnum") <> "" then
    TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
    TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
    TCWebApi_set("IpMacFilter_Common","DeleteIndex","delnum")
  end if
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
elseif Request_Form("Port_Flag") = "3" then
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","ListTypeIpUp","PortListType_Up_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
elseif Request_Form("Port_Flag") = "4" then
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","ListTypeIpDown","PortListType_Down_Flag")
  TCWebApi_commit("IpMacFilter_Entry")
  TCWebApi_save()
end if
%>

<!-- 添加up filter规则时逻辑（sec-addportfilter.asp）-->
<%
if Request_Form("PortFilterType") <> "" then
  TCWebApi_set("WebCurSet_Entry","ipfilter_id","PortFilterType")
end if

if Request_Form("Save_Flag") = "1" then 
  TCWebApi_set("WebCurSet_Entry","ipfilter_id","curNum")
  TCWebApi_set("IpMacFilter_Common","IpMacType","IpMacType_Flag")
  TCWebApi_set("IpMacFilter_Common","Action","Actionflag")
  TCWebApi_set("IpMacFilter_Entry","Interface","WanInterfaceFlag")
  TCWebApi_set("IpMacFilter_Entry","Direction","Direction_Flag")
  TCWebApi_set("IpMacFilter_Entry","Active","EnableIP_Flag")
  TCWebApi_set("IpMacFilter_Entry","RuleType","RuleType_Flag")
  TCWebApi_set("IpMacFilter_Entry","IPName","Name")
  TCWebApi_set("IpMacFilter_Entry","Protocol","Protocol")
  
  TCWebApi_set("IpMacFilter_Entry","SrcIPAddr","SourceIPStart")
  TCWebApi_set("IpMacFilter_Entry","SrcIPMask","SourceIpMask")
  TCWebApi_set("IpMacFilter_Entry","SrcPort","SourcePortStart")

  TCWebApi_set("IpMacFilter_Entry","DesIPAddr","DestIPStart")
  TCWebApi_set("IpMacFilter_Entry","DesIPMask","DestIpMask")
  TCWebApi_set("IpMacFilter_Entry","DesPort","DestPortStart")
  tcWebApi_constSet("IpMacFilter_Entry","FilterMode","IPV4")
  if TCWebApi_get("WebCustom_Entry","isCMCCSupported","h" ) <> "Yes" then
    TCWebApi_set("IpMacFilter_Entry","SrcIPEndAddr","SourceIPEnd")
    TCWebApi_set("IpMacFilter_Entry","DesIPEndAddr","DestIPEnd")
    TCWebApi_set("IpMacFilter_Entry","SrcPortEnd","SourcePortEnd")
    TCWebApi_set("IpMacFilter_Entry","DesPortEnd","DestPortEnd")
  end if
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
  <title>IP/Port Forwarding</title>
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

  <script>
    var enable_state = false;
    /** sec-portfilter.asp定义全局变量  **/
    var portFilter = [
      [
        "InternetGatewayDevice.X_ATP_Security",
        "<% tcWebApi_get("IpMacFilter_Common","ActivePortOut","s")%>",
        "<% tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","s")%>",
        "<% tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","s")%>",
        "<% tcWebApi_get("IpMacFilter_Common","ActivePortIn","s")%>"
      ],
      null
    ];
    var enblFilterOut = portFilter[0][1];
    var ModeUp = portFilter[0][2];
    var ModeDown = portFilter[0][3];
    var enblFilterIn = portFilter[0][4];

    var FilterOut = new Array(
      new Array("html/security/portfilter.asp", "FilterOut", "", "18%", "10%", "14%", "12%", "12%", "12%", "12%","10%",""),
      new Array("html/security/addportfilter.asp","", "InternetGatewayDevice.X_ATP_Security.IpFilterOut", "Filter Name", "Protocol", "Source Address", " Source Port ","Destination Address", " Destination Port ","Enable"),
      new Array("", "", "", "", "", "ShowSrcAddr", "ShowSrcPort", "ShowDestAddr", "ShowDestPort","ShowEnable"),
      new Array()
      );
    var stateUp,stateDown;

    /** 删除功能共用变量  */
    var nCount = 40;
    var IpUpFilterRuleIndex = 40;
    var IpUpFilterRule = new Array(nCount);

    /** sec-addportfilter.asp定义全局变量  **/
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(',');
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryValue = vArrayStr.split(',');

    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
    var WANEnNAT = vArrayStr.split(',');

    vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );

    vEntryValue = SortUtil.SortMyArray( vEntryValue );
    WANEnNAT = SortUtil.SortMyArray( WANEnNAT );
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name="ConfigForm" action="/cgi-bin/true-page/firewall/IP-Port-Filtering.asp" method="post">
      <div class="title-text">IP/Port Filtering</div>
      <div class="title-description-text">Entries in this table are used to restrict certain types of data packets through the Gateway. Use of such filters can be helpful in securing or restricting your local network.</div>
      <input type="hidden" name="Port_Flag" value="0">
      <input type="hidden" name="PortListType_Up_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","s") %>">
      <input type="hidden" name="PortListType_Down_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ListTypeIpDown","s") %>">
      <input type="hidden" name="EnPortFilterOut_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActivePortOut","s") %>">
      <input type="hidden" name="EnPortFilterIn_Flag" value="<% tcWebApi_get("IpMacFilter_Common","ActivePortIn","s") %>">
      <input type="hidden" name="delnum" value="">
      <input type="hidden" name="Actionflag" value="Mod">
      <input type="hidden" name="IpMacType_Flag" value="IpUp">
      <input type="hidden" name="ipup_num" value="<% tcWebApi_get("IpMacFilter","ipup_num","s") %>">
      <input type="hidden" name="ipdown_num" value="<% tcWebApi_get("IpMacFilter","ipdown_num","s") %>">

      <input type="hidden" name="PortFilterType">
      <input type="hidden" name="Save_Flag" value="0">
      <input type="hidden" name="curNum" value="<% tcWebApi_get("WebCurSet_Entry","ipfilter_id","s") %>">
      <input type="hidden" name="Direction_Flag" value="<% tcWebApi_get("IpMacFilter_Entry","Direction","s") %>">
      <input type="hidden" name="EnableIP_Flag" value="Yes">
      <input type="hidden" name="RuleType_Flag" value="IP">
      <input type="hidden" name="Current_Flag" value="0">
      <input type="hidden" name="WanInterfaceFlag" value="br0">
      <input type="hidden" name="IpType_Flag" value="IpUp">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">IP/Port Filtering:</div>
        </div>
        <div class="col-3">
          <input id="FilterOutEnable" type="radio" value="1" name="enblFilterOut" onClick="selFilter()"
            <%if tcWebApi_get("IpMacFilter_Common","ActivePortOut","h") = "1" then asp_Write("checked") end if%>>
          <label class="input-radio">Enable</label>
          <input id="FilterOutDisable" type="radio" value="0" name="enblFilterOut" onClick="selFilter()"
            <%if tcWebApi_get("IpMacFilter_Common","ActivePortOut","h") <> "1" then asp_Write("checked") end if%>>
          <label class="input-radio">Disable</label>
        </div>
      </div>
      <hr />

      <div id="FilterOutInfo" class="row" style="display: none;">
        <div class="col-12">
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Rule Action:</div>
            </div>
            <div class="col-3">
              <input type="radio" value="black" name="FilterMode"
                <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","h") = "black" then asp_Write("checked") end if%>>
              <label class="input-radio">Black List</label>
              <input type="radio" value="white" name="FilterMode"
                <%if tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","h") = "white" then asp_Write("checked") end if%>>
              <label class="input-radio">White List</label>
            </div>
            <div class="col-3">
              <button type="button" class="btn-file" onClick="ChangeMode()">Apply Changes</button>
            </div>
          </div>
          
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Direction:</div>
            </div>
            <div class="col-6">
              <select class="form-control input-select">
                <option value="1">Outgoing</option>
              </select>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Protocol:</div>
            </div>
            <div class="col-6">
              <select class="form-control input-select" name='Protocol'>
                <option value="TCP/UDP">TCP/UDP</option>
                <option value="TCP">TCP</option>
                <option value="UDP">UDP</option>
                <option value="ICMP">ICMP</option>
              </select>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Source IP Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-select" name="SourceIPStart" maxLength="15"  size="20"/>
            </div>
          </div>                                          
          <div class="row p-1" <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>style="display:none"<% end if %>>
            <div class="col-6">
              <div class="title-text-left">Subnet Mask:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-select" name="SourceIpMask" maxLength="15" size="20"/>
            </div>
          </div>
          <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>
            <div class="row p-1">
              <div class="col-6">
                <div class="title-text-left">End Source IP:</div>
              </div>
              <div class="col-6">
                <input class="form-control input-select" name="SourceIPEnd" maxLength="15" size="20"/>
              </div>
            </div>
          <% end if %>   
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Port:</div>
            </div>
            <div class="<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>col-2<% else %>col-6<% end if %>">
              <input class="input-textfield" type="text" name="SourcePortStart" maxLength="11" size="20" />
            </div>
            <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>
              <span>-</span>
              <div class="col-2">
                <input class="input-textfield" type="text" name="SourcePortEnd" maxLength="15" size="20" />
              </div>
            <% end if %>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Destination IP Address:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-select" name="DestIPStart" maxLength="15"  size="20"/>
            </div>
          </div>
          <div class="row p-1" <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>style="display:none"<% end if %>>
            <div class="col-6">
              <div class="title-text-left">Subnet Mask:</div>
            </div>
            <div class="col-6">
              <input class="form-control input-select" name="DestIpMask" maxLength="15" size="20"/>
            </div>
          </div>
          <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>
            <div class="row p-1">
              <div class="col-6">
                <div class="title-text-left">End Destination IP:</div>
              </div>
              <div class="col-6">
                <input class="form-control input-select" name="DestIPEnd" maxLength="15" size="20"/>
              </div>
            </div>
          <% end if %>   
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Port:</div>
            </div>
            <div class="<% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>col-2<% else %>col-6<% end if %>">
              <input class="input-textfield" type="text" name="DestPortStart" maxLength="11" size="20" />
            </div>
            <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>
              <span>-</span>
              <div class="col-2">
                <input class="input-textfield" type="text" name="DestPortEnd" maxLength="15" size="20" />
              </div>
            <% end if %>
          </div>

          <div id='interface' class="row p-1">
            <div class="col-12">
              <div class="row"> 
                <div class="col-6">
                  <div class="title-text-left">Interface:</div>
                </div>
                <div class="col-6">
                  <select class="form-control input-select" name="WanPath" onChange="ChangeInface()">
                  </select>
                </div>
              </div>

              <div class="row"> 
                <div class="col-6">
                  <div class="title-text-left">NAT Status:</div>
                </div>
                <div id='NatState' class="col-6">
                </div>
              </div>
            </div>
          </div>

          <div class="mt-2 center">
            <button type="button" class="btn-dashboard" onclick="javascript:return addClick();">Add</button>
          </div>

          <div id="ipPortFilterTable" class="card-table-content">
            <table style="width:100%">
              <tr class="table-header left">
                <th class="p-1" colspan="7">Current Filter Table</th>
              </tr>
              <tr class="table-content-fist center" style="height: 30px;">
                <td class="p-1">Select</td>
                <td>Protocol</td>
                <td>Source IP Address</td>
                <td>Source Port</td>
                <td>Destination IP Address</td>
                <td>Destination Port</td>
                <td>Rule Action</td>
              </tr>
            </table>
          </div>

          <div class="mt-2 center">
            <button type="button" id="btnDelSelect" type="button" class="btn-dashboard" onclick="RemoveSelect();">Delete Selected</button>
            <button type="button" id="btnDelAll" type="button" class="btn-dashboard" onclick="RemoveAll();">Delete All</button>
          </div>
        </div>
      </div>
    </form>
  </div>
  <!-- content -->
  <script>
    /** Ip port filtering 功能开关  **/
    function selFilter() {
      var FilterEnable = getElById("enblFilterOut");
      if ((FilterEnable[1].checked) && enable_state) {
        var disableTips = simpleAlert({
          "content": "Are you sure to disable the port filter?",
          "buttons":{
            "OK":function () {
              disableTips.close();
              setTimeout(function () {
                $("input[name=Port_Flag]").val("5");
                $("input[name=IpMacType_Flag]").val("IpUp");
                $("#FilterOutInfo").hide();
                btnSubmit();
              },200);
            },
            "Cancel":function () {
              disableTips.close();
              FilterEnable[0].checked = true;
              FilterEnable[1].checked = false;
              $("input[name=Port_Flag]").val("0");
              return;
            }
          }
        });
      }
      else if((FilterEnable[0].checked) && !enable_state){
        var enableTips = simpleAlert({
          "content": "Are you sure to enable the port filter?",
          "buttons":{
            "OK":function () {
              enableTips.close();
              setTimeout(function () {
                $("input[name=Port_Flag]").val("5");
                $("input[name=IpMacType_Flag]").val("IpUp");
                $("#FilterOutInfo").show();
                btnSubmit();
              },200);
            },
            "Cancel":function () {
              enableTips.close();
              $("input[name=Port_Flag]").val("0");
              FilterEnable[0].checked = false;
              FilterEnable[1].checked = true;
              return;
            }
          }
        });
      }
    }

    /** Ip/port Filter开关事件 **/
    function btnSubmit()
    {
        var Form = document.ConfigForm;
        if(Form.enblFilterOut.value == "1")
        {
            Form.EnPortFilterOut_Flag.value = "1";
            Form.PortListType_Up_Flag.value = Form.FilterMode.value;
        }
        else
        {
            Form.EnPortFilterOut_Flag.value = "0";
            Form.PortListType_Up_Flag.value = "black";
        }
        
        Form.submit();
        showLoading();
    }

    /** 改变Rule Action时触发事件  **/
    function ChangeMode()
    {
        with(document.ConfigForm) {
            if (FilterMode.value == "black" && stateUp)
            {
                if (confirm("Changing the filter mode will switch all filter rules. Are you sure to change the filter mode to the blacklist?"))
                {
                    stateUp = false;
                    PortListType_Up_Flag.value="black";
                    IpMacType_Flag.value = "IpUp";
                    Actionflag.value = "Mod";
                    Port_Flag.value = "3";
                    submit();
                    showLoading();
                }
                else
                {
                    FilterMode.value = "white";
                    return false;
                }
            }
            else if (FilterMode.value == "white" && !stateUp)
            {
                if (confirm("If you switch to the White List, then only the terminals in the table can access Internet.\n Are you sure to change the filter mode to the whitelist ?"))
                {
                    stateUp = true;
                    PortListType_Up_Flag.value="white";
                    IpMacType_Flag.value = "IpUp";
                    Actionflag.value = "Mod";
                    Port_Flag.value = "3";
                    submit();
                    showLoading();
                }
                else
                {
                    FilterMode.value = "black";
                    return false;
                }
            }
        }
    }

    /** 达到添加规则上限判断  **/
    function addClick()
    {
        var Form = document.ConfigForm;
        var FilterType = "40";   // IpUp最多只支持40条规则

        if(parseInt(Form.ipup_num.value) >= FilterType)
        {
            alert("The number of the port filter rules has reached the upper limit!");
            return false;
        }
        
        // window.location = '/cgi-bin/sec-addportfilter.asp?PortFilterType='+FilterType+typeFlag;

        // 在添加时需要改变隐藏表单值Actionflag，因为sec-portfilter.asp跟sec-addportfilter.asp是两个不同的页面
        Form.Actionflag = "Add";
        
        // sec-addportfilter.asp添加ip filter规则的方法逻辑
        if (checkForm() != false)
        {
            Form.curNum.value = "<% tcWebApi_get("IpMacFilter","add_ipupnum","s") %>";
            Form.Direction_Flag.value = "Outgoing";
            Form.IpType_Flag.value = "IpUp";
            Form.Save_Flag.value = "1";
            Form.submit();
            showLoading();
        }
    }

    function checkForm()
    {
        var LanIP="<% if tcWebApi_get("Lan_Entry","IP","h" ) = "N/A" then asp_Write("0.0.0.0") else tcWebApi_get("Lan_Entry","IP","s" ) end if %>";
        var LanIPArray = LanIP.split('.');
        var tmpArray;
        var vnumber = 0;
        
        if(document.ConfigForm.Current_Flag.value == "out")
        {
            if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIPEnd.value == "" && document.ConfigForm.SourceIpMask.value == "" && document.ConfigForm.SourcePortStart.value == "" && document.ConfigForm.SourcePortEnd.value == "" &&
                document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIPEnd.value == "" && document.ConfigForm.DestIpMask.value == "" && document.ConfigForm.DestPortStart.value == "" && document.ConfigForm.DestPortEnd.value == "")
            {
                alert("Filter rules need to configure at least one parameter!");
                return false;
            }
        }
        
        if (document.ConfigForm.SourceIPStart.value != ""  && document.ConfigForm.SourceIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.SourceIPStart.value) == false))
        {
            if (isGlobalIpv6Address(document.ConfigForm.SourceIPStart.value) == true)
            {
                alert('Source IP "' + document.ConfigForm.SourceIPStart.value + '" is IPv6.');
                return false;
            }
            else
            {
                alert('Source IP "' + document.ConfigForm.SourceIPStart.value + '" is invalid.');
                return false;
            }
        } else if (document.ConfigForm.SourceIPStart.value != "" && document.ConfigForm.SourceIPStart.value == "0.0.0.0" ){
            alert('Source IP "' + document.ConfigForm.SourceIPStart.value + '" is invalid.');
            return false;
        } else if (document.ConfigForm.SourceIPStart.value != ""){
            tmpArray=document.ConfigForm.SourceIPStart.value.split(".");
            if(LanIPArray[0] != tmpArray[0] || LanIPArray[1] != tmpArray[1]  || LanIPArray[2] != tmpArray[2]){
                alert('Source IP "' + document.ConfigForm.SourceIPStart.value + '" and LAN IP should be at the same network segment!');
                return false;
            }
        }

        <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>	
            if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIPEnd.value != "" )
            {
                msg = 'When the source end address is not empty, the source start address must be configured.';
                alert(msg);
                return false;
            }
            if (document.ConfigForm.SourceIPEnd.value != ""  && document.ConfigForm.SourceIPEnd.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.SourceIPEnd.value) == false))
            {
                if (isGlobalIpv6Address(document.ConfigForm.SourceIPEnd.value) == true)
                {
                    alert('Source End IP "' + document.ConfigForm.SourceIPEnd.value + '" is IPv6.');
                    return false;
                }
                else
                {
                    alert('Source End IP "' + document.ConfigForm.SourceIPEnd.value + '" is invalid.');
                    return false;
                }
            } else if (document.ConfigForm.SourceIPEnd.value != "" && document.ConfigForm.SourceIPEnd.value == "0.0.0.0")
            {
                alert('Source End IP "' + document.ConfigForm.SourceIPEnd.value + '" is invalid.');
                return false;
            } else if (document.ConfigForm.SourceIPEnd.value != ""){
                tmpArray=document.ConfigForm.SourceIPEnd.value.split(".");
                if(LanIPArray[0] != tmpArray[0] || LanIPArray[1] != tmpArray[1]  || LanIPArray[2] != tmpArray[2]){
                    alert('Source End IP "' + document.ConfigForm.SourceIPEnd.value + '" and LAN IP should be at the same network segment!');
                    return false;
                }
            }
        <% end if %>	

        if (document.ConfigForm.SourceIpMask.value != "" && document.ConfigForm.SourceIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.SourceIpMask.value) == false))
        {
            alert('Source subnet mask "' + document.ConfigForm.SourceIpMask.value + '" is invalid.');
            return false;
        }
        
        if (document.ConfigForm.DestIPStart.value != ""  && document.ConfigForm.DestIPStart.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.DestIPStart.value) == false))
        {
            if (isGlobalIpv6Address(document.ConfigForm.DestIPStart.value) == true)
            {
                alert('Destination Start IP "' + document.ConfigForm.DestIPStart.value + '" is IPv6.');
                return false;
            }
            else
            {
                alert('Destination Start IP "' + document.ConfigForm.DestIPStart.value + '" is invalid.');
                return false;
            }
        } else if (document.ConfigForm.DestIPStart.value == "0.0.0.0")
        {
            alert('Destination Start IP "' + document.ConfigForm.DestIPStart.value + '" is invalid.');
            return false;
        }
        <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>	
            if (document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIPEnd.value != "" )
            {
                msg = 'When the destination end address is not empty, the destination start address must be configured.';
                alert(msg);
                return false;
            }
            if (document.ConfigForm.DestIPEnd.value != ""  && document.ConfigForm.DestIPEnd.value != "0.0.0.0"  && (isAbcIpAddress(document.ConfigForm.DestIPEnd.value) == false))
            {
                if (isGlobalIpv6Address(document.ConfigForm.DestIPEnd.value) == true)
                {
                    alert('Destination End IP "' + document.ConfigForm.DestIPEnd.value + '" is IPv6.');
                    return false;
                }
                else
                {
                    alert('Destination End IP "' + document.ConfigForm.DestIPEnd.value + '" is invalid.');
                    return false;
                }
            } else if (document.ConfigForm.DestIPEnd.value == "0.0.0.0")
            {
                alert('Destination End IP "' + document.ConfigForm.DestIPEnd.value + '" is invalid.');
                return false;
            }
        <% end if %>		
        if (document.ConfigForm.DestIpMask.value != "" && document.ConfigForm.DestIpMask.value != "0.0.0.0" && (isValidSubnetMask(document.ConfigForm.DestIpMask.value) == false))
        {
            alert('Destination subnet mask "' + document.ConfigForm.DestIpMask.value + '" is invalid.');
            return false;
        }
        
        if (document.ConfigForm.SourceIPStart.value == "" && document.ConfigForm.SourceIpMask.value != "" )
        {
            msg = 'When the source subnet mask is not empty, the source address must be configured.';
            alert(msg);
            return false;
        }
        
        if (document.ConfigForm.DestIPStart.value == "" && document.ConfigForm.DestIpMask.value != "" )
        {
            msg = 'When the destination subnet mask is not empty, the destination address must be configured.';
            alert(msg);
            return false;
        }
        
        if (document.ConfigForm.SourcePortStart.value != "" || document.ConfigForm.DestPortStart.value != "")
        {
            if (document.ConfigForm.Protocol.selectedIndex == 4)
            {		
                msg = 'Only TCP or UDP protocol can set the port.';
                alert(msg);
                return false;
            }
        }
        
        if (document.ConfigForm.SourcePortStart.value != "" && isValidPort(document.ConfigForm.SourcePortStart.value) == false )
        {
            msg = 'Source port "' + document.ConfigForm.SourcePortStart.value + '" is invalid.';
            alert(msg);
            return false;
        }
        <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>	
            if (document.ConfigForm.SourcePortStart.value == "" && document.ConfigForm.SourcePortEnd.value != "" )
            {
                msg = 'When the end source port is not empty, the start source port must be configure.';
                alert(msg);
                return false;
            }
            if (document.ConfigForm.SourcePortEnd.value != "" && isValidPort(document.ConfigForm.SourcePortEnd.value) == false )
            {
                msg = 'End source port "' + document.ConfigForm.SourcePortEnd.value + '" is invalid.';
                alert(msg);
                return false;
            }
            if(document.ConfigForm.SourcePortStart.value != "" && document.ConfigForm.SourcePortEnd.value != "" && parseInt(document.ConfigForm.SourcePortEnd.value) < parseInt(document.ConfigForm.SourcePortStart.value)){
                msg = 'End source port cannot be less than start source port';
                alert(msg);
                return false;		
            }
        <% end if %>
        if (document.ConfigForm.DestPortStart.value != "" && isValidPort(document.ConfigForm.DestPortStart.value) == false )
        {
            msg = 'Destination port "' + document.ConfigForm.DestPortStart.value + '" is invalid.';
            alert(msg);
            return false;
        }
        <% if tcwebApi_get("WebCustom_Entry","isCMCCSupported","h") <> "Yes" then %>	
            if (document.ConfigForm.DestPortStart.value == "" && document.ConfigForm.DestPortEnd.value != "" )
            {
                msg = 'When the end destination port is not empty, the start destination port must be configured.';
                alert(msg);
                return false;
            }
            if (document.ConfigForm.DestPortEnd.value != "" && isValidPort(document.ConfigForm.DestPortEnd.value) == false )
            {
                msg = 'End destination port "' + document.ConfigForm.DestPortEnd.value + '" is invalid.';
                alert(msg);
                return false;
            }
            if(document.ConfigForm.DestPortStart.value != "" && document.ConfigForm.DestPortEnd.value != "" && parseInt(document.ConfigForm.DestPortEnd.value) < parseInt(document.ConfigForm.DestPortStart.value)){
                msg = 'End destination port cannot be less than start destination port.';
                alert(msg);
                return false;		
            }
        <% end if %>
        
        //outgoing逻辑，暂不考虑incoming的情形           
        for (var i=0;i<nCount;i++)
        {
            if(IpUpFilterRule[i]["Direction"] != "N/A")
            {  
                if (document.ConfigForm.Protocol.value == IpUpFilterRule[i].Protocol &&
                    document.ConfigForm.SourceIPStart.value == IpUpFilterRule[i].SrcIPAddr &&
                    document.ConfigForm.SourceIPEnd.value == IpUpFilterRule[i].SrcIPEndAddr &&
                    document.ConfigForm.SourceIpMask.value == IpUpFilterRule[i].SrcIPMask &&
                    document.ConfigForm.SourcePortStart.value == IpUpFilterRule[i].SrcPort &&
                    document.ConfigForm.SourcePortEnd.value == IpUpFilterRule[i].SrcPortEnd &&
                    document.ConfigForm.DestIPStart.value == IpUpFilterRule[i].DesIPAddr &&
                    document.ConfigForm.DestIPEnd.value == IpUpFilterRule[i].DesIPEndAddr &&
                    document.ConfigForm.DestIpMask.value == IpUpFilterRule[i].DesIPMask &&
                    document.ConfigForm.DestPortStart.value == IpUpFilterRule[i].DesPort &&
                    document.ConfigForm.DestPortEnd.value == IpUpFilterRule[i].DesPortEnd)
                {
                    var Tips = simpleAlert({
                        "content": "The same filter rule has already existed!",
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
        
        return true;
    }

    // 初始化Interface显示时的Select选项
    function initInterfaceList() {
        for (i = 0; i < nEntryNum; i++)
        {
            $("#Interface select").append('<option value=' + vEntryValue[i] + '>' + vEntryName[i] + '</option>');
        }
    };

    // Interface选择select选项时触发事件
    function ChangeInface()
    {
        var index = getElById('WanPath').selectedIndex;
        if (index > -1)
        {
            for (i = 0; i < WANEnNAT.length-1; i++)
            {
                if (vEntryValue[i] == getSelectVal('WanPath'))
                {
                    break;
                }
            }
            if (WANEnNAT[i] == "Disabled")
            {
                getElById('NatState').innerHTML = '<div class="title-text-right">Disabled</div>';
            }
            else
            {
                getElById('NatState').innerHTML = '<div class="title-text-right">Enable</div>';
            }
        }
    }

    // 初始化ip/port filter table内容
    function GetIpUpFilterTable()
    {
      var RuleAction_common = "<% tcWebApi_get("IpMacFilter_Common","ListTypeIpUp","s") %>";
      for( var i = 0; i < nCount; i++ ) {
        IpUpFilterRule[i] = {
          Direction: "",
          IPName: "",
          Protocol: "",
          SrcIPAddr: "",
          SrcIPMask: "",
          SrcIPEndAddr: "",
          SrcPort: "",
          SrcPortEnd: "",
          DesIPAddr: "",
          DesIPMask: "",
          DesIPEndAddr: "",
          DesPort: "",
          DesPortEnd: "",
          RuleAction: RuleAction_common
        };
      }

      var IpUpFilterRuleTable = '<% tcWebApi_GetTable("IpMacFilter", "Entry", "40,79") %>';
      var objIpUpFilterRuleTable = JSON.parse(IpUpFilterRuleTable);
      //深拷贝，将objIpUpFilterRuleTable对象合并到IpUpFilterRule对象中
      $.extend(true, IpUpFilterRule, objIpUpFilterRuleTable);
      var objLength = objectLength(objIpUpFilterRuleTable);

      var z=0;
      var tableHtml = "";
      for(i = 0; i < objLength; i++)
      {
        if(IpUpFilterRule[i]["FilterMode"]=="IPV4"){
        var rowCss=z%2==0?"table-content-second center":"table-content-fist center";
        var entryIndex = IpUpFilterRule[i]["EntryIndex"];
        var k = entryIndex-40
        tableHtml += '<tr class="' + rowCss + '" style="height: 30px;">';
        tableHtml += '<td><input type=\"checkbox\" id=\"IpMacFilter_Entry' + entryIndex + '\" onclick=\"doDel(' + k + ');\"></td>';

        tableHtml += '<td>' + IpUpFilterRule[i]["Protocol"] + '</td>';
        <% if TCWebApi_get("WebCustom_Entry","isCMCCSupported","h" ) <> "Yes" then %>
          tableHtml += '<td>' + IpUpFilterRule[i]["SrcIPAddr"] + "-" + IpUpFilterRule[i]["SrcIPEndAddr"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["SrcPort"] + ":" + IpUpFilterRule[i]["SrcPortEnd"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["DesIPAddr"] + "-" + IpUpFilterRule[i]["DesIPEndAddr"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["DesPort"] + ":" + IpUpFilterRule[i]["DesPortEnd"] + '</td>';
        <% else %>
          tableHtml += '<td>' + IpUpFilterRule[i]["SrcIPAddr"] + "/" + IpUpFilterRule[i]["SrcIPMask"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["SrcPort"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["DesIPAddr"] + "/" + IpUpFilterRule[i]["DesIPMask"] + '</td>';
          tableHtml += '<td>' + IpUpFilterRule[i]["DesPort"] + '</td>';
        <% end if %>
        
        tableHtml += '<td>' + IpUpFilterRule[i]["RuleAction"] + '</td>';
        tableHtml += '</tr>';
        z++;
          }
      }

      if( tableHtml != "" ) {
        $("#ipPortFilterTable tbody").append(tableHtml);
      }
    }

    var DelArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
    function doDel(id)
    {
        var entryIndex = IpUpFilterRuleIndex + id;
        var checkbox = getElById("IpMacFilter_Entry" + entryIndex);
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
        Form.Port_Flag.value = "2";
        for(i = 0; i < nCount; i++)
        {
            if(IpUpFilterRule[i] != "N/A" && DelArray[i] == "1")
            {
                hasEntry = true;
                tempstr = (IpUpFilterRuleIndex + i) + ",";
        
                Form.delnum.value = Form.delnum.value + tempstr;
            }
        }

        if(hasEntry == true){
            Form.submit();
            showLoading();
        } else {
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
        var Form = document.ConfigForm;
        var hasEntry = false;
        for(i = 0; i < nCount; i++)
        {
            if(IpUpFilterRule[i] != "N/A" && IpUpFilterRule[i]["FilterMode"]=="IPV4")//remove pv4 only
            {
                hasEntry = true;
                tempstr = (IpUpFilterRuleIndex + i) + ",";
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
                            Form.Port_Flag.value = "2";
                            Form.submit();
                            showLoading();
                        },200);
                    },
                    "Cancel":function () {
            Form.delnum.value=""
                        deleteTips.close();
                        return false;
                    }
                }
            });
        } else {
            alert("Current Filter Table is empty!");
            return false;
        }
    }

    $(document).ready(function () {
        // 初始化时判断ipUp部分Filter功能是否已开启，开启则显示操作项
        if (document.getElementById("FilterOutEnable").checked) {
            setDisplay("FilterOutInfo", 1); // 调用util_skyw.js方法，隐藏id为FilterOutInfo的元素
            enable_state = true;
        } else {
            setDisplay("FilterOutInfo", 0); // 调用util_skyw.js方法，显示id为FilterOutInfo的元素
            enable_state = false;
        }

        // 初始化要添加规则
        document.ConfigForm.delnum.value = "";
        document.ConfigForm.Port_Flag.value = "0";
        document.ConfigForm.enblFilterOut.value = enblFilterOut;
        var FilterInfo = document.ConfigForm.FilterOutInfo;
        var FilterMode = document.ConfigForm.FilterMode;
        if (ModeUp == "black" || ModeUp == "N/A")
        {
            FilterMode.value = "black";
            stateUp = false;
        }
        else
        {
            FilterMode.value = "white";
            stateUp = true;
        }

        // 初始化已添加的ip规则
        GetIpUpFilterTable();
        
        // 初始化Interface表单项下的select选项
        initInterfaceList();

        // 新版暂时支持Outgoing，所以比旧版少了判断，直接初始化添加规则为IpUp
        document.ConfigForm.Save_Flag.value = "0";
        document.ConfigForm.Current_Flag.value = "out";
        document.ConfigForm.IpMacType_Flag.value = "IpUp";
        setDisplay('interface',0);
        ChangeInface();
    });

  </script>
</body>

</html>