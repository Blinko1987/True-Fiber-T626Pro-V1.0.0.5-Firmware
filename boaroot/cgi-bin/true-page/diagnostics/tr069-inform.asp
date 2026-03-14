<script language=JavaScript type=text/javascript>
var doManaulRep = 0;
</script>
<%
If Request_Form("manual_commitflag") = "1" then
	TCWebApi_set("Cwmp_Entry","Manual_Inform","ManualInform")
	TCWebApi_commit("Cwmp_Entry")
	asp_Write("<script language=JavaScript type=text/javascript>doManaulRep=1;</script>")
	TCWebApi_unset("Diagnostic_PVC")
else
	TCWebApi_unset("Diagnostic_PVC")
End If

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Diagnostics - TR069 INFORM</title>
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

  <!-- self sript -->
  <script src="/scripts/utils/util_skyw.js"></script>
</head>

<body>
  <!-- content -->
  <form id="ReportForm" name="ReportForm" method="post" action="/cgi-bin/true-page/diagnostics/tr069-inform.asp">
  <input type="hidden" name="ManualInform" value="1">
  <input type="hidden" name="manual_commitflag" value="0">
    <div class="container-full container-resize-height">
      <div class="title-text">TR069 INFORM</div><br>
      <div class="row p-1">
        <div class="col-6">
          <div class="title-text-left"><strong>INFORM Manual Reporting:</strong></div>
        </div>
      </div>
      
      <div class="mt-2 center">
        <button type="button" id="btninform" onclick="startInform()" class="btn-dashboard">Go</button>
      </div>
      <div id=InformResults name="InformResults">
        <script language=JavaScript type=text/javascript>
          function printResult()
          {
            var result = "<%TCWebApi_get("Cwmp_Entry","Inform_Status","s")%>";
            document.writeln("<div class=\"title-text-left\"><strong>");
            switch(result)
            {
              case "0":
                document.writeln("INFORM manual reporting test result:Not reported(E home terminal is starting)");
                break;
              case "1":
                document.writeln("INFORM manual reporting test result:Not reported(No remote management WAN connection)");
                break;
              case "2":
                document.writeln("INFORM manual reporting test result:Not reported(Remote management WAN connection is not effective)");
                break;
              case "3":
                document.writeln("INFORM manual reporting test result:Not reported(No management access DNS information)");
                break;
              case "4":
                document.writeln("INFORM manual reporting test result:Not reported(Non-ACS configuration parameter)");
                break;
              case "5":
                document.writeln("INFORM manual reporting test result:Not reported(ACS DNS failure)");
                break;
              case "6":
                document.writeln("INFORM manual reporting test result:No response reported");
                break;
              case "7":
                document.writeln("INFORM manual reporting test result:Reporting process is interrupted");
                break;
              case "8":
                document.writeln("INFORM manual reporting test result:Reported successful");
                break;
              //added by zhujunjie, 2019.5.27
              case "9":
                document.writeln("INFORM manual reporting test result:Authentication failed");
                break;
              default:
                document.writeln("INFORM manual reporting test result:Not reported");
                break;
            }
            document.writeln("</strong></div>");
          }
          
          function printWaitMsg()
          {
            document.writeln("<B><font color='#FF0000' size='-1'>Manual reporting process is going on, please wait...</font></B>");
          }
          
          function refreshPage()
          {
            document.cookie = "DiagnosticPageStatus=2";
            document.ReportForm.submit();
            showLoading();
          }
          
          function disableCtl()
          {
            setDisable("btninform",1);
          }
          
          function getPageStatus()
          {
            if(document.cookie.length > 0)
            {
              tstart = document.cookie.indexOf("DiagnosticPageStatus=");
              if( tstart != -1)
              {
                tstart += 21;
                tend = document.cookie.indexOf(";",tstart);
                if(tend == -1) tend = document.cookie.length;
                return document.cookie.substring(tstart,tend);
              }
            }
          }

          var pst = getPageStatus();
          if (pst == "1" && doManaulRep)
          {
            printWaitMsg();
            disableCtl();
            setTimeout(refreshPage,15000);
          }
          else if(pst =="2")
          {
            printResult();
            document.cookie = "DiagnosticPageStatus=3";
          }
        </script>
      </div>
    </div>
  </form>
  <!-- content -->
  <script language=JavaScript type=text/javascript>                
    function startInform()
    {
      document.ReportForm.manual_commitflag.value = "1";
      document.cookie = "DiagnosticPageStatus=1";
      document.ReportForm.submit();
      showLoading();
    }
  </script>
</body>

</html>