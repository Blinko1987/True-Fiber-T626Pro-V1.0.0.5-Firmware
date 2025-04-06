<%
if Request_Form("DDNS_Flag") = "0" then
  TCWebApi_set("WebCurSet_Entry","ddns_id","Curddns_Flag")
elseif Request_Form("DDNS_Flag") = "1" then
  TCWebApi_set("WebCurSet_Entry","ddns_id","Curddns_Flag")
  TCWebApi_set("Ddns_Entry","Active","EnableDDNS_Flag")
  TCWebApi_set("Ddns_Entry","DDNS_Name","ddns_Servername")
  TCWebApi_set("Ddns_Entry","DDNS_Protocal","DDNSProtocol")
  TCWebApi_set("Ddns_Entry","SERVERNAME","DDNSServer")
  TCWebApi_set("Ddns_Entry","SERVICEPORT","ServicePort")
  TCWebApi_set("Ddns_Entry","DDNS_Interface","Interface")
  TCWebApi_set("Ddns_Entry","MYHOST","DDNSHostName")
  TCWebApi_set("Ddns_Entry","DDNS_Domain","DDNSDomainName")
  TCWebApi_set("Ddns_Entry","USERNAME","DDNSUsername")
  TCWebApi_set("Ddns_Entry","PASSWORD","DDNSPassword")
  TCWebApi_set("Ddns_Entry","Wan_IPversion","Wan_ipversion")
  TCWebApi_commit("Ddns_Entry")
  TCWebApi_save()
