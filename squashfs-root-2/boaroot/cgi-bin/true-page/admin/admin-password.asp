<%
if Request_Form("accountflg")="1" then
	if tcWebApi_get("WebCurSet_Entry","CurrentAccess","h") = "1" then   '//当前用户是普通管理员
		if Request_Form("oldUsername") = tcWebApi_get("Account_Entry0","username","h") then  '//原名和超管名相同，说明改的是超管的密码
			if Request_Form("oldPassword") = tcWebApi_get("Account_Entry0","web_passwd","h") then
				TCWebApi_set("WebCurSet_Entry","CurPage","1")
				TCWebApi_set("Account_Entry0","web_passwd","cfmPassword")
				TCWebApi_commit("Account_Entry")
				TCWebApi_save()
			else
				TCWebApi_set("WebCurSet_Entry","CurPage","2")
			end if
		else
			if Request_Form("oldPassword") = tcWebApi_get("Account_Entry1","web_passwd","h") then  '//如果旧密码输入正确
				TCWebApi_set("WebCurSet_Entry","CurPage","1")     '//更新CurPage状态为1
				TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")   '//更新admin密码
				TCWebApi_commit("Account_Entry")
				TCWebApi_save()
			else
				TCWebApi_set("WebCurSet_Entry","CurPage","2")  '//如果旧密码输入不正确 更新CurPage状态为2 回跳到 错误页面-旧密码错误
			end if
		end if
	else  '//如果当前用户是超级管理员
		if Request_Form("oldUsername") = tcWebApi_get("Account_Entry0","username","h") then  '//原用户名等于超管用户名
			if Request_Form("oldPassword") = tcWebApi_get("Account_Entry0","web_passwd","h") then
				TCWebApi_set("WebCurSet_Entry","CurPage","1")
				TCWebApi_set("Account_Entry0","web_passwd","cfmPassword")    '//更新超管密码
				TCWebApi_commit("Account_Entry")
				TCWebApi_save()
			else
				TCWebApi_set("WebCurSet_Entry","CurPage","2")
			end if
		else
      if Request_Form("oldPassword") = tcWebApi_get("Account_Entry1","web_passwd","h") then  '//如果旧密码输入正确
        TCWebApi_set("WebCurSet_Entry","CurPage","1")     '//更新CurPage状态为1
        TCWebApi_set("Account_Entry1","web_passwd","cfmPassword")   '//更新admin密码
        TCWebApi_commit("Account_Entry")
        TCWebApi_save()
        tcWebApi_constSet("WebCurSet_Entry","stayLoggedIn","1")     '//当前用户是超管，修改admin密码则置标志位为1
      else
        TCWebApi_set("WebCurSet_Entry","CurPage","2")  '//如果旧密码输入不正确 更新CurPage状态为2 回跳到 错误页面-旧密码错误
      end if
		end if
		TCWebApi_commit("Account_Entry")
		TCWebApi_save()
	end If
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
  <title>Admin - Password</title>
  <!-- style -->
  <link rel="stylesheet" href="/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- style -->

  <!-- script -->
  <script src="/scripts/lib/jquery.min.js"></script>
  <script src="/scripts/lib/bootstrap.min.js"></script>
  <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
  <!-- script -->
  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
  <script language=JavaScript type=text/javascript>
     //var curUserName = parent.curUser;
     
     //var sptUserName = '0';
     var curUserName = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
     var sptUserName = '0'
     console.log(curUserName,sptUserName,'curUserName&&sptUserName');
  </script>
  <script language=JavaScript type=text/javascript>
 
    var signal = "<% tcWebApi_get("WebCurSet_Entry","CurPage","s") %>";
    function LoadFrame()
    {	
      with (getElById('ConfigForm'))   //form 元素
      {
        accountflg.value = "0";  //本来就是1，？？ 2，3的情况都没触发
        //console.log(signal,'signal')  //signal --> 0    |当前页
        //lxf:signal 为0，，所以不会执行以下if内的代码
        // 提交表单数据后，signal（CurPage）变成：1,进入下面的代码
        //如果是2，就会跳到一个错误提示页面；“旧密码填写错误”
        if((0 != parseInt(signal)) && (signal != "N/A"))
        {
          var istate = parseInt(signal);
          if(1 == istate)
          {
            if (curUserName == sptUserName){  //lxf : 如果是超级管理员修改，那么就只要显示‘修改成功’即可
                alert("Set successfully!");
              <% if tcWebApi_get("WebCurSet_Entry", "stayLoggedIn", "h") <> "1"  then%>
                top.location.href="/cgi-bin/logout.cgi";
              <% else %>
                <% tcWebApi_constSet("WebCurSet_Entry","stayLoggedIn","0") %>
              <% end if %>
            }
            else{
              alert("Password changed successfully, back to login again!");
              top.location.href="/cgi-bin/logout.cgi";
            }
          }
          else{
            //window.location.href="/cgi-bin/ErrMsg.asp";
            alert("Old password is wrong, password setting fail.");
          }
        }
      }
    }
    //表单值验证
	function CheckForm()
	{
		var reg = /^[A-Za-z0-9\~\!\@\#\$\%\^\&\*\(\)\_\+\{\}\:\|\<\>\?\`\-\[\]\,\.\/]+$/;
		if(!reg.test(document.ConfigForm.newPassword.value)){
			alert("New password is invalid.");
			return false;
		}
		if((curUserName == sptUserName) && (document.ConfigForm.oldUsername.selectedIndex==0))
        {
        	var reg_surper = /^.*(?=.{15,15})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[\!\@\#\$\%\^\&\*\(\)\_\+\{\}\:\|\<\>\?\`\-\[\]\,\.\/]).*$/;
			//surper用户的密码需满足至少一个大写、小写字母、数字和特殊字符
			if(!reg_surper.test(document.ConfigForm.newPassword.value))
			{	
				alert("Password can be set at lease 15 Digits to 64 Digits (currently fixed only 15 Digits), and the password for superuser needs to contain at least one uppercase letter, one lowercase letter, one number, and one special character.");
				return false;
			}
      if(document.ConfigForm.newPassword.value.length > 64)
      {
        alert("New password length can not exceed 64 characters.");
        return false;
      }
      if(document.ConfigForm.newPassword.value.length < 15)
      {
        alert("New password length is no less than 15 characters.");
        return false;
      }
        }
        else
        {
			if(document.ConfigForm.newPassword.value.length > 15)
			{
				alert("New password length can not exceed 15 characters.");
				return false;
			}
			if (document.ConfigForm.newPassword.value == "")
			{
				alert("New password can not be empty.");
				return false;
			}
			if(document.ConfigForm.newPassword.value.length < 8)
			{
				alert("New password length is no less than 8 characters.");
				return false;
			}
		}
		if (document.ConfigForm.cfmPassword.value != document.ConfigForm.newPassword.value)
		{
			alert("New Password and Confirm Password are inconsistent.");
			return false;
		}
		return true;
	}
     //提交表单
	function OnOK() {
        if(document.ConfigForm.accountflg.value == "0"){
            //console.log(CheckForm(),'CheckForm()')
            if (CheckForm()){
                document.ConfigForm.accountflg.value = "1";
                document.ConfigForm.submit();
                showLoading();
            }
        }
    }

    function Undo(){
        location.reload() 
    }
  function PasswordVisible(value) {
    var passwordField = document.getElementById(value);
    if (passwordField.type === 'password') {
      passwordField.type = 'text';
    } else {
      passwordField.type = 'password';
    }
  }
  </script>
</head>

<body onload="if(getElById('ConfigForm') != null)LoadFrame()" >
<!-- content -->
  <div class="container-full container-resize-height">
    <div class="title-text">Password</div>
    <div class="title-description-text">This page is used to set the account to access the web server of your Device. Empty user name and password will disable the protection.</div>
    <FORM name=ConfigForm action="/cgi-bin/true-page/admin/admin-password.asp" method="post">
      <input type="text" id="hiddenaccount" style="visibility:hidden; position:absolute; top:-500px;" />
      <input type="password" id="hiddenpassword" style="visibility:hidden;position:absolute; top:-500px;" />			
      <INPUT TYPE="HIDDEN" NAME="name0" VALUE="<%TCWebApi_get("Account_Entry0","username","s")%>">
      <INPUT TYPE="HIDDEN" NAME="name1" VALUE="<%TCWebApi_get("Account_Entry1","username","s")%>">
      <INPUT TYPE="HIDDEN" NAME="name2" VALUE="<%TCWebApi_get("Account_Entry2","username","s")%>">
      <INPUT TYPE="HIDDEN" NAME="displayMask" VALUE="BF 00 0F CC FF B7 03 00 01">
      <INPUT TYPE="HIDDEN" NAME="accountflg" VALUE="0">
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Login User:</div>
        </div>
        <div class="col-4">
          <select id=oldUsername  name=oldUsername class="form-control input-select">
            <SCRIPT language=JavaScript type=text/javascript>
              if(curUserName == sptUserName){   // 当前用户是超级管理员时
                if(document.ConfigForm.name0.value != "")
                {
                  document.write('<option value="' + document.ConfigForm.name0.value + '" selected>' + document.ConfigForm.name0.value);
                }
              }
              if(document.ConfigForm.name1.value != "" && document.ConfigForm.name1.value != "N/A")
              {
                if(curUserName == sptUserName){
                    document.write('<option value="' + document.ConfigForm.name1.value + '">' + document.ConfigForm.name1.value);
                }else{
                    document.write('<option value="' + document.ConfigForm.name1.value + '" selected>' + document.ConfigForm.name1.value);
                }
              }
          </SCRIPT>
          </select>
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Old Password:</div>
        </div>
        <div class="col-4">
          <input id=oldPassword  name=oldPassword class="form-control input-textfield" type="password">
        </div>
        <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="PasswordVisible('oldPassword')">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">New Password:</div>
        </div>
        <div class="col-4">
          <input id=newPassword name=newPassword class="form-control input-textfield" type="password" value="">
        </div>
        <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="PasswordVisible('newPassword')">
        </div>
      </div>
      <div class="row p-1">
        <div class="col-4">
          <div class="title-text-left">Confirm Password:</div>
        </div>
        <div class="col-4">
          <input id=cfmPassword  name=cfmPassword class="form-control input-textfield" type="password">
        </div>
        <div class="col-2 left">
            <img src="/image/icon/visibility.svg" width="20" height="30" onclick="PasswordVisible('cfmPassword')">
        </div>
      </div>
    </FORM>
    <div class="mt-2 center">
        <button class="btn-dashboard" type="button" id="btnOK" onclick="OnOK()">Apply</button>
        <button class="btn-dashboard" type="button" onclick="Undo()">Reset</button>
    </div>
  </div>
<!-- content -->
</body>

</html>