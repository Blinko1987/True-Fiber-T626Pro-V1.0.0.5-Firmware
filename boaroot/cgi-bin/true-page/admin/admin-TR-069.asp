<%
if Request_Form("SaveFlag") = "1" then
	    TCWebApi_set("Cwmp_Entry","periodActive","PeriodicInformEnable")  '// Periodic Inform	
		TCWebApi_set("Cwmp_Entry","periodInterval","PeriodicInformInterval" )
		TCWebApi_set("Cwmp_Entry","prdInformTime","PeriodicInformTime" )
		TCWebApi_set("Cwmp_Entry","acsUrl","URL" )
		TCWebApi_set("Cwmp_Entry","acsUserName","Username" )
		TCWebApi_set("Cwmp_Entry","acsPassword","Password" )
		TCWebApi_set("Cwmp_Entry","conReqUserName","ConnectionRequestUsername" )
    TCWebApi_set("Cwmp_Entry","conReqPort","conReqPort" )
    TCWebApi_set("Cwmp_Entry","conReqPath","ConnectionRequestPath" )
		TCWebApi_set("Cwmp_Entry","conReqPassword","ConnectionRequestPassword" )
		TCWebApi_set("WebCurSet_Entry","CurPage","1")
        TCWebApi_commit("Cwmp_Entry")
        TCWebApi_save()
elseif Request_Form("postflag") = "1" then  '// 如果要提交文件
        if tcwebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" then   
            TCWebApi_set("Cwmp_Entry","sslAuthMode","sslAuthMode")    '// 提交的文件类型
        end if
        if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then     '//  ???
            if tcwebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" then   '//  ???
                TCWebApi_set("Cwmp_Entry","UpgradeCAFlag","fileIndex")  '//页面隐藏input，值为1
                TCWebApi_commit("Cwmp_Entry")
            else
                TCWebApi_set("SslCA_Flag","UpgradeFlag","fileIndex")
                TCWebApi_commit("SslCA")
            end if
                'tcWebApi_set("System_Entry","upgrade_fw","fileIndex")
                'tcWebApi_Commit("System_Entry")
        end if		
   
else
        TCWebApi_set("WebCurSet_Entry","CurPage","0")