elseif Request_Form("DDNS_Flag") = "2" then
  if Request_Form("hDdnsEntry0") <> "-1" then
    TCWebApi_unset("Ddns_Entry0")
  end if
  
  if Request_Form("hDdnsEntry1") <> "-1" then
    TCWebApi_unset("Ddns_Entry1")
  end if
  
  if Request_Form("hDdnsEntry2") <> "-1" then
    TCWebApi_unset("Ddns_Entry2")
  end if

  if Request_Form("hDdnsEntry3") <> "-1" then
    TCWebApi_unset("Ddns_Entry3")
  end if

  if Request_Form("hDdnsEntry4") <> "-1" then
    TCWebApi_unset("Ddns_Entry4")
  end if

  if Request_Form("hDdnsEntry5") <> "-1" then
    TCWebApi_unset("Ddns_Entry5")
  end if

  if Request_Form("hDdnsEntry6") <> "-1" then
    TCWebApi_unset("Ddns_Entry6")
  end if

  if Request_Form("hDdnsEntry7") <> "-1" then
    TCWebApi_unset("Ddns_Entry7")
  end if
  if Request_Form("hDdnsEntry8") <> "-1" then
    TCWebApi_unset("Ddns_Entry8")
  end if
  
  if Request_Form("hDdnsEntry9") <> "-1" then
    TCWebApi_unset("Ddns_Entry9")
  end if
  
  if Request_Form("hDdnsEntry10") <> "-1" then
    TCWebApi_unset("Ddns_Entry10")
  end if

  if Request_Form("hDdnsEntry11") <> "-1" then
    TCWebApi_unset("Ddns_Entry11")
  end if

  if Request_Form("hDdnsEntry12") <> "-1" then
    TCWebApi_unset("Ddns_Entry12")
  end if

  if Request_Form("hDdnsEntry13") <> "-1" then
    TCWebApi_unset("Ddns_Entry13")
  end if

  if Request_Form("hDdnsEntry14") <> "-1" then
    TCWebApi_unset("Ddns_Entry14")
  end if

  if Request_Form("hDdnsEntry15") <> "-1" then
    TCWebApi_unset("Ddns_Entry15")
  end if
  if Request_Form("hDdnsEntry16") <> "-1" then
    TCWebApi_unset("Ddns_Entry16")
  end if
  
  if Request_Form("hDdnsEntry17") <> "-1" then
    TCWebApi_unset("Ddns_Entry17")
  end if
  
  if Request_Form("hDdnsEntry18") <> "-1" then
    TCWebApi_unset("Ddns_Entry18")
  end if

  if Request_Form("hDdnsEntry19") <> "-1" then
    TCWebApi_unset("Ddns_Entry19")
  end if

  if Request_Form("hDdnsEntry20") <> "-1" then
    TCWebApi_unset("Ddns_Entry20")
  end if

  if Request_Form("hDdnsEntry21") <> "-1" then
    TCWebApi_unset("Ddns_Entry21")
  end if

  if Request_Form("hDdnsEntry22") <> "-1" then
    TCWebApi_unset("Ddns_Entry22")
  end if

  if Request_Form("hDdnsEntry23") <> "-1" then
    TCWebApi_unset("Ddns_Entry23")
  end if
    if Request_Form("hDdnsEntry24") <> "-1" then
    TCWebApi_unset("Ddns_Entry24")
  end if
  
  if Request_Form("hDdnsEntry25") <> "-1" then
    TCWebApi_unset("Ddns_Entry25")
  end if
  
  if Request_Form("hDdnsEntry26") <> "-1" then
    TCWebApi_unset("Ddns_Entry26")
  end if

  if Request_Form("hDdnsEntry27") <> "-1" then
    TCWebApi_unset("Ddns_Entry27")
  end if

  if Request_Form("hDdnsEntry28") <> "-1" then
    TCWebApi_unset("Ddns_Entry28")
  end if

  if Request_Form("hDdnsEntry29") <> "-1" then
    TCWebApi_unset("Ddns_Entry29")
  end if

  if Request_Form("hDdnsEntry30") <> "-1" then
    TCWebApi_unset("Ddns_Entry30")
  end if

  if Request_Form("hDdnsEntry31") <> "-1" then
    TCWebApi_unset("Ddns_Entry31")
  end if
    if Request_Form("hDdnsEntry32") <> "-1" then
    TCWebApi_unset("Ddns_Entry32")
  end if
  
  if Request_Form("hDdnsEntry33") <> "-1" then
    TCWebApi_unset("Ddns_Entry33")
  end if
  
  if Request_Form("hDdnsEntry34") <> "-1" then
    TCWebApi_unset("Ddns_Entry34")
  end if

  if Request_Form("hDdnsEntry35") <> "-1" then
    TCWebApi_unset("Ddns_Entry35")
  end if

  if Request_Form("hDdnsEntry36") <> "-1" then
    TCWebApi_unset("Ddns_Entry36")
  end if

  if Request_Form("hDdnsEntry37") <> "-1" then
    TCWebApi_unset("Ddns_Entry37")
  end if

  if Request_Form("hDdnsEntry38") <> "-1" then
    TCWebApi_unset("Ddns_Entry38")
  end if

  if Request_Form("hDdnsEntry39") <> "-1" then
    TCWebApi_unset("Ddns_Entry39")
  end if
    if Request_Form("hDdnsEntry40") <> "-1" then
    TCWebApi_unset("Ddns_Entry40")
  end if
  
  if Request_Form("hDdnsEntry41") <> "-1" then
    TCWebApi_unset("Ddns_Entry41")
  end if
  
  if Request_Form("hDdnsEntry42") <> "-1" then
    TCWebApi_unset("Ddns_Entry42")
  end if

  if Request_Form("hDdnsEntry43") <> "-1" then
    TCWebApi_unset("Ddns_Entry43")
  end if

  if Request_Form("hDdnsEntry44") <> "-1" then
    TCWebApi_unset("Ddns_Entry44")
  end if

  if Request_Form("hDdnsEntry45") <> "-1" then
    TCWebApi_unset("Ddns_Entry45")
  end if

  if Request_Form("hDdnsEntry46") <> "-1" then
    TCWebApi_unset("Ddns_Entry46")
  end if

  if Request_Form("hDdnsEntry47") <> "-1" then
    TCWebApi_unset("Ddns_Entry47")
  end if
    if Request_Form("hDdnsEntry48") <> "-1" then
    TCWebApi_unset("Ddns_Entry48")
  end if
  
  if Request_Form("hDdnsEntry49") <> "-1" then
    TCWebApi_unset("Ddns_Entry49")
  end if
  
  if Request_Form("hDdnsEntry50") <> "-1" then
    TCWebApi_unset("Ddns_Entry50")
  end if

  if Request_Form("hDdnsEntry51") <> "-1" then
    TCWebApi_unset("Ddns_Entry51")
  end if

  if Request_Form("hDdnsEntry52") <> "-1" then
    TCWebApi_unset("Ddns_Entry52")
  end if

  if Request_Form("hDdnsEntry53") <> "-1" then
    TCWebApi_unset("Ddns_Entry53")
  end if

  if Request_Form("hDdnsEntry54") <> "-1" then
    TCWebApi_unset("Ddns_Entry54")
  end if

  if Request_Form("hDdnsEntry55") <> "-1" then
    TCWebApi_unset("Ddns_Entry55")
  end if
    if Request_Form("hDdnsEntry56") <> "-1" then
    TCWebApi_unset("Ddns_Entry56")
  end if
  
  if Request_Form("hDdnsEntry57") <> "-1" then
    TCWebApi_unset("Ddns_Entry57")
  end if
  
  if Request_Form("hDdnsEntry58") <> "-1" then
    TCWebApi_unset("Ddns_Entry58")
  end if

  if Request_Form("hDdnsEntry59") <> "-1" then
    TCWebApi_unset("Ddns_Entry59")
  end if

  if Request_Form("hDdnsEntry60") <> "-1" then
    TCWebApi_unset("Ddns_Entry60")
  end if

  if Request_Form("hDdnsEntry61") <> "-1" then
    TCWebApi_unset("Ddns_Entry61")
  end if

  if Request_Form("hDdnsEntry62") <> "-1" then
    TCWebApi_unset("Ddns_Entry62")
  end if

  if Request_Form("hDdnsEntry63") <> "-1" then
    TCWebApi_unset("Ddns_Entry63")
  end if

  TCWebApi_commit("Ddns_Entry")
  TCWebApi_save()
