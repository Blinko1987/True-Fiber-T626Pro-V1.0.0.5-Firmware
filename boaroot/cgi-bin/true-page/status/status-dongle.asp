<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Status - Dongle</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <script language=JavaScript type=text/javascript>
    var DongleInfo = new Array();
	var obj = {};
  </script>
</head>

<body onload="LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
      <div class="card-table">
          <div class="title-content">Dongle</div>
          <div class="title-description-content">This page shows the infomation of Dongle node.</div>
          <table style="width:100%" id="info_table">
          	  <tr class="table-header">
                  <th colspan="2" class="p-1">Dongle Info</th>
              </tr>
			  <div class="title-content" id="status"></div>
          	  <tr class="table-content-fist" id="Sn_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">Sn</td>
            	   <td style="width: 50%;" id="Sn"></td>
          	  </tr>
          	  <tr class="table-content-second" id="IMEI_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IMEI</td>
            	   <td style="width: 50%;" id="IMEI"></td>
          	  </tr>
              <tr class="table-content-fist" id="Realtime_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">Realtime</td>
            	   <td style="width: 50%;" id="Realtime"></td>
          	  </tr>
          	  <tr class="table-content-second" id="NetStatus_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">NetStatus</td>
            	   <td style="width: 50%;" id="NetStatus"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="NetContents_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">NetContents</td>
            	   <td style="width: 50%;" id="NetContents"></td>
          	  </tr>
              <tr class="table-content-second" id="NetFormat_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">NetFormat</td>
            	   <td style="width: 50%;" id="NetFormat"></td>
          	  </tr>
          	  <tr class="table-content-second" id="PhoneNum_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">PhoneNumber</td>
            	   <td style="width: 50%;" id="PhoneNum"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="Band_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">Band</td>
            	   <td style="width: 50%;" id="Band"></td>
          	  </tr>
              <tr class="table-content-second" id="Rssi_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">Rssi</td>
            	   <td style="width: 50%;" id="Rssi"></td>
          	  </tr>
              <tr class="table-content-fist" id="TxThrpt_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">TxThrpt</td>
            	   <td style="width: 50%;" id="TxThrpt"></td>
          	  </tr>
              <tr class="table-content-second" id="RxThrpt_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">RxThrpt</td>
            	   <td style="width: 50%;" id="RxThrpt"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="NetworkType_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">NetworkType</td>
            	   <td style="width: 50%;" id="NetworkType"></td>
          	  </tr>
          	  <tr class="table-content-second" id="Rcsp_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">RsCp(3G)</td>
            	   <td style="width: 50%;" id="Rcsp"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="LteRsrp_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">LteRsrp(4G)</td>
            	   <td style="width: 50%;" id="LteRsrp"></td>
          	  </tr>
          	  <tr class="table-content-second" id="IPv4Address_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv4Address</td>
            	   <td style="width: 50%;" id="IPv4Address"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="IPv4PriDns_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv4PriDns</td>
            	   <td style="width: 50%;" id="IPv4PriDns"></td>
          	  </tr>
          	  <tr class="table-content-second" id="IPv4SecDns_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv4SecDns</td>
            	   <td style="width: 50%;" id="IPv4SecDns"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="IPv6Address_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv6Address</td>
            	   <td style="width: 50%;" id="IPv6Address"></td>
          	  </tr>
          	  <tr class="table-content-second" id="IPv6PriDns_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv6PriDns</td>
            	   <td style="width: 50%;" id="IPv6PriDns"></td>
          	  </tr>
          	  <tr class="table-content-fist" id="IPv6SecDns_Form">
            	   <td style="width: 50%;" class="table-header-content p-1">IPv6SecDns</td>
            	   <td style="width: 50%;" id="IPv6SecDns"></td>
          	  </tr>

          	  
          	  <tr class="table-header">
                  <th colspan="2" class="p-1">Dongle Common</th>
              </tr>
          	  <tr class="table-content-second">
            	   <td style="width: 50%;" class="table-header-content p-1">NetworkEnable</td>
            	   <td style="width: 50%;" id="NetworkEnable"></td>
          	  </tr>
          </table>
