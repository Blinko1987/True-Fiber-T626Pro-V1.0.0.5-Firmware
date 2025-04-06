<%
if Request_Form("Stp_Flag") = "1" then
    TCWebApi_set("Lan_Stp","Stpenable","stpradio")
    TCWebApi_set("Lan_Stp","Ageingtime","ageingtime")
    TCWebApi_commit("Lan_Stp")
    TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - Bridging</title>
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
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-bridging.asp">
    <input type="hidden" name="Stp_Flag" value="0">
    <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
    <div class="container-full container-resize-height">
        <div class="title-text">Bridging Configuration</div>
        <div class="title-description-text">This page is used to configure the bridge parameters. Here you can change the settings or view some information on the bridge and its attached ports.</div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">802.1d Spanning Tree:</div>
            </div>
            <div class="col-6">
                <input type="radio" value="Yes" id="stpradio" name="stpradio" onclick="enableSTP(this.value)"
                    <%if tcWebApi_get("Lan_Stp","Stpenable","h") = "Yes" then asp_Write("checked") end if%>>
                <label class="input-radio">Enabled</label>
                <input type="radio" value="No" id="stpradio" name="stpradio" onclick="enableSTP(this.value)"
                    <%if tcWebApi_get("Lan_Stp","Stpenable","h") <> "Yes" then asp_Write("checked") end if %>>
                <label class="input-radio">Disabled</label>
            </div>
        </div>
        
        <div class="row p-1 manual-mode" id="atime">
            <div class="col-6">
                <div class="title-text-left">Ageing Time:</div>
            </div>
            <div class="col-3">
                <input class="form-control input-textfield" type="text" name="ageingtime" maxLength="10"
                    value="<%if tcWebApi_get("Lan_Stp","Ageingtime", "h") <> "N/A" then tcWebApi_get("Lan_Stp","Ageingtime", "s") end if%>">
            </div>
                <span class="title-text-right col-1">(seconds)</span>
        </div>
        
        <div class="mt-2 center">
            <button type="button" onclick="stpClick()" class="btn-dashboard">Apply Changes</button>
			<button type="button" onclick="toClick()" class="btn-dashboard">Show MACs</button>
        </div>
    </div>
</form>
<!-- content -->

<script language=JavaScript type=text/javascript>
    function stpClick()
    {
        with(document.forms[0])
        {
            if (stpradio[0].checked == true || stpradio[1].checked == true) 
            {
                Stp_Flag.value = "1";
            }
            console.log(ageingtime.value);
            document.ConfigForm.SaveAlter_Flag.value = "1";
            document.ConfigForm.submit();
            //showLoading();
        }
    }
	function toClick()
	{
		window.location.href='/cgi-bin/true-page/advance/advance-bridging-showmacs.asp';
	}
    
    function enableSTP()
    {
        with(document.forms[0])
        {
            if ("Yes" == stpradio.value) {
                $("#atime").show();
            }
     
            if ("No" == stpradio.value) {
                $("#atime").hide();
            }
        }
    }
    
    $(document).ready(function(){
        enableSTP();
    });
</script>
</body>

</html>