elseif Request_Form("DDNS_Flag") = "3" then
  TCWebApi_set("WebCurSet_Entry","ddns_id","Curddns_Flag")
  TCWebApi_set("Ddns_Common","CurIndex","Curddns_Flag")
    TCWebApi_commit("Ddns")
elseif Request_Form("DDNS_Flag") = "4" then
    TCWebApi_unset("Ddns_Entry0")
    TCWebApi_unset("Ddns_Entry1")
    TCWebApi_unset("Ddns_Entry2")
    TCWebApi_unset("Ddns_Entry3")
    TCWebApi_unset("Ddns_Entry4")
    TCWebApi_unset("Ddns_Entry5")
    TCWebApi_unset("Ddns_Entry6")
    TCWebApi_unset("Ddns_Entry7")
    TCWebApi_unset("Ddns_Entry8")
    TCWebApi_unset("Ddns_Entry9")
    TCWebApi_unset("Ddns_Entry10")
    TCWebApi_unset("Ddns_Entry11")
    TCWebApi_unset("Ddns_Entry12")
    TCWebApi_unset("Ddns_Entry13")
    TCWebApi_unset("Ddns_Entry14")
    TCWebApi_unset("Ddns_Entry15")
    TCWebApi_unset("Ddns_Entry16")
    TCWebApi_unset("Ddns_Entry17")
    TCWebApi_unset("Ddns_Entry18")
    TCWebApi_unset("Ddns_Entry19")
    TCWebApi_unset("Ddns_Entry20")
    TCWebApi_unset("Ddns_Entry21")
    TCWebApi_unset("Ddns_Entry22")
    TCWebApi_unset("Ddns_Entry23")
    TCWebApi_unset("Ddns_Entry24")
    TCWebApi_unset("Ddns_Entry25")
    TCWebApi_unset("Ddns_Entry26")
    TCWebApi_unset("Ddns_Entry27")
    TCWebApi_unset("Ddns_Entry28")
    TCWebApi_unset("Ddns_Entry29")
    TCWebApi_unset("Ddns_Entry30")
    TCWebApi_unset("Ddns_Entry31")
    TCWebApi_unset("Ddns_Entry32")
    TCWebApi_unset("Ddns_Entry33")
    TCWebApi_unset("Ddns_Entry34")
    TCWebApi_unset("Ddns_Entry35")
    TCWebApi_unset("Ddns_Entry36")
    TCWebApi_unset("Ddns_Entry37")
    TCWebApi_unset("Ddns_Entry38")
    TCWebApi_unset("Ddns_Entry39")
    TCWebApi_unset("Ddns_Entry40")
    TCWebApi_unset("Ddns_Entry41")
    TCWebApi_unset("Ddns_Entry42")
    TCWebApi_unset("Ddns_Entry43")
    TCWebApi_unset("Ddns_Entry44")
    TCWebApi_unset("Ddns_Entry45")
    TCWebApi_unset("Ddns_Entry46")
    TCWebApi_unset("Ddns_Entry47")
    TCWebApi_unset("Ddns_Entry48")
    TCWebApi_unset("Ddns_Entry49")
    TCWebApi_unset("Ddns_Entry50")
    TCWebApi_unset("Ddns_Entry51")
    TCWebApi_unset("Ddns_Entry52")
    TCWebApi_unset("Ddns_Entry53")
    TCWebApi_unset("Ddns_Entry54")
    TCWebApi_unset("Ddns_Entry55")
    TCWebApi_unset("Ddns_Entry56")
    TCWebApi_unset("Ddns_Entry57")
    TCWebApi_unset("Ddns_Entry58")
    TCWebApi_unset("Ddns_Entry59")
    TCWebApi_unset("Ddns_Entry60")
    TCWebApi_unset("Ddns_Entry61")
    TCWebApi_unset("Ddns_Entry62")
    TCWebApi_unset("Ddns_Entry63")
  TCWebApi_commit("Ddns_Entry")
  TCWebApi_save()
end if

if Request_Form("DDNS_ONOFF_Flag") = "1" then
TCWebApi_set("Ddns_Entry","Active","EnableDDNS_Flag")
TCWebApi_commit("Ddns_Entry")
TCWebApi_save()
end if

%>
<!--
  elseif Request_Form("DDNS_Flag") = "3" then   'Interface下拉框选值后 DDNS_Flag:3
    TCWebApi_set("WebCurSet_Entry","ddns_id","Curddns_Flag")    'Interface选中的值，目前
    TCWebApi_set("Ddns_Common","CurIndex","Curddns_Flag")
    TCWebApi_commit("Ddns")
  end if
