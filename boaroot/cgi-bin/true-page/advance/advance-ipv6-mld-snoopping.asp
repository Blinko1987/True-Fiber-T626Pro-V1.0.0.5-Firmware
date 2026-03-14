<%
if Request_Form("Snoop_Flag") = "1" then
    TCWebApi_set("Lan_IgmpSnoop","igmpsnoopEnable","snoopingradio")
    TCWebApi_commit("Lan_IgmpSnoop")
    tcWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 MLD Snooping</title>
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
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-ipv6-mld-snoopping.asp">
    <input type="hidden" name="Snoop_Flag" value="0">
    <div class="container-full container-resize-height">
        <div class="title-text">IPv6 MLD Snooping Configuration</div>
        <div class="title-description-text">This page be used to configure MLD Snooping.</div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">MLD Snooping:</div>
            </div>
            <div class="col-6">
                <input type="radio" value="Yes" id="snoopingradio" name="snoopingradio"
                    <%if tcWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio">Enabled</label>
                <input type="radio" value="No" id="snoopingradio" name="snoopingradio" 
                    <%if tcWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","h") = "No" then asp_Write("checked") end if %>>
                <label class="input-radio">Disabled</label>
            </div>
        </div>
        <div class="mt-3 mb-3 center">
            <button type="button" id="snoopping" onclick="snooppingClick()" class="btn-dashboard">Apply Changes</button>
        </div>
    </div>
</form>
<!-- content -->

<script language=JavaScript type=text/javascript>
    function snooppingClick()
    {
        with(document.forms[0])
        {
            if (snoopingradio[0].checked == true || snoopingradio[1].checked == true) 
            {
                Snoop_Flag.value = "1";
            }
            document.ConfigForm.submit();
            showLoading();
        }
    }
</script>
</body>

</html>