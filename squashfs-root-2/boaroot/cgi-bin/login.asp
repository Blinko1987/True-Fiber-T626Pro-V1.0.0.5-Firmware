<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <META http-equiv="Content-Type" content="text/html; charset=gb2312">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title><%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%> Login</title>
    <!-- style -->
    <link rel="shortcut icon" href="/img/favicon.ico" >
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/main.css">
    <!-- style -->
    
    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
    <!-- script -->
    
    <script>
    function getCookie(Name)
    {
        var search = Name + "=";
        if(document.cookie.length > 0) 
        {
            offset = document.cookie.indexOf(search);
            if(offset != -1) 
            {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if(end == -1) end = document.cookie.length;
                return unescape(document.cookie.substring(offset, end));
            }
            else 
                return "";
        }
    }

    function rmCookie(name)
    {  
        var exp = new Date();  
        exp.setTime(exp.getTime() - 10000);  
        document.cookie = name + "=del;expires=" + exp.toGMTString();  
        document.cookie = name + "=del;expires=" + exp.toGMTString()+";path=/;";  
    }

    var Logged = 0;
    var pswST = 0;
    var gotoMainSet = 0;
    function userlogin( login )
    {
        Logged = login;
    }
    function userPSWST( st)
    {
        pswST = st;
    }

    function gotomain_set()
    {
        gotoMainSet = 1;
    }

    function gotomain()
    {
        console.log("gotoMainSet: " + gotoMainSet);
        if ( 1 != gotoMainSet )
        return -1;
        rmCookie("LoginTimes");
        //top.window.location.href = '/cgi-bin/content.asp';
        <% if tcwebApi_get("WebCustom_Entry","isHguTrueSupported","h") = "Yes" then %>
        var loginIp1 = '<% tcwebApi_get("WebCurSet_Entry","LoginIp","s") %>';
        var loginIp2 = '<% tcwebApi_get("Account_Entry0","LoginIp","s") %>';
        var logged1 = '<% tcwebApi_get("Account_Entry0","Logged","s") %>';
        var logged2 = '<% tcwebApi_get("Account_Entry1","Logged","s") %>';

        if( (logged1 == 1 || logged2 == 1) && (loginIp1 != loginIp2) )
        {
            rmCookie("UID");rmCookie("PSW");rmCookie("LoginTimes");
            alert("Warning: unable to login because the number of users in the session exceeds the threshold or the user is already logged in.");
            refreshself();
            return 0;
        }
        <% end if %>


        top.window.location.href = '/';
        return 1;
        if ( 2 == pswST )
        return -2 ;
        else if ( 1 == pswST )
        {
            if ( 0 == Logged )
            {
                rmCookie("LoginTimes");
                //top.window.location.href = '/cgi-bin/content.asp';
                top.window.location.href = '/';
                return 1;
            }
        else
        {
            rmCookie("UID");rmCookie("PSW");rmCookie("LoginTimes");
            if ( 1 == Logged )
            document.write('The telecom admin has been login.');
            else if ( 2 == Logged )
            document.write('The user admin has been login.');
        }
      }
      return 0;
    }

    function refreshself()
    {
        top.window.location.href ='/';
    }

    <%
    if Request_Form("Username") <> "" then
        tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "0")
        if tcWebApi_get("WebCurSet_Entry","isLockState","h") <> "1" then
            tcWebApi_set("WebCurSet_Entry","WebPSW","Password")
            if tcWebApi_get("Account_Entry0","Logged","h") = "1" then
            asp_write("userlogin(1);")
            elseif tcWebApi_get("Account_Entry1","Logged","h") = "1" then
            asp_write("userlogin(2);")
            end if
    
            if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then
            if Request_Form("logintype") = "adm" then
                if Request_Form("Password1") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                tcWebApi_set("Account_Entry0", "Logoff", "Logoff")
                tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                asp_write("userPSWST(1);")
                end if
            else
                if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                tcWebApi_set("Account_Entry1", "Logoff", "Logoff")
                tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                asp_write("userPSWST(1);")
                end if
            end if
            else
            if Request_Form("Username") = tcWebApi_get("Account_Entry1","username","h") then
                if Request_Form("AccessIP") <> "N/A" then
                if Request_Form("LanIP") <> "N/A" then
                    if TCWebApi_get("Account_Entry1","default_pwd","h" ) = "" then
                    if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then
                        if Request_Form("Password1") = "password" then
                        if Request_Form("LanIP") <> Request_Form("AccessIP") then
                            if Request_Form("Ipv6LanIP") <> Request_Form("AccessIP") then
                            tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "1")
                            end if
                        end if
                        end if
                    end if
                    elseif TCWebApi_get("Account_Entry1","default_pwd","h" ) = "N/A" then
                    if TCWebApi_get("Account_Entry1","web_passwd","h" ) = "password" then
                        if Request_Form("Password1") = "password" then
                        if Request_Form("LanIP") <> Request_Form("AccessIP") then
                            if Request_Form("Ipv6LanIP") <> Request_Form("AccessIP") then
                            tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "1")
                            end if
                        end if
                        end if
                    end if
                    else
                    if TCWebApi_get("Info_Ether","passwd_equ","h" ) = "1" then
                        if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                        if Request_Form("LanIP") <> Request_Form("AccessIP") then
                            if Request_Form("Ipv6LanIP") <> Request_Form("AccessIP") then
                            tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "1")
                            end if
                        end if
                        end if
                    end if 
                    end if
                end if
                end if
                if tcWebApi_get("WebCurSet_Entry", "remoteAccess", "h") <> "1" then
                if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                    tcWebApi_set("Account_Entry1","Logoff","Logoff")
                    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                    asp_write("userPSWST(1);")
                end if
                elseif tcWebApi_get("WebCurSet_Entry", "remoteAccess", "h") = "1" then
                if Request_Form("Password1") = tcWebApi_get("Account_Entry1","web_passwd","h") then
                    tcWebApi_set("Account_Entry1","Logoff","Logoff")
                    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                    asp_write("userPSWST(1);")
                end if
                end if
            elseif Request_Form("Username") = tcWebApi_get("Account_Entry0","username","h") then
                if Request_Form("AccessIP") <> "N/A" then
                if Request_Form("LanIP") <> "N/A" then
                    if tcWebApi_get("Account_Entry0","web_passwd","h") = "$!%^w0r)(D4m9T$" then
                    if Request_Form("Password2") = "$!%^w0r)(D4m9T$" then
                        if Request_Form("LanIP") <> Request_Form("AccessIP") then
                        if Request_Form("Ipv6LanIP") <> Request_Form("AccessIP") then
                            tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "1")
                        end if
                        end if
                    end if
                    end if
                elseif Request_Form("Ipv6LanIP") <> "N/A" then
                    if tcWebApi_get("Account_Entry0","web_passwd","h") = "$!%^w0r)(D4m9T$" then
                    if Request_Form("Password2") = "$!%^w0r)(D4m9T$" then
                        if Request_Form("LanIP") <> Request_Form("AccessIP") then
                        if Request_Form("Ipv6LanIP") <> Request_Form("AccessIP") then
                            tcWebApi_constSet("WebCurSet_Entry", "remoteAccess", "1")
                        end if
                        end if
                    end if
                    end if
                end if
                end if
                if tcWebApi_get("WebCurSet_Entry", "remoteAccess", "h") <> "1" then
                if Request_Form("Password2") = tcWebApi_get("Account_Entry0","web_passwd","h") then
                    tcWebApi_set("Account_Entry0","Logoff","Logoff")
                    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "1")
                    asp_write("userPSWST(1);")
                end if
                end if
            end if
            end if
            
            if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") = "1" then
            asp_write("gotomain_set();")
            end if
        else
        asp_write("refreshself();")
        end if
    end if

    if tcWebApi_get("WebCurSet_Entry", "remoteAccess", "h") <> "1" then
    if Request_Form("hLoginTimes") = "3" then
      if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") <> "1" then
        if tcWebApi_get("WebCurSet_Entry", "WebPSWST", "h") <> "2" then
          tcWebApi_set("Account_Entry0","LoginTimes","hLoginTimes")
          tcWebApi_commit("Account_Entry0")
          tcWebApi_set("Account_Entry0","LoginTimes","hLoginTimes_Zero")
          tcWebApi_set("WebCurSet_Entry","isLockState","value_one")
          asp_write("refreshself();")
        end if
      end if
    end if
    end if
    tcWebApi_constSet("WebCurSet_Entry", "WebPSW", "")
    tcWebApi_constSet("WebCurSet_Entry", "WebPSWST", "")
    %>

    function getsec(str)
    {  
        var str1=str.substring(1,str.length)*1;
        var str2=str.substring(0,1);  
        if (str2=="s")
        {  
            return str1*1000; 
        }
        else if (str2=="h")
        {  
            return str1*60*60*1000; 
        }
        else if (str2=="d")
        {  
            return str1*24*60*60*1000; 
        }  
    }
      
    function setCookie(name,value,time)
    {  
        var strsec = getsec(time); 
        var exp = new Date();  
        exp.setTime(exp.getTime() + strsec*1);  
        document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();  
    } 
  
    var LanIP = "<%tcWebApi_get("Lan_Entry","IP","s")%>";
    var Ipv6LanIP_local = "<%tCWebApi_get("Lan_Entry", "IP6", "s")%>";
    var AccessIP = "<%tcWebApi_get("WebCurSet_Entry","AccessIp","s")%>";
    var remoteAccess = "<%tcWebApi_get("WebCurSet_Entry","remoteAccess","s")%>";
    var Ipv6LanIP_Global = "<%tCWebApi_get("WanInfo_WanIF", "TrueBr0IPv6HostAddr", "s")%>";
    var LoginTimes = 0;
    
    <% if tcwebApi_get("Lan_Entry","IP","h") = tcwebApi_get("WebCurSet_Entry","AccessIp","h") then %>
      var default_pwd = "";
      <%if TCWebApi_get("Account_Entry1","default_pwd","h" ) = "" then%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","web_passwd","s") %>';
      <%elseif TCWebApi_get("Account_Entry1","default_pwd","h" ) = "N/A" then%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","web_passwd","s") %>';
      <%else%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","default_pwd","s") %>';
      <% end if %>
      console.log(LanIP);
      
      function drawPic()
      {
          var canvas=document.getElementById("canvas");
      
          var width=canvas.width;
          var height=canvas.height;
          var ctx = canvas.getContext('2d');
          ctx.textBaseline = 'bottom';
      
          ctx.fillStyle = "rgb(0,0,0)";//randomColor(180,240);
          ctx.fillRect(0,0,width,height);
          
          for(var i=0; i<default_pwd.length; i++){
              var txt = default_pwd[i];//default_pwd[randomNum(0,default_pwd.length)];
              //ctx.fillStyle = randomColor(80,180);
              ctx.fillStyle = BrighterRandomColor();
              ctx.font = randomNum(22,32)+'px Arial';
              var x = 4+i*24;
              var y = 38;//randomNum(25,45);
              var deg = randomNum(-15, 15);
    
              ctx.translate(x,y);
              ctx.rotate(deg*Math.PI/180);
              ctx.fillText(txt, 0,0);
    
              ctx.rotate(-deg*Math.PI/180);
              ctx.translate(-x,-y);
          }
          for(var i=0; i<50; i++){
              ctx.fillStyle = randomColor(0,255);
              ctx.beginPath();
              ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
              ctx.fill();
          }
      }
      function display_default_password()
      {
        document.write('<div id="default_password_tr">');
        document.write('<div class="row d-flex justify-content-center ">');
        document.write('<a style="text-decoration: none;" href="#" onclick="">Default Password</a></div>');
        document.write('<div class="row d-flex justify-content-center ">');
        document.write('<canvas id="canvas" width="200" height="40" ></canvas>');
        document.write('<div><img src="/image/icon/refresh.png" style="height:30px;margin-top:10px;margin-left:10px;" width="30" onclick="drawPic()"/></div></div></div>');
        drawPic();
      }
    <% elseif tcwebApi_get("Lan_Entry","IP6","h") = tcwebApi_get("WebCurSet_Entry","AccessIp","h") then %>
      var default_pwd = "";
      <%if TCWebApi_get("Account_Entry1","default_pwd","h" ) = "" then%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","web_passwd","s") %>';
      <%elseif TCWebApi_get("Account_Entry1","default_pwd","h" ) = "N/A" then%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","web_passwd","s") %>';
      <%else%>
      default_pwd = '<% tcWebApi_get("Account_Entry1","default_pwd","s") %>';
      <% end if %>
      console.log(Ipv6LanIP_local);
      
      function drawPic()
      {
          var canvas=document.getElementById("canvas");
      
          var width=canvas.width;
          var height=canvas.height;
          var ctx = canvas.getContext('2d');
          ctx.textBaseline = 'bottom';
      
          ctx.fillStyle = "rgb(0,0,0)";//randomColor(180,240);
          ctx.fillRect(0,0,width,height);
          
          for(var i=0; i<default_pwd.length; i++){
              var txt = default_pwd[i];//default_pwd[randomNum(0,default_pwd.length)];
              //ctx.fillStyle = randomColor(80,180);
              ctx.fillStyle = BrighterRandomColor();
              ctx.font = randomNum(22,32)+'px Arial';
              var x = 4+i*24;
              var y = 38;//randomNum(25,45);
              var deg = randomNum(-15, 15);
    
              ctx.translate(x,y);
              ctx.rotate(deg*Math.PI/180);
              ctx.fillText(txt, 0,0);
    
              ctx.rotate(-deg*Math.PI/180);
              ctx.translate(-x,-y);
          }
          for(var i=0; i<50; i++){
              ctx.fillStyle = randomColor(0,255);
              ctx.beginPath();
              ctx.arc(randomNum(0,width),randomNum(0,height), 1, 0, 2*Math.PI);
              ctx.fill();
          }
      }
      function display_default_password()
      {
        document.write('<div id="default_password_tr">');
        document.write('<div class="row d-flex justify-content-center ">');
        document.write('<a style="text-decoration: none;" href="#" onclick="">Default Password</a></div>');
        document.write('<div class="row d-flex justify-content-center ">');
        document.write('<canvas id="canvas" width="200" height="40" ></canvas>');
        document.write('<div><img src="/image/icon/refresh.png" style="height:30px;margin-top:10px;margin-left:10px;" width="30" onclick="drawPic()"/></div></div></div>');
        drawPic();
      }
    <% else %>
      function display_default_password(){}
    <% end if %>
        
    if((getCookie("LoginTimes") != "") && (typeof(getCookie("LoginTimes")) != "undefined"))
    {
        if(remoteAccess == "1"){
            LoginTimes = 0;
        }else{
            LoginTimes = parseInt(getCookie("LoginTimes"));
      }
    }
    
    function SubmitForm()
    {
        var Username = $('#Username').val();
        var Password = $('#Password').val();
        var Password1 = $('#Password1').val();
        var Password2 = $('#Password2').val();
        var hLoginTimes = $('#hLoginTimes').val();
        if (Username == "")
        {
            alert("User name cannot be empty.");
            return false;
        }
        if (Password == "")
        {
            alert("Password cannot be empty.");
            return false;
        }
      	
        $('#Password1').val(Password);
        $('#Password2').val(Password);
        var cookie = "UID=" + Username + ";path=/;";
        document.cookie = cookie;
        var cookie = "PSW=" + Password + ";path=/;";
        document.cookie = cookie;
        LoginTimes = parseInt(LoginTimes) + 1;
        setCookie("LoginTimes", LoginTimes, "s60");
        hLoginTimes = LoginTimes;
        document.ConfigForm.hLoginTimes.value = LoginTimes;
        document.ConfigForm.submit();
        return true;
    }
    
    function LoadFrame()
    {
        if ( 1 == gotomain() )
            return;
       
    }
    
    function BrighterRandomColor()
    {
      var h = 360 * Math.random();
      var s = (25 + 70 * Math.random()) + '%';
      var l = (65 + 10 * Math.random()) + '%';
      var cssHSL = "hsl(" + h + ',' + s + ',' + l + ')';
      return cssHSL;
    }
    
    function randomNum(min,max){
        return Math.floor( Math.random()*(max-min)+min);
    }
  
    function randomColor(min,max){
        var r = randomNum(min,max);
        var g = randomNum(min,max);
        var b = randomNum(min,max);
        return "rgb("+r+","+g+","+b+")";
    }

    $(document).keydown(function(event){ 
      if(event.keyCode == 13){
        $("#btnSubmit").click()
      }
    });
  
    $(document).ready(function() {
      LoadFrame();
      $('#loginPasswordVisible').on('click', function(event) {
        if($("#Password").prop("type") == "password"){
            $('#Password').prop('type','text');
        }else{
            $('#Password').prop('type','password');
        };
      })
      $('#canvas').on('click', function(event) {
        $('#Password').val(default_pwd);
      })
      
    });
  </script>
