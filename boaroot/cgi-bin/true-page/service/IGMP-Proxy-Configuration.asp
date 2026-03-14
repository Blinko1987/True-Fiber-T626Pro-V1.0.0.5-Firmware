<%
if Request_Form("Apply_Flag") = "1" then
  if Request_Form("Proxy_Flag") = "1" then
    TCWebApi_set("IGMPproxy_Entry","Active","IgmpProxyActive")	
    TCWebApi_set("IGMPproxy_Entry","UpstreamIF","WanIF")
    TCWebApi_commit("IGMPproxy_Entry")
  end if
  if Request_Form("MLDProxy_Flag") = "1" then
    TCWebApi_set("MLDproxy_Entry","Active","MLDProxyActive")	
    TCWebApi_set("MLDproxy_Entry","UpstreamIF","WanIF")
    TCWebApi_commit("MLDproxy_Entry")
  end if
  if Request_Form("Snooping_Flag") = "1" then
    TCWebApi_set("Lan_IgmpSnoop","igmpsnoopEnable","SnoopActive")
    TCWebApi_set("Lan_IgmpSnoop","mldsnoopEnable","MLDSnoopActive")
    TCWebApi_commit("Lan_IgmpSnoop")
  end if
    tcWebApi_save()

end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>IGMP Configuration</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
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
  <!-- script -->
  <style>
    .ptAlign{padding-top: 8px;}
  </style>

