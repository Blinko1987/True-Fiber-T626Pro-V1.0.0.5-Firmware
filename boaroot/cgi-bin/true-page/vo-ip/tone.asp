<%
If request_Form("VoIP_AppBtn_flag")="1" then
	tcWebApi_constSet("WebCurSet_Entry", "VoIPIdle", "1")
	if tcWebApi_get("WebCurSet_Entry", "VoIPIdle", "h") = "1"  then
		tcWebApi_set("VoIPAdvanced_Common", "VoIPRegion", "localeName")
		tcWebApi_commit("VoIPBasic")
		tcWebApi_save()
	end if

End if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>VoIP - Tone</title>
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
  <SCRIPT language=JavaScript type="text/javascript">
	function printLocaleListBox()
	{
	//	 var locList = ',,,,,,,,,,,,,,,,,,,,,,,,';
		 document.writeln("<option value=\"THA-THAILAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "THA-THAILAND" then  asp_Write("selected") end if %>> THA-THAILAND" );
		 document.writeln("<option value=\"AUS-AUSTRALIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "AUS-AUSTRALIA" then  asp_Write("selected") end if %>> AUS-AUSTRALIA" );
		 document.writeln("<option value=\"BEL-BELIGIUM\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "BEL-BELIGIUM" then  asp_Write("selected") end if %>> BEL-BELIGIUM" );
		 document.writeln("<option value=\"BRA-BRAZIL\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "BRA-BRAZIL" then  asp_Write("selected") end if %>> BRA-BRAZIL" );
		 document.writeln("<option value=\"CHL-CHILE\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHL-CHILE" then  asp_Write("selected") end if %>> CHL-CHILE" );
		 document.writeln("<option value=\"CHN-CHINA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHN-CHINA" then  asp_Write("selected") end if %>> CHN-CHINA" );
		 document.writeln("<option value=\"CZH-CZECH\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CZH-CZECH" then  asp_Write("selected") end if %>> CZH-CZECH" );
		 document.writeln("<option value=\"DNK-DENMARK\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "DNK-DENMARK" then  asp_Write("selected") end if %>> DNK-DENMARK" );
		 document.writeln("<option value=\"ETS-ETSI\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ETS-ETSI" then  asp_Write("selected") end if %>> ETS-ETSI" );
		 document.writeln("<option value=\"FIN-FINLAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "FIN-FINLAND" then  asp_Write("selected") end if %>> FIN-FINLAND" );
		 document.writeln("<option value=\"FRA-FRANCE\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "FRA-FRANCE" then  asp_Write("selected") end if %>> FRA-FRANCE" );
		 document.writeln("<option value=\"DEU-GERMANY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "DEU-GERMANY" then  asp_Write("selected") end if %>> DEU-GERMANY" );
		 document.writeln("<option value=\"HUN-HUNGARY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "HUN-HUNGARY" then  asp_Write("selected") end if %>> HUN-HUNGARY" );
		 document.writeln("<option value=\"IND-INDIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "IND-INDIA" then  asp_Write("selected") end if %>> IND-INDIA" );
		 document.writeln("<option value=\"ITA-ITALY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ITA-ITALY" then  asp_Write("selected") end if %>> ITA-ITALY" );
		 document.writeln("<option value=\"JPN-JAPAN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "JPN-JAPAN" then  asp_Write("selected") end if %>> JPN-JAPAN" );
		 document.writeln("<option value=\"RUS-RUSSIA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "RUS-RUSSIA" then  asp_Write("selected") end if %>> RUS-RUSSIA" );     
		 document.writeln("<option value=\"NLD-NETHERLANDS\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NLD-NETHERLANDS" then  asp_Write("selected") end if %>> NLD-NETHERLANDS" );
		 document.writeln("<option value=\"NZL-NEWZEALAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NZL-NEWZEALAND" then  asp_Write("selected") end if %>> NZL-NEWZEALAND" );
		 document.writeln("<option value=\"USA-NORTHAMERICA\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "USA-NORTHAMERICA" then  asp_Write("selected") end if %>> USA-NORTHAMERICA" );
		 document.writeln("<option value=\"ESP-SPAIN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "ESP-SPAIN" then  asp_Write("selected") end if %>> ESP-SPAIN" );
		 document.writeln("<option value=\"SWE-SWEDEN\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "SWE-SWEDEN" then  asp_Write("selected") end if %>> SWE-SWEDEN" );
		 document.writeln("<option value=\"NOR-NORWAY\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "NOR-NORWAY" then  asp_Write("selected") end if %>> NOR-NORWAY" );
		 document.writeln("<option value=\"CHE-SWITZERLAND\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "CHE-SWITZERLAND" then  asp_Write("selected") end if %>> CHE-SWITZERLAND" );
		 document.writeln("<option value=\"T57-TR57\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "T57-TR57" then  asp_Write("selected") end if %>> T57-TR57" );
		 document.writeln("<option value=\"GBR-UK\" <%if TCWebAPI_get("VoIPAdvanced_Common", "VoIPRegion", "h") = "GBR-UK" then  asp_Write("selected") end if %>> GBR-UK" );
		 
	
	}
	
	function btnApplySip() 
	{
	   with ( document.ConfigForm )
	   {					
			VoIP_AppBtn_flag.value = 1;
			parent.voipType = "SIP";
			submit();
			showLoading();						
	   }
	}
	
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
  <FORM id=ConfigForm name="ConfigForm" action="/cgi-bin/true-page/vo-ip/tone.asp" method="post">
      <div class="title-text">Select Country</div>
      <div class="title-description-text">This page is used to Select Country of VoIP.</div>
      <input type='hidden' name="VoIP_AppBtn_flag" value="0">
      <div class="row p-1">
          <div class="col-6">
              <label class="title-text-left">Country:</label>
          </div>
          <div class="col-6">
              <select name="localeName" class="form-control input-select">
				<script TYPE="text/javascript">
				 printLocaleListBox()			  
				  </script>
              </select>
          </div>
      </div><br>
      <div class="mt-2 center">
          <button type="button" class="btn-dashboard" onClick="btnApplySip()" ID="ApplyButton" >Apply</button>
      </div>
	  </form>
  </div>
  <!-- content -->
  
</body>

</html>