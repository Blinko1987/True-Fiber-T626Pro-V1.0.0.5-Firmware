<%
If Request_Form("SaveFlag") = "1" then
	TCWebApi_set("Timezone_Entry","TZ","cboTimeZone")
	TCWebApi_set("Timezone_Entry","TYPE","autotimeFlag")
	TCWebApi_set("Timezone_Entry","SERVER","ntpServerOther1Flag")
    TCWebApi_set("Timezone_Entry","SYNCTIME","ntpSynctimeFlag")   
    TCWebApi_set("Timezone_Entry","DAYLIGHT","DaylightFlag")
	if Request_Form("isNtpServerTypeSupported") = "1" then  
		TCWebApi_set("Timezone_Entry","NTPServerType","AddRouteTimeZone") 
	else
		TCWebApi_set("Timezone_Entry","AddRoute","AddRouteTimeZone")
	end if
	TCWebApi_commit("Timezone_Entry")
	TCWebApi_save()
End if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - Timezone</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
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
  <!-- script -->
  <style>
      .col-4  input[type=checkbox],.col-6 input[type=checkbox]{
          margin-top: 9px;
      }
      .manualBox{
          height:42px;
          width: 100%;
      }
      .manualBox .inner{
          margin-top:11px;
      }
      .manualBox .inner input{
         margin-right: 0;
         width: 49%!important;
         display: inline-block;
      }
      .manualBox .inner .title-text-right{
         display: inline-block;
      }
      #ntpServer1{
        margin-right: 53px;
      }
  </style>
  <script language=javascript>
    var timeZonesEng = new Array();
    timeZonesEng[0] = '(GMT-12:00) International Date Line West';
    timeZonesEng[1] = '(GMT-11:00) Midway Island, Samoa';
    timeZonesEng[2] = '(GMT-10:00) Hawaii';
    timeZonesEng[3] = '(GMT-09:00) Alaska';
    timeZonesEng[4] = '(GMT-08:00) Pacific Time, Tijuana';
    timeZonesEng[5] = '(GMT-07:00) Arizona, Mazatlan';
    timeZonesEng[6] = '(GMT-07:00-1) Chihuahua, La Paz';
    timeZonesEng[7] = '(GMT-07:00-2) Mountain Time';
    timeZonesEng[8] = '(GMT-06:00) Central America';
    timeZonesEng[9] = '(GMT-06:00-1) Central Time';
    timeZonesEng[10] = '(GMT-06:00-2) Guadalajara, Mexico City, Monterrey';
    timeZonesEng[11] = '(GMT-06:00-3) Saskatchewan';
    timeZonesEng[12] = '(GMT-05:00) Bogota, Lima, Quito';
    timeZonesEng[13] = '(GMT-05:00-1) Eastern Time';
    timeZonesEng[14] = '(GMT-05:00-2) Indiana';
    timeZonesEng[15] = '(GMT-04:00) Atlantic Time';
    timeZonesEng[16] = '(GMT-04:00-1) Caracas, La Paz';
    timeZonesEng[17] = '(GMT-04:00-2) Santiago';
    timeZonesEng[18] = '(GMT-03:30) Newfoundland';
    timeZonesEng[19] = '(GMT-03:00) Brasilia';
    timeZonesEng[20] = '(GMT-03:00-1) Buenos Aires, Georgetown';
    timeZonesEng[21] = '(GMT-03:00-2) Greenland';
    timeZonesEng[22] = '(GMT-02:00) Mid-Atlantic';
    timeZonesEng[23] = '(GMT-01:00) Azores';
    timeZonesEng[24] = '(GMT-01:00-1) Cape Verde Is.';
    timeZonesEng[25] = '(GMT) Casablanca, Monrovia';
    timeZonesEng[26] = '(GMT-1) Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London';
    timeZonesEng[27] = '(GMT+01:00) Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna';
    timeZonesEng[28] = '(GMT+01:00-1) Belgrade, Bratislava, Budapest, Ljubljana, Prague';
    timeZonesEng[29] = '(GMT+01:00-2) Brussels, Copenhagen, Madrid, Paris';
    timeZonesEng[30] = '(GMT+01:00-3) Sarajevo, Skopje, Warsaw, Zagreb';
    timeZonesEng[31] = '(GMT+01:00-4) West Central Africa';
    timeZonesEng[32] = '(GMT+02:00) Athens, Istanbul, Minsk';
    timeZonesEng[33] = '(GMT+02:00-1) Bucharest';
    timeZonesEng[34] = '(GMT+02:00-2) Cairo';
    timeZonesEng[35] = '(GMT+02:00-3) Harare, Pretoria';
    timeZonesEng[36] = '(GMT+02:00-4) Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius';
    timeZonesEng[37] = '(GMT+02:00-5) Jerusalem';
    timeZonesEng[38] = '(GMT+03:00) Baghdad';
    timeZonesEng[39] = '(GMT+03:00-1) Kuwait, Riyadh';
    timeZonesEng[40] = '(GMT+03:00-2) Moscow, St. Petersburg, Volgograd';
    timeZonesEng[41] = '(GMT+03:00-3) Nairobi';
    timeZonesEng[42] = '(GMT+03:30) Tehran';
    timeZonesEng[43] = '(GMT+04:00) Abu Dhabi, Muscat';
    timeZonesEng[44] = '(GMT+04:00-1) Baku, Tbilisi, Yerevan';
    timeZonesEng[45] = '(GMT+04:30) Kabul';
    timeZonesEng[46] = '(GMT+05:00) Ekaterinburg';
    timeZonesEng[47] = '(GMT+05:00-1) Islamabad, Karachi, Tashkent';
    timeZonesEng[48] = '(GMT+05:30) Chennai, Kolkata, Mumbai, New Delhi';
    timeZonesEng[49] = '(GMT+05:45) Kathmandu';
    timeZonesEng[50] = '(GMT+06:00) Almaty, Novosibirsk';
    timeZonesEng[51] = '(GMT+06:00-1) Astana, Dhaka';
    timeZonesEng[52] = '(GMT+06:00-2) Sri Jayawardenepura';
    timeZonesEng[53] = '(GMT+06:30) Rangoon';
    timeZonesEng[54] = '(GMT+07:00) Bangkok, Hanoi, Jakarta';
    timeZonesEng[55] = '(GMT+07:00-1) Krasnoyarsk';
    timeZonesEng[56] = '(GMT+08:00) Beijing, Chongqing, Hong Kong, Urumqi';
    timeZonesEng[57] = '(GMT+08:00-1) Irkutsk, Ulaan Bataar';
    timeZonesEng[58] = '(GMT+08:00-2) Kuala Lumpur, Singapore';
    timeZonesEng[59] = '(GMT+08:00-3) Perth';
    timeZonesEng[60] = '(GMT+08:00-4) Taipei';
    timeZonesEng[61] = '(GMT+09:00) Osaka, Sapporo, Tokyo';
    timeZonesEng[62] = '(GMT+09:00-1) Seoul';
    timeZonesEng[63] = '(GMT+09:00-2) Yakutsk';
    timeZonesEng[64] = '(GMT+09:30) Adelaide';
    timeZonesEng[65] = '(GMT+09:30-1) Darwin';
    timeZonesEng[66] = '(GMT+10:00) Brisbane';
    timeZonesEng[67] = '(GMT+10:00-1) Canberra, Melbourne, Sydney';
    timeZonesEng[68] = '(GMT+10:00-2) Guam, Port Moresby';
    timeZonesEng[69] = '(GMT+10:00-3) Hobart';
    timeZonesEng[70] = '(GMT+10:00-4) Vladivostok';
    timeZonesEng[71] = '(GMT+11:00) Magadan';
    timeZonesEng[72] = '(GMT+11:00-1) Solomon Is., New Caledonia';
    timeZonesEng[73] = '(GMT+12:00) Auckland, Wellington';
    timeZonesEng[74] = '(GMT+12:00-1) Fiji, Kamchatka, Marshall Is.';

    var ntpServers = new Array();
    ntpServers[0] = '0.pool.ntp.org';
    ntpServers[1] = '1.pool.ntp.org';
    ntpServers[2] = '0.th.pool.ntp.org';
    ntpServers[3] = '1.th.pool.ntp.org';

    function writeTimeZoneList()  //渲染TimeZone下拉框
    {
        var  vValue;
        var	bExit = 0;
        for( var i = 0; i < timeZonesEng.length; i++ )  //timeZonesEng:一个时间数组
        {
            vValue = getTimeZoneOffset(i);
            document.writeln("<option value=" + vValue + ">" + timeZonesEng[i] + "</option>");
            if(document.ConfigForm.CountryName.value == vValue)
            {
                document.ConfigForm.cboTimeZone.selectedIndex= i;
                bExit = 1;
            }
            else
            {
                if((timeZonesEng[i].match("GMT+08:00") != null) && (0 == bExit))
                {
                    document.ConfigForm.cboTimeZone.selectedIndex= i;
                }
            }	
        }
    }

    function getTimeZoneOffset(idx) {  // 取出括号里的内容：'(GMT+12:00-1) Fiji,'  ---> "GMT+12:00-1"
        var str = timeZonesEng[idx];
        var ret = '';
        var nLength = str.indexOf(")");
        ret = str.substr(1, nLength-1);
        return ret;
    }
    $(function(){ 
        $("#Automatical").change(function() { 
            console.log($(this).prop('checked'))
            let checkStatus = $(this).prop('checked')
            if(checkStatus){
                  $('.toggleBox').show()
            }else{
                  $('.toggleBox').hide()
            }
          
        });
        
        $("#ntpServer1").change(function() {  //选中other，表示要勾选手动
            var val = $(this).val();
            if(val == 'Other'){
                $("#Manual").prop("checked",true);
            }
          
        });
        $("#auto").change(function() {  //防止把other当成值提交上去
            console.log($("#ntpServer1").val());
            if ($("#ntpServer1").val() == 'Other') {
                $("#ntpServer1").val('0.pool.ntp.org');
            }
        });
    }); 

    
    function getRadioVar(){  //获取radio选中项的value
        
        var chkRadio = $('input:radio[name="radio"]:checked').val();
        if (chkRadio == null) {
            //alert("没有选中项");
            return false;
        } else {
            return chkRadio;
        }
    }

    //WebCustom_Entry->isNtpServerTypeSupported : Yes
    <% if tcWebApi_get("WebCustom_Entry","isNtpServerTypeSupported","h") = "Yes" then %>
    function listCreate(l_flag)
    {
            var slNtpServerType = "<% tcWebApi_get("Timezone_Entry","NTPServerType","s") %>";
            var vEntryName = new Array();	
            vEntryName[0]="INTERNET";
            vEntryName[1]="VOICE";
            vEntryName[2]="TR069";
            vEntryName[3]="OTHER";
            for (i = 0; i < 4; i++)
            {
    <% if tcwebApi_get("WebCustom_Entry","isCTPONNOVOIP","h") = "Yes" then %>
                    if ( 1 == i )
                        continue;
    <% end if %>
                    if(slNtpServerType == i)
                    {
                        document.write('<option value=' + i + ' selected>'	+ vEntryName[i] + '</option>');
                    }
                    else
                    {
                        document.write('<option value=' + i + '>'	+ vEntryName[i] + '</option>');
                    }
            }
    }
    <% else %>
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>"; //值：1_TR069_INTERNET_R_VID_100,2_INTERNET_R_VID_35,
    var vEntryName = vArrayStr.split(',');  //转成数组
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryValue = vArrayStr.split(',');

    //sort
    vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
    vEntryValue = SortUtil.SortMyArray( vEntryValue );		
    console.log(vEntryName,'vEntryName>>>');
    console.log(vEntryValue,'vEntryValue>>>');
    var slIFNnme = "<% tcWebApi_get("Timezone_Entry","AddRoute","s") %>";			
    function listCreate(l_flag)   //listCreate(0);
    {
            for (i = 0; i < nEntryNum; i++)   //nEntryNum就是-->WanInfo_Common>CycleNum  值为2
            {
                if(vEntryName[i].indexOf('_R_') > 0){
                    if(slIFNnme == vEntryValue[i])
                    {
                        document.write('<option value=' + vEntryValue[i] + ' selected>'	+ vEntryName[i] + '</option>');
                    }
                    else
                    {
                        document.write('<option value=' + vEntryValue[i] + '>'	+ vEntryName[i] + '</option>');
                    }
                }
            }
    }	
    <%end if%>

    function writeNtpList(needed)  //渲染Primary SNTP Server和Secondary SNTP Server下拉框
    {
        var  vFlag = "0";
        if(!needed)  //needed==false时， 加上 option：None
        {
            document.writeln("<option value=None>None</option>");
        }
        for( var i = 0; i < ntpServers.length; i++ )
        {
            document.writeln("<option value=" + ntpServers[i] + ">" + ntpServers[i] + "</option>");
            
            if(needed)
            {
                if(document.ConfigForm.ntpServerOther1Flag.value == ntpServers[i])  //使默认选中值等于ntpServerOther1Flag的值
                {
                    document.ConfigForm.ntpServer1.selectedIndex = i;  
                    vFlag = "1";
                }
            }
            else
            {
                if(document.ConfigForm.ntpServerOther2Flag.value == ntpServers[i])  //使默认选中值等于ntpServerOther2Flag的值
                {
                    document.ConfigForm.ntpServer2.selectedIndex = i+1;
                    vFlag = "1";
                }
            }
        }
        document.writeln("<option value=Other>Other</option>");
        if(vFlag == "0")
        {
            if(needed) 
            {
                if(document.ConfigForm.ntpServerOther1Flag.value == "0.0.0.0")
                    document.ConfigForm.ntpServer1.selectedIndex =  0;
                else{
                    document.ConfigForm.ntpServer1.selectedIndex =  ntpServers.length;

                    /*
                       ****** 已废弃**start********************
                        改用旧页面的方式了，以下注释是已废弃的方式
                        如果是自动不存在的值，那么说明是手动输入的
                        这时候就要把手动的勾选框勾上
                        这样是为了点提交的时候，，不会不小心把自动的当成新的值去提交
                        因为提交哪个值是按勾选哪一个来决定的
                    */
                    // setTimeout(function(){  
                    //       selectNtpChange()
                    // },0)
                    //****** 已废弃**end********************
                }
                    
            }else {
                if(document.ConfigForm.ntpServerOther2Flag.value == "None")
                    document.ConfigForm.ntpServer2.selectedIndex =  0;
                else{
                    if(ntpServers.length>2 && document.ConfigForm.ntpServerOther2Flag.value =="0.0.0.0"){
                        document.ConfigForm.ntpServer2.selectedIndex =  2;
                    }else{
                        document.ConfigForm.ntpServer2.selectedIndex =  ntpServers.length+1;
                    }
                    
                }
            }
        }
    }
    
    function checkntpServrState()  //根据选中值切换
    {
        var  vForm = document.ConfigForm;
        //if(vForm.ntpEnabled.checked) {
            if(vForm.ntpServer1.value == "Other")
                vForm.ntpServerOther1Flag.value = vForm.ntpServerOther1.value;
            else vForm.ntpServerOther1Flag.value = vForm.ntpServer1.value;
        

            console.log(vForm.ntpServerOther1Flag.value,'vForm.ntpServerOther1Flag.value')
        //}
    }

    function ntpChange(optionlist,textbox)   //通过选中值是否"Other"判断右边输入框是否显示
    {
    //if(document.ConfigForm.ntpEnabled.checked)
    //{
        //console.log(optionlist,textbox,'optionlist,textbox')
        if( optionlist[optionlist.selectedIndex].value == "Other" )
        {
            //console.log($(textbox).parent(),892)
            //$(textbox).get(0).removeAttr("disabled");
            textbox.disabled = false;
            $(textbox).parent().show();
        }else{
            textbox.value = "";
            textbox.disabled = true;
            $(textbox).parent().hide();
            //$(textbox).get(0).attr("disabled","disabled");
        }
    //}
    }
    // function selectNtpChange(){
    //     if(document.ConfigForm.ntpServer1.selectedIndex == ntpServers.length){
    //         $("#Manual").prop("checked",true);
    //     }else{
    //         $("#auto").prop("checked",true);
    //     }
    // }
    function isIpFormat(str)  //检验IP是否合法
    {
        var addrParts = str.split('.');
        if (addrParts.length != 4 )
            return false;
        if (isNaN(addrParts[0] || addrparts[i] == ""))
            return false;
        if (isPlusInteger(addrParts[0]) == false || isPlusInteger(addrParts[2]) == false 
            || isPlusInteger(addrParts[3]) == false || isPlusInteger(addrParts[4]) == false)
            return false;
        return true;
    }
    function isTValidName(name) {   //检验名字是否合法
        var i = 0;
        var unsafeString = "\"<>%\\^[]`\+\$\,='#&:;*/{} \t";
        for ( i = 0; i < name.length; i++ ) {
            for( j = 0; j < unsafeString.length; j++)
                if ( (name.charAt(i)) == unsafeString.charAt(j) )
                    return false;
        }
        return true;
    }
    function stSntp(domain,Enable,ntp1,ntp2,ZoneName)  //对象构造函数
    {
        this.domain = domain;
        this.Enable = Enable;
        this.ntp1 = ntp1;
        this.ntp2 = ntp2;
        this.ZoneName = ZoneName;
    }
    var SntpEntry = new Array(new stSntp("InternetGatewayDevice.Time","0","clock.fmt.he.net","clock.nyc.he.net","Beijing"),null);
    //console.log(JSON.stringify(SntpEntry),'SntpEntry')
    //[{"domain":"InternetGatewayDevice.Time","Enable":"0","ntp1":"clock.fmt.he.net","ntp2":"clock.nyc.he.net","ZoneName":"Beijing"},null]
    var Sntp = SntpEntry[0];
    function LoadFrame()
    {
        var i = 0;
        var ntp1 = Sntp.ntp1 ;   //"ntp1":"clock.fmt.he.net"
        var ntp2 = Sntp.ntp2;    //"ntp2":"clock.nyc.he.net"
        var ntp_enabled = Sntp.Enable;  //"Enable":"0"
        var tz_name = Sntp.ZoneName;  //"ZoneName":"Beijing"
        with (document.forms[0])
        {
            ntpEnblChange();  //Automatically--勾选框勾选之后页面显示处理
            ntpChange(ntpServer1,ntpServerOther1)
        }
    }
    function ntpEnblChange()  //Automatically--勾选框勾中之后显示Time Zone下拉框
    {
        if( document.forms[0].ntpEnabled.checked )
        {
            $('.toggleBox').show()
            document.forms[0].autotimeFlag.value = "0";//0 is auto time
        }
        else
        {
            $('.toggleBox').hide()
            document.forms[0].autotimeFlag.value = "2";//2 is manual 
        }
    }
    function Undo(){
        location.reload() 
    }
    function SubmitForm(){
        with( document.forms[0] ){

            //-------------------手动输入框验证----开始--------------------------------//
            if(ntpServer1.selectedIndex == ntpServers.length){  //如果是手动填写，，目前我认为就是旧页面的那个other
                if( ntpServerOther1.value.length == 0 )  //那么输入框就必须填
                { 
                    alert('Please input server address.');
                    document.ConfigForm.SaveFlag.value = 0;
                    return;
                }
                if( !checkeURL(ntpServerOther1.value))  //检验链接输入合法性
                { 
                    alert('Primary ntp server is invalid.');
                    document.ConfigForm.SaveFlag.value = 0;
                    return;
                }
                if(isIpv6Address(ntpServerOther1.value))  //检验链接输入合法性
                {
                    if(isUnicastIpv6Address(ntpServerOther1.value) == false)
                    {
                            alert('Primary ntp server is invalid.');
                            document.ConfigForm.SaveFlag.value = 0;
                            return;
                    }
                }
                else if (isIpFormat(ntpServerOther1.value))  //检验链接输入合法性
                {
                    if ( '0.0.0.0' != ntpServerOther1.value && isValidIpAddress(ntpServerOther1.value) == false)
                    {
                        alert('Primary ntp server is invalid.');
                        document.ConfigForm.SaveFlag.value = 0;
                        return;
                    }
                }
                else
                {
                        if(isTValidName(ntpServerOther1.value) == false)  //检验链接输入合法性
                        {
                                alert('Primary ntp server is invalid.');
                                document.ConfigForm.SaveFlag.value = 0;
                                return;
                        }
                }
            }
            //-------------------手动输入框验证----结束--------------------------------//
            checkntpServrState();
            // return;
            document.ConfigForm.SaveAlter_Flag.value = "1";
            document.ConfigForm.SaveFlag.value = "1";
            document.ConfigForm.submit();
            //showLoading();
        }
    }
    function DaylightChange(){
        if( document.forms[0].Daylight.checked )
                {
                    document.forms[0].DaylightFlag.value = "Enable";
                }
                else
                {
                    document.forms[0].DaylightFlag.value = "Disable";
                }
    }
