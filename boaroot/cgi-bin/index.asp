<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title><%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%></title>
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
<script src="/scripts/utils/util_skyw.js"></script>
<!-- script -->
<script data-main="/scripts/app/app_main" src="/scripts/lib/require.js"></script>
<script>
  /*
  require(['./app', '../utils/utils'],function(app, utils){
    console.log(utils.moduleName);
  });
  */
  var curUser = "<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>";
  <% if tcwebApi_get("WebCustom_Entry","isCYE8SFUSupported","h") = "Yes" then %>
  var ModelName_dev = "<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%>";
  <% if tcwebApi_get("WebCustom_Entry","isCTSFUC9Supported","h") = "Yes" then %>
  var ModelName = "SFU";
  <% else %>
  var ModelName = "E8-B-GPON";
  <% end if %>
  <% else %>
  var ModelName = "<%tcWebApi_get("DeviceInfo_devParaStatic","ModelName","s")%>";
  <% end if %>  
    var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;
    var screenHeight = -1;
    var observer = new MutationObserver(function() {
      refreshFrameHeight();
    });

    // 当iframe url刷新时调用
    function refreshFrame() {
      // 用于refreshFrame时是否需要计算高度用途
      if( screenHeight === -1 ) {
        screenHeight = $(".empty-container").height();
      }

      $("#contentfrm").removeAttr("style");

      refreshFrameHeight();

      if (this.observer) {
        this.observer.disconnect();
        this.observer.takeRecords();
        
        var element = $("body", document.getElementById("contentfrm").contentWindow.document).get(0);
        observer.observe(element,{attributes:true,attributeFilter:['style'],attributeOldValue:true,subtree:true});
      }
    }

    // observer回调处理逻辑，当iframe里面出现内容变化时调用
    function refreshFrameHeight() {

      var iframeDoc = document.getElementById("contentfrm").contentWindow.document;
      $("body .container-full", iframeDoc).addClass("container-resize-height");

      var iframeHeight = $("body", iframeDoc).height();

      if( screenHeight <= iframeHeight ) {
        // if( !$("body .container-full", iframeDoc).hasClass("container-resize-height") ) {
        //   $("body .container-full", iframeDoc).addClass("container-resize-height");
        // }
        $("#contentfrm").height(iframeHeight);
      } else {
        $("#contentfrm").removeAttr("style");
        $("body .container-full", iframeDoc).removeClass("container-resize-height");
        $("#contentfrm").height(iframeHeight);
      }
    }

</script>
</head>
<body>
  <!-- empty content for calculate height -->
  <div class="empty-container container-full" style="position: absolute; width: 0px; height: 100vh; z-index: -1000; visibility: hidden;"></div>

  <!-- header -->
  <nav class="navbar navbar-light bg-light p-0">
    <!-- container -->
    <div class="container mt-2">
      <!-- row-1 -->
      <div class="row d-flex align-items-center">
        <div class="col-md-4">
          <a class="navbar-brand" href="/">
            <img src="/image/True-Gigatex1.png" class="logo-header" alt="">
          </a>
        </div>
        <div class="col-md-6 col-6">
        </div>
        <div class="col-md-2 col-4">
          <div class="dropdown">
            <a class="btn-admin dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <% if tcWebApi_get("WebCurSet_Entry", "CurrentAccess", "h") = "0"  then %>
              Superadmin
              <%else%>
              Admin
              <% end if%>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" href="/cgi-bin/logout.cgi">Logout</a>
            </div>
          </div>
        </div>
      </div>
      <!-- row-1 -->
      <!-- row-2 -->
      <div class="row tap-menu">
        <ul class="nav nav-tabs menu-list pt-1" style="border-bottom: none;" id="mainMenuList">
        </ul>
      </div>
      <!-- row-2 -->
    </div>
    <!-- container -->
  </nav>
  <!-- header -->
  <!-- content -->
  <div class="container mt-3 mb-4">
    <div class="row">
      <div class="col-md-3 col-sm-12 label-hide" id="slideMenu">
        <div class="list-group slide-menu-list text-truncate" id="subMenuList">
        </div>
      </div>
      <iframe 
        src='' 
        name='contentfrm' 
        class="col-md-9 col-sm-12" 
        id="contentfrm" 
        frameborder='no' 
        border='0' 
        target='_self' 
        marginwidth='0' 
        marginheight='0'
        onload="refreshFrame()"
      >
      </iframe>
    </div>
  </div>
  <!-- footer -->
  <div class="footer font-weight-bold">
    <a href="tel:1242">
      <div class="mtp-lines-box txt-grey">
        <span class="txt-size-m">True Call Center</span>
      </div>
      <span class="txt-size-xxl txt-red">
        1242
        <span class="phone-cir-red-icon sprite-icons">
        </span>
      </span>
    </a>
  </div>
  <!-- footer -->
  <script src="scripts/lib/script.js"></script>

  <!--mainMenu templates-->
  <script type="text/template" data-id="mainMenuList">
    <li class="nav-item menu-item" id="{menuId}_li">
      <span style="color: #007bff;" class="cursor-pointer nav-link menu-link text-light" id="{menuId}">{menuName}</span>
    </li>
  </script>
  <!--mainMenu templates-->

  <!--subMenu templates-->
  <script type="text/template" data-id="subMenuList">
    <span id="{menuId}" class="cursor-pointer list-group-item list-group-item-action slide-menu-item" data-toggle="collapse" role="button" aria-expanded="true"
    aria-controls="collapse0">{menuName}</span>
    <div class="collapse" id="collapse{index}">
    </div>
  </script>
  <!--subMenu templates-->

  <!--thirdMenu templates-->
  <script type="text/template" data-id="thirdMenuList">
    <span id="{menuId}" class="cursor-pointer list-group-item list-group-item-action slide-menu-l-item {show}">{menuName}</span>
  </script>
  <!--thirdMenu templates-->

  <script>
    $(document).ready(function() {
      // 监听浏览器窗口事件
      $(window).resize(function() {
        refreshFrame();
      })
      $('.dropdown-toggle').dropdown();
    });

    rootShowLoading();
    window.addEventListener('message',(e) => {
      //console.log(e.data);
      //console.log(e.origin);
      //console.log(e.source);
      if(e.origin != (location.origin)) {
        return;
      }else {
        if(e.data == "showLoading"){
          $("#showHideModal").show();
          $('#loadingModal .progress-bar').css({width: "0%"});
          $('#loadingModal').addClass("show");
          $('#loadingModal').css({display: "block"});
          setTimeout(function() {
            $('#loadingModal .progress-bar').css({width: "100%"});
          }, 200);
        }else if(e.data == "hideLoading"){
          $('#loadingModal').removeClass("show");
          $('#loadingModal').css({display: "none"});
          $("#showHideModal").hide();
        }else if(e.data == "LoadComplete") {
          refreshFrameHeight();
        }
      }
    }, false);
  </script>

</body>
</html>
