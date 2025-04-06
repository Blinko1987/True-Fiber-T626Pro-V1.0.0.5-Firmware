<%
if Request_Form("Proxy_Flag") = "1" then
    TCWebApi_set("MLDproxy_Entry","Active","MLDProxyActive")	
    TCWebApi_set("MLDproxy_Entry","UpstreamIF","rapdsource")
    TCWebApi_commit("MLDproxy_Entry")	
    tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 MLD Proxy Configuration</title>
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
</head>

<body>
<!-- content -->
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-ipv6-mld-proxy.asp">
    <input type="hidden" name="Proxy_Flag" value="0">
    <div class="container-full container-resize-height">
        <div class="title-text">MLD Proxy Configuration</div>
        <div class="title-description-text">This page be used to configure MLD Proxy.</div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">MLD Proxy:</div>
            </div>
            <div class="col-6">
                <input type="radio" value="Yes" id="MLDProxyActive" name="MLDProxyActive" onchange="InterfaceChange(this.value)"
                    <%if tcWebApi_get("MLDproxy_Entry","Active","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio">Enabled</label>
                <input type="radio" value="No" id="MLDProxyActive" name="MLDProxyActive" onchange="InterfaceChange(this.value)"
                    <%if tcWebApi_get("MLDproxy_Entry","Active","h") = "No" then asp_Write("checked") end if %>>
                <label class="input-radio">Disabled</label>
            </div>
        </div>
        
       <div id="waninterface" class="row p-1" style="display: none;">
           <div class="col-6">
               <div class="title-text-left">Prefix:</div>
           </div>
           <div class="col-6">
               <select class="form-control input-select" id="rapdsource" name="rapdsource"></select>
           </div>
           <div class="col-2"></div>
       </div>
        
        
        <!--div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Robust Count:</div>
            </div>
            <div class="col-6">
                <input class="input-textfield" type="text">
            </div>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Query Interval:</div>
            </div>
            <div class="col-4">
                <input class="input-textfield" type="text">
            </div>
            <span class="title-text-right col-1">(seconds)</span>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Query Response Interval:</div>
            </div>
            <div class="col-4">
                <input class="input-textfield" type="text">
            </div>
            <span class="title-text-right col-1">(millisecond)</span>
        </div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Response Interval of Last Group Member:</div>
            </div>
            <div class="col-4">
                <input class="input-textfield" type="text">
            </div>
            <span class="title-text-right col-1">(seconds)</span>
        </div-->
        <div class="mt-2 center">
            <button type="button" onclick="OnSubmit()" class="btn-dashboard">Apply Changes</button>
        </div>
    </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
    var nEntryNum = "<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>";
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(','); 
    vArrayStr = '<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>';
    var vEntryValue = vArrayStr.split(',');
    // num 6
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
    var vIPVersion = vArrayStr.split(',');
    
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryIndex = vArrayStr.split(',');
    
    function initRaPDSourceList()
    {
        var IGMPinterface = "<% tcWebApi_get("IGMPproxy_Entry","UpstreamIF","s") %>";
        var MLDinterface = "<% tcWebApi_get("MLDproxy_Entry","UpstreamIF","s") %>"
        var RaPdTmpUseIdx = '<% tcWebApi_get("WanInfo_Common","PDRUNIFIdx","s") %>';
        var i = 0;
        var isSel = -1;
        var bakSel = -1;
        var itemCnt = 0;

        with (getElById('rapdsource'))
        {
            for( i=0; i< parseInt(nEntryNum); i++)
            {
                var opt;
                var CONName = vEntryName[i];
                var CONValue = vEntryValue[i];
                if ( ( CONName.indexOf('_INTERNET_R_') < 0 && CONName.indexOf('_OTHER_R_') < 0 )
                    || 'IPv4' == vIPVersion[i] )
                    continue;

                opt = new Option(CONValue, vEntryIndex[i]);

                if ( 'N/A' == MLDinterface || 0 == IGMPinterface.length )
                {
                    if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
                    {
                        opt.selected = true;
                        isSel = itemCnt;
                    }
                }
                else
                {
                    if (  'N/A' != IGMPinterface && IGMPinterface == vEntryIndex[i] )
                    {
                        opt.selected = true;
                        isSel = itemCnt;
                    }
                    else
                    {
                        if (  'N/A' != RaPdTmpUseIdx && RaPdTmpUseIdx == vEntryIndex[i] )
                        {
                            bakSel = itemCnt;
                        }
                    }
                }

                itemCnt ++;
                options.add ( opt );
            }
            if ( isSel >= 0 )
                options[isSel].setAttribute('selected', 'true');
            else if ( bakSel >= 0 )
            {
                options[bakSel].selected = true;
                options[bakSel].setAttribute('selected', 'true');
            }
        }
    }
    
    function InterfaceChange() {
        with(document.forms[0])
        {
            if ("No" == MLDProxyActive.value)
                $("#waninterface").hide();
            else
                $("#waninterface").show();
        }
    }
    
    function OnSubmit()
    {
        with(document.forms[0])
        {
            Proxy_Flag.value = "1";
            document.ConfigForm.submit();
            showLoading();
        }
    }
    
    $(document).ready(function(){
        initRaPDSourceList();
        InterfaceChange();
    });
</script>
</body>
</html>