<%
If request_Form("VoIP_SIP_flag")="1" then
	tcWebApi_set("VoIPMedia_Common", "FaxCodec", "t38EnableFlag")
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
  <title>VoIP - Advance</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
  <SCRIPT language=javascript>
	function btnApplySip()
	{
		with (document.ConfigForm)
		{
			if (t38Enable.checked)
			{
				t38EnableFlag.value = "1";
			}
						
			VoIP_SIP_flag.value = "1";
			submit();
			showLoading();		
		}
	}
  </script>
  <!-- script -->
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
    <form name=ConfigForm action="/cgi-bin/true-page/vo-ip/advance.asp" method="post">
      <input type='hidden' value='0' name="VoIP_SIP_flag">
      <input type='hidden' value='0' name="t38EnableFlag">
      <div class="title-text">Advance</div>
      <div class="title-description-text">This page is used to configure Advance of VoIP.</div>
      <div class="title-text">V.152</div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">V.152:</div>
          </div>
          <div class="col-sm-6">
              <input type="checkbox" value="1" name="check1" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">V.152 Payload Type:</div>
          </div>
          <div class="col-sm-6">
              <input class="form-control input-textfield" type="text" disabled>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">V.152 code type:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="PCM u-law">PCM u-law</option>
              </select>
          </div>
      </div>
      <br>
      <div class="title-text">T.38(FAX)</div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">T.38:</div>
          </div>
          <div class="col-sm-6">
              <input type="checkbox" value="1" name='t38Enable' <%if tcWebApi_get("VoIPMedia_Common", "FaxCodec", "h") = "1" then asp_Write("checked") end if %>>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Fax Modem Detection Mode:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="Auto_2">Auto_2</option>
              </select>
          </div>
      </div>
      <br>
      <div class="title-text">T.38(FAX)</div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Customize parameters:</div>
          </div>
          <div class="col-sm-6">
              <input type="checkbox" value="1" name="check3" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Max buffer:</div>
          </div>
          <div class="col-sm-6">
              <input class="form-control input-textfield" value="1492" type="text" disabled>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">TCF:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="Remote TCF">Remote TCF</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Max Rate:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="14400">14400</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">ECM:</div>
          </div>
          <div class="col-sm-6">
              <input type="checkbox" value="1" name="check4" disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">ECC signal:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="5">5</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">ECC Data:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="2">2</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Spoofing:</div>
          </div>
          <div class="col-sm-6">
              <input type="checkbox" value="1" name="check5" checked disabled>
              <label class="input-radio">Enable</label>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-6">
              <div class="title-text-left">Packet Duplicate Num:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="0">0</option>
              </select>
          </div>
      </div>

      <br>
      <div class="title-text">DSP</div>
      <div class="row p-1">
          <div class="col-sm-3">
          </div>
          <div class="col-sm-3">
              <div class="title-text-right">Min delay(ms):</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="40">40</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">Jitter Buffer Control:</div>
          </div>
          <div class="col-sm-3">
              <div class="title-text-right">Max delay(ms):</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="200">200</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
          </div>
          <div class="col-sm-3">
              <div class="title-text-right">Optimization factor:</div>
          </div>
          <div class="col-sm-6">
              <select class="form-control input-select" disabled>
                  <option value="40">1</option>
              </select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">LEC Tail Length:</div>
          </div>
          <div class="col-2">
              <input class="form-control input-textfield" value="2" type="text" disabled>
          </div>
          <span class="input-radio">(ms)</span>
          <div class="col-sm-6">
              <div class="title-text-left">2-3 ms:</div>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">LEC:</div>
          </div>
          <div class="col-sm-3">
              <input type="checkbox" value="1" name="check6" checked disabled>
              <label class="input-radio">Enable</label>
          </div>
          <div class="col-sm-6">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">NLP:</div>
          </div>
          <div class="col-sm-3">
              <input type="checkbox" value="1" name="check7" checked disabled>
              <label class="input-radio">Enable</label>
          </div>
          <div class="col-sm-6">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">VAD:</div>
          </div>
          <div class="col-sm-3">
              <input type="checkbox" value="1" name="check8" disabled>
              <label class="input-radio">Enable</label>
          </div>
          <div class="col-sm-6">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-sm-3">
              <div class="title-text-left">VAD Amp. Threshold(0
                  < Amp < 200):</div>
              </div>
              <div class="col-2">
                  <input class="form-control input-textfield" value="63" type="text" disabled>
              </div>
              <span class="input-radio">(Amp.)</span>
              <div class="col-sm-6">
              </div>
          </div>
          <div class="row p-1">
              <div class="col-sm-3">
              </div>
              <div class="col-sm-3">
                  <input type="radio" value="1" name="check9" checked disabled>
                  <label class="input-radio">Disable configuration</label>
              </div>
              <div class="col-sm-6">
                  <input class="form-control input-textfield" value="70" type="text" disabled>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-sm-3">
                  <div class="title-text-left">SID Noise Level:</div>
              </div>
              <div class="col-sm-3">
                  <input type="radio" value="1" name="check10">
                  <label class="input-radio">Fixed noise level</label>
              </div>
              <div class="col-sm-6">
                  <select class="form-control input-select" disabled>
                  <option value="70">70</option>
              </select>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-sm-3">
              </div>
              <div class="col-sm-3">
                  <input type="radio" value="1" name="check11" disabled>
                  <label class="input-radio">Adjust noise level:</label>
              </div>
              <div class="col-sm-6">
                  <input class="form-control input-textfield" value="0" type="text" disabled>
              </div>
          </div>
          <div class="row p-1">
              <div class="col-sm-3">
                  <div class="title-text-left">CNG:</div>
              </div>
              <div class="col-sm-3">
                  <input type="checkbox" value="1" name="check12" disabled>
                  <label class="input-radio">Enable:</label>
              </div>
              <div class="col-sm-6">
              </div>
          </div>
          <div class="row p-1">
              <div class="col-sm-3">
                  <div class="title-text-left">CNG.Amp.(0
                      < Amp < 200,0 means no limit for Max. Amp):</div>
                  </div>
                  <div class="col-2">
                      <input class="form-control input-textfield" value="0" type="text" disabled>
                  </div>
                  <span class="input-radio">(Amp.)</span>
                  <div class="col-sm-6">
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">PLC:</div>
                  </div>
                  <div class="col-sm-3">
                      <input type="checkbox" value="1" name="check13" checked disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
                  <div class="col-sm-6">
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">RTCP:</div>
                  </div>
                  <div class="col-sm-3">
                      <input type="checkbox" value="1" name="check14" checked disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
                  <div class="col-1">
                      <span class="input-radio">Interval</span>
                  </div>
                  <div class="col-sm-3">
                      <input class="form-control input-textfield" value="10" type="text" disabled>
                  </div>
                  <div class="col-1">
                      <span class="input-radio">(Sec.)</span>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">RTCP XR:</div>
                  </div>
                  <div class="col-sm-3">
                      <input type="checkbox" value="1" name="check13" checked disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
                  <div class="col-sm-6">
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left"></div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check15" disabled>
                      <label class="input-radio">Enable Fax/Modem RFC2833 Relay(For TX):</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Fax/Modem RFC2833 Support:</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check16" disabled>
                      <label class="input-radio">Enable Fax/Modem Inband Removal(For TX):</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left"></div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check17" disabled>
                      <label class="input-radio">Enable Fax/Modem Tone Play(For RX):</label>
                  </div>
              </div>

              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left"></div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check18" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">require level:</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="1">1</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Speaker AGC:</div>
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">Max gain up: dB</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="6">6</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">Max gain down: dB</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="-6">-6</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left"></div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check18" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">require level:</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="1">1</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">MIC AGC:</div>
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">Max gain up: dB</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="6">6</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-3">
                      <div class="title-text-right">Max gain down: dB</div>
                  </div>
                  <div class="col-sm-6">
                      <select class="form-control input-select" disabled>
                  <option value="-6">-6</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Caller ID Mode</div>
                  </div>
                  <div class="col-sm-3">
                      <select class="form-control input-select" disabled >
                  <option value="FSK_ETSI">FSK_ETSI</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">FSK Date & Time Sync</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check19" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Reverse Polarity before Caller ID</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check20" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Short Ring before Caller ID</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check21" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Dual Tone before Caller ID</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check22" disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Caller ID Prior First Ring</div>
                  </div>
                  <div class="col-sm-6">
                      <input type="checkbox" value="1" name="check23" checked disabled>
                      <label class="input-radio">Enable:</label>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Caller ID DTMF Start Digit</div>
                  </div>
                  <div class="col-sm-3">
                      <select class="form-control input-select" disabled>
                  <option value="DTMF_A">DTMF_A</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Caller ID DTMF End Digit</div>
                  </div>
                  <div class="col-sm-3">
                      <select class="form-control input-select" disabled>
                  <option value="DTMF_C">DTMF_C</option>
              </select>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Flash Time Setting (ms) [Space: 10, Min:80, Max:2000]</div>
                  </div>
                  <div class="col-sm-3">
                      <input class="form-control input-textfield" value="80" type="text" disabled>
                      <input class="form-control input-textfield" value="500" type="text" disabled>
                  </div>
                  <span class="input-radio">< Flash Time <</span>
              </div>
              <div class="row p-1">
                  <div class="col-sm-3">
                      <div class="title-text-left">Speaker Voice Gain (dB)[-32~31], Mute:-32</div>
                  </div>
                  <div class="col-sm-3">
                      <input class="form-control input-textfield" value="0" type="text" disabled>
                  </div>
              </div>
              <div class="row p-1">
                  <div class="col-3">
                      <div class="title-text-left">Mic Voice Gain (dB)[-32~31], Mute:-32</div>
                  </div>
                  <div class="col-sm-3">
                      <input class="form-control input-textfield" value="0" type="text" disabled>
                  </div>
              </div>
              <div class="mt-2 center">
                  <button class="btn-dashboard" type='button' value="Apply" onClick="btnApplySip()">Apply</button>
              </div>
          </div>
      </div>
	  </form>
  </div>
  <!-- content -->
</body>

</html>