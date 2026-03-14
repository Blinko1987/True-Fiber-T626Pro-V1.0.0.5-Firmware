

<%
if Request_Form("catvflg") = "1" then 
	TCWebApi_set("CatvInfo_Entry","CATV_enable","catv_enable_Flag")
	TCWebApi_set("CatvInfo_Entry","CATV_offset","agcOffset")
	TCWebApi_commit("CatvInfo_Entry")	
	TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>CATV Configuration</title>
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

<body onload="if(getElById('ConfigForm') != null)LoadFrame()" >
    <!-- content -->
    <div class="col-md-12 col-sm-12">
        <div class="container-full container-resize-height">
            <form name="ConfigForm" method="post" action="/cgi-bin/true-page/service/CATV-Configuration.asp">
                <INPUT TYPE="HIDDEN" NAME="catvflg" VALUE="0">
                <INPUT type="HIDDEN" name="catv_enable_Flag" value="0">
                <div class="title-text">CATV Configuration</div>
                <div class="title-description-text">This page is used to configure CATV.</div>
                <div class="row p-1" id="enable_tr">
                    <div class="col-6">
                        <div class="title-text-left">CATV:</div>
                    </div>
                    <div class="col-6 ptAlign">
                        <input type="radio" name="catvEnable" id="catv_disable" onclick="CatvOff(0);"/><label class="input-radio">Disable</label>&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="catvEnable" id="catv_enable" onclick="CatvOff(1);"/><label class="input-radio">Enable</label>
                    </div>
                </div>
                <div class="row p-1" id="offset_tr">
                    <div class="col-6">
                        <div class="title-text-left">AGC Offset:</div>
                    </div>
                    <div class="col-6">
                        <div class="row">
                            <div class="col-7 pr-0">
                                <input class="form-control input-textfield" name="agcOffset" value="<%if TCWebApi_get("CatvInfo_Entry","CATV_offset","h" ) <> "N/A" then TCWebApi_get("CatvInfo_Entry","CATV_offset","s" ) end if %>">
                            </div>
                            <div class="col-5 pl-0 title-text-right">
                                <label>	(-12.8~12.7dB Step:0.1dB)</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-2 center">
                    <button id="btnOK" onclick="OnOK()" class="btn-dashboard" >Apply</button>
                    <!-- 调用在util_skyw.js中的refreshPage()事件 -->
                    <button id="btnCancel" class="btn-dashboard" onclick="javascript: RefreshPage();">Cancel</button>
                </div>
            </form>
        </div>
    </div>
    <!-- content -->

    <script language=JavaScript type=text/javascript>
        function LoadFrame()
        {
            if (curUserName != sptUserName){
                setDisplay("enable_tr",0);
                setDisplay("offset_tr",0);
            }
            initCatvEnable();
        }
        
        function initCatvEnable()
        {
            var catv_enable = "<% tcWebApi_get("CatvInfo_Entry","CATV_enable","s"); %>";
            if(catv_enable==1)
            {
                document.getElementById("catv_enable").checked=true;
            }
            else
            {
                document.getElementById("catv_disable").checked=true;
            }
        }
        
        function CatvOff(off)
        {
            if( off == 1 )
            {
                document.ConfigForm.catv_enable_Flag.value = "1";
            }else
            {
                document.ConfigForm.catv_enable_Flag.value = "0";
            }
        }
        
        function OnOK()
        {
            var offsetValue;
            var agcOffset = document.ConfigForm.agcOffset.value;
            if( "" == agcOffset || false != isNaN(agcOffset) )
            {
                alert('"' + agcOffset + '"' + ' can only be numbers.');
                return;
            }
            
            offsetValue = parseFloat(agcOffset);
            if(offsetValue < -12.8 || offsetValue > 12.7)
            {
                alert("AGC Offset should be -12.8~12.7dB");
                return;
            }
            document.ConfigForm.catvflg.value = "1";
            document.ConfigForm.submit();
            showLoading();
        }
    </script>
</body>

</html>