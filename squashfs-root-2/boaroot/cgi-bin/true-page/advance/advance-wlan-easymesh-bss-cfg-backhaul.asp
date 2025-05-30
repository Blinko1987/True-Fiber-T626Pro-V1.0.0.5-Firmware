<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Advance - Easy Mesh</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
</head>

<body>
  <!-- content -->
  <div class="container-full container-resize-height">
  <input type="hidden" name="webwait_Flag" id="webwait_Flag" value="0">
  <form method="post" name="cbi" id="add_bss_cfgs_form" action="/cgi-bin/true-page/advance/advance-wlan-easymesh-bss-cfg-backhaul.asp" autocomplete="off" style="display:none;">
    <input type="hidden" name="Save_Flag" id="Save_Flag" value="0">
	<input type="hidden" name="Add_Flag" id="Add_Flag" value="0">
	<input type="hidden" name="Edit_Flag" id="Edit_Flag" value="0">
	<input type="hidden" name="Remove_Flag" id="Remove_Flag" value="0">

	<input type="hidden" name="_BssInfoCount" value="0">
	<input type="hidden" name="_alMac" value="">
	<input type="hidden" name="_band" value="">
	<input type="hidden" name="_ssid" value="">
	<input type="hidden" name="_authMode" value="">
	<input type="hidden" name="_encType" value="">
	<input type="hidden" name="_passPhrase" value="">
	<input type="hidden" name="_isBhBssSupported" value="">
	<input type="hidden" name="_isFhBssSupported" value="">
	<input type="hidden" name="_isHidden_ssid" value="">
	<input type="hidden" name="_edit_removeNodeIndex" value="">
	<input type="hidden" name="__IS_EDIT" id="edit_bss_hid_inp" value="0" />
	<input type="hidden" name="__EDIT_SSID" id="edit_bss_ssid_hid_inp" value="" />
	<input type="hidden" name="__EDIT_AUTH_MODE" id="edit_bss_auth_mode_hid_inp" value="" />
	<input type="hidden" name="__EDIT_ENCRYPTION_TYPE" id="edit_bss_enc_type_hid_inp" value="" />
	<input type="hidden" name="__EDIT_PASS_PHRASE" id="edit_bss_pass_phrase_hid_inp" value="" />
	<input type="hidden" name="__EDIT_BH_SUPPORT" id="edit_bss_bh_support_hid_inp" value="" />
	<input type="hidden" name="__EDIT_FH_SUPPORT" id="edit_bss_fh_support_hid_inp" value="" />
	<input type="hidden" name="__EDIT_IS_SSID_HIDDEN" id="edit_bss_is_ssid_hidden_hid_inp" value="" />
	<input type="hidden" name="isBhBssSupported" id="add_bss_bh_hid_inp" value="0" />
	<input type="hidden" name="isFhBssSupported" id="add_bss_fh_hid_inp" value="0" />
	<input type="hidden" name="isHidden" id="add_bss_is_ssid_hidden_hid_inp" value="0" />
	<input type="hidden" name="__EDIT_REMOVE_BSSINDEX" id="edit_remove_bss_bssindex_hid_inp" value="">
		<div class="row p-1" style="display:none;">
	      <div class="col-6">
	          <div class="title-text-left">AL-MAC:</div>
	      </div>
	      <div class="col-6">
	          <input class="form-control input-textfield" type="text" name="alMac" id="add_bss_almac_inp_text">
	      </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Radio Band:</div>
          </div>
          <div class="col-6">
          		<div id="add_bss_band_div" style="display: none">
            		<select name="band" size="1" id="add_bss_band_sel">
                	<option value="8x">2G</option>
                	<option value="11x">5GL</option>
                	<option value="12x">5GH</option>
            		</select>
          		</div>
          		<div id="add_bss_band_val_div"></div>
              <input class="form-control input-textfield" type="hidden" id="add_bss_band_sel_hid" name="add_bss_band_sel_hid" value="">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">SSID:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" name="ssid" id="add_bss_ssid_inp_text">
              <input type="hidden" name="add_bss_ssid_inp_text_hid" id="add_bss_ssid_inp_text_hid" value="" />
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Authentication Mode:</div>
          </div>
          <div class="col-6">
              <select class="form-control input-select" name="authMode" id="add_bss_auth_mode_sel" onchange="AuthModeOnChange(this.value)">
            			<option value="0x0001">OPEN</option>
	                <option value="0x0002">WPA-PSK</option>
	                <option value="0x0020">WPA2-PSK</option>
	                <option value="0x0022">WPA-PSK/WPA2-PSK</option>
          		</select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Encryption Type:</div>
          </div>
          <div class="col-6">
              <select class="form-control input-select" name="encType" id="add_bss_enc_type_sel" onchange="EncryptionTypeOnChange(this.value)">
            		<option value="0x0001">NONE</option>
                    <option value="0x0004">TKIP</option>
                    <option value="0x0008">AES</option>
                    <option value="0x000c">TKIP/AES</option>
          		</select>
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">PSK:</div>
          </div>
          <div class="col-6">
              <input class="form-control input-textfield" type="text" name="passPhrase" id="add_bss_pass_phrase_inp_text">
          </div>
      </div>
      <div class="row p-1">
          <div class="col-6">
              <div class="title-text-left">Hidden:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" id="add_bss_is_ssid_hidden_cbox">
          </div>
      </div>
      <div class="row p-1" style="display:none">
          <div class="col-6">
              <div class="title-text-left">Back-haul BSS Support:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" id="add_bss_bh_cbox" onClick="validate_bss_backhaul()">
          </div>
      </div>
      <div class="row p-1" style="display:none">
          <div class="col-6">
              <div class="title-text-left">Front-haul BSS Support:</div>
          </div>
          <div class="col-6">
              <input type="checkbox" id="add_bss_fh_cbox">
          </div>
      </div>
      <div class="mt-2 center" id="add_bss_cfgs_form_submit_div">
          <button class="btn-dashboard" type="button" onclick="bss_Save()">Apply</button>
      		<button class="btn-dashboard" type="button" onclick="bss_Reset()">Reset</button>
      </div>
      <div id="add_bss_cfgs_validate_almac_band_div" style="display:none">
    			<input type="button" value="Validate AL-MAC & Band" onclick="addBssPreConditionCheck()" />
    	</div>
    </form>
    <div class="alert-message" id='no_bss_cfg_msg_div' style="display:none">
        <strong>No BSS Configuration has been added yet!</strong>
    </div>

    <div class="container-full" id='cfg_bss_info_hdr_fset' style='display:none'>
        <!--<legend>
            <B>Configured BSS Information</B>
        </legend>-->
        <div class="card-table" id="bss_overview_div">
            <!-- JavaScript will create table with BSS Information -->
        </div>
    </div>
  </div>
  <!-- content -->
  <SCRIPT language=JavaScript type=text/javascript>
  	function get_encryption_val2str(encryptionCode)
	{
		switch(encryptionCode)
		{
			case "0x0001"://NONE
			    return "NONE";
			case "0x0008"://AES
			    return "AES";
			case "0x0004"://TKIP
			    return "TKIP";
			case "0x000c"://TKIPAES
			    return "TKIPAES";
			default:
					return "";
		}
	}
		
	function get_encryption_str2val(encryptionCode)
	{
		switch(encryptionCode)
		{
			case "NONE"://NONE
			case "0x0001":
			    return "0x0001";
			case "AES"://AES
			case "0x0008":
			    return "0x0008";
			case "TKIP"://TKIP
			case "0x0004":
			    return "0x0004";
			case "TKIPAES"://TKIPAES
			case "TKIP/AES"://TKIPAES
			case "0x000c":
			    return "0x000c";
			default:
					return "";
		}
	}
		
	function get_auth_mode_val2str(authModeCode)
	{
		switch(authModeCode)
		{
			case "0x0001"://OPEN
			    return "OPEN";
			case "0x0020"://WPA2 - Personal
			    return "WPA2PSK";
			case "0x0002"://WPA1 - Personal
			    return "WPAPSK";
			case "0x0022"://WPA1WPA2
			    return "WPAPSKWPA2PSK";
			default:
					return "";
		}
	}
		
	function get_auth_mode_str2val(authModeCode)
	{
		switch(authModeCode)
		{
			case "OPEN"://OPEN
			case "0x0001":
			    return "0x0001";
			case "WPA2PSK"://WPA2 - Personal
			case "WPA2-PSK":
			case "0x0020":
			    return "0x0020";
			case "WPAPSK"://WPA1 - Personal
			case "WPA-PSK":
			case "0x0002":
			    return "0x0002";
			case "WPAPSKWPA2PSK"://WPA1WPA2
			case "WPA-PSK/WPA2-PSK":
			case "0x0022":
			    return "0x0022";
			default:
					return "";
		}
	}
	var cfgsJs_global;
	var macRegExp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
	function JSO_Only_Status(staType)
	{
		var ret = ' { ' + 
										'"status": "' + staType + '"' + 
								' } ';
		return ret;
	}
	function validate_band(band)
	{
		var ret = 0;
		switch(band)
		{
			case "8x":
			case "11x":
			case "12x":
				ret = 1;
				break;
			default:
				ret = 0;
				break;
		}
		return ret;
	}
	function validate_easymshe_bss(cfgsJs, alMac, band)
	{
		var numBss = 0;
		var ret = '';

		if(cfgsJs[alMac] == null)
		{
			ret = '{ "status": "SUCCESS" }';
		}
		else if(cfgsJs[alMac][band] == null)
		{
			ret = '{ "status": "SUCCESS" }';
		}
		else
		{
			numBss = 0;
			for(var bssIndex in cfgsJs[alMac][band])
			{
				numBss++;
			}
			if(numBss >= 16)
			{
				ret = '{ "status": "No more BSS could be added!" }';
			}
			else
			{
				ret = '{ "status": "SUCCESS" }';
			}
		}

		return ret;
	}
	function JSO_validate_add_easymesh_bss_req(alMac, band)
	{
		var ret = '';
		//var macRegExp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		if (!macRegExp.test(alMac))
		{
			ret = '{ ';
			ret = ret + '"status": "Invalid AL-MAC: '+ alMac + ' !"';
			ret = ret + ' }';
		}
		else if(0 == validate_band(band))
		{
			ret = '{ ';
			ret = ret + '"status": "Invalid Band: '+ band + ' !"';
			ret = ret + ' }';
		}
		else
		{
			alMac = alMac.toUpperCase();
			if(alMac == "FF:FF:FF:FF:FF:FF")
			{
				ret = validate_easymshe_bss(cfgsJs_global['wildCardAlMacCfgs'], alMac, band);
			}
			else
			{
				ret = validate_easymshe_bss(cfgsJs_global['distinctAlMacCfgs'], alMac, band);
			}
		}

		return ret;
	}
	function JSO_remove_easymesh_bss_cfg_req()
	{
		var staType = 'SUCCESS';
		var ret = JSO_Only_Status(staType);
		return ret;
	}

	function getX_Response(type)
	{
		var X_Res='';
		try
		{
			switch(type)
			{
				case "remove_easymesh_bss_cfg_req":
					X_Res = JSO_remove_easymesh_bss_cfg_req();
					break;
				default:
					break;
			}
		}
		catch(e)
		{
			X_Res='';
		}

		return X_Res;
	}
	function bss_Reset()
	{
		document.getElementById("add_bss_almac_inp_text").value = "FF:FF:FF:FF:FF:FF";
		var bandSel = document.getElementById("add_bss_band_sel");
		var idx = document.getElementById("add_bss_band_sel_hid").value;
		bandSel.options[idx].selected = true;
		document.getElementById("add_bss_ssid_inp_text").value = document.getElementById("add_bss_ssid_inp_text_hid").value;
		var authModeSel = document.getElementById("add_bss_auth_mode_sel");
		authModeSel.options[0].selected = true;
		var endTypeSel = document.getElementById("add_bss_enc_type_sel");
		endTypeSel.options[0].selected = true;
		document.getElementById("add_bss_pass_phrase_inp_text").value = "";
		document.getElementById("add_bss_is_ssid_hidden_cbox").checked = false;
		document.getElementById("add_bss_bh_cbox").checked = false;
		document.getElementById("add_bss_fh_cbox").checked = false;
	}
    function checkInjection(str)
    {
        for (var i=0; i < str.length; i++) 
        {
            if ( str.charAt(i) == '\r' || str.charAt(i) == '\n' || str.charAt(i) == ' ')
            {
                return false;
            }
        }
        return true;
    }
	function get_backhaul_bss_count(bandList)
	{
		var i, tmpIndex, backhaul_bss_count = 0;
		
		for(i = 0; i < 8; i++)
		{
			tmpIndex = i + 1;
			if(bandList[tmpIndex] != null)
			{
				if(bandList[tmpIndex]['isBhBssSupported'] != null)
				{
					if(1 == bandList[tmpIndex]['isBhBssSupported'])
					{
						backhaul_bss_count++;
					}
				}
			}
		}
		return backhaul_bss_count;
	}
	function checkBackHaulBssCount()
	{
		return 1;
		var checkRet = 0;
		var tmpMac = "FF:FF:FF:FF:FF:FF";
		var tmpband, backhaul_bss_count_8x, backhaul_bss_count_11x, tmpIndex, i;
		
		if(cfgsJs_global['wildCardAlMacCfgs'] != null)
		{
			if(cfgsJs_global['wildCardAlMacCfgs'][tmpMac] != null)
			{
				tmpband = "8x";
				backhaul_bss_count_8x = 0;
				if(cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband] != null)
				{
					backhaul_bss_count_8x = get_backhaul_bss_count(cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband]);
				}
				else
				{
					/*band not exist*/
					backhaul_bss_count_8x = -1;
				}

				tmpband = "11x";
				backhaul_bss_count_11x = 0;
				if(cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband] != null)
				{
					backhaul_bss_count_11x = get_backhaul_bss_count(cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband]);
				}
				else
				{
					/*band not exist*/
					backhaul_bss_count_11x = -1;
				}

				if( ((-1 != backhaul_bss_count_8x) && (1 != backhaul_bss_count_8x))
					|| ((-1 != backhaul_bss_count_11x) && (1 != backhaul_bss_count_11x)) )
				{
					checkRet = 0;
				}
				else
				{
					checkRet = 1;
				}
			}
			else
			{
				checkRet = 0;
			}
		}
		else
		{
			checkRet = 0;
		}
		return checkRet;
	}

	function validate_bss_backhaul()
	{
		return;
		var tmpMac = "FF:FF:FF:FF:FF:FF";
		var tmpband = document.getElementById('add_bss_band_sel').value;
		var bss_bh_ctl = document.getElementById('add_bss_bh_cbox');
		var curIndex = document.getElementById('edit_remove_bss_bssindex_hid_inp').value;
		var tmpIndex = 0, i = 0;
		var bandList;
		
		if(bss_bh_ctl.checked)
		{
			if(cfgsJs_global['wildCardAlMacCfgs'] != null)
			{
				if(cfgsJs_global['wildCardAlMacCfgs'][tmpMac] != null)
				{
					if(cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband] != null)
					{
						bandList = cfgsJs_global['wildCardAlMacCfgs'][tmpMac][tmpband];
						for(i = 0; i < 8; i++)
						{
							tmpIndex = i + 1;
							if(curIndex == tmpIndex)
							{
								continue;
							}
							
							if(bandList[tmpIndex] != null)
							{
								if(bandList[tmpIndex]['isBhBssSupported'] != null)
								{
									if(1 == bandList[tmpIndex]['isBhBssSupported'])
									{
										bss_bh_ctl.checked = false;
										alert("Back-Haul BSS must be configed one and only one!");
										return;
									}
								}
							}
						}
					}
				}
			}
		}
	}
    function validate_security()
    {
        var authModeSel = document.getElementById('add_bss_auth_mode_sel');
        var encTypeSel = document.getElementById('add_bss_enc_type_sel');
        var passPhraseId = document.getElementById('add_bss_pass_phrase_inp_text');
        var passPhrase = passPhraseId.value;
        if(authModeSel.value == '0x0001' && encTypeSel.value == '0x0001')
        {
            //AUTH_MODE = OPEN and ENCRYPTION_TYPE = NONE
            passPhraseId.value = '';
        }
        else if((authModeSel.value == '0x0020' || authModeSel.value == '0x0002' || authModeSel.value == '0x0022') && (encTypeSel.value == '0x0004' || encTypeSel.value == '0x0008' || encTypeSel.value == '0x000c'))
        {
            //AUTH_MODE = WPA2-Personal and ENCRYPTION_TYPE = AES
            if (passPhrase.length == 0)
            {
                alert('Pass-phrase is empty!\n' +
                    'Please enter 8~63 ASCII or 64 Hexadecimal characters as Pass-phrase.\n' +
                    'DO NOT INCLUDE SPACE CHARACTERS!');
                passPhraseId.select();
                passPhraseId.focus();
                return false;
            }
            if (passPhrase.length < 8)
            {
                alert('Pass-phrase is short!\n' +
                    'Please enter 8~63 ASCII or 64 Hexadecimal characters as Pass-phrase.\n' +
                    'DO NOT INCLUDE SPACE CHARACTERS!');
                passPhraseId.select();
                passPhraseId.focus();
                return false;
            }
            var nonHexPat = /[^A-Fa-f0-9]/;
            if(nonHexPat.test(passPhrase))
            {
                // ASCII
                if (passPhrase.length > 63) 
                {
                    alert('Too many characters in Pass-phrase!\n' +
                        'Please enter 8~63 ASCII or 64 Hexadecimal characters as Pass-phrase.\n' +
                        'DO NOT INCLUDE SPACE CHARACTERS!');
                    passPhraseId.select();
                    passPhraseId.focus();
                    return false;
                }
                for (i = 0; i < passPhrase.length; i++){
					if (passPhrase.charAt(i) == ',' || passPhrase.charAt(i) == '\"' || passPhrase.charAt(i) == '\''){
							break;
					}
				}
				if ( i == passPhrase.length)
				{
					return true;
				}
				else if (passPhrase.charAt(i) == ',')
				{
					alert("Pass-phrase cannot contain commas!");
					passPhraseId.select();
	            	passPhraseId.focus();
	            	return false;
				}
				else if (passPhrase.charAt(i) == '\"')
				{
					alert("Pass-phrase cannot contain double quotation marks!");
					passPhraseId.select();
	            	passPhraseId.focus();
	            	return false;
				}
				else if (passPhrase.charAt(i) == '\'')
				{
					alert("Pass-phrase cannot contain single quotation marks!");
					passPhraseId.select();
	            	passPhraseId.focus();
	            	return false;
				}
            }
            else
            {
                // Hexadecimal
                if (passPhrase.length > 64 )
                {
                    alert('Too many characters in Pass-phrase!\n' +
                        'Please enter 64 Hexadecimal or 8~63 ASCII characters as Pass-phrase.\n' +
                        'DO NOT INCLUDE SPACE CHARACTERS!');
                    passPhraseId.select();
                    passPhraseId.focus();
                    return false;
                }
            }
            if(checkInjection(passPhrase) == false)
            {
                alert('Pass-phrase has white space characters!\n' +
                    'Please enter 8~63 ASCII or 64 Hexadecimal characters as Pass-phrase.\n' +
                    'DO NOT INCLUDE SPACE CHARACTERS!');
                passPhraseId.select();
                passPhraseId.focus();
                return false;
            }
        }
        else
        {
            alert('Invalid security settings!\n'+
                'Please select valid Authentication Mode and Encryption Type.');
            authModeSel.focus();
            return false;
        }
        return true;
    }

    function validate_ssid()
    {
        var ssidInp = document.getElementById("add_bss_ssid_inp_text");
        var ssid = ssidInp.value;
        if(ssid.length == 0)
        {
            alert('SSID is empty!\n' +
                'Please enter SSID with 1 to 32 characters.\n' +
                'DO NOT INCLUDE SPACE CHARACTERS!');
            ssidInp.select();
            ssidInp.focus();
            return false;
        }
        if(ssid.length > 32)
        {
            alert('Too many characters in SSID!\n' +
                'Please enter SSID with 1 to 32 characters.\n' +
                'DO NOT INCLUDE SPACE CHARACTERS!');
            ssidInp.select();
            ssidInp.focus();
            return false;
        }
        if (ssid.indexOf(",") >= 0 )
		{
			alert("SSID cannot contain commas.");
			ssidInp.select();
	    	ssidInp.focus();
	    	return false;
		}
		if (ssid.indexOf("\"") >= 0 )
		{
			alert("SSID cannot contain double quotation marks.");
			ssidInp.select();
	    	ssidInp.focus();
	    	return false;
		}
		if (ssid.indexOf("'") >= 0 )
		{
			alert("SSID cannot contain single quotation marks.");
			ssidInp.select();
	    	ssidInp.focus();
	    	return false;
		}
        if(checkInjection(ssid) == false)
        {
            alert('SSID has white space characters!\n' +
                'Please enter SSID with 1 to 32 characters.\n'+
                'DO NOT INCLUDE SPACE CHARACTERS!');
            ssidInp.select();
            ssidInp.focus();
            return false;
        }
        return true;
    }

    function validate_al_mac()
    {
        var alMacInp = document.getElementById('add_bss_almac_inp_text');
        //var macRegExp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
        if (!macRegExp.test(alMacInp.value)) 
        {
            alert("Please fill AL-MAC in correct format! (XX:XX:XX:XX:XX:XX)");
            alMacInp.focus();
            alMacInp.select();
            return false;
        }
        return true;
    }

    function validate_all()
    {
        if (validate_al_mac() &&
            validate_ssid() &&
            validate_security())
        {
            var fhChbox = document.getElementById('add_bss_fh_cbox');
            var fhHdInp = document.getElementById('add_bss_fh_hid_inp');
            var bhChbox = document.getElementById('add_bss_bh_cbox');
            var bhHdInp = document.getElementById('add_bss_bh_hid_inp');
            var isSsidHiddenChbox = document.getElementById('add_bss_is_ssid_hidden_cbox');
            var isSsidHiddenHdInp = document.getElementById('add_bss_is_ssid_hidden_hid_inp');
            fhChbox.checked ? fhHdInp.value = "1" : fhHdInp.value = "0";
            bhChbox.checked ? bhHdInp.value = "1" : bhHdInp.value = "0";
            isSsidHiddenChbox.checked ? isSsidHiddenHdInp.value = "hidden-Y" : isSsidHiddenHdInp.value = "hidden-N";
            //document.getElementById('bss_cfgs_display').style.display = 'none';
            //document.getElementById('bss_cfgs_loading_div').style.display = '';
            return true;
        }
        return false;
    }

    function AuthModeOnChange(authModeCode)
    {
        var encTypeSel = document.getElementById('add_bss_enc_type_sel');
        switch(authModeCode)
        {
            case "0x0001":  // OPEN
                for (var idx=0; idx < encTypeSel.length; idx++) 
                {
                    // NONE
                    if (encTypeSel.options[idx].value == '0x0001')
                    {
                        encTypeSel.options[idx].selected = true;
                        encTypeSel.options[idx].disabled = false;
                    }
                    else
                    {
                        encTypeSel.options[idx].selected = false;
                        encTypeSel.options[idx].disabled = true;
                    }
                }
                break;
            case "0x0002": // WPA1 - Personal
            case "0x0020": // WPA2 - Personal
            case "0x0022": // WPA1WPA2
                for (var idx=0; idx < encTypeSel.length; idx++) 
                {
                    // AES
                    if (encTypeSel.options[idx].value == '0x0008' || encTypeSel.options[idx].value == '0x0004' || encTypeSel.options[idx].value == '0x000c')
                    {
                        encTypeSel.options[idx].selected = true;
                        encTypeSel.options[idx].disabled = false;
                    }
                    else
                    {
                        encTypeSel.options[idx].selected = false;
                        encTypeSel.options[idx].disabled = true;
                    }
                }
                break;
            default:
                console.log("AuthModeOnChange: unknown Authentication Code: ",authModeCode);
        }
        EncryptionTypeOnChange(encTypeSel.value);
    }

    function EncryptionTypeOnChange(encType)
    {
        var passPhraseInp = document.getElementById('add_bss_pass_phrase_inp_text');
        passPhraseInp.value = '';
        switch(encType)
        {
            case "0x0001": // NONE
                passPhraseInp.parentNode.parentNode.style.display = 'none';
                break;
            case "0x0004": // TKIP
            case "0x0008": // AES
            case "0x000c": // TKIPAES
                passPhraseInp.parentNode.parentNode.style.display = '';
                break;
            default:
                return "Unknown Encryption Code: " + encType;
        }
    }

    function addNewBssCfgs()
    {
        document.getElementById('add_bss_cfgs_form').style.display = '';
        //document.getElementById('add_bss_cfgs_fields_tbody').style.display = 'none';
        var alMacInp = document.getElementById('add_bss_almac_inp_text');
        alMacInp.value = '';
        alMacInp.readOnly = false;
        var bandSel = document.getElementById('add_bss_band_sel');
        for (var idx=0; idx < bandSel.length; idx++) 
        {
            bandSel.options[idx].disabled = false;
        }
        bandSel.selectedIndex = 0;
        document.getElementById('add_bss_cfgs_validate_almac_band_div').style.display = '';
        document.getElementById('add_bss_cfgs_form_submit_div').style.display = 'none';
    }

    function addBssPreConditionCheck()
    {
        var bandSel = document.getElementById('add_bss_band_sel');
        var alMacInp = document.getElementById('add_bss_almac_inp_text');
        if (!validate_al_mac()) 
        {
            return;
        }
        addBssCfg(alMacInp.value,bandSel.value);
    }

    function addBssCfg(alMac,band)
    {
        /* Value of __IS_EDIT should be set to 1 only by onClick Edit button Action. */
        document.getElementById('edit_bss_hid_inp').value = "0";
        document.getElementById('edit_bss_ssid_hid_inp').value = '';
        document.getElementById('edit_bss_auth_mode_hid_inp').value = '';
        document.getElementById('edit_bss_enc_type_hid_inp').value = '';
        document.getElementById('edit_bss_pass_phrase_hid_inp').value = '';
        document.getElementById('edit_bss_bh_support_hid_inp').value = '';
        document.getElementById('edit_bss_fh_support_hid_inp').value = '';
        document.getElementById('edit_bss_is_ssid_hidden_hid_inp').value = '';
        //document.getElementById('bss_cfgs_display').style.display = 'none';
        //document.getElementById('bss_cfgs_loading_div').style.display = '';
        document.getElementById('Add_Flag').value = 1;
        document.getElementById('Edit_Flag').value = 0;
        document.getElementById('Remove_Flag').value = 0;

		var x_response = JSO_validate_add_easymesh_bss_req(alMac,band);
    	{
            try
            {
                var r = JSON.parse(x_response);
                if(r['status'] == 'SUCCESS')
                {
                    document.getElementById('add_bss_cfgs_form').style.display = '';
                    //document.getElementById('add_bss_cfgs_fields_tbody').style.display = '';
                    var alMacInp = document.getElementById('add_bss_almac_inp_text');
                    alMacInp.value = alMac;
                    alMacInp.readOnly = true;
                    var bandSel = document.getElementById('add_bss_band_sel');
                    for (var idx=0; idx < bandSel.length; idx++) 
                    {
                        if (bandSel.options[idx].value == band)
                        {
                            bandSel.options[idx].selected = true;
                            bandSel.options[idx].disabled = false;
                        }
                        else
                        {
                            bandSel.options[idx].selected = false;
                            bandSel.options[idx].disabled = true;
                        }
                    }
                    document.getElementById('add_bss_ssid_inp_text').value = '';
                    document.getElementById('add_bss_auth_mode_sel').selectedIndex = 0;
                    document.getElementById('add_bss_enc_type_sel').selectedIndex = 0;
                    document.getElementById('add_bss_pass_phrase_inp_text').value = '';
                    document.getElementById('add_bss_bh_cbox').checked = false;
                    document.getElementById('add_bss_fh_cbox').checked = false;
                    document.getElementById('add_bss_is_ssid_hidden_cbox').checked = false;
                    AuthModeOnChange(document.getElementById('add_bss_auth_mode_sel').value);
                    document.getElementById('add_bss_cfgs_validate_almac_band_div').style.display = 'none';
                    document.getElementById('add_bss_cfgs_form_submit_div').style.display = '';
                }
                else
                {
                    alert('No more BSS could be added in ' +
                        (band == '8x' ? '2G' : band == '11x' ? '5GL' : '5GH') +
                        ' band of Device with AL-MAC ' + alMac + ' !\nStatus: ' + r['status']);
                    location.reload(true);
                }
            }
            catch(e)
            {
                alert("Failed to add a new BSS!\nERROR: Incorrect response received!");
                console.log("Failed to add a new BSS!\nERROR: [" + e.name + "] " + e.message);
                location.reload(true);
            }
            finally
            {
                //document.getElementById('bss_cfgs_display').style.display = '';
                //document.getElementById('bss_cfgs_loading_div').style.display = 'none';
            }
        }
    }

    function editBssCfg(alMac,band,bssInfoGrpObj,btnIdStr)
    {
        var bssInfo;
        var bssIdx;
        if(typeof(btnIdStr) == 'string')
        {
            var bssIdxArr = btnIdStr.match(/\d{1,}$/);
            if(bssIdxArr)
            {
                bssIdx = bssIdxArr[0];
            }
        }
        if(typeof(bssIdx) == 'string' && typeof(bssInfoGrpObj) == 'object')
        {
            bssInfo = bssInfoGrpObj[bssIdx];
        }
        if(typeof(bssInfo) != 'object' ||
            !bssInfo.hasOwnProperty('ssid') ||
            !bssInfo.hasOwnProperty('authMode') ||
            !bssInfo.hasOwnProperty('encType') ||
            !bssInfo.hasOwnProperty('passPhrase') ||
            !bssInfo.hasOwnProperty('isBhBssSupported') ||
            !bssInfo.hasOwnProperty('isFhBssSupported') ||
            !bssInfo.hasOwnProperty('isHidden'))
        {
            alert('BSS could not be edited!\nIt does not have all required information to edit!');
            location.reload(true);
            return;
        }
        document.getElementById('add_bss_cfgs_form').style.display = '';
        //document.getElementById('add_bss_cfgs_fields_tbody').style.display = '';
        var alMacInp = document.getElementById('add_bss_almac_inp_text');
        alMacInp.value = alMac;
        alMacInp.readOnly = true;
        alMacInp.disabled = true;
        var bandSel = document.getElementById('add_bss_band_sel');
        for (var idx=0; idx < bandSel.length; idx++) 
        {
            if (bandSel.options[idx].value == band)
            {
                bandSel.options[idx].selected = true;
                bandSel.options[idx].disabled = false;
                document.getElementById('add_bss_band_sel_hid').value = idx;
            }
            else
            {
                bandSel.options[idx].selected = false;
                bandSel.options[idx].disabled = true;
            }
        }
        bandSel.disabled = true;
        
        var bandValDiv= document.getElementById('add_bss_band_val_div');
        switch(band)
        {
    		case "8x":
    			bandValDiv.innerHTML = "2G";
    			break;
    		case "11x":
    		case "12x":
    			bandValDiv.innerHTML = "5G";
    			break;
    		default:
    			bandValDiv.innerHTML = "";
    			break;
        }
        
        document.getElementById('add_bss_ssid_inp_text').value = bssInfo['ssid'];
        document.getElementById('add_bss_ssid_inp_text_hid').value = bssInfo['ssid'];
        var authModeSel = document.getElementById('add_bss_auth_mode_sel');
        for (var idx=0; idx < authModeSel.length; idx++) 
        {
            if (authModeSel.options[idx].value == bssInfo['authMode'])
            {
                authModeSel.options[idx].selected = true;
            }
            authModeSel.options[idx].disabled = false;
        }
        AuthModeOnChange(authModeSel.value);
        var encTypeSel = document.getElementById('add_bss_enc_type_sel');
        for (var idx=0; idx < encTypeSel.length; idx++) 
        {
			if (encTypeSel.options[idx].value == bssInfo['encType'])
    		{
        		encTypeSel.options[idx].selected = true;
        		encTypeSel.options[idx].disabled = false;
        	}
        }
        EncryptionTypeOnChange(encTypeSel.value);
        // Populate Pass-phrase field only when EncryptionType is not NONE.
        if(encTypeSel.value != '0x0001')
        {
            document.getElementById('add_bss_pass_phrase_inp_text').value = bssInfo['passPhrase'];
        }
        document.getElementById('add_bss_is_ssid_hidden_cbox').checked = (bssInfo['isHidden'] == 'hidden-Y') ? true : false;
        document.getElementById('add_bss_bh_cbox').checked = (parseInt(bssInfo['isBhBssSupported']) == 1) ? true : false;
        document.getElementById('add_bss_fh_cbox').checked = (parseInt(bssInfo['isFhBssSupported']) == 1) ? true : false;
        /* Value of __IS_EDIT should be set to 1 here. */
        document.getElementById('edit_bss_hid_inp').value = "1";
        document.getElementById('edit_bss_ssid_hid_inp').value = bssInfo['ssid'];
        document.getElementById('edit_bss_auth_mode_hid_inp').value = bssInfo['authMode'];
        document.getElementById('edit_bss_enc_type_hid_inp').value = bssInfo['encType'];
        document.getElementById('edit_bss_pass_phrase_hid_inp').value = bssInfo['passPhrase'];
        document.getElementById('edit_bss_is_ssid_hidden_hid_inp').value = bssInfo['isHidden'];
        document.getElementById('edit_bss_bh_support_hid_inp').value = bssInfo['isBhBssSupported'];
        document.getElementById('edit_bss_fh_support_hid_inp').value = bssInfo['isFhBssSupported'];
        document.getElementById('edit_remove_bss_bssindex_hid_inp').value = bssInfo['NodeIndex'];
        document.getElementById('add_bss_cfgs_validate_almac_band_div').style.display = 'none';
        document.getElementById('add_bss_cfgs_form_submit_div').style.display = '';
        document.getElementById('Add_Flag').value = 0;
        document.getElementById('Edit_Flag').value = 1;
        document.getElementById('Remove_Flag').value = 0;
        window.scrollTo(0, 0);
    }

    function removeBssCfg(alMac,band,bssInfoGrpObj,btnIdStr)
    {
        var bssInfo;
        var bssIdx;
        if(typeof(btnIdStr) == 'string')
        {
            var bssIdxArr = btnIdStr.match(/\d{1,}$/);
            if(bssIdxArr)
            {
                bssIdx = bssIdxArr[0];
            }
        }
        if(typeof(bssIdx) == 'string' && typeof(bssInfoGrpObj) == 'object')
        {
            bssInfo = bssInfoGrpObj[bssIdx];
        }
        if(!alMac ||
            !band ||
            !bssInfo ||
            !bssInfo['ssid'] ||
            !bssInfo['authMode'] ||
            !bssInfo['encType'] ||
            !bssInfo['passPhrase'] ||
            !bssInfo['isBhBssSupported'] ||
            !bssInfo['isFhBssSupported'] ||
            !bssInfo['isHidden'])
        {
            console.log('Failed to remove BSS!\nERROR: BSSINFO is incorrect!\nbssInfo=',bssInfo);
            alert('Failed to remove BSS!\nERROR: BSSINFO is incorrect!');
            return;
        }
        //document.getElementById('bss_cfgs_display').style.display = 'none';
        //document.getElementById('bss_cfgs_loading_div').style.display = '';

        document.cbi._alMac.value = alMac;
        document.cbi._band.value = band;
        document.cbi._ssid.value = bssInfo['ssid'];
        document.cbi._authMode.value = bssInfo['authMode'];
        document.cbi._encType.value = bssInfo['encType'];
        document.cbi._passPhrase.value = bssInfo['passPhrase'];
        document.cbi._isBhBssSupported.value = bssInfo['isBhBssSupported'];
        document.cbi._isFhBssSupported.value = bssInfo['isFhBssSupported'];
        document.cbi._isHidden_ssid.value = bssInfo['isHidden'];
        document.cbi._edit_removeNodeIndex.value = bssInfo['NodeIndex'];
        
        document.cbi.Add_Flag.value = 0;
        document.cbi.Edit_Flag.value = 0;
        document.cbi.Remove_Flag.value = 1;
        
        if(SetCtlValue())
        {
        	formSubmit();
        }
        else
        {
        	alert("Failed to remove BSS!\nError: BSS is not exist !\n");
        	//document.getElementById('bss_cfgs_display').style.display = '';
        	//document.getElementById('bss_cfgs_loading_div').style.display = 'none';
        }
    }

    function get_auth_mode_str(authModeCode)
    {
        switch(authModeCode)
        {
            case "0x0001":
                return "OPEN";
            case "0x0020":
                return "WPA2-PSK";
            case "0x0002":
                return "WPA-PSK";
            case "0x0022":
                return "WPA-PSK/WPA2-PSK";
            default:
                return "Unknown Authentication Code: " + authModeCode;
        }
    }

    function get_encryption_str(encryptionCode)
    {
        switch(encryptionCode)
        {
            case "0x0001":
                return "NONE";
            case "0x0008":
                return "AES";
            case "0x0004":
                return "TKIP";
            case "0x000c":
                return "TKIP/AES";
            default:
                return "Unknown Encryption Code: " + encryptionCode;
        }
    }

	function get_band_str(bandCode)
    {
        switch(bandCode)
        {
            case "8x":
                return "2G";
            case "11x":
            case "12x":
                return "5G";
            default:
                return "Unknown Band Code: " + bandCode;
        }
    }
    
    function get_band_str2(bandCode)
    {
        switch(bandCode)
        {
            case "8x":
                return "2G";
            case "11x":
                return "5GL";
            case "12x":
                return "5GH";
            default:
                return "Unknown Band Code: " + bandCode;
        }
    }

    function set_rowspan_auth_mode(o)
    {
        var rowspan = 0;
        for(var k in o)
        {
            var v = o[k];
            if(k=="isBhBssSupported" || k=="isFhBssSupported" || k=="NodeIndex")
            {
        		continue;
        	}
            if(((typeof v) == "object") && v != null)
            {
                rowspan = rowspan + set_rowspan_auth_mode(v);
            }
            else
            {
                /* Pass-phrase row is not required for OPEN/NONE Security. */
                if(k != 'passPhrase' || !(o['authMode'] == '0x0001' && o['encType'] == '0x0001'))
                {
                	if((k != 'NodeIndex'))
                	{
                		rowspan++;
                	}
                }
            }
        }
        return rowspan;
    }

    function draw_bssinfo_cells(alMacTbl, row, alMac, band, bssInfoGrpObj)
    {
        var cell,s,t,i;
        for(var bssIdx in bssInfoGrpObj)
        {
            var bssInfo = bssInfoGrpObj[bssIdx];
            var bssRowSpan = set_rowspan_auth_mode(bssInfo);
            /* BSS-Idx */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            cell.rowSpan = bssRowSpan;
            s = document.createElement('STRONG');
            t = document.createTextNode(get_band_str(band) +' : BSS-' + bssIdx);
            s.appendChild(t);
            cell.appendChild(s);

            /* SSID Key */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            s = document.createElement('STRONG');
            t = document.createTextNode('SSID');
            s.appendChild(t);
            cell.appendChild(s);

            /* SSID Value */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            t = document.createTextNode(bssInfo['ssid']);
            cell.appendChild(t);

            /* Action Button : Edit BSS */
            /*cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            cell.rowSpan = bssRowSpan;
            i = document.createElement('button');
            i.setAttribute("class", "btn-file");
            i.setAttribute("type", "button");
            i.setAttribute("id", "edit-bss-" + alMac + '-' + band + '-' + bssIdx);
            i.innerHTML = "Edit BSS";
            if (document.addEventListener) 
            {
                // For all major browsers, except IE 8 and earlier
                i.addEventListener("click", function(){editBssCfg(alMac,band,bssInfoGrpObj,this.id);});
            } else if (document.attachEvent) {
                // For IE 8 and earlier versions
                i.attachEvent("onclick", function(){editBssCfg(alMac,band,bssInfoGrpObj,this.id);});
            }
            cell.appendChild(i);*/

            /* AuthMode Key */
            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            s = document.createElement('STRONG');
            t = document.createTextNode('Authentication Mode');
            s.appendChild(t);
            cell.appendChild(s);

            /* AuthMode Value */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            t = document.createTextNode(get_auth_mode_str(bssInfo['authMode']));
            cell.appendChild(t);

            /* Encryption Type Key */
            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            s = document.createElement('STRONG');
            t = document.createTextNode('Encryption Type');
            s.appendChild(t);
            cell.appendChild(s);

            /* Encryption Type Value */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            t = document.createTextNode(get_encryption_str(bssInfo['encType']));
            cell.appendChild(t);

            /* Pass-phrase row will not be inserted for OPEN/NONE Security. */
            if (!(bssInfo['authMode'] == '0x0001' && bssInfo['encType'] == '0x0001'))
            {
                /* Pass-phrase Key */
                row = alMacTbl.insertRow(-1);
                row.setAttribute("class", "table-content-fist center");
                cell = row.insertCell(-1);
                cell.setAttribute("class", "text-center border border-dark");
                s = document.createElement('STRONG');
                //t = document.createTextNode('Pass-phrase');
                t = document.createTextNode('WPAPSK');
                s.appendChild(t);
                cell.appendChild(s);

                /* Pass-phrase Value */
                cell = row.insertCell(-1);
                cell.setAttribute("class", "text-center border border-dark");
                t = document.createTextNode(bssInfo['passPhrase']);
                cell.appendChild(t);
            }

            /* Hidden SSID Key */
            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            s = document.createElement('STRONG');
            t = document.createTextNode('Hidden');
            s.appendChild(t);
            cell.appendChild(s);

            /* Hidden SSID Value */
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            t = document.createTextNode(bssInfo['isHidden'] == 'hidden-Y' ? 'Enabled' : 'Disabled');
            cell.appendChild(t);

            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
        }
        /* Action Button : Add BSS */
       	row.style.display  = "none";
        cell = row.insertCell(-1);
        cell.setAttribute("class", "text-center border border-dark");
        /* (1)BSS-Idx (2)BSS-Key (3)BSS-Value (4)Edit (5)Remove
         *  First cell is Band and the below Add BSS button will be placed at second cell with colspan of 5.
         */
        
        cell.colSpan = 5;
        i = document.createElement('INPUT');
        i.setAttribute("class", "cbi-button cbi-button-add");
        i.setAttribute("type", "button");
        i.setAttribute("value", "Add BSS");
        if (document.addEventListener) {
            // For all major browsers, except IE 8 and earlier
            i.addEventListener("click", function(){addBssCfg(alMac,band);});
        } else if (document.attachEvent) {
            // For IE 8 and earlier versions
            i.attachEvent("onclick", function(){addBssCfg(alMac,band);});
        }
        cell.appendChild(i);
        
    }

    function draw_easymesh_bss_overview_table(alMac, alMacInfo)
    {
        var cfgBssInfoHdrFset = document.getElementById('cfg_bss_info_hdr_fset');
        var bssCfgOverviewDiv = document.getElementById('bss_overview_div');
        var alMacTbl = document.createElement("TABLE");
        alMacTbl.setAttribute("style", "width:100%")
        var row = alMacTbl.insertRow(-1);
        row.setAttribute("class", "table-content-fist center");
        var cell = row.insertCell(-1);
        /* (1)Band (2)BSS-Idx (3)BSS-Key (4)BSS-Value (5)Edit (6)Remove */
        cell.colSpan = 6;
        cell.setAttribute("class", "text-center border border-dark");
        var b = document.createElement('BIG');
        var s = document.createElement('STRONG');
        /*var t = document.createTextNode('AL-MAC: ' + alMac);*/
       	var t = document.createTextNode('Backhaul BSS');
        s.appendChild(t);
        b.appendChild(s);
        cell.appendChild(b);
        /* 2G Band */
        if(alMacInfo.hasOwnProperty('8x'))
        {
            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            cell.rowSpan = set_rowspan_auth_mode(alMacInfo['8x']); // One more row is required for 'Add New BSS' button.
            s = document.createElement('STRONG');
            t = document.createTextNode('2G');
            s.appendChild(t);
            cell.appendChild(s);
            draw_bssinfo_cells(alMacTbl, row, alMac, '8x', alMacInfo['8x']);
        }
        /* 5GL Band */
        if(alMacInfo.hasOwnProperty('11x'))
        {
            row = alMacTbl.insertRow(-1);
            row.setAttribute("class", "table-content-fist center");
            cell = row.insertCell(-1);
            cell.setAttribute("class", "text-center border border-dark");
            cell.rowSpan = set_rowspan_auth_mode(alMacInfo['11x']); // One more row is required for 'Add New BSS' button.
            s = document.createElement('STRONG');
            //t = document.createTextNode('5GL');
            t = document.createTextNode('5G');
            s.appendChild(t);
            cell.appendChild(s);
            draw_bssinfo_cells(alMacTbl, row, alMac, '11x', alMacInfo['11x']);
        }

        bssCfgOverviewDiv.appendChild(alMacTbl);
        cfgBssInfoHdrFset.style.display = '';
        //cfgBssInfoHdrFset.setAttribute("style", "width: 450; padding: 0");
    }

    function get_easymesh_bss_overview_info()
    {
        var cfgsJs = {};
        cfgsJs['distinctAlMacCfgs'] = {};
        cfgsJs['wildCardAlMacCfgs'] = {};
        var tmpMac,tmpband,i,j,k,tmpIndex,tmpBssCount,tmpNodeIndex,tmpBssInfoIndex;
				var tmpbssEnable="",tmpalMac="",tmpband="",tmpssid="",tmpauthMode="",tmpencType="",tmppassPhrase="",tmpisBhBssSupported="",tmpisFhBssSupported="",tmpisHidden_ssid="",tmpNodeIndex="";
				var al_mac_2g = "<% tcWebApi_get("Mesh_radio2gbssinfo","AL-MAC","s") %>";
				var al_mac_5gl = "<% tcWebApi_get("Mesh_radio5glbssinfo","AL-MAC","s") %>";
				var al_mac_5gh = "<% tcWebApi_get("Mesh_radio5ghbssinfo","AL-MAC","s") %>";
				var band_2g = "8x";
				var band_5gl = "11x";
				var band_5gh = "12x";
				
				tmpBssCount = 0;
				tmpBssInfoIndex = 0;
       	{
   				tmpBssInfoIndex=1;
								
					var vArrayStr = "<% tcWebApi_get("WLan_Entry1","EnableSSID","s") %>";
					if((vArrayStr != "N/A") && (parseInt(vArrayStr) > 0))
					{
						tmpbssEnable = tmpbssEnable + ',' + vArrayStr;
						tmpalMac = tmpalMac + ',' + al_mac_2g;
						tmpband = tmpband + ',' + band_2g;
						var vArrayStr = "<% tcWebApi_get("WLan_Entry1","SSID","s") %>";
						tmpssid = tmpssid + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan_Entry1","AuthMode","s") %>";
						tmpauthMode = tmpauthMode + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan_Entry1","EncrypType","s") %>";
						tmpencType = tmpencType + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan_Entry1","WPAPSK","s") %>";
						tmppassPhrase = tmppassPhrase + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","BackHaul","s") %>";
						tmpisBhBssSupported = tmpisBhBssSupported + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("Mesh_radio2gbssinfo_entry1","FrontHaul","s") %>";
						tmpisFhBssSupported = tmpisFhBssSupported + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan_Entry1","HideSSID","s") %>";
						tmpisHidden_ssid = tmpisHidden_ssid + ',' + vArrayStr;
						tmpNodeIndex = tmpNodeIndex + ',' + tmpBssInfoIndex;
						tmpBssCount++;
					}

			
					tmpBssInfoIndex=1;
					
					var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","EnableSSID","s") %>";
					if((vArrayStr != "N/A") && (parseInt(vArrayStr) > 0))
					{
						tmpbssEnable = tmpbssEnable + ',' + vArrayStr;
						tmpalMac = tmpalMac + ',' + al_mac_5gl;
						tmpband = tmpband + ',' + band_5gl;
						var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","SSID","s") %>";
						tmpssid = tmpssid + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","AuthMode","s") %>";
						tmpauthMode = tmpauthMode + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","EncrypType","s") %>";
						tmpencType = tmpencType + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","WPAPSK","s") %>";
						tmppassPhrase = tmppassPhrase + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","BackHaul","s") %>";
						tmpisBhBssSupported = tmpisBhBssSupported + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("Mesh_radio5glbssinfo_entry1","FrontHaul","s") %>";
						tmpisFhBssSupported = tmpisFhBssSupported + ',' + vArrayStr;
						var vArrayStr = "<% tcWebApi_get("WLan11ac_Entry1","HideSSID","s") %>";
						tmpisHidden_ssid = tmpisHidden_ssid + ',' + vArrayStr;
						tmpNodeIndex = tmpNodeIndex + ',' + tmpBssInfoIndex;
						tmpBssCount++;
					}
       	}

		/*bssEnable*/
		var vbssEnable = tmpbssEnable.split(',');
		/*alMac*/
		var valMac = tmpalMac.split(',');
		/*band*/
		var vband = tmpband.split(',');
		/*ssid*/
		var vssid = tmpssid.split(',');
		/*authMode*/
		var vauthMode = tmpauthMode.split(',');
		/*encType*/
		var vencType = tmpencType.split(',');
		/*passPhrase*/
		var vpassPhrase = tmppassPhrase.split(',');
		/*isBhBssSupported*/
		var visBhBssSupported = tmpisBhBssSupported.split(',');
		/*isFhBssSupported*/
		var visFhBssSupported = tmpisFhBssSupported.split(',');
		/*isHidden_ssid*/
		var visHidden_ssid = tmpisHidden_ssid.split(',');
		/*NodeIndex*/
		var vNodeIndex = tmpNodeIndex.split(',');

		for(i=0;i<vbssEnable.length;i++)
		{
			tmpMac = valMac[i];
			tmpband = vband[i];

			if (macRegExp.test(tmpMac))
			{
				tmpMac = tmpMac.toUpperCase();
				if(tmpMac == "FF:FF:FF:FF:FF:FF")
				{
					/* wildCardAlMacCfgs */
					if(cfgsJs['wildCardAlMacCfgs'][tmpMac] == null)
					{
							cfgsJs['wildCardAlMacCfgs'][tmpMac] = {};
					}
					if(cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband] == null)
					{
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband] = {};
					}
					for(j=0; j<tmpBssCount; j++)
					{
						tmpIndex = j + 1;
						if(cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex] == null)
						{
							var tb_authMode = "";
							var tb_encType = "";
							var tb_isHidden = "hidden-N";

							tb_authMode = get_auth_mode_str2val(vauthMode[i]);
							tb_encType = get_encryption_str2val(vencType[i]);
							if('0x0001' == tb_authMode)
							{
									tb_encType = '0x0001';
									vpassPhrase[i] = '';
							}

							if(("hidden-Y" == visHidden_ssid[i]) || ("1" == visHidden_ssid[i]))
							{
									tb_isHidden = "hidden-Y";
							}

							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex] = {};
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['ssid'] = vssid[i];
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['authMode'] = tb_authMode;
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['encType'] = tb_encType;
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['passPhrase'] = vpassPhrase[i];
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isFhBssSupported'] = visFhBssSupported[i];
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isBhBssSupported'] = visBhBssSupported[i];
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isHidden'] = tb_isHidden;
							cfgsJs['wildCardAlMacCfgs'][tmpMac][tmpband][tmpIndex]['NodeIndex'] = vNodeIndex[i];
							break;
						}
					}
				}
				else
				{
					continue;/* only support wildCardAlMacCfgs */

					/* distinctAlMacCfgs */
					if(cfgsJs['distinctAlMacCfgs'][tmpMac] == null)
					{
						cfgsJs['distinctAlMacCfgs'][tmpMac] = {};
					}
					if(cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband] == null)
					{
						cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband] = {};
					}
					for(j=0; j<tmpBssCount; j++)
					{
						tmpIndex = j + 1;
						if(cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex] == null)
						{
							var tb_authMode = "";
							var tb_encType = "";
							var tb_isHidden = "hidden-N";

							tb_authMode = get_auth_mode_str2val(vauthMode[i]);
							tb_encType = get_encryption_str2val(vencType[i]);
							if('0x0001' == tb_authMode)
							{
									tb_encType = '0x0001';
									vpassPhrase[i] = ''
							}
							
							if(("hidden-Y" == visHidden_ssid[i]) || ("1" == visHidden_ssid[i]))
							{
									tb_isHidden = "hidden-Y";
							}

							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex] = {};
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['ssid'] = vssid[i];
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['authMode'] = tb_authMode;
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['encType'] = tb_encType;
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['passPhrase'] = vpassPhrase[i];
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isFhBssSupported'] = visFhBssSupported[i];
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isBhBssSupported'] = visBhBssSupported[i];
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['isHidden'] = tb_isHidden;
							cfgsJs['distinctAlMacCfgs'][tmpMac][tmpband][tmpIndex]['NodeIndex'] = vNodeIndex[i];
							break;
						}
					}
				}
			}
		}

        return cfgsJs;
    }

    function gen_easymesh_bss_overview_table()
    {
        var cfgsJs = get_easymesh_bss_overview_info();
        cfgsJs_global = cfgsJs;
        var isCfgJsEmpty = true;
        if(cfgsJs.hasOwnProperty('distinctAlMacCfgs'))
        {
            for(var alMac in cfgsJs['distinctAlMacCfgs'])
            {
                draw_easymesh_bss_overview_table(alMac, cfgsJs['distinctAlMacCfgs'][alMac]);
                isCfgJsEmpty = false;
            }
        }
        if(cfgsJs.hasOwnProperty('wildCardAlMacCfgs'))
        {
            for(var alMac in cfgsJs['wildCardAlMacCfgs'])
            {
                draw_easymesh_bss_overview_table(alMac, cfgsJs['wildCardAlMacCfgs'][alMac]);
                isCfgJsEmpty = false;
            }
        }
        if(isCfgJsEmpty)
        {
            document.getElementById('cfg_bss_info_hdr_fset').style.display = 'none';
            document.getElementById('no_bss_cfg_msg_div').style.display = '';
        }
    }
    
    function checkWebStatus()
	{
		location.href = '/cgi-bin/true-page/advance/advance-wlan-easymesh-bss-cfg-backhaul.asp';
	}

    function webStateCheck()
    {
    	var checkBackHaulBssFlag;
    	var webstate = "0";
    	if(1 == parseInt(webstate))
    	{
    		setTimeout(checkWebStatus, 5000);
    	}
    	else
    	{
    		clearTimeout(checkWebStatus);
    		gen_easymesh_bss_overview_table();
			checkBackHaulBssFlag = checkBackHaulBssCount();
    	}
    }

    webStateCheck();
    
	function formSubmit()
	{
		if(document.cbi != null)
		{
			if(1 == getValue('Save_Flag'))
			{
				setText('webwait_Flag', 1);
				document.cbi.submit();
			}
		}
	}
	function SetCtlValue()
	{
		var macRegExp = /[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}:[A-Fa-f0-9]{2}/;
		/*BssInfoCount, alMac, band, ssid, authMode, encType, passPhrase, isBhBssSupported, isFhBssSupported*/
		var vBssInfoCount = "<% tcWebApi_get("Mesh_common","BssInfoCount","s") %>";

		if((0 == getValue('Add_Flag')) && (1 == getValue('Edit_Flag')) && (0 == getValue('Remove_Flag')))
		{
			var _edit_removeNodeIndex = document.cbi.__EDIT_REMOVE_BSSINDEX.value;
			var tmpNodeIndex = parseInt(_edit_removeNodeIndex);
			if((tmpNodeIndex < 1) || (tmpNodeIndex > 48))
			{
				setText('Edit_Flag', 0);
				setText('Save_Flag', 0);
				return 0;
			}
			else
			{
				var isSsidHiddenChbox = document.cbi.add_bss_is_ssid_hidden_cbox;
				var band_val = document.cbi.add_bss_band_sel.value;
				var authMode_val = document.cbi.authMode.value;
				var encType_val = document.cbi.encType.value;

				authMode_val = get_auth_mode_val2str(authMode_val);
				encType_val = get_encryption_val2str(encType_val);					
				if(isSsidHiddenChbox.checked)
				{
					setText('isHidden', "1");
				}
				else
				{
					setText('isHidden', "0");
				}
				setText('_band', band_val);
				setText('_authMode', authMode_val);
				setText('_encType', encType_val);
				setText('_edit_removeNodeIndex', tmpNodeIndex);
				setText('Save_Flag', 1);
				return 1;
			}						
		}
			
	}

	function bss_Save()
	{
		if(document.cbi != null)
		{
			if((0 == getValue('Edit_Flag')) && (0 == getValue('Remove_Flag')))
			{
				setText('Add_Flag', 1);
			}
			if(validate_all())
			{
				SetCtlValue();
				formSubmit();
			}
		}
	}
  </SCRIPT>
</body>
</html>