</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()" >
<!-- content -->
<SCRIPT language=JavaScript type=text/javascript>
  var vIgmpProxy = new Array(new stIGMPCfg("domain","<% tcWebApi_get("IGMPproxy_Entry","Active","s") %>","<% tcWebApi_get("IGMPproxy_Entry","UpstreamIF","s") %>","IGMPVersion","<% tcWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","s") %>","<% tcWebApi_get("MLDproxy_Entry","Active","s") %>" ,"<% tcWebApi_get("Lan_IgmpSnoop","mldsnoopEnable","s") %>","<% tcWebApi_get("MLDproxy_Entry","UpstreamIF","s") %>"),null);
  var igmp = vIgmpProxy[0];
  var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
  var vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
  var vEntryValue = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
  var vEntryName = vArrayStr.split(',');
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
  var vIPVersion = vArrayStr.split(',');
  
  vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
  vEntryValue = SortUtil.SortMyArray( vEntryValue );
  vIPVersion = SortUtil.SortMyArray( vIPVersion );
  function stIGMPCfg(domain,ProxyEnable,WanIF, IGMPVersion, SnoopingEnable,MldProxyEnable,MldSnoopingEnable,MLDWanIF)
  {
    this.domain = domain;
    if(ProxyEnable == "Yes")
      this.ProxyEnable = 1;
    else
      this.ProxyEnable = 0;
    this.WanIF = WanIF;
    this.MLDWanIF = MLDWanIF;
    this.IGMPVersion = IGMPVersion;
    if(SnoopingEnable == "Yes")
      this.SnoopingEnable = 1;
    else
      this.SnoopingEnable = 0;	
    if(MldProxyEnable == "Yes")
      this.MldProxyEnable = 1;
    else
      this.MldProxyEnable = 0;
    if(MldSnoopingEnable == "Yes")
      this.MldSnoopingEnable = 1;
    else
      this.MldSnoopingEnable = 0;
  }
  
  function LoadFrame()
  {
    with ( document.forms[0])
    {
      var igmpwanif_unempty = false;
      var mldwanif_unempty = false;
      var igmpwanif_exist = false;
      var mldwanif_exist = false;
      var igmpwanif_bridage = false;
      var mldwanif_bridage = false;

      /*
      if( igmp.ProxyEnable)
        setDisplay('IgmpProxyTab',1);
      else
        setDisplay('IgmpProxyTab',0);
      */

      if(igmp.WanIF != 'N/A' && igmp.WanIF != '')
        igmpwanif_unempty = true;
      if(igmp.MLDWanIF != 'N/A' && igmp.MLDWanIF != '')
        mldwanif_unempty = true;

      for (i = 0; i < nEntryNum; i++)
      {
        if(igmpwanif_unempty == true && vEntryValue[i] == igmp.WanIF)
        {
          igmpwanif_exist = true;
          if(vEntryName[i].indexOf('_B_')>-1)
            igmpwanif_bridage = true;
        }
        if(mldwanif_unempty == true && vEntryValue[i] == igmp.MLDWanIF)
        {
          mldwanif_exist = true;
          if(vEntryName[i].indexOf('_B_')>-1)
            mldwanif_bridage = true;
        }
      }

      if(igmpwanif_exist == true && igmpwanif_bridage != true)
      {
        setSelect('WanIF',igmp.WanIF);
        setCheck('chkIgmpProxy',igmp.ProxyEnable);
        setCheck('chkIgmpSnp',igmp.SnoopingEnable);
        if(mldwanif_exist == true && mldwanif_bridage != true)
        {
          setCheck('chkMldProxy',igmp.MldProxyEnable);
          setCheck('chkMldSnp',igmp.MldSnoopingEnable);
        }
        else
        {
          setCheck('chkMldProxy',0);
          setCheck('chkMldSnp',0);
        }
      }
      else
      {
        if(mldwanif_exist == true && mldwanif_bridage != true)
        {
          setSelect('WanIF',igmp.WanIF);
          setCheck('chkIgmpProxy',0);
          setCheck('chkIgmpSnp',0);
          setCheck('chkMldProxy',igmp.MldProxyEnable);
          setCheck('chkMldSnp',igmp.MldSnoopingEnable);
        }
        else
        {
          var selectElement = getElById('WanIF');
          if(selectElement.length > 0)
            selectElement.selectedIndex = 0;
          setCheck('chkIgmpProxy',0);
          setCheck('chkIgmpSnp',0);
          setCheck('chkMldProxy',0);
          setCheck('chkMldSnp',0);
        }
      }
      IFChange();
    }
  }
  
  function btnSubmit()
  {
    if(document.ConfigForm.chkIgmpProxy.checked)//igmp proxy
    {
      if(document.ConfigForm.WanIF.value != "")
      {
        document.ConfigForm.IgmpProxyActive.value = "Yes";
      }
      else
      {
        alert("Select WAN interface.");
        return;
      }
    }
    else
      document.ConfigForm.IgmpProxyActive.value = "No";

    if(document.ConfigForm.chkIgmpSnp.checked)//igmp snooping
    {
      document.ConfigForm.SnoopActive.value = "Yes";
    }
    else
      document.ConfigForm.SnoopActive.value = "No";

    if(document.ConfigForm.chkMldProxy.checked)//mld proxy
    {
      if(document.ConfigForm.WanIF.value != "")
      {
        document.ConfigForm.MLDProxyActive.value = "Yes";
      }
      else
      {
        alert("Select WAN interface.");
        return;
      }
    }
    else
      document.ConfigForm.MLDProxyActive.value = "No";

    if(document.ConfigForm.chkMldSnp.checked)//mld snooping
    {
      document.ConfigForm.MLDSnoopActive.value = "Yes";
    }
    else
      document.ConfigForm.MLDSnoopActive.value = "No";

    document.ConfigForm.Snooping_Flag.value = "1";
    document.ConfigForm.SaveAlter_Flag.value = "1";
    document.ConfigForm.Apply_Flag.value = "1";
    document.ConfigForm.submit();
    //showLoading();
  }
  /*
  function ChangeEnabIgmp()
  {
    if(getCheckVal('chkIgmpProxy'))
      setDisplay('IgmpProxyTab',1);
    else
      setDisplay('IgmpProxyTab',0);
  }
  */

  function IFChange()
  {
    with (getElById('ConfigForm'))
    {
      var IPv = GetIFIPVersion('WanIF');
      
      switch (IPv)
      {
        case 'IPv4':
          document.getElementById("chkIgmpProxy").disabled = false;
          document.getElementById("chkMldProxy").disabled = true;
          //$("input[id='chkIgmpProxy']").Attr("disabled", false);
          //$("input[id='chkMldProxy']").Attr("disabled", true);
          document.ConfigForm.Proxy_Flag.value = "1";
          document.ConfigForm.MLDProxy_Flag.value = "0";
          break;
        case 'IPv6':
          document.getElementById("chkIgmpProxy").disabled = true;
          document.getElementById("chkMldProxy").disabled = false;
          //$("input[id='chkIgmpProxy']").Attr("disabled", true);
          //$("input[id='chkMldProxy']").Attr("disabled", false);
          document.ConfigForm.MLDProxy_Flag.value = "1";
          document.ConfigForm.Proxy_Flag.value = "0";
          break;
        case 'IPv4/IPv6':
          document.getElementById("chkIgmpProxy").disabled = false;
          document.getElementById("chkMldProxy").disabled = false;
          //$("input[id='chkIgmpProxy']").Attr("disabled", false);
          //$("input[id='chkMldProxy']").Attr("disabled", false);
          document.ConfigForm.MLDProxy_Flag.value = "1";
          document.ConfigForm.Proxy_Flag.value = "1";
          break;

        default:
          document.getElementById("chkIgmpProxy").disabled = true;
          document.getElementById("chkMldProxy").disabled = true;
          //$("input[id='chkIgmpProxy']").Attr("disabled", true);
          //$("input[id='chkMldProxy']").Attr("disabled", true);
          document.ConfigForm.MLDProxy_Flag.value = "0";
          document.ConfigForm.Proxy_Flag.value = "0";
        break;
      }
    }
  }

  function GetIFIPVersion(Sid)
  {
    var Valuebuf = getElById(Sid).value;
  if(Valuebuf != 'N/A')
  {
    for (i = 0; i < nEntryNum; i++)
    {
      if(vEntryValue[i]==Valuebuf)
        break;
    }
    return vIPVersion[i];
  }
  }
</SCRIPT>
  <div class="container-full container-resize-height">
    <div class="title-text">IGMP Proxy Configuration</div>
    <div class="title-description-text" style="padding-bottom: 0!important;">This page is used to configure IGMP and MLD:</div>
    <FORM name="ConfigForm" action="/cgi-bin/true-page/service/IGMP-Proxy-Configuration.asp" method="post">
      <input type="hidden" name="Proxy_Flag" value="0">
      <input TYPE="hidden" NAME="Apply_Flag" VALUE="0">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="MLDProxy_Flag" value="0">
      <input type="hidden" name="Snooping_Flag" value="0">
      <input type="hidden" name="IgmpProxyActive" value="0">
      <input type="hidden" name="SnoopActive" value="0">
      <input type="hidden" name="MLDSnoopActive" value="0">
      <input type="hidden" name="MLDProxyActive" value="0">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">IPv4:</div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Enable IGMP Snooping:</div>
        </div>
        <div class="col-6 ptAlign">
          <input id=chkIgmpSnp type=checkbox name=chkIgmpSnp />
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Enable IGMP Proxy:</div>
        </div>
        <div class="col-6 ptAlign">
          <input id=chkIgmpProxy type=checkbox name=chkIgmpProxy disabled/>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">IPv6:</div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Enable MLD Snooping:</div>
        </div>
        <div class="col-6 ptAlign">
          <input id=chkMldSnp type=checkbox name=chkMldSnp />
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Enable MLD Proxy:</div>
        </div>
        <div class="col-6 ptAlign">
          <input id=chkMldProxy type=checkbox name=chkMldProxy disabled/>
        </div>
      </div>
      <div class="row p-1" id=IgmpProxyTab name="IgmpProxyTab"  <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
        <div class="col-6">
          <div class="title-text-left">WAN Interface:</div>
        </div>
        <div class="col-6">
          <SELECT class="form-control input-select" onchange="IFChange()" id="WanIF" name="WanIF">
            <SCRIPT language=JavaScript type=text/javascript>
              for (i = 0; i < nEntryNum; i++)
              {
                  if(( vEntryName[i].indexOf('_INTERNET_')<0 && vEntryName[i].indexOf('_OTHER_')<0 ) || (vEntryName[i].indexOf('_B_')>-1))
                    continue;
                  document.write('<option value=' + vEntryValue[i] + '>'+ vEntryName[i] + ' '+ vIPVersion[i] + '</option>');
              }
            </SCRIPT>
          </SELECT>
        </div>
      </div>
    </FORM>
    <!--
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Multicast Allowed:</div>
        </div>
        <div class="col-6">
            <input type="radio" value="Enable" name="radio1" checked="checked">
            <label class="input-radio">Enable</label>
            <input type="radio" value="Disable" name="radio1">
            <label class="input-radio">Disable</label> </div>
    </div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Robust Count:</div>
        </div>
        <div class="col-6">
            <input class="form-control input-textfield" value="2" type="text">
        </div>
    </div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Last Member Query Count:</div>
        </div>
        <div class="col-6">
            <input class="form-control input-textfield" value="2" type="text">
        </div>
    </div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Query Interval:</div>
        </div>
        <div class="col-4">
            <input class="form-control input-textfield" type="text" value="15">
        </div>
        <div class="col-2 left">
            <label class="input-radio">(seconds)</label>
        </div>
    </div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Query Response Interval:</div>
        </div>
        <div class="col-4">
            <input class="form-control input-textfield" type="text" value="100">
        </div>
        <div class="col-2 left">
            <label class="input-radio">(*100ms)</label>
        </div>
    </div>
    <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Group Leave Delay:</div>
        </div>
        <div class="col-4">
            <input class="form-control input-textfield" type="text" value="2000">
        </div>
        <div class="col-2 left">
            <label class="input-radio">(ms)</label>
        </div>
    </div><br>
    -->
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" onclick='btnSubmit()'  name=applyProxy>Apply Changes</button>
    </div>
  </div>
<!-- content -->
</body>

</html>
