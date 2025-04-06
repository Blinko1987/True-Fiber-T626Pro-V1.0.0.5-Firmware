<%
if Request_Form("SaveFlag") = "1" then
  TCWebApi_Set("WLan_Entry0", "EnableSSID", "MapEnable")
  TCWebApi_Set("WLan11ac_Entry0", "EnableSSID", "MapEnable")
  'TCWebApi_Set("MeshInfo_Entry0", "DeviceName", "DeviceName")
  if Request_Form("MapEnable") = "1" then
    TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","1")
    TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","0")
    TCWebApi_constSet("Mesh_dat", "MapEnable","1")
  else
    TCWebApi_constSet("Mesh_Common", "DeviceRole","1")
    TCWebApi_constSet("MeshRoleExchange_Entry", "MeshRole","1")
    TCWebApi_constSet("Mesh_EnableConf", "EasyMeshEnable","0")
    TCWebApi_constSet("Mesh_EnableConf", "BandSteeringEnable","1")
    TCWebApi_constSet("Mesh_dat", "MapEnable","0")
  end if
  if Request_Form("OtherToAgent") = "1" then
    TCWebApi_constSet("Dhcp6s_Entry", "Enable", "0")
    TCWebApi_constSet("Radvd_Entry", "Enable", "0")
    TCWebApi_commit("Radvd_Entry")
    TCWebApi_commit("Dhcp6s_Entry")
    TCWebApi_save("Radvd_Entry")
    TCWebApi_save("Dhcp6s_Entry")
  end if
  if Request_Form("deviceRoleChange_Flag") = "1" then
    TCWebApi_Set("MeshRoleExchange_Entry", "MeshRole", "DeviceRole")
    TCWebApi_Set("Mesh_common", "DeviceRole", "DeviceRole")
    if Request_Form("DeviceRole") = "0" then
      TCWebApi_constSet("Mesh_common","DeviceRole","1")
      TCWebApi_unset("Mesh_apclibh_Entry0")
      TCWebApi_unset("Mesh_apclibh_Entry1")
    end if
    if Request_Form("DeviceRole") = "2" then
      TCWebApi_constSet("Account_Entry0","display_mask","2E FF 35 5C 00 00 37 00 FF")
      TCWebApi_constSet("Account_Entry1","display_mask","2E FF 25 4C 00 00 17 00 FF")
    else
      TCWebApi_constSet("Account_Entry0","display_mask","FF FF FF FF FF BF FF FF FF")
      TCWebApi_constSet("Account_Entry1","display_mask","BF 00 0F CC FF 87 17 00 01")
    end if
    if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then
      TCWebApi_constSet("Account_Entry0","Logged","0")
      TCWebApi_constSet("Account_Entry0","Logoff","1")
    else
      TCWebApi_constSet("Account_Entry1","Logged","0")
      TCWebApi_constSet("Account_Entry1","Logoff","1")
    end if
    TCWebApi_commit("Account")
    TCWebApi_commit("Mesh_apclibh")
  end if

  TCWebApi_commit("MeshRoleExchange_Entry")
  TCWebApi_commit("Mesh_dat")
  TCWebApi_save()
end if

if Request_Form("defaultflag") = "1" then
  TCWebApi_Set("MeshRoleExchange_Entry", "ReserveConf", "ReserveConf")
  TCWebApi_save()
  TCWebApi_set("System_Entry","reboot_type","restoreflag") 
  TCWebApi_commit("System_Entry")
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Operation Mode - Operation Mode</title>
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
    <form name="ConfigForm" action="/cgi-bin/true-page/other/OperationMode.asp" method="post">
    <input type="hidden" name="SaveFlag" value="0">
    <input type="hidden" name="deviceRoleChange_Flag" value="0">
    <input type="hidden" name="SaveAlter_Flag" value="0">
    <!-- <input type="hidden" name="DeviceName" value="N/A"> -->
    <input type="hidden" name="OtherToAgent" value="0">
    <input type="hidden" name="VID" value="0">

    <div class="title-text">Operation Mode</div>
    <div class="title-description-text">This page is used to configure the operation mode of the device.</div>
<% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Operation Mode</div>
      </div>
      <div class="col-6">
        <input type="radio" name="MapEnable" id="MapEnableOn" value="1" onchange="MapEnableClick(1)" >
        <label class="input-radio">Mesh</label>
        <input type="radio" name="MapEnable" id="MapEnableOff" value="0" onchange="MapEnableClick(0)" >
        <label class="input-radio">AP</label>
      </div>
    </div>
<% else %>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">EasyMesh</div>
      </div>
      <div class="col-6">
        <input type="radio" id="MapEnableOn" value="1" disabled>
        <label class="input-radio">Enable</label>
        <input type="radio" id="MapEnableOff" value="0" disabled>
        <label class="input-radio">Disable</label>
        <input type="hidden" name="MapEnable" value="<% tcWebApi_get("Mesh_dat", "MapEnable","s") %>">
      </div>
    </div>
<% end if %>
    <div class="row p-1" id="map-cfg-basic-devicerole-setting" style="display:none">
      <div class="col-6">
        <div class="title-text-left">Role:</div>
      </div>
      <div class="col-6">
        <input type="radio" name="DeviceRole" id="Role_Controller" value="1" >
        <label class="input-radio">Controller</label>
        <input type="radio" name="DeviceRole" id="Role_Agent" value="2" >
        <label class="input-radio">Agent</label>
        <input type="radio" name="DeviceRole" id="Role_Auto" value="0" >
        <label class="input-radio">Auto</label>
      </div>
    </div>
    </form>
    <form id="DefaultForm" name="DefaultForm" action="/cgi-bin/true-page/other/OperationMode.asp" method="post">
      <input type="hidden" name="defaultflag" value="0"> 
      <input type="hidden" name="restoreflag" value="0">
      <input type="hidden" name="ReserveConf" value="0">
      <input type="hidden" name="VID" value="0">
    </form>
    <div class="mt-3 mb-3 center">
      <button type="button" class="btn-dashboard" onclick="btnSave()">Apply Changes</button>
    </div>
  </div>
  <!-- content -->
  <script>
    var allowRoleChange = 1;
    $(document).ready(function()
    {
<% if Request_Form("defaultflag") = "1" then %>
      var rebootTips = simpleAlert({
        "content": "Device reset, please wait...",
        "autoClose": 80,
<% if Request_Form("VID") <> "10" then %> 
        "IPchange": "http://192.168.1.1"
<% end if %>
      });
<% else %>
      InitRole();
      showRoleSel();
<% end if %>
    });

    function InitRole()
    {
      var MeshRole = "<% tcWebApi_get("MeshRoleExchange_Entry","MeshRole","s") %>";
      if(MeshRole == "1")
      {
        setCheck("Role_Controller", 1);
        setCheck("Role_Agent", 0);
        setCheck("Role_Auto", 0);
      }
      else if(MeshRole == "2")
      {
        setCheck("Role_Controller", 0);
        setCheck("Role_Agent", 1);
        setCheck("Role_Auto", 0);
      }
      else if(MeshRole == "0")
      {
        setCheck("Role_Controller", 0);
        setCheck("Role_Agent", 0);
        setCheck("Role_Auto", 1);
      }
    }

    function showRoleSel()
    {
      var mapEnable = "<% tcWebApi_get("Mesh_dat","MapEnable","s") %>";
      if(mapEnable == "1")
      {
        setCheck("MapEnableOn", 1);
        setCheck("MapEnableOff", 0);
        MapEnableClick(1);
      }
      else
      {
        setCheck("MapEnableOn", 0);
        setCheck("MapEnableOff", 1);
        MapEnableClick(0);
      }
    }

    function MapEnableClick(_val)
    {
      if(_val)
      {
        setDisplay("map-cfg-basic-devicerole-setting", "1");
      }
      else
      {
        setDisplay("map-cfg-basic-devicerole-setting", "0");
      }
    }

    function submitRestoreForm()
    {
      document.DefaultForm.defaultflag.value = "1";
      document.DefaultForm.restoreflag.value = "2";
      var formName = $("#DefaultForm").attr("action");
      var formData = $("#DefaultForm").serialize();

      deferAjax(formName, formData)
      .done(function(_html){
        document.write(_html);
        document.close();
      })
      .fail(function(fail){
        alert("Request error! Please try again.");
      });
    }

    function ReDefaultboot() 
    {
      var rebootAlert = simpleAlert({
        "content":"Are you sure to change device mode? if you changed device mode, it will restore settings.",
        "buttons":{
          "OK":function () 
          {
            rebootAlert.close();
            submitRestoreForm();
          },
          "Cancel":function () 
          {
            rebootAlert.close();
          }
        }
      });
    }

    function btnSave()
    {
      var need_commit = 0;
      var CurVID = "<% tcWebApi_get("Vid_Common", "skyvid","s") %>";
      var CurRole = "<% tcWebApi_get("MeshRoleExchange_Entry", "MeshRole","s") %>";
      var CurMeshSta =  "<% tcWebApi_get("Mesh_dat", "MapEnable","s") %>";
      document.ConfigForm.VID.value = CurVID;
      document.DefaultForm.VID.value = CurVID;

      if(CurMeshSta != document.ConfigForm.MapEnable.value)
      {
        need_commit = 1;
      }
      else
      {
        if(CurRole != document.ConfigForm.DeviceRole.value)
        {
          need_commit = 1;
        }
      }

      if(need_commit)
      {
        if(document.ConfigForm.MapEnable.value == "1")//Open mesh
        {
          if(CurRole != document.ConfigForm.DeviceRole.value)//need to change Role
          {
            document.ConfigForm.deviceRoleChange_Flag.value = "1";
            if(CurMeshSta == "1" && CurRole == "2")//Agent to Controller or Agent to Auto
            {
              if(document.ConfigForm.DeviceRole.value == "1")
              {
                document.DefaultForm.ReserveConf.value = "2";
              }
              else if(document.ConfigForm.DeviceRole.value == "0")
              {
                document.DefaultForm.ReserveConf.value = "3";
              }
              ReDefaultboot();
            }
            else//Controller to Agent or Auto, Atuo to Controller or Agent, Ap to Agent
            {
              if(!confirm("Are you sure to change device role? if you changed device role, it will logout."))
              {
                return false;
              }
              if(document.ConfigForm.DeviceRole.value == "1" || document.ConfigForm.DeviceRole.value == "0")
              {
                //document.ConfigForm.DeviceName.value = "Controller";
              }
              else if(document.ConfigForm.DeviceRole.value == "2")
              {
                document.ConfigForm.OtherToAgent.value = "1";
                //document.ConfigForm.DeviceName.value = "Agent";
              }
              document.ConfigForm.SaveAlter_Flag.value = "1";
              document.ConfigForm.SaveFlag.value = "1";
              document.ConfigForm.submit();
            }
          }
          else//just Open mesh no change role, Ap To Controller or Auto
          {
            //document.ConfigForm.DeviceName.value = "Controller";
            document.ConfigForm.SaveAlter_Flag.value = "1";
            document.ConfigForm.SaveFlag.value = "1";
            document.ConfigForm.submit();
          }
        }
        else//Close mesh
        {
          if(CurRole == "2")//Agent to Ap
          {
            document.DefaultForm.ReserveConf.value = "1";
            ReDefaultboot();
          }
          else//just close mesh, Controller or Auto To Ap
          {
            //document.ConfigForm.DeviceName.value = "N/A";
            document.ConfigForm.SaveAlter_Flag.value = "1";
            document.ConfigForm.SaveFlag.value = "1";
            document.ConfigForm.submit();
          }
        }
      }
      else
      {
          document.ConfigForm.SaveAlter_Flag.value = "1";
          document.ConfigForm.submit();
      }
    }
  </script>
</body>

</html>
