<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - PON</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <SCRIPT language=JavaScript type=text/javascript>
  var onuStatus="<% tcWebApi_get("XPON_LinkCfg","OnuStatus","s") %>";
  var LoidAuthStatus="<% tcWebApi_get("XPON_LinkCfg","LoidAuthStatus","s") %>";
  var OnuID="<% tcWebApi_get("XPON_LinkCfg","OnuID","s") %>";
  function transTemperature(temperature)
	{
		var temp = Number(temperature);
		if(temp < 100){
			return temp;
		}
		if (temp >= Math.pow(2, 15)){
			return -Math.round((Math.pow(2, 16)-temp)/256);
		}else{
			return Math.round(temp/256);
		}
	}			
		
	function PonInfoClass()
	{
		this.LinkSta					= '<% tcWebApi_get("XPON_LinkCfg","LinkSta","s") %>';
		this.trafficstate			= '<% tcWebApi_get("XPON_Common","trafficStatus","s") %>';
		this.fecState					= '<% tcWebApi_get("Info_PonPhy","FecStatus","s") %>';
		this.ponType					= '<% tcWebApi_get("XPON_Common","xponMode","s") %>';
		this.loidStatus				= 'init';
		this.PonState 				= 'down';
		this.FECEnable 				= '-';
		this.WarnInfo 				= 'disconnect';
		this.PonSendPkt 			= '<% tcWebApi_get("Info_PonWanStats","TxFrameCnt","s") %>';
		this.PonRecvPkt 			= '<% tcWebApi_get("Info_PonWanStats","RxFrameCnt","s") %>';
		this.SendPower 				= '-';
		this.RecvPower 				= '-';
		this.WorkVoltage 			= '-';
		this.WorkElectric 		= '-';
		this.WorkTemperature 	= '-';
		this.EncryptEnable 		= '-';
		this.encryptState			= '<% tcWebApi_get("WebCurSet_Entry","EPONEncryption","s") %>';
		this.GemPortInfo			= '<% tcWebApi_get("GPON_GEMPort","EncryptionStateALL","s") %>';
		this.DispGemPortState = DispGemPortState;
		this.phyStatus				=	'<% tcWebApi_get("XPON_Common","phyStatus","s") %>';
		
		this.CATV_VPD         = '<%tcWebApi_get("CatvInfo_Entry", "CATV_VPD", "s")%>';
		this.CATV_RF          = '<%tcWebApi_get("CatvInfo_Entry", "CATV_RF", "s")%>';
		this.up_time		  = '-';

		if ( 'GPON' != this.ponType && 'EPON' != this.ponType )
			this.ponType = 'GPON';
		if ( 'GPON' == this.ponType )
		{
			this.loidAuth					= '<% tcWebApi_get("GPON_LOIDAuth","AuthStatus","s") %>';
			this.loidV1						= '<% tcWebApi_get("GPON_LOIDAuth","LOID","s") %>';
		}
		else
		{
			this.loidAuth					= '<% tcWebApi_get("EPON_LOIDAuth","AuthStatus","s") %>';
			this.loidV1						= '<% tcWebApi_get("EPON_LOIDAuth","LOID0","s") %>';
		}

		if ( 'up' == this.trafficstate )
		{
			this.PonState 				= 'up';
			this.WarnInfo 				= 'no info';
			this.loidStatus				= 'up';
			this.up_time		  		= '<% tcWebApi_get("XPON_Common","upTime","s") %>';
			
		}
		else
		{
			if ( '0' != this.LinkSta && '2' == this.loidAuth && 0 != this.loidV1.length )
				this.loidStatus			= 'error';
		}
		
		if( '0' != this.LinkSta)
		{
			this.SendPower 				= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
			this.RecvPower 				= (Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10);
			this.WorkVoltage 			= (Number(<%tcWebApi_get("Info_PonPhy", "SupplyVoltage", "s")%>)/10);
			this.WorkElectric 		= (Number(<%tcWebApi_get("Info_PonPhy", "TxBiasCurrent", "s")%>)*2/1000);
			this.WorkTemperature 	= transTemperature(<%tcWebApi_get("Info_PonPhy", "Temperature", "s")%>);
			this.FECEnable 				= ( '1' == this.fecState ) ? 'enabled' : 'disabled';

			if ( '2' == this.LinkSta )
				this.EncryptEnable	= ( '1' == this.encryptState ) ? 'enabled' : 'disabled';
		}
		
		function DispGemPortState()
		{
			var gemportList;
			var gemportInfo;
			var gemportState;
			var i = 0;

			if ( this.GemPortInfo.indexOf('#') >=0 )
				this.GemPortInfo = this.GemPortInfo.substring(0, this.GemPortInfo.length - 1);
			else
			{
				document.write('Disabled');
				return -1;
			}

			gemportList = this.GemPortInfo.split('#');
			for (i = 0; i < gemportList.length; i ++)
			{
				gemportInfo = gemportList[i].split(':');
				if ( 2 != gemportInfo.length )
					continue;

				gemportState = 'GEMPORT' + gemportInfo[0] + ':' + ( ( 1 == gemportInfo[1] ) ? 'Enable' : 'Disabled' )
											+ '; '
				document.write(gemportState);
			}

			return 0;
		}
	}
	
	var PonInfo = new PonInfoClass();
  function RefreshPage()
	{
		location.href = document.location.href;
	}
	</SCRIPT>