-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Dynamic DNS Configuration</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/main.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <script src="/scripts/utils/util_skyw.js"></script>
  <!-- script -->
  <SCRIPT language=JavaScript>
    //获取页面表格需要展示的数据
    var ddnsRuleTable = '<% tcWebApi_GetTable("Ddns", "Entry") %>';
    var ddnsRuleTableObj = JSON.parse(ddnsRuleTable);

    var ddnsListObj = new Array();
    $.each(ddnsRuleTableObj, function(i, object) {
      if(object.hasOwnProperty("DDNS_Domain")){
        ddnsListObj.push({
          ddnsName:object.DDNS_Name,
          Hostname:object.SERVERNAME,
          Interface:object.DDNS_Interface,
          Enable:object.Active,
          DomainName:object.DDNS_Domain,
          UserName:object.USERNAME,
          Ddns_EntryIndex:object.EntryIndex
        })
      }
    });

    $(document).ready(function(){
      var tmpContent = $("script[data-id='ddnsList']").html();
      renderList(tmpContent, ddnsListObj, document.querySelector("#ddnsListContainer"));
    });

    var renderList = function(tmpContent, renderData, wrappers){ //html渲染函数
      var rederHtml = '';
      $.each(renderData, function(i, object) {
        object.index= i;
        rederHtml += tmpContent.tmp(object);  //填充模版字符串中的变量
        //console.log(tmpContent.tmp(object),'tmpContent=tmp');
      });
      if (wrappers) {
        while(wrappers.hasChildNodes()){
            wrappers.removeChild(wrappers.firstChild);
        }
        wrappers.appendHTML(rederHtml);
        }
    }
    console.log(ddnsListObj,'ddnsListObj>>>>>');
    String.prototype.tmp = function(obj) {  //填充模版字符串中的变量
      var format = {
        name: function(x) {
          return x ;
        }
      };

      console.log(format,'format>>')
      return this.replace(/{(\w+)}/g, function(m1, m2) {
        console.log(m1,m2,'mmm')  ///{chkSwitch} chkSwitch mmm
        if (!m2)
            return "";
        return (format && format[m2]) ? format[m2](obj[m2]) : obj[m2];
      });
    };

    HTMLElement.prototype.appendHTML = function(html) {
      var divTemp = document.createElement("table");
      nodes = null,

      fragment = document.createDocumentFragment();
      divTemp.innerHTML = html;
      nodes = divTemp.childNodes;
      for (var i=0, length=nodes.length; i<length; i+=1) {
        fragment.appendChild(nodes[i].cloneNode(true));
      }
      this.appendChild(fragment);
      nodes = null;
      fragment = null;
    };

     var IfaceNumber = 0;
     var ddnsActive = '<% tcWebApi_get("Ddns_Entry","Active","s") %>';
     var ddnsEnable = 0;

     function LoadFrame()  //页面初始化
     {
        if (typeof(top.DDNSProvider) != 'undefined' && top.DDNSProvider != '')  //top.DDNSProvider是undefined;
          setSelect('DDNSProviderType',top.DDNSProvider);  //不走这里
        ISPStatus();  //走入这里

        if ( 0 == IfaceNumber ) { //IfaceNumber -> 2  //表示Interface下拉框的个数
          setDisable('Add_Button', 1);   //下拉框还没出来时禁止点击添加按钮
        //document.DdnsForm.DDNS_Flag.value = "0";
        }else{
          setDisable('DDNSPassword', 0);  //允许输入
          setDisable('DDNSUsername', 0);
        }
        toggleProviderDsiplay()
        if(ddnsActive == "Yes"){
          ddnsEnable = 1;
          $("#DDNS_content").show();
        }else{
          ddnsEnable = 0;
          $("#DDNS_content").hide();
        }
     }

    function toggleProviderDsiplay(){
      with (document.forms[0]){
        console.log(DDNSProviderType.value,'DDNSProviderType');
        console.log(DDNSProvider.value,'DDNSProvider');
        if(DDNSProvider.value == 'dyndns.org' || DDNSProvider.value == 'noip.com'){
          DDNSProviderType.value = DDNSProvider.value
          setDisplay('tr_ProviderName',0);
        }else{
          DDNSProviderType.value = 'Other'
          setDisplay('tr_ProviderName',1);
        }
      }
    }

    function ISPStatus()  //根据值控制输入框是否可以输入
    {
      with (document.forms[0])
      {
        if (DDNSProviderType.value == '2233.org' || DDNSProviderType.value == 'dyndns.org' || DDNSProviderType.value == 'noip.com')
        {
          setDisplay('tr_ProviderName',0);
        }
        else
        {
          setDisplay('tr_ProviderName',1);
        }
      }
    }

    function ISPChange()//Provider下拉框切换事件
    {
      with (document.forms[0])
      {
        if (DDNSProviderType.value == '2233.org' || DDNSProviderType.value == 'dyndns.org' || DDNSProviderType.value == 'noip.com')
        {
          setDisplay('tr_ProviderName',0);
        }
        else//如果是‘other’，那么把隐藏的输入框显示出来
        {
          setDisplay('tr_ProviderName',1);
        }
        if(DDNSProviderType.value == 'noip.com')   //设置Server（Hostname）输入框的值
        {
          DDNSServer.value = "dynupdate.no-ip.com";
        }else if(DDNSProviderType.value == 'dyndns.org')
        {
          DDNSServer.value = "members.dyndns.org";
        }else
        {
          DDNSServer.value = "";
        }
      }
    }

    var Wan_IPVERSION = new Array();
    function WriteWanNameSelected()  //渲染Interface下拉框
    {
      var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
      var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
      var vEntryName = vArrayStr.split(',');  //转成数组
      vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
      var vEntryValue = vArrayStr.split(',');  //转成数组
      vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanValidIF","s") %>";
      var vEntryIndex = vArrayStr.split(',');  //转成数组
      
      vArrayStr = "<% tcWebApi_get("WanInfo_Common","WANEnNAT","s") %>";
      var WANEnNAT = vArrayStr.split(',');
      
      vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
      Wan_IPVERSION = vArrayStr.split(',');
      var selObj = getElById("Interface");
      var Curddns_index = document.DdnsForm.Curddns_Flag.value;

      vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );  //SortUtil：util_skyw.js 中的一个对象
      
      vEntryValue = SortUtil.SortMyArray( vEntryValue );
      vEntryIndex = SortUtil.SortMyArray( vEntryIndex );
      Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
      for (i = 0; i < nEntryNum; i++)
      {
        if( ( vEntryName[i].indexOf('_INTERNET_') >= 0 || vEntryName[i].indexOf('OTHER') >= 0 )
            && vEntryName[i].indexOf('_B_') < 0 )
        {
          IfaceNumber ++;
          if(vEntryIndex[i] == Curddns_index)
          {
            document.writeln("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +" selected>" + vEntryValue[i] + "</option>");
            document.DdnsForm.Wan_ipversion.value = Wan_IPVERSION[i];
          }
          else
          {
            document.writeln("<option id=" + vEntryIndex[i] + " " + "value=" + vEntryValue[i] +">" + vEntryValue[i] + "</option>");
          }
        }
      }
    }

    function interfaceChange()  //Interface下拉框切换事件 --- 会直接提交表单 DDNS_Flag：3
    {
      with (document.forms[0])
      {
        var selObj = getElById("Interface");  //getElById方法是优先通过name获取，如果没有再根据Id获取
        var temp = selObj.options[selObj.selectedIndex].id;  //当前选中项的id
        Curddns_Flag.value = temp;
        if(selObj.selectedIndex < Wan_IPVERSION.length)  ///Wan_IPVERSION : ["IPv4/IPv6", "IPv4/IPv6"]
        {
          Wan_ipversion.value = Wan_IPVERSION[selObj.selectedIndex];
        }
        DDNS_Flag.value = "3";
      }
      document.forms[0].submit();
      showLoading();
    }


    function btnSubmit()  //'add'按钮点击事件
    {
      with (document.forms[0])
      {
        if (DDNSProviderType.value == '2233.org')
        {
          ddns_Servername.value = "2233.org";
        }
        else if(DDNSProviderType.value == 'dyndns.org')
        {
          ddns_Servername.value = "dyndns.org";
        }
        else if(DDNSProviderType.value == 'noip.com')
        {
          ddns_Servername.value = "noip.com";
        }
        else
        {
          if(isValidDDNSProvider()==false)
          {
            alert("Invalid DDNS!")
            return;
          }
          ddns_Servername.value = DDNSProvider.value;
        }
        
        if(DDNSCfgEnabled.checked)
          EnableDDNS_Flag.value = "Yes";
        else EnableDDNS_Flag.value = "No";
        var selObj = getElById("Interface");
        var temp = selObj.options[selObj.selectedIndex].id; //??
        Curddns_Flag.value = temp;
        DDNS_Flag.value = "1";
      }
      if(CheckForm()== true)
      {
        document.forms[0].submit();
        showLoading();
      }
    }

    function isValidDDNSProvider() //Provider合法校验
    {
      var ddns_Provider = document.forms[0].DDNSProvider.value;
      var len = ddns_Provider.length;
      if(len!=0)
      {
        for ( var j = 0 ; j < len ; j++ )
        {
          var ch = ddns_Provider.charCodeAt(j)
          if(ch < 0 || ch > 255)
          {
            return false;
          }
        }
      }
      return true;
    }
    function CheckForm() //校验表单
    {
      with (getElById('DdnsForm'))
      {
        if(DDNSServer.value == "")
        {
          alert('Server can not be empty.');
          return false;
        }
        if (DDNSServer.value.indexOf("\"") >= 0 )
        {
          alert('Invalid server.' );
          return false;
        }
        if(Interface.value == "")
        {
          alert("Interface can not be empty!");
          return false;
        }
        if (DDNSDomainName.value == "")
        {
          alert('Domain name can not be empty.' );
          return false;
        }
        if (DDNSDomainName.value.indexOf("\"") >= 0 )
        {
          alert('Invalid domain name.' );
          return false;
        }
        if (DDNSUsername.value == "")
        {
          alert('User name can not be empty.' );
          return false;
        }
        if (DDNSUsername.value.indexOf("\"") >= 0 )
        {
          alert('Invalid user name.' );
          return false;
        }
        if (DDNSPassword.value == "")
        {
          alert('Password can not be empty.' );
          return false;
        }
        if (DDNSPassword.value.indexOf("\"") >= 0 )
        {
          alert('Invalid password.' );
          return false;
        }
      }
      return true;
    }
  </SCRIPT>