</script>
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()" >
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Timezone</div>
    <div class="title-description-text">You can maintain the system time by synchronizing with a public time server over the Internet.</div>
    <FORM name="ConfigForm" action="/cgi-bin/true-page/admin/admin-timezone.asp" method="post">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <input type="hidden" name="autotimeFlag" value="0">
      <BR>
      <input type="hidden" name="SaveFlag" value="0">
      <input type="hidden" name="CountryName" value="<% tcWebApi_get("Timezone_Entry","TZ", "s") %>">
      <input type="hidden" name="ntpServerOther1Flag" value="<% tcWebApi_get("Timezone_Entry","SERVER", "s") %>">
      <input type="hidden" name="ntpServerOther2Flag" value="<% tcWebApi_get("Timezone_Entry","SERVER2", "s") %>">
      <input type="hidden" name="ntpSynctimeFlag" value="<% tcWebApi_get("Timezone_Entry","synctime", "s") %>">
      <INPUT TYPE="HIDDEN" NAME="isNtpServerTypeSupported" value="<% if tcWebApi_get("WebCustom_Entry","isNtpServerTypeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Current Time:</div>
        </div>
        <div class="col-6">
          <div class="title-text-right">
            <SCRIPT language=javascript>  
              //页面展示时间
              var currTime = '<%tcWebApi_get("DeviceInfo","cur_time2","s")%>';  //值：1/9/1970/22/2
              var curTimelist = currTime.split('/');
              if ( 5 == curTimelist.length )
              {
                document.write(curTimelist[2] + '-' + curTimelist[0] + '-' + curTimelist[1] + '&nbsp;&nbsp;' + curTimelist[3] + ':' + curTimelist[4]);
              }
              else
                document.write('N/A');
            </SCRIPT>
          </div>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
            <div class="title-text-left">Automatical time synchronization:</div>
        </div>
        <div class="col-6">
            <input onclick=ntpEnblChange()  type="checkbox" id="Automatical" value="checkbox" name="ntpEnabled" <%if TCWebApi_get("Timezone_Entry","TYPE", "h") = "0" then asp_Write("checked") end if%> >
        </div>
      </div>
      <div class="toggleBox">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Timezone Select:</div>
          </div>
          <div class="col-6">
            <select name="cboTimeZone" class="form-control input-select" >
              <SCRIPT language=javascript>
                writeTimeZoneList();  ////渲染TimeZone下拉框
              </SCRIPT>
            </select>
          </div>
        </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">Enable Daylight Saving Time:</div>
            </div>
            <div class="col-6">
              <input onclick=DaylightChange() type="checkbox" name=Daylight <%if tcWebApi_get("Timezone_Entry","DAYLIGHT","h") <> "Disable" then asp_Write("checked") end if%>>
              <input type="hidden" name="DaylightFlag" value="<%if tcWebApi_get("Timezone_Entry","DAYLIGHT","h") <> "Disable" then asp_Write("Enable") elseif tcWebApi_get("Timezone_Entry","DAYLIGHT","h") = "Disable" then asp_Write("Disable") end if%>">
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">WAN Interface:</div>
            </div>
            <div class="col-6">
              <select class="form-control input-select"  id="AddRouteTimeZone"  name="AddRouteTimeZone">
                <SCRIPT language=javascript>
                  listCreate(0);  //渲染Interface的下拉框
                </SCRIPT>
              </select>
            </div>
          </div>
          <div class="row p-1">
            <div class="col-6">
              <div class="title-text-left">SNTP Server:</div>
            </div>
            <div class="col-6">
              <div class="row" style="margin-left: 0px;">
                <!--<input type="radio" id="auto" value="auto" checked name="radio" class="mt-1"> &nbsp;&nbsp;-->
                <select class="form-control input-select" onChange=ntpChange(this.form.ntpServer1,this.form.ntpServerOther1)  name=ntpServer1 id="ntpServer1" >
                  <script language=javascript>
                    writeNtpList(true);  ////渲染Primary SNTP Server下拉框
                  </script>
                </select>
                <!--<input type="radio" id="Manual" value="Manual" name="radio" class="mt-1">&nbsp;&nbsp;-->
                <div class="manualBox">
                    <div class="inner" id="textInputBox">
                            <input class="form-control input-textfield-20" name=ntpServerOther1 value="<%if tcWebApi_get("Timezone_Entry","SERVER","h") <> "N/A" then tcWebApi_get("Timezone_Entry","SERVER","s") end if%>">&nbsp;&nbsp;
                            <div class="title-text-right" id="btnclick">(Manual Setting)</div>
                    </div>
                </div>
                
              </div>
            </div>
          </div>
      </div>
    </FORM>
    <div class="mt-2 center">
      <button class="btn-dashboard" type="button" onclick=SubmitForm()>Apply</button>
      <button class="btn-dashboard" type="button" onclick="Undo()">Refresh</button>
    </div>
  </div>
<!-- content -->
</body>

</html>
