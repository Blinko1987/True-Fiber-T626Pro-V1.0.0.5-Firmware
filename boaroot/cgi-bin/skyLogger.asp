<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>skyLogger</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="/JS/ui-dialog.css" type=text/css rel=stylesheet>
<LINK href="/JS/stylemain_skyw.css?v=<%tcWebApi_get("DeviceInfo_devParaStatic","CustomerSWVersion","s")%>" rel="stylesheet" type="text/css">
<LINK href="/JS/message.css" type=text/css rel=stylesheet>
<SCRIPT language=javascript src="/JS/jquery-2.1.3.min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/dialog-min.js"></SCRIPT>
<SCRIPT language=javascript src="/JS/util_skyw.js"></SCRIPT>
<script type="text/javascript" src="/JS/message.js"></script>

<META content="MSHTML 6.00.6000.16809" name=GENERATOR>
<style>
.btn-cmder{

  color: white;
  background-color: #22b6ec;
  border: none;
  height: 30px;
  margin-left: 20px;
}

.card-filetable
{
    background: #F0F1F1;
    border-radius: 10px;
    margin: 1rem 1rem 1rem 1rem;
    overflow-x: auto;
    height:200px;
}

.filetable-header
{
    color: white;
    font-size: 16px;
    font-weight: bold;
    padding: 0.5rem;
    background: linear-gradient(0deg, #31A8C3 -129.68%, #3D6BA6 118.94%);
}

.filetable-content-first
{
    font-size: 16px;
    color: #5D646E;
    background: #E3E7E7;
}

.filetable-content-second
{
    font-size: 16px;
    color: #5D646E;
}

.loadingContainer
{
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  top: 40%;
  left: 55%;
  transform: translate(-50%, -50%);
  z-index: 9999;
}

#overlay
{
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 9999;
}
</style>
</HEAD>
<body style="TEXT-ALIGN: center" vLink=#000000 aLink=#000000 link=#000000 
leftMargin=0 topMargin=0 
onunload=DoUnload() marginheight="0" marginwidth="0">
<div id="loadingGif" class="loadingContainer" style="display: none;">
  <img src="/img/loading.gif">
</div>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=1008 align=center 
border=0>
  <TBODY>
  <TR>
    <TD height=1>
      <TABLE cellSpacing=0 cellPadding=0 border=0 class="FragmeLogo"> 
        <TBODY>
        <TR>
          <TD>&nbsp;</TD>
          <TD vAlign=bottom align=right width=558>
            <TABLE id=table8 cellSpacing=0 cellPadding=0 border=0 height="100%">
              <TBODY>
              <TR>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
                <TD>&nbsp;</TD>
              </TR>
              <TR>
                <TD  align=right><SPAN class=curUserName>&nbsp; 
                  </SPAN></TD>
                <TD class=welcom vAlign=bottom align=middle width=20 style="color:#ffffff;line-height:40px;"></TD>
                <TD vAlign=bottom width=100>
                  <A href="/cgi-bin/index.asp" target=_top style="TEXT-DECORATION: none;">
                    <SPAN class=logout style="line-height:40px;">Home Page</SPAN>
                  </A>
                </TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
      </TBODY>
    </TABLE>
    <TABLE id=table3 cellSpacing=0 cellPadding=0 class=HeaderTable3 border=0>
      <TBODY>
        <TR>
          <TD class=HeaderTable3Img_1></TD>
          <TD class=HeaderTable3Img_2></TD>
        </TR>
      </TBODY>
      </TABLE>
    </TD>
  </TR>
  <TR>
    <TD vAlign=top>
      <TABLE id="msgComponent" height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
        <TR>
          <TD class="Item_L1_table_td_1_height30">
            <P class=Item_L1>skyLogger</P>
          </TD>
          <TD class="Item_table_td_2"></TD>
          <TD class="Item_table_td_3" style="width: 835px;"></TD>
          <TD vAlign=top class="Item_table_td_4" rowSpan=4 style="width: 6px; background-image: url(../img/panel3.gif);">
           <TABLE cellSpacing=0 cellPadding=1 width="100%" border=0 height='100%'>
             <TBODY>
              <TR><TD valign='top'></TD></TR>
             </TBODY>
           </TABLE>
         </TD>
        </TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height30">
            <P class=Item_L2></P></TD>
          <TD class="Item_table_td_2"></TD>
          <TD>
            <br>
            <form onsubmit="return false;" name="ButtonForm" method="post" style="margin-left: 10px;">
              <div style="margin-left:20px" id="cmdboxList"></div>
              <br>
              <button type="button" id="cmdboxListBtn" onclick="cmdboxListBtnCk()" class="btn-cmder">Generate and Download</button>
              <button style="margin-left: 53%;" type="button" id="cmdboxListAllBtn" onclick="cmdboxListBtnAllCk()" class="btn-cmder">Generate All and Download</button>
              <br>
              <br>
              <div style="display: flex;">
                <div style="margin-left:20px" id="processboxList" onchange="updateProcessfileList(event.target.value)"></div>
                <div style="margin-left:20px" id="processfileList"></div>
                <button type="button" id="processfileBtn" onclick="processfileBtnCk()" class="btn-cmder">Generate and Download</button>
              </div>
              <div class="card-filetable">
              <TABLE class="" style="width:100%;overflow-y: scroll;" id='logfilelist'>
              </TABLE>
              </div>
              <br>
              <button type="button" id="AllBtn" onclick="filePackAllBtCk()" class="btn-cmder">Package And Save All Log</button>
              <button style="margin-left: 60%;" type="button" id="RemoveAllBtn" onclick="fileRemoveBtCk('all')" class="btn-cmder">Remove All Log</button>
            </form>
          </TD>
        </TR>
<% end if %>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height10"></TD>
          <TD class="Item_table_td_2"></TD>
          <TD></TD>
        </TR>
        <TR>
          <TD vAlign=top class="Item_table_td_1_height0"></TD>
          <TD class="Item_table_td_2"></TD>
          <TD></TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>
<% if tcwebApi_get("WebCurSet_Entry","CurrentAccess","h") = "0" then %>
  <TR>
    <TD height=1>
      <TABLE id=table7 height=35 cellSpacing=0 cellPadding=0 width=100% 
        border=0><TBODY>
        <TR>
          <TD class="bottom_table_td_1"></TD>
          <TD class="bottom_table_td_2"></TD>
          <TD class="bottom_table_td_3" style="width: 670px">
            <P align=right style="padding-right:20px;">
            <input type="button" id="btnOK" onclick="btnCommit()" value="Confirm" border="0" style="height:23; width:105;">&nbsp;&nbsp;
            <input type="button" id="btnCancel" onclick="RefreshPage()" value="Cancel" border="0" style="width:105; height:23;">
            </P>
          </TD>
          <TD class="bottom_table_td_4"></TD></TR>
    </TABLE></TD></TR>
<% end if %>
  </TBODY>
</TABLE>
<script>
  var filenum = 0;
  LoadFrame();

  function showLoadingUI()
  {
    document.getElementById('loadingGif').style.display = 'block';
    var overlay = document.createElement('div');
    overlay.id = 'overlay';
    document.body.appendChild(overlay);
  }

  function hideLoadingUI()
  {
    document.getElementById('loadingGif').style.display = 'none';
    var overlay = document.getElementById('overlay');
    if (overlay)
    {
      overlay.remove();
    }
  }

  function cmdboxListInit(json, containerId)
  {
    var container = document.getElementById(containerId);
    var table = document.createElement('table');
    table.style.width = '100%';
    container.appendChild(table);

    var maxItemsPerRow = 4;

    for (var i = 0; i < json.cmds.length; i++)
    {
      var cmd = json.cmds[i];
      var parts = cmd.split(' ');
      var value = parts[0];
      var displayValue = parts[1];

      if (i % maxItemsPerRow === 0)
      {
        var row = document.createElement('tr');
        table.appendChild(row);
      }

      var cell = document.createElement('td');
      cell.style.width = '25%';
      row.appendChild(cell);

      var checkbox = document.createElement('input');
      checkbox.type = 'checkbox';
      checkbox.value = value;
      cell.appendChild(checkbox);

      var label = document.createElement('label');
      label.textContent = displayValue;
      cell.appendChild(label);
    }

    var remainingItems = maxItemsPerRow - (json.cmds.length % maxItemsPerRow);
    for (var i = 0; i < remainingItems; i++)
    {
      var emptyCell = document.createElement('td');
      emptyCell.style.width = '25%';
      row.appendChild(emptyCell);
    }
  }

  function cmdboxListCheck(containerId)
  {
    var container = document.getElementById(containerId);
    var checkboxes = container.querySelectorAll('input[type="checkbox"]:checked');
    var cmds = [];
    var i = 0;

    for (i = 0; i < checkboxes.length; i++)
    {
      var checkbox = checkboxes[i];
      var value = checkbox.value;
      var cmd = value
      cmds.push(cmd);
    }
    
    var json = {
      "cmds": cmds,
      "num": i
    };
    
    return json;
  }

  function processboxListInit(json, containerId)
  {
    var cmds = json.cmds;
    var select = document.createElement("select");
  
    cmds.forEach(cmd => {
      const option = document.createElement("option");
      var parts = cmd.split(' ');
      option.value = parts[0];
      option.text = parts[1];
      select.appendChild(option);
    });
  
    var container = document.getElementById(containerId);
    if (container)
    {
      container.innerHTML = "";
      container.appendChild(select);
    }
  }

  function processfileListInit(json, containerId)
  {
    var files = json.files;
    var select = document.createElement("select");
  
    files.forEach(file => {
      const option = document.createElement("option");
      option.value = file.name;
      option.text = file.name;
      select.appendChild(option);
    });
  
    var container = document.getElementById(containerId);
    if (container)
    {
      container.innerHTML = "";
      container.appendChild(select);
    }
  }

  function updateProcessfileList(val)
  {
    sendCmder('get_process_logfile ' + val, '{}');
  }

  function processfileBtnCk()
  {
    var container = document.getElementById('processfileList');
    var selectElement = container.querySelector("select");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var selectedValue = selectedOption.value;
    sendCmder('download_process_logfile '+selectedValue, '{}');
  }

  function cmdboxListBtnCk()
  {
    var tmpval = cmdboxListCheck('cmdboxList');

    if(tmpval.num > 0)
    {
      sendCmder('pack_selected_module', tmpval);
    }
    else
    {
      alert('Please select at least one module');
    }
  }

  function cmdboxListBtnAllCk()
  {
    var container = document.getElementById('cmdboxList');
    var checkboxes = container.querySelectorAll('input[type="checkbox"]');
    checkboxes.forEach((checkbox) => {
      checkbox.checked = true;
    });
    cmdboxListBtnCk();
  }

  function timestampToString(timestamp)
  {
    function addLeadingZero(number)
    {
      return number < 10 ? '0' + number : number;
    }

    var date = new Date(timestamp * 1000);
    var year = date.getFullYear();
    var month = addLeadingZero(date.getMonth() + 1);
    var day = addLeadingZero(date.getDate());
    var hours = addLeadingZero(date.getHours());
    var minutes = addLeadingZero(date.getMinutes());
    var seconds = addLeadingZero(date.getSeconds());

    var formattedTime = year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
    return formattedTime;
  }

  function fileListInit(jsonData, containerId)
  {
    var cmdsTable = document.getElementById(containerId);
    var rowHtml = '';
    var count = 1;
    rowHtml += '<thead style="position: sticky; top: 0;"><tr class= \'filetable-header\'><td style="width:4%">No</td><td style="width:40%">File Name</td><td style="width:13%">File Size</td><td style="width:20%">Generate Time</td><td style="width:23%">Option</td></tr></thead>'

    filenum = 0;

    jsonData.files.forEach((file, index) => {
      filenum++;
      if(index % 2 == 0)
        rowHtml += '<tr class= \'filetable-content-first\'>';
      else
        rowHtml += '<tr class= \'filetable-content-second\'>';
      rowHtml += '<td>' + (index + 1) + '</td>';
      rowHtml += '<td>' + file.name + '</td>';
      rowHtml += '<td>' + (file.size/1024).toFixed(2) + 'KB</td>';
      rowHtml += '<td>' + timestampToString(file.created) + '</td>';
      rowHtml += '<td><button type="button" onclick="fileRemoveBtCk(\''+ file.name +'\')" class="btn-cmder">remove</button>';
      rowHtml += '<button type="button" onclick="fileDownloadBtCk(\''+ file.name +'\')" class="btn-cmder">Download</button></td>';
      rowHtml += '</tr>';
      count++;
    });

    while(count <= 12)
    {
      if(count % 2 == 0)
        rowHtml += '<tr class= \'filetable-content-second\'>';
      else
        rowHtml += '<tr class= \'filetable-content-first\'>';
      rowHtml += '<td>' + count + '</td><td></td><td></td><td></td><td></td></tr>';
      count++;
    }

    cmdsTable.innerHTML = rowHtml;
  }

  function LoadFrame()
  {
    sendCmder('get_loggerCmd_list', '{}');
    sendCmder('get_logfile_list', '{}');
    sendCmder('get_processkeyword_list', '{}');
  }

  function fileRemoveBtCk(targetFileName)
  {
    sendCmder("remove_module_log "+targetFileName, '{}');
  }

  function fileDownloadBtCk(targetFileName)
  {
    Back_Syslog(targetFileName);
  }

  function filePackAllBtCk()
  {
    if(filenum > 0)
      sendCmder("tar_all_module_log", "{}");
    else
      alert('There are no files to be packaged.');
  }

  function Back_Syslog(PackageName)
  {
    var cfg = '/skyLoggerData/' + PackageName;
    var code;

    code = 'location.assign("'+cfg+'")';
    eval(code);
  }

  function sendCmder(tmpmethod, tmpdata)
  {
    showLoadingUI();
    var jsondata = {
      method: tmpmethod,
      data: tmpdata
    };
    var sendData = JSON.stringify(jsondata);
    console.log("sendData:" + sendData);
    $.ajax({
      type:"POST",
      url:"/webapi/skyLogger",
      data:"sendData=" + sendData,
      processData:false,
      success:function(res)
      {
        hideLoadingUI();
        if(res.code == 0)
        {
          console.log(res.msg);
          console.log(res.data);
          var datajson = JSON.parse(res.data);
          if(datajson.method == "get_loggerCmd_list")
          {
            cmdboxListInit(datajson.data, 'cmdboxList');
          }
          else if(datajson.method == "get_logfile_list")
          {
            fileListInit(datajson.data, 'logfilelist');
          }
          else if(datajson.method == "get_processkeyword_list")
          {
            processboxListInit(datajson.data, 'processboxList');
            var defaultselected = datajson.data.cmds[0].split(' ');
            sendCmder('get_process_logfile ' + defaultselected[0], '{}');
          }
          else if(datajson.method.includes("get_process_logfile"))
          {
            processfileListInit(datajson.data, 'processfileList');
          }
          else if(datajson.method.includes("download_process_logfile"))
          {
            sendCmder('get_logfile_list', '{}');
            Back_Syslog(datajson.data.filename);
          }
          else if(datajson.method == "pack_selected_module")
          {
            sendCmder('get_logfile_list', '{}');
            Back_Syslog("skylogger.log");
          }
          else if(datajson.method.includes("remove_module_log"))
          {
            sendCmder('get_logfile_list', '{}');
          }
          else if(datajson.method == "tar_all_module_log")
          {
            Back_Syslog(datajson.data.filename);
          }
          return true;
        }
        else
        {
          console.log(res.msg);
          console.log(res.data);
          return false;
        }
      },
      error:function(res)
      {
        hideLoadingUI();
        alert("execute failed, please try again.");
        return false;
      }
    });
  }
</script>
</body>
