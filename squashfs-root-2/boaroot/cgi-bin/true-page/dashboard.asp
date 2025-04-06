
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Dashboard</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->
  <style>
    .progress-fail-status {
      width: 0%;
      height: 7px;
      background-color: red;
    }
    .progress-success-status {
      width: 0%;
      height: 7px;
      background-color: green;
    }
    .progress-bar-striped {
      background-image: linear-gradient(45deg,rgba(6, 0, 0, 0.15) 25%,#0c000000 25%,#380b0b00 50%,rgba(0, 0, 0, 0.15) 50%,rgba(0, 0, 0, 0.15) 75%,#1b030300 75%,#08050500);
      background-size: 1rem 1rem
    }
  </style>

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
  
  <!-- script -->
  <script data-main="/scripts/app/app" src="/scripts/lib/require.js"></script>
  <script>
    /*
    require(['/scripts/utils/utils.js'],function(utils){
      console.log(utils.moduleName);
    });
    */
    
    //wan Info
    var ListCreatIndex = -1;
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    var userState = 1;
    if (curUserName == sptUserName)
      userState = 0;
    var para = 0;
    var onuStatus="<% tcWebApi_get("XPON_LinkCfg","OnuStatus","s") %>";
    var pvc_counts=<% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    <% if tcwebApi_get("WebCustom_Entry","isCTSFUC9Supported","h") = "Yes" then %>
      pvc_counts = 1;
    <% end if %>

<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
    var MeshStatus = "<%tcWebApi_get("Mesh_Common","MeshStatus","s")%>";
<% end if%>
    
    //get all value
    // num 0
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var Wan_WanName = vArrayStr.split(',');
    // num 1
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var Wan_WanValue = vArrayStr.split(',');
    
    // num 3
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_Actives","s") %>";
    Wan_Actives = vArrayStr.split(',');
    // num 4
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
    var WANEnNAT = vArrayStr.split(',');
    
    // num 6
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
    var Wan_IPVERSION = vArrayStr.split(',');
    // num 8
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP4","s") %>";
    var Wan_IP4 = vArrayStr.split(',');
    // num 11
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_DNS4","s") %>";
    var Wan_DNS4 = vArrayStr.split(',');
    // num 12
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_SecDNS4","s") %>";
    var Wan_SecDNS4 = vArrayStr.split(',');
    // num 14
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP6","s") %>";
    var Wan_IP6 = vArrayStr.split(',');
    // num 16
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_DNS6","s") %>";
    var Wan_DNS6 = vArrayStr.split(',');
    // num 17
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_SecDNS6","s") %>";
    var Wan_SecDNS6 = vArrayStr.split(',');

    SortUtil.SetReplaceStrflag(1);
    Wan_WanName = SortUtil.UpdateWanIFName( Wan_WanName, pvc_counts );
    
    Wan_WanValue = SortUtil.SortMyArray( Wan_WanValue );
    Wan_Actives = SortUtil.SortMyArray( Wan_Actives );
    WANEnNAT = SortUtil.SortMyArray( WANEnNAT );
    Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
    Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
    Wan_DNS4 = SortUtil.SortMyArray( Wan_DNS4 );
    Wan_SecDNS4 = SortUtil.SortMyArray( Wan_SecDNS4 );
    Wan_IP6 = SortUtil.SortMyArray( Wan_IP6 );
    Wan_DNS6 = SortUtil.SortMyArray( Wan_DNS6 );
    Wan_SecDNS6 = SortUtil.SortMyArray( Wan_SecDNS6 );

    wanStatus = "<% tcWebApi_get("XPON_Common","wanstatus","s") %>";  //wanStatus  is the actual status of whether the internet can be accessed

    function getSpecificIndex_reconnect()
    {
      var AllWanName = "<% tcWebApi_get("WanInfo_Common","WanName", "s") %>";
      var AllWanName_Array = AllWanName.split(',');
      var validifindex = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex", "s") %>";
      var validifindex_Array = validifindex.split(',');
      var tr069_internet_wan_index = -1;
      var internet_wan_index = -1;
      const reg = /(?<=([0-9]_)).*?(?=(_R_VID))/g;

      AllWanName_Array = SortUtil.SortMyArray( AllWanName_Array );
      validifindex_Array = SortUtil.SortMyArray( validifindex_Array );
      
        for(i = 0; i < nEntryNum; i++)
        {
          if (AllWanName_Array[i].match(reg) != null)
          {
            if (AllWanName_Array[i].match(reg) == "INTERNET")
            {
              internet_wan_index = validifindex_Array[i];
              ListCreatIndex = i;
            }
            <% if tcWebApi_get("vid_common", "skyvid","h") = "38" then %>
            else if ((AllWanName_Array[i].match(reg) == "TR069_VOICE_INTERNET") || (AllWanName_Array[i].match(reg) == "TR069_INTERNET"))
            <% else %>
            else if (AllWanName_Array[i].match(reg) == "TR069_INTERNET")
            <% end if %>
            {
              tr069_internet_wan_index =  validifindex_Array[i];
              ListCreatIndex = i;
              return tr069_internet_wan_index;
            }
        }
      }
      return internet_wan_index;
    }

    function getSpecificIndex_display()
    {
      var AllWanName = "<% tcWebApi_get("WanInfo_Common","WanName", "s") %>";
      var AllWanName_Array = AllWanName.split(',');
      var validifindex = "<% tcWebApi_get("WanInfo_Common","ValidIFIndex", "s") %>";
      var validifindex_Array = validifindex.split(',');
      var internet_wan_flag = -1;
      var tr069_internet_flag = -1;
      var internet_flag = -1;
      const reg = /(?<=([0-9]_)).*?(?=(_R_VID))/g;

      AllWanName_Array = SortUtil.SortMyArray( AllWanName_Array );
      
        for(i = 0; i < nEntryNum; i++)
        {
          if (AllWanName_Array[i].match(reg) != null)
          {
            <% if tcWebApi_get("vid_common", "skyvid","h") = "38" then %>
            if ((AllWanName_Array[i].match(reg) == "TR069_VOICE_INTERNET") || (AllWanName_Array[i].match(reg) == "TR069_INTERNET"))
            <% else %>
            if (AllWanName_Array[i].match(reg) == "TR069_INTERNET")
            <% end if %>
            {
              tr069_internet_flag = i;
              if(Wan_IP4[i] != '-' || Wan_IP6[i] != '-')
              {
                 ListCreatIndex = i;
                 return;
              }
            }
          }
        }

        for(i = 0; i < nEntryNum; i++)
        {
          if (AllWanName_Array[i].match(reg) != null)
          {
            if (AllWanName_Array[i].match(reg) == "INTERNET")
            {
              internet_flag = i;
              if(Wan_IP4[i] != '-' || Wan_IP6[i] != '-')
              {
                ListCreatIndex = i;
                return;
              }
            }
          }
        }

      if(tr069_internet_flag != -1)
      {
        ListCreatIndex = tr069_internet_flag;
      }
      else if(internet_flag != -1)
      {
        ListCreatIndex = internet_flag;
      }
      return;
    }
    //function
  
    function ListCreate_info1()
    {
      getSpecificIndex_display();
      if ( ListCreatIndex != -1)
      {
        if(Wan_Actives[ListCreatIndex] != "N/A")
        {
          if(Wan_IPVERSION[ListCreatIndex] == "IPv4" || Wan_IPVERSION[ListCreatIndex] == "IPv6" || Wan_IPVERSION[ListCreatIndex] == "IPv4/IPv6")
          {
            if(Wan_IPVERSION[ListCreatIndex] == "IPv4")
            {
              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>IP Address:</div></div>");
              document.writeln("<div class='col-6' ><div class='sub-title-dashboard-right' id='wanip4'>" + Wan_IP4[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");

              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>DNS IP Address:</div></div>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wandns4'>" + Wan_DNS4[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");
              if ( 0 != Wan_SecDNS4[ListCreatIndex].length && '-' != Wan_SecDNS4[ListCreatIndex] )
              {
                document.writeln("<div class='row' id ='secdns4'>");
              }
              else{
                document.writeln("<div class='row' id ='secdns4' style='display:none'>");
              }
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>Primary DNS:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wansecdns4'>" + Wan_SecDNS4[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");     
            }
            else if(Wan_IPVERSION[ListCreatIndex] == "IPv6")
            {
              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>IPv6 Address:</div></div>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wanip6'>" + Wan_IP6[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");
              
              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>DNS IP Address:</div></div>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wandns6'>" + Wan_DNS6[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");
              if ( 0 != Wan_SecDNS6[ListCreatIndex].length && '-' != Wan_SecDNS6[ListCreatIndex] )
                document.writeln("<div class='row' id ='secdns6'>");
              else
                document.writeln("<div class='row' id ='secdns6' style='display:none'>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>Secondary DNS IPv6 Address:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wansecdns6'>" + Wan_SecDNS6[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");             
            }
            else if(Wan_IPVERSION[ListCreatIndex] == "IPv4/IPv6")
            {
              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>IP Address:</div></div>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wanip4'>" + Wan_IP4[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");

              document.writeln("<div class='row'>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>DNS IP Address:</div></div>");
              document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wandns4'>" + Wan_DNS4[ListCreatIndex] + "</div></div>");
              document.writeln("</div>");
              if ( 0 != Wan_SecDNS4[ListCreatIndex].length && '-' != Wan_SecDNS4[ListCreatIndex] )
                document.writeln("<div class='row' id ='secdns4'>");
              else
                document.writeln("<div class='row' id ='secdns4' style='display:none'>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>Secondary DNS IP Address:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wansecdns4'>" + Wan_SecDNS4[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");
              
              
                document.writeln("<div class='row'>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>IPv6 Address:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wanip6'>" + Wan_IP6[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");

                document.writeln("<div class='row'>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>DNS IPv6 Address:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wandns6'>" + Wan_DNS6[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");
                if ( 0 != Wan_SecDNS6[ListCreatIndex].length && '-' != Wan_SecDNS6[ListCreatIndex] )        
                  document.writeln("<div class='row' id ='secdns6'>");
                else
                  document.writeln("<div class='row' id ='secdns6' style='display:none'>");

                document.writeln("<div class='col-6'><div class='sub-title-dashboard-left'>Secondary DNS IPv6 Address:</div></div>");
                document.writeln("<div class='col-6'><div class='sub-title-dashboard-right' id='wansecdns6'>" + Wan_SecDNS6[ListCreatIndex] + "</div></div>");
                document.writeln("</div>");
            }
          }
        }

<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
        if(MeshStatus != "Disconnected")
<% else %>
        if (Wan_IP4[ListCreatIndex] != '-' || Wan_IP6[ListCreatIndex] != '-')
<% end if%>
        {
          document.getElementById("offline").style.display = "none";
          document.getElementById("online").style.display = "block";
        }
        else
        {
          document.getElementById("offline").style.display = "block";
          document.getElementById("online").style.display = "none";
        }
      }
    }
    //end
    
    //2.4g and 5g
    var wlanEnbl = "<% TCWebApi_get("WLan_Common", "APOn", "s") %>";
    var wlanacEnbl = "<% TCWebApi_get("WLan11ac_Common", "APOn", "s") %>";
  </script>
</head>

<body>
  <!-- content -->
  <!-- row-1 -->
  <div class="row mb-2 container-dashboard-wrapper">
    <div class="col-md-4 col-sm-12 container-dashboard-item">
      <div class="container-dashboard-content">
        <div class="title-dashboard">Device Infomation</div>
        <div class="row">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Model Name:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <script language=javascript>
                <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
                  document.write(top.ModelName_dev);
                <% else %>
                  document.write(top.ModelName);
                <% end if %>
              </script>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Mac-Address:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("Info_Ether","mac","h") <> "N/A" Then tcWebApi_get("Info_Ether","mac","s") end if%>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Hardware Version:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerHWVersion","s") end if%>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Firmware Version:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s") end if%>
            </div>
          </div>
        </div>
        <div class="row">
        <% if tcWebApi_get("vid_common", "skyvid","h") = "10" then %>
          <div class="col-6">
            <div class="sub-title-dashboard-left">TRUE Serial Number:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","h") <> "" Then tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","s") end if%>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Device Serial Number:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%>
            </div>
          </div>
        </div>
        <% else %>
        <div class="col-6">
          <div class="sub-title-dashboard-left">GPON Serial Number:</div>
        </div>
        <div class="col-6">
          <div class="sub-title-dashboard-right">
            <%If tcWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" Then tcWebApi_get("GPON_ONU","SerialNumber","s") end if%>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6">
          <div class="sub-title-dashboard-left">TRUE Serial Number:</div>
        </div>
        <div class="col-6">
          <div class="sub-title-dashboard-right">
            <%If tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","h") <> "" Then tcWebApi_get("deviceinfo_devParaDynamic","CfePwd","s") else tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-6">
          <div class="sub-title-dashboard-left">Device Serial Number:</div>
        </div>
        <div class="col-6">
          <div class="sub-title-dashboard-right">
            <%If tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","h") <> "N/A" Then tcWebApi_get("DeviceInfo_devParaDynamic","SerialNum","s") end if%>
          </div>
        </div>
      </div>
        <% end if %>
        <div class="row mb-3">
          <div class="col-6">
            <div class="sub-title-dashboard-left">Compile Time:</div>
          </div>
          <div class="col-6">
            <div class="sub-title-dashboard-right">
              <%If tcWebApi_get("DeviceInfo","CompileTime","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CompileTime","s") end if%>
            </div>
          </div>
        </div>
        <div class="row card-action container-dashboard-btn">
          <span id="UpgradeButton" class="btn-dashboard">Upgrade</span>
        </div>
      </div>
    </div>
    <div class="col-md-4 col-sm-12 container-dashboard-item">
      <div class="container-dashboard-content" id="internetStatus">
        <div class="title-dashboard mb-3">Internet Status</div>
        <div class="row d-flex align-items-center justify-content-center mb-3">
          <img type="/image/svg+xml" src="/image/icon/labtop.svg" class=""/>
          <img src="/image/icon/Line-middle.svg" class="m-2"/>
          <img src="/image/icon/router-parent.svg" class=""/>
          <img id='online' src='/image/icon/online.svg' class='m-2' style="display: none;"/>
          <img id='offline' src='/image/icon/offline.svg' class='m-2' style="display: none;"/>
          <img src="/image/icon/network.svg" class=""/>
        </div>
        <script language=JavaScript type=text/javascript>
          ListCreate_info1();
        </script>
        <div class="row card-action container-dashboard-btn">
          <span id="ReConnect" class="btn-dashboard">Re-Connect</span>
        </div>
      </div>
    </div>
    <div class="col-md-4 col-sm-12 container-dashboard-item">
      <div class="container-dashboard-content" id="attached">
        <div class="title-dashboard mb-3">Attached Devices</div>
        <div class="row d-flex align-items-center justify-content-center mb-3">
          <div class="col-4">
            <div class="row d-flex align-items-center justify-content-center">
              <img src="/image/router - attach.png" width="100%" alt="">
            </div>
            <div class="row d-flex align-items-center justify-content-center">
              <!-- <img src="/image/router.png" width="100%" alt=""> -->
            </div>
          </div>
          <div class="col-2">
            <div class="row d-flex align-items-center justify-content-center">
              <img src="/image/Line 1.png" class="mb-2" width="80%" alt="">
              <img src="/image/Line 2.png" class="mb-2" width="80%" alt="">
              <img src="/image/Line 3.png" class="mb-2" width="80%" alt="">
            </div>
          </div>
          <div class="col-4">
            <div class="row d-flex align-items-center justify-content-center">
              <div class="d-flex align-items-center justify-content-center">
                <img src="/image/chanel - lan.png" class="mb-2" width="100%" alt="">
                <span id="lanStatus" class="badge badge-pill badge-secondary mb-2 ml-1" style="cursor: pointer;">
                </span>
              </div>
              <div class="d-flex align-items-center justify-content-center">
                <img src="/image/chanel - 5.png" class="mb-2" width="100%" alt="">
                <span id="wlanStatus_5g" class="badge badge-pill badge-secondary mb-2 ml-1" style="cursor: pointer;">
                </span>
              </div>
              <div class="d-flex align-items-center justify-content-center">
                <img src="/image/chanel - 24.png" class="mb-2" width="100%" alt="">
                <span id="wlanStatus_2g"class="badge badge-pill badge-secondary mb-2 ml-1" style="cursor: pointer;">
                </span>
              </div>
            </div>
          </div>
        </div>
        <div class="row card-action container-dashboard-btn">
          <span id="RefreshButton" class="btn-dashboard">Refresh</span>
        </div>
      </div>
  </div>
</div>
<!-- row-1 -->

<!-- row-2 -->
<div class="row mb-2">
    <div class="col-md-8 col-sm-12">
      <div class="row mb-2 justify-content-center">
        <div class="m-auto p-auto container-dashboard-content" style="min-width: 100%; min-height: 400px;">
          <iframe src="https://speedtest.trueinternet.co.th" width="100%" height="420"></iframe>
        </div>
      </div>
        <!-- sub-row-2 -->
      <div class="row">
        <div class="col-12">
          <div class="container-dashboard-wifi">
            <div class="title-dashboard border-bottom">Wifi</div>
            <div class="row pl-4 pr-5 border-bottom">
              <div class="col-2 mt-1">
                <img src="/image/icon/wifi.png" width="40px" height="40px">
              </div>
              <div class="col-8">
                <div class="row">
                  <div class="title-dashboard-wifi">5 GHz</div>
                </div>
                <div class="row">
                  <div class="title-dashboard-wifi">
                    <% tcWebApi_get("WLan11ac_Entry1","SSID","s") %>
                  </div>
                </div>
                <div class="row">
                  <a href="#">
                      <div class="sub-title-dashboard-wifi" id="wlanBasic_5g">CHANGE</div>
                  </a>
                </div>
              </div>
              <% if tcWebApi_get("WLan11ac_Common","APOn","h") = "1" then %>
                <!--
                <div class="col-1 mt-3">
                  <input class='tgl tgl-ios' id='cb1' type='checkbox' checked disabled>
                  <label class='tgl-btn' for='cb1'></label>
                </div>
                -->
                <div class="col-1 mt-3">
                  <label class='tgl-btn'>ON</label>
                </div>
              <% else %>
                <!--
                <div class="col-1 mt-3">
                  <input class='tgl tgl-ios' id='cb3' type='checkbox' disabled>
                  <label class='tgl-btn' for='cb3'></label>
                </div>
                -->
                <div class="col-1 mt-3">
                  <label class='tgl-btn'>OFF</label>
                </div>
              <% end if %>
            </div>
            <div class="row pl-4 pr-5 border-bottom">
              <div class="col-2 mt-1">
                <img src="/image/icon/wifi.png" width="40px" height="40px">
              </div>
              <div class="col-8">
                <div class="row">
                  <div class="title-dashboard-wifi">2.4 GHz</div>
                </div>
                <div class="row">
                  <div class="title-dashboard-wifi">
                    <% tcWebApi_get("WLan_Entry1","SSID","s") %>
                  </div>
                </div>
                <div class="row">
                  <a href="#">
                    <div class="sub-title-dashboard-wifi" id="wlanBasic_2g">CHANGE</div>
                  </a>
                </div>
              </div>
              <% if tcWebApi_get("WLan_Common","APOn","h") = "1" then %>
                <!--
                <div class="col-1 mt-3">
                  <input class='tgl tgl-ios' id='cb2' type='checkbox' checked disabled>
                  <label class='tgl-btn' for='cb2'></label>
                </div>
                -->
                <div class="col-1 mt-3">
                  <label class='tgl-btn'>ON</label>
                </div>
              <% else %>
                <!--
                <div class="col-1 mt-3">
                  <input class='tgl tgl-ios' id='cb3' type='checkbox' disabled>
                  <label class='tgl-btn' for='cb3'></label>
                </div>
                -->
                <div class="col-1 mt-3">
                  <label class='tgl-btn'>OFF</label>
                </div>
              <% end if %>
            </div>
          </div>
        </div>
      </div>
        <!-- sub-row-2 -->
    </div>
    <!--end-->
    <div class="col-md-4 col-sm-12">
      <div id="Diagnostic" class="container-dashboard-content col-auto">
        <div class="title-dashboard">Easy Diagnostic (IPv4)</div>
        <div class="sub-title-dashboard-left">WLAN Check</div>
        <div class="row">
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="WlanCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="WlanImg" src="/image/icon/check_circle.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="row">
          <div class="col-4">
            <div class="sub-title-dashboard-left">DNS Check</div>
          </div>
          <div class="col-4">
            <div class="sub-title-dashboard-right"  style="color:#888888">
              <span id="dnstext"><%If tcWebApi_get("WanInfo_Entry0","DNS","h") <> "N/A" Then tcWebApi_get("WanInfo_Entry0","DNS","s") end if%></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="DnsCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="DnsImg" src="/image/icon/check_circle.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="sub-title-dashboard-left">Internet Check</div>
        <div class="row">
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="InternetCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="InternetImg" src="/image/icon/check_circle.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="sub-title-dashboard-left">NAT Check</div>
        <div class="row">
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="NatCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="NatImg" src="/image/icon/cancel.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="row">
          <div class="col-4">
            <div class="sub-title-dashboard-left">LAN Check</div>
          </div>
          <div class="col-4">
            <div class="sub-title-dashboard-right"  style="color:#888888">
              <%If tcWebApi_get("Lan_Entry0","IP","h") <> "N/A" Then tcWebApi_get("Lan_Entry0","IP","s") end if%>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="LanCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="LanImg" src="/image/icon/check_circle.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="sub-title-dashboard-left"  <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>DHCP Check</div>
        <div class="row"  <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="DhcpCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="DhcpImg" src="/image/icon/cancel.svg" width="15" height="15" class="icon-svg">
        </div>
        <div class="sub-title-dashboard-left"  <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>WAN Check</div>
        <div class="row"  <%  if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then  %> style="display: none" <% end if%>>
          <div class="card-progress-bar">
            <div id="progress-bar">
              <div id="WanCheck" class="progress-success-status"></div>
            </div>
          </div>
          <img id="WanImg" src="/image/icon/cancel.svg" width="15" height="15" class="icon-svg">
        </div>
        <br>
        <div class="row">
          <input id="btnDiagnose" type="button" class="btn-dashboard m-auto" onclick="" value="Re-Connect"/>
        </div>
      </div>
    </div>
    <!-- row-2 -->
  </div>
  <!-- content -->
  <script>
  var internetWanIndex = 0;
  $.each(Wan_WanName, function(i, currentObj) {
    <% if tcWebApi_get("vid_common", "skyvid","h") = "38" then %>
    if((currentObj.indexOf("TR069_VOICE_INTERNET_R") != -1) || (currentObj.indexOf("TR069_INTERNET_R") != -1)){
    <% else %>
    if(currentObj.indexOf("TR069_INTERNET_R") != -1){
    <% end if %>
      internetWanIndex = i;
      return false;
    }else if(currentObj.indexOf("INTERNET_R") != -1){
      internetWanIndex = i;
      return false;
    }
  });
  console.log("internetWanIndex = " + internetWanIndex);

  var Wlan2GEnable = "<% tcWebApi_get("WLan_Common","APOn","s") %>";
  var Wlan5GEnable = "<% tcWebApi_get("WLan11ac_Common","APOn","s") %>";
  var DnsAddress = "<% tcWebApi_get("WanInfo_Entry0","DNS","s") %>";
  var WanState = "<% tcWebApi_get("WanInfo_Entry0","Status","s") %>";
  var NatEnable = WANEnNAT[internetWanIndex];
  var DhcpEnable = "<% tcWebApi_get("Lan_Dhcp","type","s") %>";
 
  var EasyDiagnoseId;
  var DiagnoseNum = 0;
  var getwanInfo;
  var getwanInfoNum = 0;
  var Wan_All_IP4;
  var Wan_All_DNS4;
  var Wan_All_SecDNS4;
  var Wan_All_IP6;
  var Wan_All_DNS6;
  var Wan_All_SecDNS6;
  var Wan_All_Actives;
  var Wan_All_IPVERSION;
  var isSave = 0 ;
  function initwaninfo()
  {
    getSpecificIndex_display();
    if ( ListCreatIndex != -1)
    {
      if(Wan_All_Actives[ListCreatIndex] != "N/A")
      {
        if(Wan_All_IPVERSION[ListCreatIndex] == "IPv4" || Wan_All_IPVERSION[ListCreatIndex] == "IPv6" || Wan_All_IPVERSION[ListCreatIndex] == "IPv4/IPv6")
        {
          if(Wan_All_IPVERSION[ListCreatIndex] == "IPv4")
          {
            document.getElementById("wanip4").innerHTML = Wan_All_IP4[ListCreatIndex];
            document.getElementById("wandns4").innerHTML = Wan_All_DNS4[ListCreatIndex];
            
            if ( 0 != Wan_All_SecDNS4[ListCreatIndex].length && '-' != Wan_All_SecDNS4[ListCreatIndex] )
            {
              document.getElementById("wansecdns4").innerHTML = Wan_All_SecDNS4[ListCreatIndex];
              setDisplay('secdns4',1);
            }
            else
              setDisplay('secdns4',0);
          }
          else if(Wan_All_IPVERSION[ListCreatIndex] == "IPv6")
          {
            document.getElementById("wanip6").innerHTML = Wan_All_IP6[ListCreatIndex];
            document.getElementById("wandns6").innerHTML = Wan_All_DNS6[ListCreatIndex];
            
            if ( 0 != Wan_All_SecDNS6[ListCreatIndex].length && '-' != Wan_All_SecDNS6[ListCreatIndex] )
            {                         
              document.getElementById("wansecdns6").innerHTML = Wan_All_SecDNS6[ListCreatIndex];
              setDisplay('secdns6',1);
            }
            else
            {
              setDisplay('secdns6',0);
            }
          }
          else if(Wan_All_IPVERSION[ListCreatIndex] == "IPv4/IPv6")
          {
            document.getElementById("wanip4").innerHTML = Wan_All_IP4[ListCreatIndex];
            document.getElementById("wandns4").innerHTML = Wan_All_DNS4[ListCreatIndex];          
            document.getElementById("wanip6").innerHTML = Wan_All_IP6[ListCreatIndex];
            document.getElementById("wandns6").innerHTML = Wan_All_DNS6[ListCreatIndex];
            if ( 0 != Wan_All_SecDNS4[ListCreatIndex].length && '-' != Wan_All_SecDNS4[ListCreatIndex])
            {      
              document.getElementById("wansecdns4").innerHTML = Wan_All_SecDNS4[ListCreatIndex];
              setDisplay('secdns4',1); 
            }
            else{
              setDisplay('secdns4',0);
            }
            if (0 != Wan_All_SecDNS6[ListCreatIndex].length && '-' != Wan_All_SecDNS6[ListCreatIndex])
            {
              document.getElementById("wansecdns6").innerHTML = Wan_All_SecDNS6[ListCreatIndex];
                setDisplay('secdns6',1);
            }
            else
            {
              setDisplay('secdns6',0);
            }
          }
        }
      }
      if (Wan_All_IP4[ListCreatIndex] != '-' || Wan_All_IP6[ListCreatIndex] != '-')
      {
        if(wanStatus == "up")
        {
          document.getElementById("offline").style.display = "none";
          document.getElementById("online").style.display = "block";
        }
        else
        {
          document.getElementById("offline").style.display = "block";
          document.getElementById("online").style.display = "none";
        }
      }
      else
      {
        document.getElementById("offline").style.display = "block";
        document.getElementById("online").style.display = "none";
      }
    }
  }

  function startajaxEasyDiagnose() 
  {
      clearInterval(EasyDiagnoseId);
      DiagnoseNum = 0;
      EasyDiagnoseId = setInterval(ajaxEasyDiagnose,700);
  }

  function ajaxEasyDiagnose() 
  {
    if(DiagnoseNum == 0){
      $.ajax(
        {
          type:"GET",
          url:"/cgi-bin/json/diagnoseStatus.json",
          success:function showstatus(obj){
            console.log(obj);
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
            MeshStatus = obj.MeshStatus;
<% end if%>
            Wlan2GEnable = obj.Wlan2GEnable;
            Wlan5GEnable = obj.Wlan5GEnable;
            DnsAddress = obj.DnsAddress;
            WanState = obj.WanState;
            WANEnNAT = obj.WANEnNAT.split(',');
            WANEnNAT = SortUtil.SortMyArray( WANEnNAT );
            NatEnable = WANEnNAT[internetWanIndex];
            Wan_WanName = obj.WanName.split(',');
            Wan_WanName = SortUtil.SortMyArray( Wan_WanName );
            Wan_IP4 = obj.WanIP4.split(',');
            Wan_IP4 = SortUtil.SortMyArray( Wan_IP4 );
            Wan_DNS4 = obj.WanDns4.split(',');
            Wan_DNS4 = SortUtil.SortMyArray( Wan_DNS4 );
            Wan_DNS6 = obj.WanDns6.split(',');
            Wan_DNS6 = SortUtil.SortMyArray( Wan_DNS6 );
            DhcpEnable = obj.DhcpEnable;
            wanStatus = obj.wanStatus;
          }
        }
      )
    }
    DiagnoseNum++;
    initProgressStatus();
  }

  function initProgressStatus()
  {
      var progress = DiagnoseNum*25;
      console.log("progress="+progress);
      if( progress == 100 )
      {
          clearInterval(EasyDiagnoseId);
          progress = 0;
          EasyDiagnose();
      }
      else
      {
          document.getElementById("WlanCheck").style.width = progress+"%";
          document.getElementById("WlanCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("WlanImg").src= "/image/icon/cancel.svg";
          
          document.getElementById("DnsCheck").style.width = progress+"%";
          document.getElementById("DnsCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("DnsImg").src= "/image/icon/cancel.svg";
          
          document.getElementById("InternetCheck").style.width = progress+"%";
          document.getElementById("InternetCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("InternetImg").src= "/image/icon/cancel.svg";
          
          document.getElementById("NatCheck").style.width = progress+"%";
          document.getElementById("NatCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("NatImg").src= "/image/icon/cancel.svg";

          document.getElementById("LanCheck").style.width = progress+"%";
          document.getElementById("LanCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("LanImg").src= "/image/icon/cancel.svg";
          
          document.getElementById("DhcpCheck").style.width = progress+"%";
          document.getElementById("DhcpCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("DhcpImg").src= "/image/icon/cancel.svg";

          document.getElementById("WanCheck").style.width = progress+"%";
          document.getElementById("WanCheck").className="progress-fail-status progress-bar-striped progress-bar-animated";
          document.getElementById("WanImg").src= "/image/icon/cancel.svg";
      }
  }

  function EasyDiagnose() 
  {
      WlanCheck();
      DnsCheck();
      InternetCheck();
      NatCheck();
      LanCheck();
      DhcpCheck();
      WanCheck();
  }

  function WlanCheck() 
  {
      if(Wlan2GEnable == "1" && Wlan5GEnable == "1")
      {
          document.getElementById("WlanCheck").style.width = '100%';
          document.getElementById("WlanCheck").className="progress-success-status"
          document.getElementById("WlanImg").src= "/image/icon/check_circle.svg";
      }
      else if(Wlan2GEnable == "0" && Wlan5GEnable == "0")
      {
          document.getElementById("WlanCheck").style.width = '100%';
          document.getElementById("WlanCheck").className="progress-fail-status"
          document.getElementById("WlanImg").src= "/image/icon/cancel.svg";
      }
      else
      {
          document.getElementById("WlanCheck").style.width = '80%';
          document.getElementById("WlanCheck").className="progress-fail-status"
          document.getElementById("WlanImg").src= "/image/icon/cancel.svg";
      }
  }

  /* Check if there is an internet wan up with DNS when TR069_INTERNET Wan cannot be up */
  function check_internet_wan_dns()
  {
    const reg = /(?<=([0-9]_)).*?(?=(_R_VID))/g;
    for(i = 0; i < nEntryNum; i++)
    {
      if (Wan_WanName[i].match(reg) != null)
      {
        <% if tcWebApi_get("vid_common", "skyvid","h") = "38" then %>
        if ((Wan_WanName[i].match(reg) == "TR069_VOICE_INTERNET") || (Wan_WanName[i].match(reg) == "TR069_INTERNET"))
        <% else %>
        if (Wan_WanName[i].match(reg) == "TR069_INTERNET")
        <% end if %>
        {
          if((Wan_IP4[i] != '-' || Wan_IP6[i] != '-') && (Wan_DNS4[i] != "N/A" || Wan_DNS6[i] != "N/A"))
          {
            if(Wan_DNS4[i] != "N/A")
              $("#dnstext").text(Wan_DNS4[i]);
            return true;
          }
        }
      }
    }

    if (i == nEntryNum)
    {
      for(i = 0; i < nEntryNum; i++)
      {
        if (Wan_WanName[i].match(reg) != null)
        {
          if (Wan_WanName[i].match(reg) == "INTERNET")
          {
            if((Wan_IP4[i] != '-' || Wan_IP6[i] != '-') && (Wan_DNS4[i] != "N/A" || Wan_DNS6[i] != "N/A"))
            {
              if(Wan_DNS4[i] != "N/A")
                $("#dnstext").text(Wan_DNS4[i]);
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  /* Check if there is an internet wan up when TR069_INTERNET Wan cannot be up */
  function check_internet_wan_up()
  {
    const reg = /(?<=([0-9]_)).*?(?=(_R_VID))/g;
    for(i = 0; i < nEntryNum; i++)
    {
      if (Wan_WanName[i].match(reg) != null)
      {
        <% if tcWebApi_get("vid_common", "skyvid","h") = "38" then %>
        if ((Wan_WanName[i].match(reg) == "TR069_VOICE_INTERNET") || (Wan_WanName[i].match(reg) == "TR069_INTERNET"))
        <% else %>
        if (Wan_WanName[i].match(reg) == "TR069_INTERNET")
        <% end if %>
        {
          if(Wan_IP4[i] != '-' || Wan_IP6[i] != '-')
          {
            return true;
          }
        }
      }
    }
    if (i == nEntryNum)
    {
      for(i = 0; i < nEntryNum; i++)
      {
        if (Wan_WanName[i].match(reg) != null)
        {
          if (Wan_WanName[i].match(reg) == "INTERNET")
          {
            if(Wan_IP4[i] != '-' || Wan_IP6[i] != '-')
            {
              return true;
            }
          }
        }
      }
    }
    return false;
  }

  function DnsCheck() 
  {
<% if tcWebApi_get("mesh_common", "DeviceRole","h") = "2" then %>
    if(MeshStatus != "Disconnected")
<% else %>
    if(check_internet_wan_dns() == true)
<% end if%>
    {
      document.getElementById("DnsCheck").style.width = '100%';
      document.getElementById("DnsCheck").className="progress-success-status"
      document.getElementById("DnsImg").src= "/image/icon/check_circle.svg";
    }
    else
    {
      document.getElementById("DnsCheck").style.width = '100%';
      document.getElementById("DnsCheck").className="progress-fail-status"
      document.getElementById("DnsImg").src= "/image/icon/cancel.svg";
    }
  }

  function InternetCheck() 
  {
      if(wanStatus == "up")
      {
          document.getElementById("InternetCheck").style.width = '100%';
          document.getElementById("InternetCheck").className="progress-success-status"
          document.getElementById("InternetImg").src= "/image/icon/check_circle.svg";
      }
      else
      {
          document.getElementById("InternetCheck").style.width = '100%';
          document.getElementById("InternetCheck").className="progress-fail-status"
          document.getElementById("InternetImg").src= "/image/icon/cancel.svg";
      }
  }

  function NatCheck() 
  {
    if(NatEnable == "Enable")
      {
          document.getElementById("NatCheck").style.width = '100%';
          document.getElementById("NatCheck").className="progress-success-status";
          document.getElementById("NatImg").src= "/image/icon/check_circle.svg";
      }
      else
      {
          document.getElementById("NatCheck").style.width = '100%';
          document.getElementById("NatCheck").className="progress-fail-status";
          document.getElementById("NatImg").src= "/image/icon/cancel.svg";
      } 
  }  

  function LanCheck()
  {
      document.getElementById("LanCheck").style.width = '100%';
      document.getElementById("LanCheck").className="progress-success-status";
      document.getElementById("LanImg").src= "/image/icon/check_circle.svg";
  }

  function DhcpCheck() 
  {
    if(DhcpEnable == "1")
      {
          document.getElementById("DhcpCheck").style.width = '100%';
          document.getElementById("DhcpCheck").className="progress-success-status";
          document.getElementById("DhcpImg").src= "/image/icon/check_circle.svg";
      }
      else
      {
          document.getElementById("DhcpCheck").style.width = '100%';
          document.getElementById("DhcpCheck").className="progress-fail-status";
          document.getElementById("DhcpImg").src= "/image/icon/cancel.svg";
      } 
  }

  function WanCheck()
  {
      if(check_internet_wan_up() == true)
      {
          document.getElementById("WanCheck").style.width = '100%';
          document.getElementById("WanCheck").className="progress-success-status";
          document.getElementById("WanImg").src= "/image/icon/check_circle.svg";
      }
      else
      {
          document.getElementById("WanCheck").style.width = '100%';
          document.getElementById("WanCheck").className="progress-fail-status";
          document.getElementById("WanImg").src= "/image/icon/cancel.svg";
      }

}

//lan
var lan1 = 0;
var lan2 = 0;
var lan3 = 0;
var lan4= 0;
var lan_total = 0;
lan1 = "<% tcwebApi_get("Info_Ether","Port1Status","s") %>";
lan2 = "<% tcwebApi_get("Info_Ether","Port2Status","s") %>";
lan3 = "<% tcwebApi_get("Info_Ether","Port3Status","s") %>";
lan4 = "<% tcwebApi_get("Info_Ether","Port4Status","s") %>";
<% if tcwebApi_get("Vid_Common","skyvid","h" ) <> "10" then %>
lan9 = "<% tcwebApi_get("Info_Ether","Port9Status","s") %>";
<% end if %>
//2.4g
var wifi24sta = 0;
var type24g = "<% tcWebApi_get("WebCurSet_Entry","wlan_id", "s") %>";
var stalist0_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM0","s") %>";
var stalist1_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM1","s") %>";
var stalist2_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM2","s") %>";
var stalist3_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM3","s") %>";
var stalist4_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM4","s") %>";
var stalist5_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM5","s") %>";
var stalist6_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM6","s") %>";
var stalist7_num_24g = "<% tcWebApi_get("wifiMacTab_Common","NUM7","s") %>";
//5g
var wifi5sta = 0;
var type5g = "<% tcWebApi_get("WebCurSet_Entry","wlan_id", "s") %>";
var stalist0_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM8","s") %>";
var stalist1_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM9","s") %>";
var stalist2_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM10","s") %>";
var stalist3_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM11","s") %>";
var stalist4_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM12","s") %>";
var stalist5_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM13","s") %>";
var stalist6_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM14","s") %>";
var stalist7_num_5g = "<% tcWebApi_get("wifiMacTab_Common","NUM15","s") %>";

var requestCount = 0;
var maxRequestCount = 50;
//add by luxiaoyang for IDID1082531, Automatically refresh Attached Devices every 20s  2023.03.23
var auto_refresh_attached_devices = setInterval(function(){ ajaxAttachedDevices(1) }, 20000);
//add end

function startajaxsyncWaninfo()
{
  clearInterval(getwanInfo);
  getwanInfoNum= 0;
  getwanInfo = setInterval(ajaxsyncWaninfo,2000);
}

function ajaxsyncWaninfo()
{
  if(getwanInfoNum < 15){
      $.ajax(
        {
          type:"GET",
          url:"/cgi-bin/json/getwanInfo.json",
          success:function showstatus(obj){
            Wan_All_IPVERSION = SortUtil.SortMyArray( obj.Wan_All_IPVERSION.split(','));
            Wan_All_Actives = SortUtil.SortMyArray( obj.Wan_All_Actives.split(','));
            Wan_All_IP4 = SortUtil.SortMyArray( obj.Wan_All_IP4.split(','));
            Wan_All_DNS4 = SortUtil.SortMyArray( obj.Wan_All_DNS4.split(',') );
            Wan_All_SecDNS4 = SortUtil.SortMyArray( obj.Wan_All_SecDNS4.split(',') );
            Wan_All_IP6 = SortUtil.SortMyArray( obj.Wan_All_IP6.split(',') );
            Wan_All_DNS6 = SortUtil.SortMyArray( obj.Wan_All_DNS6.split(',') );
            Wan_All_SecDNS6 = SortUtil.SortMyArray( obj.Wan_All_SecDNS6.split(','));
            wanStatus = obj.wanStatus;
          }
        }
      )
      getwanInfoNum++;
      initwaninfo();
    }
    else{
      clearInterval(getwanInfo);
      isSave = 0;
    }
}

function reconnectWanHandle(data)
{
  $.ajax({
    type:"POST",
    url:"/webapi/reconnectWanHandle",
    data:"cmd=" + data,
    processData:false,
    success:function(res){
      if(res.code == 0){
        console.log(res.msg);
        return true;
      }else{
        console.log(res.msg);
        return false;
      }
    },
    error:function(res){
      alert("execute failed, please try again.");
      //location.reload(true);
      return false;
    }
  });
}

function reConnect()
{
  if( isSave ){ 
       return;
  }
  isSave = 1;
  if (nEntryNum != 0){
    var SpecificIndex = getSpecificIndex_reconnect();
    if (SpecificIndex != -1)
    {
      reconnectWanHandle(SpecificIndex);

      $("#wanip4").text("-");
      $("#wandns4").text("-");
      $("#wansecdns4").text("-");
      setDisplay('secdns4',0);
      $("#wanip6").text("-");
      $("#wandns6").text("-");
      document.getElementById("offline").style.display = "block";
      document.getElementById("online").style.display = "none";

      setTimeout("startajaxsyncWaninfo()",15000);
    }
  }
}


function ajaxAttachedDevices_Delay() 
{
  $.ajax(
  {
    type:"GET",
    url:"/cgi-bin/json/deviceStatus.json",
    success:function showstatus(obj){
      console.log(obj);
      lan1 = obj.Port1Status;
      lan2 = obj.Port2Status;
      lan3 = obj.Port3Status;
      lan4 = obj.Port4Status;
      <% if tcwebApi_get("Vid_Common","skyvid","h" ) <> "10" then %>
      lan9 = obj.Port9Status;
      <% end if %>
      type24g = obj.wlan_id;
      type5g = obj.wlan_ac_id;
      stalist0_num_24g = obj.wifiMacTab_NUM0;
      stalist1_num_24g = obj.wifiMacTab_NUM1;
      stalist2_num_24g = obj.wifiMacTab_NUM2;
      stalist3_num_24g = obj.wifiMacTab_NUM3;
      stalist4_num_24g = obj.wifiMacTab_NUM4;
      stalist5_num_24g = obj.wifiMacTab_NUM5;
      stalist6_num_24g = obj.wifiMacTab_NUM6;
      stalist7_num_24g = obj.wifiMacTab_NUM7;

      stalist0_num_5g = obj.wifiMacTab_NUM8;
      stalist1_num_5g = obj.wifiMacTab_NUM9;
      stalist2_num_5g = obj.wifiMacTab_NUM10;
      stalist3_num_5g = obj.wifiMacTab_NUM11;
      stalist4_num_5g = obj.wifiMacTab_NUM12;
      stalist5_num_5g = obj.wifiMacTab_NUM13;
      stalist6_num_5g = obj.wifiMacTab_NUM14;
      stalist7_num_5g = obj.wifiMacTab_NUM15;
      LoadLanInfo();
    },
    error:function (data, status, e){
      console.log("data error")
      LoadLanInfo();
    } 
  });
}


function ajaxAttachedDevices(type) 
{
  if (requestCount >= maxRequestCount)
  {
    clearInterval(auto_refresh_attached_devices);
    console.log('stop refresh devices......');
    return;
  }

  $.ajax(
  {
    type:"GET",
    url:"/cgi-bin/json/wifiMacTabCommit.json",
    success:function showstatus(obj){
      setTimeout("ajaxAttachedDevices_Delay()",10000);
    },
    error:function (data, status, e){
      console.log("data error")
      LoadLanInfo();
    } 
  });

  if(type == 1)
    requestCount++;
  console.log('requesetCount:' + requestCount);
}

function LoadLanInfo()
{
  lan_total = 0;
  if(lan1 == "1"){
    lan_total++;
  }
  if(lan2 == "1"){
    lan_total++;
  }
  if(lan3 == "1"){
    lan_total++;
  }
  if(lan4 == "1"){
    lan_total++;
  }
  <% if tcwebApi_get("Vid_Common","skyvid","h" ) <> "10" then %>
  if(lan9 == "1"){
    lan_total++;
  }
  <% end if %>

  $("#lanStatus").text(lan_total);

  if(stalist1_num_24g == "N/A"){
    stalist1_num_24g = 0;
  }
  if(stalist2_num_24g == "N/A"){
    stalist2_num_24g = 0;
  }
  if(stalist3_num_24g == "N/A"){
    stalist3_num_24g = 0;
  }
  if(stalist4_num_24g == "N/A"){
    stalist4_num_24g = 0;
  }
  if(stalist5_num_24g == "N/A"){
    stalist5_num_24g = 0;
  }
  if(stalist6_num_24g == "N/A"){
    stalist6_num_24g = 0;
  }
  if(stalist7_num_24g == "N/A"){
    stalist7_num_24g = 0;
  }
  if(stalist0_num_24g == "N/A"){
    stalist0_num_24g = 0;
  }
  wifi24sta = (parseInt(stalist1_num_24g) + parseInt(stalist2_num_24g) + parseInt(stalist3_num_24g) + parseInt(stalist4_num_24g) + parseInt(stalist5_num_24g) + parseInt(stalist6_num_24g) + parseInt(stalist7_num_24g) + parseInt(stalist0_num_24g));
  $("#wlanStatus_2g").text(wifi24sta);

  if(stalist1_num_5g == "N/A"){
    stalist1_num_5g = 0;
  }
  if(stalist2_num_5g == "N/A"){
    stalist2_num_5g = 0;
  }
  if(stalist3_num_5g == "N/A"){
    stalist3_num_5g = 0;
  }
  if(stalist4_num_5g == "N/A"){
    stalist4_num_5g = 0;
  }
  if(stalist5_num_5g == "N/A"){
    stalist5_num_5g = 0;
  }
  if(stalist6_num_5g == "N/A"){
    stalist6_num_5g = 0;
  }
  if(stalist7_num_5g == "N/A"){
    stalist7_num_5g = 0;
  }
  if(stalist0_num_5g == "N/A"){
    stalist0_num_5g = 0;
  }
  wifi5sta = (parseInt(stalist1_num_5g) + parseInt(stalist2_num_5g) + parseInt(stalist3_num_5g) + parseInt(stalist4_num_5g) + parseInt(stalist5_num_5g) + parseInt(stalist6_num_5g) + parseInt(stalist7_num_5g) + parseInt(stalist0_num_5g));
  $("#wlanStatus_5g").text(wifi5sta);
}
  
  function checkStatus() {
    var statusConnect = false;

    $.ajax({
      url: 'https://maps.googleapis.com/maps/api/geocode/json',
      data: {
        sensor: false,
        address: {
          lat: -34.397,
          lng: 150.644
        }
      },
      success:function(res){
        console.log('res', res.status);
        statusConnect = true;
        console.log('statusConnect', statusConnect);
        document.getElementById("offline").style.display = "none";
        document.getElementById("online").style.display = "block";
      },
      error:function(e){
        console.log('status', e.status);
        statusConnect = false;
        console.log('statusConnect', statusConnect);
        document.getElementById("offline").style.display = "block";
        document.getElementById("online").style.display = "none";
      }
    });
  }

  $(function(){
    var pa_frame=parent.document.getElementById('contentfrm');
    var height = pa_frame.contentWindow.document.body.scrollHeight+50+'px';
    //console.log(height);
    pa_frame.style.height=height;

    $('#UpgradeButton').on('click', function(event) {
      $('#mainMenuAdmin', parent.document).click();
      $('#subMenuAdminUpgrade', parent.document).click();
    });
    $('#lanStatus').on('click', function(event) {
      //window.parent.$("#contentfrm").attr('src', '');
      $(".col-md-12").hide();
      $('#mainMenuStatus', parent.document).click();
      $('#subMenuStatus_LAN', parent.document).click();
    });
    $('#wlanStatus_5g').on('click', function(event) {
      $(".col-md-12").hide();
      $('#mainMenuWLAN', parent.document).click();
      $('#subMenuWLAN_5g', parent.document).click();
      $('#thirdMenuWLAN_associated0', parent.document).click();
    });
    $('#wlanStatus_2g').on('click', function(event) {
      $(".col-md-12").hide();
      $('#mainMenuWLAN', parent.document).click();
      $('#subMenuWLAN_2g', parent.document).click();
      $('#thirdMenuWLAN_associated1', parent.document).click();
    });
    
    $('#RefreshButton').on('click', function(event) {
      requestCount = 0;
      $("#attached").hide();
      ajaxAttachedDevices(0); 
      $('#attached').delay(900).show(0);
    });
    
<% if tcwebApi_get("Vid_Common","skyvid","h" ) <> "10" then %>
    $('#ReConnect').on('click', function(event) {
      requestCount = 0;
      $("#internetStatus").hide();
      reConnect(); 
      $('#internetStatus').delay(900).show(0);
    });
<% else %>
<% if tcWebApi_get("mesh_common", "DeviceRole","h") <> "2" then %>
    $('#ReConnect').on('click', function(event) {
      requestCount = 0;
      $("#internetStatus").hide();
      reConnect(); 
      $('#internetStatus').delay(900).show(0);
    });
<% end if %>
<% end if %>
    
    $('#btnDiagnose').on('click', function(event) {
      requestCount = 0;
      $("#Diagnostic").hide();
      startajaxEasyDiagnose(); 
      $('#Diagnostic').delay(300).show(0);
    });
    
    $('#wlanBasic_5g').on('click', function(event) {
      $(".col-md-12").hide();
      $('#mainMenuWLAN', parent.document).click();
    });
    $('#wlanBasic_2g').on('click', function(event) {
      $(".col-md-12").hide();
      $('#mainMenuWLAN', parent.document).click();
      $('#subMenuWLAN_2g', parent.document).click();
    });
    /*if(wanStatus == "up") {
      document.getElementById("offline").style.display = "none";
      document.getElementById("online").style.display = "block";
    }
    else {
      document.getElementById("offline").style.display = "block";
      document.getElementById("online").style.display = "none";
    }*/
    //checkStatus();
    LoadLanInfo();
    startajaxEasyDiagnose();
  });
  </script>
</body>

</html>
