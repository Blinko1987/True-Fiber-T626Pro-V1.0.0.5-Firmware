<%
if Request_Form("RA_Flag") = "1" then
    TCWebApi_set("Radvd_Entry","Enable","RAEnable_Flag")
    TCWebApi_set("Radvd_Entry","Mode","RAUseWan")
    if Request_Form("RAUseWan") = "1" then
        TCWebApi_set("Radvd_Entry","PrefixIPv6","radvdPrefix")
        TCWebApi_set("Radvd_Entry","Prefixv6Len","RAPrefixLen")
        TCWebApi_set("Radvd_Entry","PreferredLifetime","RAt1")
        TCWebApi_set("Radvd_Entry","ValidLifetime","RAt2")
        TCWebApi_set("Radvd_Entry","ManagedEnable","radvdmanageden")
        TCWebApi_set("Radvd_Entry","OtherEnable","radvdotheren")
        TCWebApi_set("Radvd_Entry","MinRAInterval","RACycMin")
        TCWebApi_set("Radvd_Entry","MaxRAInterval","RACycMax")
        TCWebApi_constSet("Radvd_Entry","AutoPrefix","1")
    else
        TCWebApi_constSet("Radvd_Entry","AutoPrefix","0")
        TCWebApi_set("Radvd_Entry","ManagedEnable","radvdmanageden")
        TCWebApi_set("Radvd_Entry","OtherEnable","radvdotheren")
        TCWebApi_set("Radvd_Entry","DelegatedWanConnection","rapdsource")
    end if
    
    TCWebApi_commit("Radvd_Entry")
    TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 RADVD</title>
    <!-- style -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
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
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-ipv6-radvd.asp">
  <input type="hidden" name="RA_Flag" value="0">
  <input type="hidden" name="RAEnable_Flag" value="<% tcWebApi_get("Radvd_Entry","Enable","s") %>">
  <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
  <div class="container-full container-resize-height">
    <div class="title-text">RADVD Configuration</div>
    <div class="title-description-text">This page is used to configure RADVD.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">SLAAC:</div>
      </div>
      <div class="col-6">
        <input type="checkbox" value="checkbox" name="radvdSrvType" id="radvdSrvType" onclick="RATypeClick()" <%if tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%>>
      </div>
    </div>
    <div id="advManagedFlag" class="row p-1">
        <div class="col-6">
            <div class="title-text-left">AdvManagedFlag:</div>
        </div>
        <div class="col-6">
            <input type="radio" value="0" name="radvdmanageden" id="radvdmanageden"
                <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "0" then asp_Write("checked") end if%>>
            <label class="input-radio">off</label>
            <input type="radio" value="1" name="radvdmanageden" id="radvdmanageden"
                <%if tcWebApi_get("Radvd_Entry","ManagedEnable","h") = "1" then asp_Write("checked") end if%>>
            <label class="input-radio">on</label>
        </div>
    </div>
    <div id="advOtherConfigFlag" class="row p-1">
        <div class="col-6">
            <div class="title-text-left">AdvOtherConfigFlag:</div>
        </div>
        <div class="col-6">
            <input type="radio" value="0" name="radvdotheren" id="radvdotheren"
                <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "0" then asp_Write("checked") end if%>>
            <label class="input-radio">off</label>
            <input type="radio" value="1" name="radvdotheren" id="radvdotheren"
                <%if tcWebApi_get("Radvd_Entry","OtherEnable","h") = "1" then asp_Write("checked") end if%>>
            <label class="input-radio">on</label>
        </div>
    </div>
    <div id="prefixMode" class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Prefix Mode:</div>
        </div>
        <div class="col-6">
            <select class="form-control input-select" id="RAUseWan" name="RAUseWan" onchange="RAUseWanChange(this.value)">
                <option value="0" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("selected") end if%>>Auto</option>
                <option value="1" <%if tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("selected") end if%>>Manul</option>
            </select>
        </div>
        <div class="col-2"></div>
    </div>
    <div id="waninterface" class="row p-1" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">Prefix:</div>
        </div>
        <div class="col-6">
            <select class="form-control input-select" id="rapdsource" name="rapdsource" onchange="WanInterfaceChange(this.value)"></select>
        </div>
        <div class="col-2"></div>
    </div>
    <div id="showAddress" class="row p-1 auto-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">IPv6 Prefix:</div>
        </div>
        <div class="col-6">
            <!-- <input class="form-control input-textfield" type="text"> -->
            <div class="title-text-right" id="DelegationAddress">
                
            </div>
        </div>
    </div>
    <div id="showPrefix" class="row p-1 auto-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">IPv6 Prefix Length:</div>
        </div>
        <div class="col-6">
            <!-- <input class="form-control input-textfield" type="text"> -->
            <div class="title-text-right">
                <% if tcWebApi_get("Radvd_Entry","Prefixv6Len","h" ) <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s" ) end if %>
            </div>
        </div>
    </div>
        
    <div id="namePrefix" class="row p-1 manual-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">Prefix:</div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="col-7 pr-0">
                    <input class="form-control input-textfield" type="text" name="radvdPrefix"
                        maxLength="39" onchange="this.value = this.value.toLowerCase()"
                        value="<%if tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>">
                </div>
                <div class="col-5 pl-0 title-text-right">
                    <strong style="color: #ff0033">*</strong>
                </div>
            </div>
        </div>
    </div>
    <div id="namePrefixLen" class="row p-1 manual-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">Prefix Length:</div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="col-7 pr-0">
                    <input class="form-control input-textfield" type="text" name="RAPrefixLen" maxLength="2"
                        value="<%if tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>">
                </div>
                <div class="col-5 pl-0 title-text-right">
                    <strong style="color: #ff0033">*</strong>
                    <label>[16 - 64]</label>
                </div>
            </div>
        </div>
    </div>
    <div id="preferredLifetime" class="row p-1 manual-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">Preferred Life Time:</div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="col-7 pr-0">
                    <input class="form-control input-textfield" type="text" name="RAt1" maxLength="10"
                        value="<%if tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>">
                </div>
                <div class="col-5 pl-0 title-text-right">
                    <strong style="color: #ff0033">*</strong>
                    <label>[600-4294967295 S]</label>
                </div>
            </div>
        </div>
    </div>
    <div id="validLifetime" class="row p-1 manual-mode" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">Valid Life Time:</div>
        </div>
        <div class="col-6">
            <div class="row">
                <div class="col-7 pr-0">
                    <input class="form-control input-textfield" type="text" name="RAt2" maxLength="10"
                        value="<%if tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>">
                </div>
                <div class="col-5 pl-0 title-text-right">
                    <strong style="color: #ff0033">*</strong>
                    <label>[600-4294967295 S]</label>
                </div>
            </div>
        </div>
    </div>
    <div id="racycmax" class="row p-1" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">MaxRtrAdvInterval:</div>
        </div>
        <div class="col-6">
            <input class="input-textfield" type="text" name="RACycMax"
            value="<%if tcWebApi_get("Radvd_Entry","MaxRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MaxRAInterval","s") end if%>">
        </div>
    </div>
    <div id="racycmin" class="row p-1" style="display: none;">
        <div class="col-6">
            <div class="title-text-left">MinRtrAdvInterval:</div>
        </div>
        <div class="col-6">
            <input class="input-textfield" type="text" name="RACycMin"
            value="<%if tcWebApi_get("Radvd_Entry","MinRAInterval","h") <> "N/A" then tcWebApi_get("Radvd_Entry","MinRAInterval","s") end if%>">
        </div>
    </div>
        
    <div id="enableULA" class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Enable ULA:</div>
        </div>
        <div class="col-6">
            <input type="radio" value="disabled" name="radio3" checked>
            <label class="input-radio">off</label>
            <input type="radio" value="enabled" name="radio3">
            <label class="input-radio">on</label>
        </div>
    </div>
    <div class="mt-3 mb-3 center">
        <button type="button" onclick="RASubmit()" class="btn-dashboard">Apply Changes</button>
    </div>
  </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
  var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
  // num 0
  var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
  var vEntryName = vArrayStr.split(','); 
  vArrayStr = '<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>';
  var vEntryValue = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex","s") %>";
  var vEntryIndex = vArrayStr.split(',');
  // num 6
  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
  var vIPVersion = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_ipv6rd","s") %>";
  var vIPv6rdEnable = vArrayStr.split(',');

  vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_PD6","s") %>";
  var vEntryPD6 = vArrayStr.split(',');
    
  function RATypeClick()
  {
    with (document.forms[0])
    {
      if (getCheckVal('radvdSrvType') == 0)
      {
        disableRASrv();
        RAEnable_Flag.value = "0";
      }
      else
      {
        enableRASrv();
        RAEnable_Flag.value = "1";
        RAUseWanChange();
      }
    }
  }

  function disableRASrv()
  {
    with (document.forms[0])
    {
      $("#advManagedFlag").hide();
      $("#advOtherConfigFlag").hide();
      $("#prefixMode").hide();

      $("#waninterface").hide();
      $("#showAddress").hide();
      $("#showPrefix").hide();
      
      $("#racycmax").hide();
      $("#racycmin").hide();
      $("#namePrefix").hide();
      $("#namePrefixLen").hide();
      $("#preferredLifetime").hide();
      $("#validLifetime").hide();
      $("#enableULA").hide();
    }
  }

  function enableRASrv()
  {
    with (document.forms[0])
    {
      $("#advManagedFlag").show();
      $("#advOtherConfigFlag").show();
      $("#prefixMode").show();
      $("#enableULA").show();
    }
  }

  function initRaPDSourceList()
  {
    var RaPdSourceIdx = '<% tcWebApi_get("Radvd_Entry","DelegatedWanConnection","s") %>';
    var RaPdType = '<% tcWebApi_get("Radvd_Entry","AutoPrefix","s") %>';
    var RaPdTmpUseIdx = '<% tcWebApi_get("WanInfo_Common","PDRUNIFIdx","s") %>';
    var i = 0;
    var isSel = -1;
    var bakSel = -1;
    var itemCnt = 0;
	var isAddress = 0;
	var bacAddress = 0;

    with (getElById('rapdsource'))
    {
      for( i=0; i< parseInt(nEntryNum); i++)
      {
        var opt;
        var CONName = vEntryName[i];
        var CONValue = vEntryValue[i];

        if (( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
          || 'IPv4' == vIPVersion[i] ) && ('Yes' != vIPv6rdEnable[i]))
          continue;

        opt = new Option(CONValue, vEntryIndex[i]);

        if ( 'N/A' == RaPdType || 0 == RaPdSourceIdx.length )
        {
          if ( 'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
          {
            opt.selected = true;
            isSel = itemCnt;
			isAddress = i;
          }
        }
        else
        {
          if (  'N/A' != RaPdSourceIdx && RaPdSourceIdx == vEntryIndex[i] )
          {
            opt.selected = true;
            isSel = itemCnt;
			isAddress = i;
          }
          else
          {
            if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
            {
              bakSel = itemCnt;
              bacAddress = i;
            }
          }
        }

        itemCnt ++;
        options.add ( opt );
      }
      if ( isSel >= 0 )
  	  {
  	    options[isSel].setAttribute('selected', 'true');
		$("#DelegationAddress").text(vEntryPD6[isAddress]);
  	  }
      else if ( bakSel >= 0 )
      {
        options[bakSel].selected = true;
        options[bakSel].setAttribute('selected', 'true');
		$("#DelegationAddress").text(vEntryPD6[bacAddress]);
      }
    }
  }
  
  function CheckRAPrefix(Prefix, type) {
    var IpAddress1 = Prefix.split(':');
    var IpAddress3 = Prefix;
    if (1 == type && '' == IpAddress3) {
        return true;
    }
    if (true != isGlobalIpv6Address(IpAddress3)) {
        return false;
    }
    return true;
  }
  
  function CheckLength(Length) {
    var TemLen = parseInt(Length);
    if (true == isNaN(TemLen) || TemLen > 64 || TemLen < 16) {
        return false;
    }
    return true;
  }
  
  function CheckRATime(Time1, Time2) {
    var TemTime1 = Time1;
    var TemTime2 = Time2;
    if (TemTime1.length > 10 || '' == TemTime1) {
        return 1;
    }
    if (TemTime2.length > 10 || '' == TemTime2) {
        return 2;
    }
    if (true != isPlusInteger(TemTime1)) {
        return 1;
    }
    if (true != isPlusInteger(TemTime2)) {
        return 2;
    }
    TemTime1 = parseInt(Time1);
    TemTime2 = parseInt(Time2);
    if (TemTime1 > 4294967295 || TemTime1 < 600) {
        return 1;
    }
    if (TemTime2 > 4294967295 || TemTime2 < 600) {
        return 2;
    }
    if (TemTime2 <= TemTime1) {
        return 3;
    }
    return true;
  }
  
  function RAIntervalValue(vMin, vMax)
  {
    var MinInterval = vMin;
    var MaxInterval = vMax;
    if ('' == MinInterval || false == isNumeric(MinInterval))
    {
        return 1;
    }
    if ('' == MaxInterval || false == isNumeric(MaxInterval))
    {
        return 2;
    }
    MinInterval = parseFloat(vMin);
    MaxInterval = parseFloat(vMax);
    
    if ( MinInterval < 3 || MinInterval > 1350 )
        return 1;
    if ( MaxInterval > 1800 || MaxInterval < 4 )
        return 2;
    if ( MaxInterval < MinInterval )
        return 3;
    
    if ( MinInterval > (MaxInterval*0.75) )
        return 4;
    
    return true;
  }
  
  function RACheckForm()
  {
    with(document.forms[0])
    {
        if (true != CheckRAPrefix(radvdPrefix.value, 0)) {
            alert("Prefix\"" + radvdPrefix.value + "\"is not a valid IPv6 address.");
            return false;
        }
        if (true != CheckLength(RAPrefixLen.value)) {
            alert("Prefix length\"" + RAPrefixLen.value + "\"is wrong.");
            return false;
        }
        
        switch (CheckRATime(RAt1.value, RAt2.value)) {
            case 1: {
                alert("Preferred Life Time \"" + RAt1.value + "\" is invalid.");
                return false;
            }
            case 2: {
                alert("Valid Life Time \"" + RAt2.value + "\" is invalid");
                return false;
            }
            case 3: {
                alert("Valid Life Time \"" + RAt2.value + "\" should less than Preferred Life Time \"" +
                    RAt1.value + "\"");
                return false;
            }
            default:
                break;
        }
        
        switch (RAIntervalValue(RACycMin.value, RACycMax.value)){
            case 1 :
            {
                alert("Min interval\"" + RACycMin.value + "\" is invalid.");
                return false;
            }
            case 2 :
            {
                alert("Max interval \"" + RACycMax.value + "\" is invalid.");
                return false;
            }
            case 3 :
            {
                alert("Max time" + RACycMax.value + "should be less than min time" + RACycMin.value);
                return false;
            }
            case 4 :
            {
                var temp = parseFloat(RACycMax.value) * 0.75;
                alert("RA min time" + RACycMin.value + "should be less 0.75 of max time." + temp.toString());
                return false;
            }
            default:
                break;
        }
    }
    return true;
  }
  
  function RASubmit()
  {
    if (RACheckForm() == true) {
        document.ConfigForm.RA_Flag.value = "1";
        document.ConfigForm.SaveAlter_Flag.value = "1";
        document.ConfigForm.submit();
        //showLoading();
    }else{
        alert("error submit");
    }
  }
  
  function RAUseWanChange() {
    if ( ("1" == RAUseWan.value) && (1 == getCheckVal('radvdSrvType')) ) {
      $("#waninterface").hide();
      $("#showAddress").hide();
      $("#showPrefix").hide();
      
      $("#racycmax").show();
      $("#racycmin").show();
      $("#namePrefix").show();
      $("#namePrefixLen").show();
      $("#preferredLifetime").show();
      $("#validLifetime").show();
    } else {
      $("#waninterface").show();
      $("#showAddress").show();
      $("#showPrefix").show();
      
      $("#racycmax").hide();
      $("#racycmin").hide();
      $("#namePrefix").hide();
      $("#namePrefixLen").hide();
      $("#preferredLifetime").hide();
      $("#validLifetime").hide();
    }
  }

  function WanInterfaceChange() {
    var WanValue = getSelectVal('rapdsource'); 
    var i;
	for( i=0; i< parseInt(nEntryNum); i++)
	{
		if(vEntryIndex[i]==WanValue)
		{
			$("#DelegationAddress").text(vEntryPD6[i]);
		}
	}
  }
  
  $(document).ready(function(){
    initRaPDSourceList();
    RATypeClick();
  });
</script>
</body>

</html>
