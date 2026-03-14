<%
if Request_Form("Wan_Flag") = "1" then
  TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
  TCWebApi_commit("WanInfo_Common")
  '提交WanInfo_WanPVC前要先get WanInfo_wanIF，用于将WanInfo_wanIF更新为当前wan信息，否则会将错误的wan entry配置copy到WAN_PVC下
	tcWebApi_get("WanInfo_WanIF","MulticastVID","h")
  TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle")
  TCWebApi_set("WanInfo_WanIF","MulticastVID","MulticastVID")
  TCWebApi_commit("WanInfo_WanPVC")
  TCWebApi_save()
elseif Request_Form("Wan_Flag") = "2" then
  TCWebApi_set("WanInfo_Common","CurIFIndex","curSetIndex")
  TCWebApi_commit("WanInfo_Common")
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - Multicast Vlan</title>
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

<body>
<script language="JavaScript" type="text/javascript">
var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;

var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
var vEntryName = vArrayStr.split(',');

vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
var vEntryValue = vArrayStr.split(',');

vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_VidPRI","s") %>";
var vEntryVlan = vArrayStr.split(',');
vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_McVid","s") %>";
var vEntryMcVid = vArrayStr.split(',');

vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
var vEntryIndex = vArrayStr.split(',');

vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
var Wan_IPVERSION = vArrayStr.split(',');

vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
vEntryValue = SortUtil.SortMyArray( vEntryValue );
vEntryVlan = SortUtil.SortMyArray( vEntryVlan );
vEntryMcVid = SortUtil.SortMyArray( vEntryMcVid );
vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );

function CheckVid()
{
    var vForm = document.ConfigForm;
    var v = vForm.MulticastVID.value;
    if ( 0 != v.length)
    {
        if (isPlusInteger(v) == false)
        {
            alert("Multicast VLAN ID is invalid.");
            return false;
        }
        if ( v < 1 || v > 4094 )
        {
            alert("Multicast VLAN ID is invalid.");
            return false;
        }
    }
    return true;
}

function SubmitForm()
{
    var vForm = document.ConfigForm;
    if (true == CheckVid())
    {
        vForm.Wan_Flag.value = "1"
        vForm.OperatorStyle.value = "Modify";
        vForm.submit();
        showLoading();
    }
}

function WriteWanNameSelected()
{
    var vForm = document.ConfigForm;
    var CurInterface_index = vForm.curSetIndex.value;
    for (var i = 0; i < nEntryNum; i++)
    {
        if( ( vEntryName[i].indexOf('_INTERNET_') >= 0 || vEntryName[i].indexOf('OTHER') >= 0 )
         && vEntryName[i].indexOf('_B_') < 0 )
        {
            if(vEntryIndex[i] == CurInterface_index)
            {
                document.write("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +" selected>" + vEntryValue[i] + "</option>");
            }
            else
            {
                document.write("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +">" + vEntryValue[i] + "</option>");
            }
        }
    }
}

function ChangeInterface()
{
    var vForm = document.ConfigForm;
    
    for(var i = 0; i < nEntryNum; i++)
    {
        if(vEntryValue[i] == vForm.Interface.value)
        {
            vForm.curSetIndex.value = vEntryIndex[i];
            vForm.MulticastVID.value = vEntryMcVid[i];
        }
    }
    vForm.Wan_Flag.value = "2";
    vForm.submit();
    showLoading();
}

function ShowMcVid()
{
    var vForm = document.ConfigForm;
    
    for(var i = 0; i < nEntryNum; i++)
    {
        if(vEntryValue[i] == vForm.Interface.value)
        {
            vForm.MulticastVID.value = vEntryMcVid[i];
        }
    }
}
</script>
<!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Multicast Vlan</div>
    <div class="title-description-text">This page is used to configure Multicast Vlan.</div>
    <FORM name="ConfigForm" action="/cgi-bin/true-page/admin/admin-multicast.asp" method="post">
    <input type="hidden" name="curSetIndex" value="<% tcWebApi_get("WanInfo_Common","CurIFIndex","s") %>">
    <input type="hidden" name="Wan_Flag" value="0">
    <input type="hidden" name="OperatorStyle" value="Modify">
    <div class="row p-1">
      <div class="col-6">
          <input type="checkbox" name='ifStr' checked style="display:none;">
          <div class="title-text-left">Interface:</div>
      </div>
      <div class="col-6">
          <select class="form-control input-select" name='Interface' id="select" onChange="ChangeInterface()">
            <script language="javascript">
            WriteWanNameSelected();
            </script>
          </select>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
          <div class="title-text-left">Multicast Vlan:</div>
      </div>
      <div class="col-6">
          <input class="input-textfield" type="text" id="MulticastVID" name="MulticastVID">
          <script language="javascript">
          ShowMcVid();
          </script>
      </div>
    </div>
    </FORM>

    <div class="mt-2 center">
      <button id="btnOK" type="button" class="btn-dashboard" onclick="SubmitForm();">Modify</button>
    </div>
    <hr>
    <div class="card-table-content">
      <div class="table-header">Multicast Vlan Table</div>
      <table style="width:100%">
        <tr class="table-header center">
          <th style="width: 50%;" class="p-1">Interface</th>
          <th style="width: 50%;">Multicast Vlan</th>
        </tr>
        <SCRIPT language=JavaScript type=text/javascript>
        var z=0;
        for(i = 0; i < nEntryNum; i++)
        {
            if(vEntryName[i] != "N/A")
            {  
                var rowCss=z%2==0?"table-content-fist":"table-content-second";
                document.write('<TR class="' + rowCss + '" style="text-align: center;height: 30px;">');
                if(vEntryVlan[i].indexOf("293") >= 0)
                  document.write('<TD>' + "THSI" + '&nbsp;</TD>');
                else
                  document.write('<TD>' + vEntryValue[i] + '&nbsp;</TD>');
                document.write('<TD>' + vEntryMcVid[i] + '&nbsp;</TD>');
                document.write('</TR>');
                z++;
            }
        }
        </SCRIPT>
      </table>
    </div>
  </div>
<!-- content -->
</body>

</html>