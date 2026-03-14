<%
If request_Form("VoIP_SIP_flag")="1" then
	tcWebApi_set("VoIPBasic_Common", "PRACKEnable", "PrackEnableFlag")
	tcWebApi_commit("VoIPBasic_Common")
	tcWebApi_save()
end if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>VoIP - Other</title>
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
  <SCRIPT language=javascript>
	function btnApplySip()
	{
		with (document.ConfigForm)
		{
			if (PrackEnable.checked)
			{
				PrackEnableFlag.value = "No";
			}
						
			VoIP_SIP_flag.value = "1";
			submit();
			showLoading();		
		}
	}
  </script>
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
  <form name=ConfigForm action="/cgi-bin/true-page/vo-ip/other.asp" method="post">
  <input type='hidden' value='0' name="VoIP_SIP_flag">
  <input type='hidden' value='Yes' name="PrackEnableFlag">
      <div class="title-text">Dial Option</div>
      <div class="title-description-text">This page is used to configure Other of VoIP.</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Auto Dial Time :</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="5" disabled>
          </div>
          <div class="col-3 left">
              <label class="input-radio">( 3-9 Sec, 0 is disable )</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Dial-out by Hash Key :</div>
          </div>
          <div class="col-6">
              <input type="checkbox" value="disabled" name="checkbox">
              <label class="input-radio">Disable</label>
          </div>
      </div><br>

      <div class="title-text">Off-Hook Alarm</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Off-Hook Alarm Time :</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="10" disabled>
          </div>
          <div class="col-3 left">
              <label class="input-radio">( 10-60 Sec, 0 is disable )</label>
          </div>
      </div><br>

      <div class="title-text">FXS Pulse Dial Detection</div>
      <div class="row p-1">
          <div class="col-6 pl60">
              <input type="radio" value="disabled" name="radio2" checked>
              <label class="input-radio">Disable</label>
              <input type="radio" value="Enable" name="radio2">
              <label class="input-radio">Enable</label>
          </div>
          <div class="col-6">

          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Interdigit Pause Duration :</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="450" disabled>
          </div>
          <div class="col-3 left">
              <label class="input-radio">( msec )</label>
          </div>
      </div><br>

      <div class="title-text">SIP setting</div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SIP Prack:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" name="PrackEnable"  value='YES' <%if tcWebApi_get("VoIPBasic_Common", "PRACKEnable", "h") = "No" then asp_Write("checked") end if %>>
              <label class="input-radio">Disable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SIP Server Rendundacy :</div>
          </div>
          <div class="col-6">
              <input type="checkbox" value="Enable" name="checkbox" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SIP CLIR anonymouse from header :</div>
          </div>
          <div class="col-6">
              <input type="checkbox" value="Enable" name="checkbox" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Non-SIP INBOX call:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" value="Enable" name="checkbox" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <label class="title-text-left">Hook Flash Relay setting:</label>
          </div>
          <div class="col-6">
              <select class="form-control input-select" disabled>
                  <option value="NONE">NONE</option>
                  <option value="">-</option>
                  <option value="">-</option>
              </select>
          </div>
      </div><br>

      <div class="title-text">SIP OPTIONS</div>
      <div class="row p-1">
          <div class="col-6 pl60">
              <input type="radio" value="disabled" name="radio3" checked disabled>
              <label class="input-radio">Disable</label>
              <input type="radio" value="Enable" name="radio3" disabled>
              <label class="input-radio">Enable</label>
          </div>
          <div class="col-6">

          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Options interval time :</div>
          </div>
          <div class="col-3">
              <input class="form-control input-textfield" type="text" value="0" disabled>
          </div>
          <div class="col-3 left">
              <label class="input-radio" disabled>( Sec )</label>
          </div>
      </div><br>


      <div class="mt-2 center">
          <button class="btn-dashboard" type='button' value="Apply" onClick="btnApplySip()">Apply</button>
      </div>
	  </form>
  </div>
  <!-- content -->
</body>

</html>