</head>

<body onload="if(getElById('DdnsForm') != null)LoadFrame()" >
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Dynamic DNS Configuration</div>
    <div class="title-description-text">This page is used to configure the Dynamic DNS address from DynDNS.org or TZO or No-IP. Here you can Add/Remove to configure Dynamic DNS.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Time Interval:</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" readonly value="86400" type="text">
      </div>
    </div>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard button-disable" disabled>Apply Changes</button>
    </div><br>
    <FORM name="DdnsForm" action="/cgi-bin/true-page/service/Dynamic-DNS-Configuration.asp" method="post">
      <input type="hidden" name="DDNS_Flag" value="0">
      <input type="hidden" name="DDNS_ONOFF_Flag" value="0">
      <input type="hidden" name="ddns_Servername" value="2233.org">
      <input type="hidden" name="EnableDDNS_Flag" value="<% tcWebApi_get("Ddns_Entry","Active","s") %>">
      <input type="hidden" name="Curddns_Flag" value="<% tcWebApi_get("Ddns_Common","CurIndex","s") %>">
      <input type="hidden" name="Wan_ipversion" value="IPV4">
      <input type="hidden" name="delnum">
      <input type="hidden" name="hDdnsEntry0" value="-1">
      <input type="hidden" name="hDdnsEntry1" value="-1">
      <input type="hidden" name="hDdnsEntry2" value="-1">
      <input type="hidden" name="hDdnsEntry3" value="-1">
      <input type="hidden" name="hDdnsEntry4" value="-1">
      <input type="hidden" name="hDdnsEntry5" value="-1">
      <input type="hidden" name="hDdnsEntry6" value="-1">
      <input type="hidden" name="hDdnsEntry7" value="-1">
      <input type="hidden" name="hDdnsEntry8" value="-1">
      <input type="hidden" name="hDdnsEntry9" value="-1">
      <input type="hidden" name="hDdnsEntry10" value="-1">
      <input type="hidden" name="hDdnsEntry11" value="-1">
      <input type="hidden" name="hDdnsEntry12" value="-1">
      <input type="hidden" name="hDdnsEntry13" value="-1">
      <input type="hidden" name="hDdnsEntry14" value="-1">
      <input type="hidden" name="hDdnsEntry15" value="-1">
      <input type="hidden" name="hDdnsEntry16" value="-1">
      <input type="hidden" name="hDdnsEntry17" value="-1">
      <input type="hidden" name="hDdnsEntry18" value="-1">
      <input type="hidden" name="hDdnsEntry19" value="-1">
      <input type="hidden" name="hDdnsEntry20" value="-1">
      <input type="hidden" name="hDdnsEntry21" value="-1">
      <input type="hidden" name="hDdnsEntry22" value="-1">
      <input type="hidden" name="hDdnsEntry23" value="-1">
      <input type="hidden" name="hDdnsEntry24" value="-1">
      <input type="hidden" name="hDdnsEntry25" value="-1">
      <input type="hidden" name="hDdnsEntry26" value="-1">
      <input type="hidden" name="hDdnsEntry27" value="-1">
      <input type="hidden" name="hDdnsEntry28" value="-1">
      <input type="hidden" name="hDdnsEntry29" value="-1">
      <input type="hidden" name="hDdnsEntry30" value="-1">
      <input type="hidden" name="hDdnsEntry31" value="-1"> 
      <input type="hidden" name="hDdnsEntry32" value="-1">
      <input type="hidden" name="hDdnsEntry33" value="-1">
      <input type="hidden" name="hDdnsEntry34" value="-1">
      <input type="hidden" name="hDdnsEntry35" value="-1">
      <input type="hidden" name="hDdnsEntry36" value="-1">
      <input type="hidden" name="hDdnsEntry37" value="-1">
      <input type="hidden" name="hDdnsEntry38" value="-1">
      <input type="hidden" name="hDdnsEntry39" value="-1">
      <input type="hidden" name="hDdnsEntry40" value="-1">
      <input type="hidden" name="hDdnsEntry41" value="-1">
      <input type="hidden" name="hDdnsEntry42" value="-1">
      <input type="hidden" name="hDdnsEntry43" value="-1">
      <input type="hidden" name="hDdnsEntry44" value="-1">
      <input type="hidden" name="hDdnsEntry45" value="-1">
      <input type="hidden" name="hDdnsEntry46" value="-1">
      <input type="hidden" name="hDdnsEntry47" value="-1">
      <input type="hidden" name="hDdnsEntry48" value="-1">
      <input type="hidden" name="hDdnsEntry49" value="-1">
      <input type="hidden" name="hDdnsEntry50" value="-1">
      <input type="hidden" name="hDdnsEntry51" value="-1">
      <input type="hidden" name="hDdnsEntry52" value="-1">
      <input type="hidden" name="hDdnsEntry53" value="-1">
      <input type="hidden" name="hDdnsEntry54" value="-1">
      <input type="hidden" name="hDdnsEntry55" value="-1">
      <input type="hidden" name="hDdnsEntry56" value="-1">
      <input type="hidden" name="hDdnsEntry57" value="-1">
      <input type="hidden" name="hDdnsEntry58" value="-1">
      <input type="hidden" name="hDdnsEntry59" value="-1">
      <input type="hidden" name="hDdnsEntry60" value="-1">
      <input type="hidden" name="hDdnsEntry61" value="-1">
      <input type="hidden" name="hDdnsEntry62" value="-1">
      <input type="hidden" name="hDdnsEntry63" value="-1"> 
      <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Enable:</div>
      </div>
      <div class="col-6">
        <input type="checkbox" name="DDNSCfgEnabled" onclick="SetEnable()" <%if tcWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> >
      </div>
      </div>
      <div id="DDNS_content">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">DDNS Provider:</div>
          </div>
          <div class="col-6">
            <SELECT class="form-control input-select" onchange=ISPChange() size=1 name="DDNSProviderType" > 
              <OPTION value="noip.com" <%if tcWebApi_get("Ddns_Entry","DDNS_Name","h") = "noip.com" then asp_Write("selected") elseif tcWebApi_get("Ddns_Entry","DDNS_Name","h") = "N/A" then asp_Write("selected") end if %>>noip.com</OPTION>
              <!--<OPTION value="2233.org" <%if tcWebApi_get("Ddns_Entry","DDNS_Name","h") = "2233.org" then asp_Write("selected") end if %>>2233.org</OPTION>-->
              <OPTION value="dyndns.org" <%if tcWebApi_get("Ddns_Entry","DDNS_Name","h") = "dyndns.org" then asp_Write("selected") end if %>>dyndns.org</OPTION> 
              <OPTION value="Other">Other</OPTION>
              </SELECT>
          </div>
        </div>
        <div class="row p-1"  id=tr_ProviderName>
          <div class="col-6">
            <div class="title-text-left">Provider Name:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" name="DDNSProvider" value="<%if TCWebApi_get("Ddns_Entry","DDNS_Name","h" ) <> "N/A" then TCWebApi_get("Ddns_Entry","DDNS_Name","s" ) end if %>">
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Hostname:</div>
          </div>
          <div class="col-6">
            <input name="DDNSServer" class="form-control input-textfield" value="<%if TCWebApi_get("Ddns_Entry","SERVERNAME","h" ) <> "N/A" then TCWebApi_get("Ddns_Entry","SERVERNAME","s" ) elseif tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "N/A" then asp_Write("dynupdate.no-ip.com") end if  %>"
            >
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Interface:</div>
          </div>
          <div class="col-6">
            <select class="form-control input-select" name="Interface" onchange=interfaceChange()> 
              <script language="JavaScript" type="text/javascript">
                WriteWanNameSelected();
              </script>
            </select>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Domain Name:</div>
          </div>
          <div class="col-6">
            <input class="form-control input-textfield" name="DDNSDomainName" value="<%if TCWebApi_get("Ddns_Entry","DDNS_Domain","h" ) <> "N/A" then TCWebApi_get("Ddns_Entry","DDNS_Domain","s" ) end if %>">
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Username/Email:</div>
          </div>
          <div class="col-6">
            <INPUT type="text" id="hiddenaccount_ddns" style="position:absolute; top:-500px;" />
            <INPUT type="password" id="hiddenpwd_ddns" style="position:absolute; top:-500px;" />
            <INPUT class="form-control input-textfield" disabled maxLength=32 name="DDNSUsername" value="<%if TCWebApi_get("Ddns_Entry","USERNAME","h" ) <> "N/A" then TCWebApi_get("Ddns_Entry","USERNAME","s" ) end if %>">
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">Password/Key:</div>
          </div>
          <div class="col-6">
            <INPUT class="form-control input-textfield" style="width: 143px;" disabled type="password" maxLength=32 name="DDNSPassword" value="<%if TCWebApi_get("Ddns_Entry","PASSWORD","h" ) <> "N/A" then TCWebApi_get("Ddns_Entry","PASSWORD","s" ) end if %>">
          </div>
        </div>
      </FORM>
      <div class="mt-2 center">
          <button type="button" class="btn-dashboard" id='Add_Button' onclick="btnSubmit()" name='Add_Button'>Add</button>
      </div>
    </div>

    <div class="card-table-content" id="">
      <div class="table-header">Dynamic DNS Table</div>
        <table style="width:100%" id="ddnsTable">
        <tr class="table-header center">
          <th style="width: 10%;" class="p-1">DDNS Name</th>
          <th style="width: 25%;" class="p-1">Hostname</th>
          <th style="width: 10%;">Interface</th>
          <th style="width: 5%;">Enable</th>
          <th style="width: 25%;">Domain Name</th>
          <th style="width: 20%;">User Name</th>
          <th style="width: 5%;">Select</th>
        </tr>
        </table>
        <table style="width:100%" id="ddnsListContainer">
          <script type="text/template" data-id="ddnsList">
            <tr class="table-content-fist center">
              <td style="width: 10%;" class="p-1">{ddnsName}</td>
              <td style="width: 25%;" >{Hostname}</td>
              <td style="width: 10%;">{Interface}</td>
              <td style="width: 5%;">{Enable}</td>
              <td style="width: 25%;">{DomainName}</td>
              <td style="width: 20%;">{UserName}</td>
              <td style="width: 5%;">
              <input type="checkbox" id="chkbox{Ddns_EntryIndex}" name="chkbox{Ddns_EntryIndex}" value="{chkSwitch}" {chkSelect} >
              </td>
            </tr>
          </script>
        </table>
      </div>
    <div class="mt-2 center">
      <button type="button" class="btn-dashboard" id='Del_Button' onclick="delConfirm()" name='Del_Button'>Delete Selected</button>
      <button type="button" class="btn-dashboard" id='DelAll_Button' onclick="delAllSubmit()" name='DelAll_Button'>Delete All</button>
    </div>
  </div>
  <!-- content -->
  <!-- lxf --页面开发备注
      旧页面中的 AssociateParam 函数不知道是起什么作用的，我暂时不管
  -->

  <script>
    function delConfirm(){
      var del_list = new Array();
      var i, count = 0;
      var chkboxlist = $('table input[type=checkbox]');
      for(i = 0; i < chkboxlist.length; i++){
        var boxName = chkboxlist[i].name;
        var selectIndex = parseInt(boxName.slice(6));

        if(chkboxlist[i].checked){
          count++;
          del_list.push(selectIndex);
        }
      }
      console.log(del_list,'del_list>>>')
      if( !count ){
        alert("Please select at least one item.");
        return false;
      }else{
        var deleteTips = simpleAlert({
        "content": "Are you sure to delete checked items?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            setTimeout(function () {
              setDelBtnFlag(del_list);
              document.DdnsForm.DDNS_Flag.value = "2";
              document.DdnsForm.submit();
            },500);
          },
          "Cancel":function () {
            deleteTips.close();
          }
        }
        });
      }
    }

    function setDelBtnFlag(del_list){
      for(i = 0; i < del_list.length; i++){
        $("input[name='hDdnsEntry"+ del_list[i] +"']").val(1);
      }
    }
    function delAllSubmit()
    {
      selectChkBox(true);
      setTimeout("delAllConfirm()",100);
    }
    
    function selectChkBox(isChecked)
    {
      var chkboxlist = $('table input[type=checkbox]');

      for(i = 0; i < chkboxlist.length; i++){
        var boxName = chkboxlist[i].name;
        var selectIndex = parseInt(boxName.slice(6));
        $("#chkbox" + selectIndex).prop("checked",isChecked);
      }
    }
    
    function delAllConfirm(){
      var vForm = document.DdnsForm;
      var deleteTips = simpleAlert({
        "content": "Are you sure to delete all items?",
        "buttons":{
          "OK":function () {
            deleteTips.close();
            setTimeout(function () {
              document.DdnsForm.DDNS_Flag.value = "4";
              document.DdnsForm.submit();
            },500);
          },
          "Cancel":function () {
            deleteTips.close();
            selectChkBox(false);
            return false;
          }
        }
      });
    }

    function SetEnable() {
      var isChecked = $("input[name=DDNSCfgEnabled]").prop("checked");
      if(isChecked && !ddnsEnable){ //on
        var enableTips = simpleAlert({
          "content": "Are you sure to enable Dynamic DNS?",
          "buttons":{
            "OK":function () {
              enableTips.close();
              setTimeout(function () {
                $("#DDNS_content").show();
                document.DdnsForm.DDNS_ONOFF_Flag.value = "1";
                document.DdnsForm.EnableDDNS_Flag.value = "Yes";
                document.DdnsForm.submit();
                showLoading();
              },200);
            },
            "Cancel":function () {
              enableTips.close();
              $("input[name=DDNSCfgEnabled]").prop("checked",false);
              return;
            }
          }
        });
      }
      else if (!isChecked && ddnsEnable) //off
      {
        var disableTips = simpleAlert({
          "content": "Are you sure to disable Dynamic DNS?",
          "buttons":{
            "OK":function () {
              disableTips.close();
              setTimeout(function () {
                $("#DDNS_content").hide();
                document.DdnsForm.DDNS_ONOFF_Flag.value = "1";
                document.DdnsForm.EnableDDNS_Flag.value = "No";
                document.DdnsForm.submit();
                showLoading();
              },200);
            },
            "Cancel":function () {
              disableTips.close();
              $("input[name=DDNSCfgEnabled]").prop("checked",true);
              return;
            }
          }
        });
      }
    }
  </script>
</body>

</html>