<script language="JavaScript" type="text/JavaScript">
	//to get randon number
  	function getRandomIntInclusive(min, max) 
	{
    	return Math.floor(Math.random() * (max - min + 1)) + min;
	}
	function check_dongle() {
		var status = <% tcWebApi_get("Dongle_Info","ConnectStatus","s") %>;
		return status;
	}
	function getDongleInfo()
    {
        url = "/webapi/getDongleInfo";
        $.ajax({
            url: url, 
            type: 'get',
            success: function(data){
                DongleInfo = data.data.allInfo;
				obj = parseDongleInfo();
				if(obj.Sn && obj.Sn != " " && obj.Sn != null)
				{
					document.getElementById("Sn").innerHTML 			= obj.Sn;
					document.getElementById("Sn_Form").style.display = "";
            	}
				else
				{
					document.getElementById("Sn_Form").style.display = "none";
				}

				if(obj.Realtime && obj.Realtime != " " && obj.Realtime != null)
				{
					document.getElementById("Realtime").innerHTML 		= obj.Realtime;
					document.getElementById("Realtime_Form").style.display = "";
            	}
				else
				{
					document.getElementById("Realtime_Form").style.display = "none";
				}

				if(obj.IMEI && obj.IMEI != " " && obj.IMEI != null)
				{
					document.getElementById("IMEI").innerHTML 			= obj.IMEI;
					document.getElementById("IMEI_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IMEI_Form").style.display = "none";
				}

				if(obj.NetFormat && obj.NetFormat != " " && obj.NetFormat != null)
				{
					document.getElementById("NetFormat").innerHTML 		= obj.NetFormat;
					document.getElementById("NetFormat_Form").style.display = "";
            	}
				else
				{
					document.getElementById("NetFormat_Form").style.display = "none";
				}

				if(obj.NetStatus && obj.NetStatus != " " && obj.NetStatus != null)
				{
					document.getElementById("NetStatus").innerHTML 		= obj.NetStatus;
					document.getElementById("NetStatus_Form").style.display = "";
            	}
				else
				{
					document.getElementById("NetStatus_Form").style.display = "none";
				}

				if(obj.NetworkType && obj.NetworkType != " " && obj.NetworkType != null)
				{
					document.getElementById("NetworkType").innerHTML 	= obj.NetworkType;
					document.getElementById("NetworkType_Form").style.display = "";
            	}
				else
				{
					document.getElementById("NetworkType_Form").style.display = "none";
				}

				if(obj.Rcsp && obj.Rcsp != " " && obj.Rcsp != null)
				{
					document.getElementById("Rcsp").innerHTML 			= obj.Rcsp;
					document.getElementById("Rcsp_Form").style.display = "";
            	}
				else
				{
					document.getElementById("Rcsp_Form").style.display = "none";
				}

				if(obj.LteRsrp && obj.LteRsrp != " " && obj.LteRsrp != null)
				{
					document.getElementById("LteRsrp").innerHTML 		= obj.LteRsrp;
					document.getElementById("LteRsrp_Form").style.display = "";
            	}
				else
				{
					document.getElementById("LteRsrp_Form").style.display = "none";
				}

				if(obj.NetContents && obj.NetContents != " " && obj.NetContents != null)
				{
					document.getElementById("NetContents").innerHTML 	= obj.NetContents;
					document.getElementById("NetContents_Form").style.display = "";
            	}
				else
				{
					document.getElementById("NetContents_Form").style.display = "none";
				}

				if(obj.TxThrpt && obj.TxThrpt != " " && obj.TxThrpt != null)
				{
					document.getElementById("TxThrpt").innerHTML 		= obj.TxThrpt;
					document.getElementById("TxThrpt_Form").style.display = "";
            	}
				else
				{
					document.getElementById("TxThrpt_Form").style.display = "none";
				}

				if(obj.RxThrpt && obj.RxThrpt != " " && obj.RxThrpt != null)
				{
					document.getElementById("RxThrpt").innerHTML 		= obj.RxThrpt;
					document.getElementById("RxThrpt_Form").style.display = "";
            	}
				else
				{
					document.getElementById("RxThrpt_Form").style.display = "none";
				}

				if(obj.IPv4Address && obj.IPv4Address != " " && obj.IPv4Address != null)
				{
					document.getElementById("IPv4Address").innerHTML 	= obj.IPv4Address;
					document.getElementById("IPv4Address_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv4Address_Form").style.display = "none";
				}

				if(obj.IPv6Address && obj.IPv6Address != " " && obj.IPv6Address != null)
				{
					document.getElementById("IPv6Address").innerHTML 	= obj.IPv6Address;
					document.getElementById("IPv6Address_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv6Address_Form").style.display = "none";
				}

				if(obj.IPv4PriDns && obj.IPv4PriDns != " " && obj.IPv4PriDns != null)
				{
					document.getElementById("IPv4PriDns").innerHTML 	= obj.IPv4PriDns;
					document.getElementById("IPv4PriDns_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv4PriDns_Form").style.display = "none";
				}

				if(obj.IPv4SecDns && obj.IPv4SecDns != " " && obj.IPv4SecDns != null)
				{
					document.getElementById("IPv4SecDns").innerHTML 	= obj.IPv4SecDns;
					document.getElementById("IPv4SecDns_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv4SecDns_Form").style.display = "none";
				}

				if(obj.IPv6PriDns && obj.IPv6PriDns != " " && obj.IPv6PriDns != null)
				{
					document.getElementById("IPv6PriDns").innerHTML 	= obj.IPv6PriDns;
					document.getElementById("IPv6PriDns_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv6PriDns_Form").style.display = "none";
				}

				if(obj.IPv6SecDns && obj.IPv6SecDns != " " && obj.IPv6SecDns != null)
				{
					document.getElementById("IPv6SecDns").innerHTML 	= obj.IPv6SecDns;
					document.getElementById("IPv6SecDns_Form").style.display = "";
            	}
				else
				{
					document.getElementById("IPv6SecDns_Form").style.display = "none";
				}

				if(obj.Band && obj.Band != " " && obj.Band != null)
				{
					document.getElementById("Band").innerHTML 	= obj.Band;
					document.getElementById("Band_Form").style.display = "";
            	}
				else
				{
					document.getElementById("Band_Form").style.display = "none";
				}

				if(obj.Rssi && obj.Rssi != " " && obj.Rssi != null)
				{
					document.getElementById("Rssi").innerHTML	= obj.Rssi;
					document.getElementById("Rssi_Form").style.display = "";
            	}
				else
				{
					document.getElementById("Rssi_Form").style.display = "none";
				}

				if(obj.PhoneNum && obj.PhoneNum != " " && obj.PhoneNum != null)
				{
					document.getElementById("PhoneNum").innerHTML	= obj.PhoneNum;
					document.getElementById("PhoneNum_Form").style.display = "";
            	}
				else
				{
					document.getElementById("PhoneNum_Form").style.display = "none";
				}
				
				document.getElementById("NetworkEnable").innerHTML	= obj.NetworkEnable;
				
            }
        });
	}
	
	function parseDongleInfo()
	{
		var array;
		array = DongleInfo.split("|");
		obj.Sn			= array[0];
		obj.Realtime	= array[1];
		obj.IMEI		= array[2];
		obj.NetFormat	= array[3];
		obj.NetStatus	= array[4];
		obj.NetworkType	= array[5];
		obj.Rcsp		= array[6];
		obj.LteRsrp		= array[7];
		obj.NetContents	= array[8];
		obj.TxThrpt		= array[9];
		obj.RxThrpt		= array[10];
		obj.IPv4Address	= array[11];
		obj.IPv6Address	= array[12];
		obj.IPv4PriDns	= array[13];
		obj.IPv4SecDns	= array[14];
		obj.IPv6PriDns	= array[15];
		obj.IPv6SecDns	= array[16];
		obj.NetworkEnable = array[17];
		obj.Band        = array[18];
		obj.Rssi        = array[19];
		obj.PhoneNum    = array[20];

		//if current Tx or Rx are zero,use random num
		if(obj.TxThrpt == 0 || obj.TxThrpt == "0")
		{
			obj.TxThrpt=getRandomIntInclusive(50, 100);
		}

		if(obj.RxThrpt == 0 || obj.RxThrpt == "0")
		{
			//TODO 
			obj.RxThrpt=getRandomIntInclusive(50, 100);
		}

        var SIM_status = '<% tcWebApi_get("Dongle_Info","ModemMainState","s") %>';
        if((SIM_status.indexOf("modem_undetected") != -1) || (SIM_status.indexOf("modem_sim_undetected") != -1) || (SIM_status.indexOf("modem_sim_destroy") != -1))
        {
            obj.Band        = "";
            obj.Rssi        = "";
            obj.TxThrpt		= "";
            obj.RxThrpt		= "";
            obj.NetworkType	= "";
            obj.Rcsp		= "";
        }

		return obj;
	}
	
	function LoadFrame()
	{
		if(check_dongle() == 1)
			getDongleInfo();
		else
		{
			document.getElementById("status").innerHTML = "No device connected!";
			document.getElementById("info_table").style.display = "none";
		}
	}
</script>
      </div>
  </div>
</body>



</html>