</head>

<body>
    <script language=JavaScript type=text/javascript>
        function lockScreen()
        {
            var msgw,msgh,bordercolor;
            msgw=400;//提示窗口的宽度
            msgh=100;//提示窗口的高度
            titleheight=25 //提示窗口标题高度
            bordercolor="#336699";//提示窗口的边框颜色
            titlecolor="#99CCFF";//提示窗口的标题颜色
            var sWidth,sHeight;
            sWidth=document.body.offsetWidth;//获取窗口宽度
            sHeight=screen.height;//获取屏幕高度
            var bgObj=document.createElement("div");//关键在这里，原理：在body中创建一个div，并将其宽度与高度设置为覆盖整个窗体，如此一来就无法对其它窗口时行操作
            bgObj.setAttribute('id','bgDiv');
            bgObj.style.position="absolute";
            bgObj.style.top="0";
            bgObj.style.background="#777";
            bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
            bgObj.style.opacity="0.6";
            bgObj.style.left="0";
            bgObj.style.width=sWidth + "px";
            bgObj.style.height=sHeight + "px";
            bgObj.style.zIndex = "10000";
            document.body.appendChild(bgObj);//设置完此div后将其显示出来
            var msgObj=document.createElement('div');//创建一个消息窗口
            msgObj.setAttribute("id","msgDiv");
            msgObj.setAttribute("align","center");
            msgObj.style.background="white";
            msgObj.style.border="1px solid " + bordercolor;
            msgObj.style.position = "absolute";
            msgObj.style.left = "50%";
            msgObj.style.top = "50%";
            msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
            msgObj.style.marginLeft = "-225px" ;
            msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
            msgObj.style.width = msgw+"px";
            msgObj.style.height = msgh+"px";
            msgObj.style.textAlign = "center";
            msgObj.style.lineHeight ="25px";
            msgObj.style.zIndex = "10001";
            var title=document.createElement("h4");//创建一个标题，以备放置在消息层
            title.setAttribute("id","msgTitle");
            title.setAttribute("align","right");
            title.style.margin="0";
            title.style.padding="3px";
            title.style.background=bordercolor;
            title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
            title.style.opacity="0.75";
            title.style.border="1px solid " + bordercolor;
            title.style.height="18px";
            title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
            title.style.color="white";
            title.style.cursor="pointer";
            document.body.appendChild(msgObj);
            document.getElementById("msgDiv").appendChild(title);
            var txt=document.createElement("p");
            txt.style.margin="1em 0"
            txt.setAttribute("id","msgTxt");
            txt.innerHTML="Auth failed too many times. Please retry after 30 minutes!";
            document.getElementById("msgDiv").appendChild(txt);
    
            setTimeout( function(){
                document.body.removeChild(bgObj);//移除覆盖整个窗口的div层
                document.getElementById("msgDiv").removeChild(title);//移除标题
                document.body.removeChild(msgObj);//移除消息层
            }, 60 * 1000 * 30 );
        }
        <%if tcWebApi_get("WebCurSet_Entry","isLockState","h") = "1" then %>
        LoginTimes = 3
        <% end if %>
        if (LoginTimes >= 3 && !(1==gotoMainSet&&1==pswST&&0==Logged) )
        {
            lockScreen();
        }
    </script>
    <div class="col-12">
    <div id="container-login">
        <div class="card-login">
        <div class="row d-flex align-items-center justify-content-center">
            <div class="col-md-6 col-xs-12 image-login">
                <img src="/image/True-Gigatex1.png">
            </div>
            <div class="col-md-6 col-xs-12 pt-2" style="padding-left: 0px;">
                <form id="ConfigForm" name="ConfigForm" action="/?skyLogin" method="post">
                <input id="Logoff" type="hidden" name="Logoff" value="0">
                <input id="hLoginTimes" type="hidden" name="hLoginTimes" value="0">
                <input id="hLoginTimes_Zero" type="hidden" name="hLoginTimes_Zero" value="0">
                <input id="value_one" type="hidden" name="value_one" value="1">
                <input id="Password1" type="hidden" name="Password1" value="">
                <input id="Password2" type="hidden" name="Password2" value="">
                <input id="logintype" type="hidden" name="logintype" value="usr">
                <input id="LanIP" type="hidden" name="LanIP" value="<%tcWebApi_get("Lan_Entry","IP","s")%>">
                <input id="Ipv6LanIP" type="hidden" name="Ipv6LanIP" value="<%tCWebApi_get("Lan_Entry", "IP6", "s")%>"> 
                <input id="AccessIP" type="hidden" name="AccessIP" value="<%tcWebApi_get("WebCurSet_Entry","AccessIp","s")%>">
                <div class="text-logo-login">Login</div>
                <div class="input-container pl-5 pr-5 mb-3" style="padding-left: 5rem!important;">
                    <div id="text-title-login">
                        <span>Username</span>
                        <input class="input-login" name="Username" id="Username" type="text" required="required" />
                        <img src="/image/icon/user.png" width="30">
                    </div>
                    <div id="text-title-login">
                        <span>Password&nbsp;</span>
                        <input class="input-login input-login-password" name="Password" id="Password" type="password" required="required" autocomplete/>
                        <img src="/image/icon/key.png" id="loginPasswordVisible" width="30">
                    </div>
                </div>
                <script language=javascript>
                    console.log(LoginTimes);
                    if (LoginTimes > 0 && LoginTimes < 3 && !(1==gotoMainSet&&1==pswST&&0==Logged))
                    {
                        document.writeln('<div class="row d-flex justify-content-center " style="color: red; font-size: 16px;"><strong>')
                        var str = LoginTimes + ' failed of user name or password.';
                        document.writeln(str);
                        document.writeln('</strong></div>');
                        <% if tcWebApi_get("WebCustom_Entry", "isCTPONJXSupported", "h") = "Yes" then%>
                            rmCookie("UID");
                            rmCookie("PSW");
                        <% end if %>
                    }			
                </script>
                <SCRIPT language=JavaScript type=text/javascript>
                  <%asp_write("display_default_password();")%>
                </SCRIPT>
                <br>
                <button id="btnSubmit" onclick="SubmitForm()" type="button" name="btnSubmit" value="Login" class="button-login">Login</button>
                </form>
            </div>
            </div>
        </div>
    </div>
    </div>
</body>

</html>