end If
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Admin - TR-069 Configuration</title>
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

  <script language="JavaScript" type="text/JavaScript">
    var msg = new Array(6);

    <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
    msg[0] = "Upload successful!";
    msg[1] = "Invalid certificate file, upload failed!";
    msg[2] = "Certificate is disabled!";
    msg[3] = "Certificate is enable!";
    msg[4] = "No certificate file, please upload!";
    msg[5] = "Certificate file is too big, upload failed!";
    <% end if %>

    var signal = "<% tcWebApi_get("WebCurSet_Entry","CurPage","s") %>";
    function LoadFrame() { //lxf：页面初始化处理
      //CurrentAccess-->0  当前用户是超级管理员 ？？？
      <% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>  
        document.ConfigForm.SaveFlag.value = "0";
        document.SslForm.postflag.value = "0";
      <% end if %>
      if((0 != parseInt(signal)) && (signal != "N/A")){
        var istate = parseInt(signal);
        if(1 == istate)
        {
          //alert("changed successfully!");
        }else{
          alert("fail");
        }
      }

      //页面展示-证书的提交状态
      <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
        var obj = getElById('ResultText');
        var certStatus = parseInt("<% tcWebApi_get("Cwmp_Entry","CertCode","s") %>");
        
        if ((certStatus >= 0) && (certStatus <= 9))  //页面显示-上传成功-"Upload successful!" 
        {
          // obj.innerHTML = '<font color="#FF0000">' + msg[certStatus] + '</font>';
          setDisplay('ResultText',1);
        }
      else
      {
        setDisplay('ResultText', 0);
      }
      <% end if %>
    }

    function isTimeFormat(str)  //判断日期格式是否正确
    {
      if(str.length > 20 || str.length < 19)	//0001-01-01T00:00:00Z
        return false;

      if(str.substr(10, 1) != 'T' || str.substr(4, 1) != '-' || str.substr(7, 1) != '-' || str.substr(13, 1) != ':' || str.substr(16, 1) != ':' || (str.substr(19, 1) != 'Z' && str.length == 20))
        return false;
      
      if(str.substr(0, 4) < '0001' || str.substr(0, 4) > '9999')	
        return false;
              
      if(str.substr(5, 2) < '01' || str.substr(5, 2) > '12')
        return false;
              
      if(str.substr(8, 2) < '01' || str.substr(8, 2) > '31')	
        return false;
              
      if(str.substr(11, 2) < '00' || str.substr(11, 2) > '23')	
        return false;		

      if(str.substr(14, 2) < '00' || str.substr(14, 2) > '59')	
        return false;		

      if(str.substr(17, 2) < '00' || str.substr(17, 2) > '59')	
        return false;	

      return true;
    }
  function CheckForm(type)   //表单验证
  {
    with (getElById ("ConfigForm"))
    {
      if (!checkeURL(URL.value))
      {
        alert("ACS URL is invalid, please try again!");
        return false;
      }
      if (PeriodicInformEnable[1].checked == true &&PeriodicInformInterval.value =='' )
      {
        alert("Period inform interval is invalid.");
        return false;
      }
      if ((PeriodicInformInterval.value == '') || (isPlusInteger(PeriodicInformInterval.value) == false))
      {
        alert("Period inform interval is invalid.");
        return false;
      }
      if ((conReqPort.value == '') || (isPlusInteger(conReqPort.value) == false))
      {
        alert("conReqPort is invalid.");
        return false;
      }
      var conPortValue = parseFloat(conReqPort.value );
      if(conPortValue < 1 || conPortValue > 65535 ){
        alert("Invalid conReqPort, range<1-65535>.");
        return false;
      }
      if (false)
      {
        if (PeriodicInformEnable[1].checked == true && PeriodicInformTime.value =='' )
        {
          alert("Period inform interval is invalid.");
          return false;
        }
        if ((PeriodicInformTime.value == '') || (isTimeFormat(PeriodicInformTime.value) == false) )
        {
          alert("Period inform interval is invalid.");
          return false;
        }
      }
      var info = parseFloat(PeriodicInformInterval.value );
      if (info <= 0 || info > 604800)
      {
        alert("Period inform interval is invalid.");
        return false;
      }
      if (isValidString(Username.value) == false )
      {
        alert("User name is invalid.");
        return false;
      }
      if (isValidString(Password.value) == false )
      {
        alert("Password is invalid.");
        return false;
      }
      if (isValidString(ConnectionRequestUsername.value) == false )
      {
        alert("Connection request username is invalid.");
        return false;
      }
      if (isValidString(ConnectionRequestPassword.value) == false )
      {
        alert("Connection request password is invalid.");
        return false;
      }
    }
    return true;
  }

  function formSave()
  {
    console.log(122)
    if(CheckForm() == false)
      return;
    

    var Form = document.ConfigForm;
    document.ConfigForm.SaveAlter_Flag.value = "1";
    Form.SaveFlag.value = "1";
    Form.submit();
    //showLoading();
  }

  function SubmitCert(type)  //提交证书文件
  {
    var SslForm =document.SslForm;
    console.log(SslForm.sslAuthMode.value,'SslForm0');
    if(type==1){
      SslForm.sslAuthMode.value = '1';
      var string = SslForm.filename1.value.search(/pem/);
      if(SslForm.filename1.value==""){
        alert("Please select certificate for upload.");
      }
      else{
        SslForm.postflag.value = "1";
        SslForm.submit();
        showLoading();
      }
    }else if(type==2){
        SslForm.sslAuthMode.value = '2'
        var string = SslForm.filename1.value.search(/pem/);
        if(SslForm.filename2.value==""){
          alert("Please select certificate for upload.");
        }
        else{
          SslForm.postflag.value = "1";
          SslForm.submit();
          showLoading();
        }
    }
  }
  </script>
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()">
  <!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">TR-069 Configuration</div>
    <div class="title-description-text">This page is used to configure the TR-069 CPE. Here you may change the setting for the ACS's parameters.</div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">TR069 Daemon:</div>
      </div>
      <div class="col-6">
        <input type="radio" disabled value="Enable" name="radio1" checked="checked">
        <label class="input-radio">Enable</label>
        <input type="radio" disabled value="Disable" name="radio1">
        <label class="input-radio">Disable</label>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">EnableCWMPParamete:</div>
      </div>
      <div class="col-6">
        <input type="radio" disabled value="Enable" name="radio2" checked="checked">
        <label class="input-radio">Enable</label>
        <input type="radio" disabled value="Disable" name="radio2">
        <label class="input-radio">Disable</label>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Root Data Model:</div>
      </div>
      <div class="col-6">
        <input type="radio" disabled value="Enable" name="radio3" checked="checked">
        <label class="input-radio">TR-098</label>
        <input type="radio" disabled value="Disable" name="radio3">
        <label class="input-radio">TR-181</label>
      </div>
    </div>

    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header left">
          <th class="p-1" colspan="4">ACS</th>
        </tr>
      </table>
    </div>
    <FORM name="ConfigForm" action="/cgi-bin/true-page/admin/admin-TR-069.asp" method="post">
      <input TYPE="hidden" NAME="SaveAlter_Flag" VALUE="0">
      <INPUT TYPE="HIDDEN" NAME="SaveFlag" VALUE="0">
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">URL:</div>
        </div>
        <div class="col-6">
          <input id=URL class="form-control input-textfield" name=URL value="<% if TCWebApi_get("Cwmp_Entry","acsUrl","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsUrl","s") end if %>" type="text">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Username:</div>
        </div>
        <div class="col-6">
          <input id=Username  name=Username  class="form-control input-textfield" value="<% if TCWebApi_get("Cwmp_Entry","acsUserName","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsUserName","s") end if %>" type="text" maxLength=24>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Password:</div>
        </div>
        <div class="col-6">
          <input  id=Passwordclass name=Password class="form-control input-textfield"  value="<% if TCWebApi_get("Cwmp_Entry","acsPassword","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","acsPassword","s") end if %>"  type="password" maxLength=24>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Periodic Informs:</div>
        </div>
        <div class="col-6">
          <input id=radio type="radio" value="Yes" name="PeriodicInformEnable" <%if TCWebApi_get("Cwmp_Entry","periodActive","h") = "Yes" then asp_Write("checked") elseif TCWebApi_get("Cwmp_Entry","periodActive","h") = "N/A" then asp_Write("checked") end if %>>
          <label class="input-radio">Enable</label>
          <input id=PeriodicInformEnable type="radio" value="No" name="PeriodicInformEnable" <%if TCWebApi_get("Cwmp_Entry","periodActive","h") = "No" then asp_Write("checked") end if %>>
          <label class="input-radio">Disable</label>
        </div>

      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Periodic Inform Interval:</div>
        </div>
        <div class="col-6">
          <input  id=PeriodicInformInterval 
          name=PeriodicInformInterval class="form-control input-textfield" value="<% if TCWebApi_get("Cwmp_Entry","periodInterval","h" ) <> "N/A" then TCWebApi_get("Cwmp_Entry","periodInterval","s" ) end if %>" type="text">
        </div>
      </div>
      <div class="row p-1" style='display:none'>
        <div class="col-6">
          <div class="title-text-left">Periodic Inform Time:</div>
          </div>
          <div class="col-6">
            <input  id=PeriodicInformTime 
            name=PeriodicInformTime  class="form-control input-textfield" value="<% TCWebApi_get("Cwmp_Entry","prdInformTime","s" ) %>">
          </div>
        </div>
      <div class="card-table-content">
        <table style="width:100%">
          <tr class="table-header left">
            <th class="p-1" colspan="4">Connection Request</th>
          </tr>
        </table>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Username:</div>
        </div>
        <div class="col-6">
          <input name=ConnectionRequestUsername id=ConnectionRequestUsername class="form-control input-textfield" 
          value="<% if TCWebApi_get("Cwmp_Entry","conReqUserName","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqUserName","s") end if %>" type="text" maxLength=24>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Password:</div>
        </div>
        <div class="col-6">
          <input  name=ConnectionRequestPassword  id=ConnectionRequestPassword class="form-control input-textfield"  value="<%if TCWebApi_get("Cwmp_Entry","conReqPassword","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqPassword","s") end if %>" type="password"  maxLength=24>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Path:</div>
        </div>
        <div class="col-6">
          <input name=ConnectionRequestPath id=ConnectionRequestPath class="form-control input-textfield" 
          value="<% if TCWebApi_get("Cwmp_Entry","conReqPath","h") <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqPath","s") end if %>" type="text">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left">Port:</div>
        </div>
        <div class="col-6">
          <input id=conReqPort 
          name=conReqPort class="form-control input-textfield" value="<% if TCWebApi_get("Cwmp_Entry","conReqPort","h" ) <> "N/A" then TCWebApi_get("Cwmp_Entry","conReqPort","s" ) end if %>">
        </div>
      </div>
    </FORM>
    <div class="mt-2 center">
      <button class="btn-dashboard" onclick="formSave()">Apply</button>
    </div>

    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header left">
          <th class="p-1" colspan="4">Certificate Management</th>
        </tr>
      </table>
    </div>
    
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">CPE Certificate Password:</div>
      </div>
      <div class="col-4">
        <input disabled class="input-textfield" type="text" value="client">
      </div>
      <div class="col-2">
        <button class="btn-file button-disable-gray" disabled>Apply</button>
      </div>
    </div>
    <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
      <SCRIPT language=javascript>
        <% If tcWebApi_get("WebCustom_Entry","isCwmpOpensslSupported","h") = "Yes" Then %>
          var caExist = 1;
          <% If tcWebApi_get("SslCA_Common","ca1Exist","h") <> "1" Then %>
          <% If tcWebApi_get("SslCA_Common","ca2Exist","h") <> "1" Then %>
          <% If tcWebApi_get("SslCA_Common","ca3Exist","h") <> "1" Then %>
            caExist = 0;
          <% end if %>
          <% end if %>
          <% end if %>
            if(caExist == 1){
              ;//document.write("(SSL CA is already loaded.)");
            }
            else
              ;// document.write("(No SSL CA!)");
          <% else %>
            var  cflag = "<% tcWebApi_get("SslCA_Entry0","FragNum","s") %>";//the certificate of index 1 is exist?
            if(cflag != "N/A"){
              ;//document.write("(SSL CA is already loaded.)");
            }
            else
              ;// document.write("(No SSL CA!)");
        <% end if %>
      </SCRIPT>
    <% end if %>
    
    <FORM id=SslForm name="SslForm" method="post" encType="multipart/form-data">
        
      <% if tcwebApi_get("WebCustom_Entry","isCTPONNMGSupported","h") <> "Yes" then %>
        <input type="hidden" name="postflag" value="0">
        <input type="hidden" name="fileIndex" value="1">
        <input type="hidden" name="sslAuthMode" value="<% if TCWebApi_get("Cwmp_Entry","sslAuthMode","h" ) <> "N/A" then TCWebApi_get("Cwmp_Entry","sslAuthMode","s" ) end if %>">
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">CPE Certificate:</div>
          </div>
          <div class="col-4">
            <input type="file" name="filename1" class="input-file">
          </div>
          <div class="col-2 left ml5">
            <button class="btn-file" onclick="SubmitCert(1)">Upload</button>
          </div>
        </div>
        <div class="row p-1">
          <div class="col-6">
            <div class="title-text-left">CA Certificate:</div>
          </div>
          <div class="col-4">
            <input type="file" name="filename2" class="input-file">
          </div>
          <div class="col-2 left ml5">
            <button class="btn-file" onclick="SubmitCert(2)">Upload</button>
          </div>
        </div>
      <% else %>

      <% end if %>
      <DIV id=ResultText name="ResultText"></DIV> 
    </FORM>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Enable CWMP WAN ACL:</div>
      </div>
      <div class="col-6">
        <input type="radio" disabled value="Enable" name="radio5">
        <label class="input-radio">Enable</label>
        <input type="radio" disabled value="Disable" name="radio5" checked="checked">
        <label class="input-radio">Disable</label>
        <button class="btn-dashboard  button-disable-gray" disabled>Apply Changes</button>
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">IP Address:</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" disabled value="" type="text">
      </div>
    </div>
    <div class="row p-1">
      <div class="col-6">
        <div class="title-text-left">Subnet Mask:</div>
      </div>
      <div class="col-6">
        <input class="form-control input-textfield" disabled value="" type="text">
      </div>
    </div>
    <div class="mt-2 center">
      <button class="btn-dashboard button-disable-gray" disabled>Add</button>
    </div>

    <div class="card-table-content">
      <table style="width:100%">
        <tr class="table-header left">
          <th class="p-1" colspan="4">CWMP WAN ACL Table</th>
        </tr>
        <tr class="table-content-fist left">
          <td>Select</td>
          <td>IP Address</td>
        </tr>
      </table>
    </div>
    <div class="mt-2 center">
      <button class="btn-dashboard button-disable-gray" disabled>Delete Selected</button>
    </div>
  </div>
  <!-- content -->
</body>

</html>