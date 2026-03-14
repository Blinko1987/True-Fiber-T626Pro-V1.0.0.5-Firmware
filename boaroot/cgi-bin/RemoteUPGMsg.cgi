#!/bin/sh

echo "Content-Type: text/html"
echo ""

FILE="/tmp/cwmpfirmwareupgrade"
echo "<html>
<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" /></head>
<body onload=\"setInterval('msgJudge()', 3000)\">
<div id=\"div0\">"

#文件存在时，表明正在下载
if [ -f "$FILE" ];
then
    echo "<center><b><font size=5>Terminal is upgrading,Please do not power off.</font></b></center><br /><br />
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font color=red>Prompt</font>:<br />
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspITMS platform is upgrading the device remotely, and automatically configure the business after the system restart (within 10 minutes), please note the following:<br />
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1、During the upgrade process, do not power off.<br />
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2、During the upgrade process, do not plug fiber.<br />
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp3、During the upgrade process, do not close this page.<br />"

else
	echo "<center><b><font size=5>Terminal upgrade successfully, the business can be used normally, thank you for your patience.</font></b></center>"      
fi

echo "<br />
</div>
<div id=\"div1\"></div>
<script type=\"text/javascript\" language=javascript>

//全局变量，保存状态、标识、计数等
var bias = 1;
var biasOfBrowser = 5;
var cycleCount = 0;
var onloadCount = 0;
var countAfterErase = 0;
var eraseFlashBeginFlag = 0;
var onloadCountWhenEraseFlash = 0;
var eraseFlashCount = 20, connectWanCount = 3;
var rebootCount = 10;

function onloadIncrease(){
  onloadCount+=1;
}

//显示网关的三种状态，包括正在下载、正在重启、已经正常。
function msgJudge()
{ 
  var elem, img, msg, time, elem1;

  elem = document.getElementById(\"div0\");
  elem1 = document.getElementById(\"div1\");
  time = new Date().getTime();
  msg  = elem.innerHTML;  

  if (cycleCount > (onloadCount+bias)){
      if (onloadCountWhenEraseFlash == 0){
		  onloadCountWhenEraseFlash = onloadCount;
		  eraseFlashBeginFlag = 1;  
      }    
      if (cycleCount > (onloadCountWhenEraseFlash+eraseFlashCount)){
	  	  msg=\"<center><b><font size=5>Terminal is restarting, please wait...</font></b></center>\";
      }
  }

  if (eraseFlashBeginFlag == 1){
      countAfterErase+=1;
      if ((onloadCount > (onloadCountWhenEraseFlash+connectWanCount+biasOfBrowser)) && (countAfterErase > (eraseFlashCount+rebootCount))){
  		  msg=\"<center><b><font size=5>Terminal upgrade successfully, the business can be used normally, thank you for your patience.</font></b></center>\";
  	  }
  }

  img=\"<img width='1' height='1' style='display:none' onload='onloadIncrease()'\" +
      \"src='/img/ok_skyw.gif?query0=\"
      + time + \"'></img>\";
  elem1.innerHTML=img;
  elem.innerHTML=msg;
  cycleCount+=1;
}
</script>
</body>
</html>"