</head>

<body>
		<!-- content -->
    <div class="container-full container-resize-height">
        <div class="card-table">
            <div class="title-content">PON Status</div>
            <div class="title-description-content">This page shows the current system status of PON.</div>
            <table style="width:100%">
                <tr class="table-header">
                    <th colspan="2" class="p-1">PON Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">Vender Name</td>
                    <td style="width: 50%;">WTD</td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">Temperature</td>
                    <td>
                    	<SCRIPT language=JavaScript type=text/javascript>
												document.write(PonInfo.WorkTemperature);
											</SCRIPT>&nbsp;¡æ
                    </td>
                </tr>
                <tr class="table-content-fist">
                    <td class="table-header-content p-1">Voltage</td>
                    <td>
                    	<SCRIPT language=JavaScript type=text/javascript>
												document.write(PonInfo.WorkVoltage);
											</SCRIPT>&nbsp;mV
                    </td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">Tx Power</td>
                    <td>
                    	<SCRIPT language=JavaScript type=text/javascript>
												document.write(PonInfo.SendPower);
											</SCRIPT>&nbsp;dBm
                    </td>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">Rx Power</td>
                    <td>
                    	<SCRIPT language=JavaScript type=text/javascript>
												document.write(PonInfo.RecvPower);
											</SCRIPT>&nbsp;dBm
                    </td>
                </tr>
                <tr class="table-content-second">
                    <td class="table-header-content p-1">Bias Current</td>
                    <td>
                    	<SCRIPT language=JavaScript type=text/javascript>
												document.write(PonInfo.WorkElectric);
											</SCRIPT>&nbsp;mA
                    </td>
                </tr>
            </table>
        </div>

        <div class="card-table">
            <table style="width:100%">
                <tr class="table-header">
                    <th colspan="2" class="p-1">GPON Status</th>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">ONU Status</td>
                    <td style="width: 50%;">
                    	<script language=JavaScript type=text/javascript>
												document.write("O"+onuStatus);
											</script>
                    </td>
                </tr>
                <tr class="table-content-second">
					<td style="width: 50%;" class="table-header-content p-1">ONU ID</td>
                    <td style="width: 50%;">
                    	<script language=JavaScript type=text/javascript>
							if((parseInt(OnuID) >=0 ) && (parseInt(OnuID) <255))
							{
								document.write(OnuID);
							}
							else
							{
								document.write("N/A");
							}
						</script>
                    </td>
                </tr>
                <tr class="table-content-fist">
                    <td style="width: 50%;" class="table-header-content p-1">LOID Status</td>
                    <td style="width: 50%;">
						<script language=JavaScript type=text/javascript>
							if(LoidAuthStatus == '1')
							{
								document.write("Sucessful Authentication");
							}
							else
							{
								document.write("Unauthorized");
							}							
							
						</script>
					</td>
                </tr>
            </table>
        </div>

        <div class="card-btn-bottom">
            <button class="btn-dashboard" onclick="RefreshPage()">Refresh</button>
        </div>
    	</div>
</body>

</html>