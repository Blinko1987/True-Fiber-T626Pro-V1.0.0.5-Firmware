define(function (require,exports,modules) {
  var utils = require('utils'),
    config = require('config');

  $(function () {
    //渲染主菜单
    renderMainMenu();
    //遍历菜单列表并添加监听事件
    addListenerForMainMenu();
  });
  
  function addListenerForMainMenu(){
    $.each(config.mainMenuList, function(i, currentObj) {
      //console.log(currentObj.menuId);
      //console.log(currentObj.href);
      //遍历主菜单添加监听点击事件
      $('#' + currentObj.menuId).on('click', function(event) {
        //为当前点击的菜单添加样式
        $('#' + currentObj.menuId + "_li").addClass("menu-active");
        $('#' + currentObj.menuId).removeClass("text-light");
        //console.log("click mainMenu: " + currentObj.menuName);
        //某一个主菜单发生点击时要做的其它操作
        mainMenuClicked(currentObj);
      });
    });
    //渲染后触发当前菜单项点击事件
    $('#' + config.mainMenuList[0].menuId).click();
  }
  
  function addListenerForSubMenu(subMenuArray){
    $.each(subMenuArray, function(i, currentObj) {//遍历二级菜单添加监听点击事件
      //console.log(currentObj.menuId);
      if(currentObj.hasOwnProperty("diableClick") && currentObj.diableClick){
        //如果该菜单禁用,则移除及添加相关class,且不为该菜单添加点击事件
        //console.log(currentObj.menuName + " diableClick: " + currentObj.diableClick);
        $('#' + currentObj.menuId).removeClass("list-group-item-action");
        $('#' + currentObj.menuId).removeClass("slide-menu-item");
        $('#' + currentObj.menuId).addClass("slide-menu-disable");
      }else{
        $('#' + currentObj.menuId).on('click', function(event) {
          $('#' + currentObj.menuId).addClass("slide-menu-active");
          //console.log("click subMenu: " + currentObj.menuName);
          //某一个二级菜单发生点击时要做的其它操作
          subMenuClicked(subMenuArray, currentObj);
        });
      }
    });
    $.each(subMenuArray, function(i, currentObj) {
        //找到第一个渲染的二级菜单点击(被渲染的菜单会添加index属性)
        if(currentObj.hasOwnProperty("index")){
            $('#' + subMenuArray[i].menuId).click();
            return false;
        }
    });
  }
  
  function addListenerForThirdMenu(thirdMenuArray){
    var curUser = '<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>';
    $.each(thirdMenuArray, function(i, currentObj) {
      //console.log("thirdMenu currentObj: " + currentObj.menuId);
      //遍历三级菜单添加监听点击事件
      if(currentObj.hasOwnProperty("diableClick") && currentObj.diableClick){
        //如果该菜单禁用,则移除及添加相关class,且不为该菜单添加点击事件
        //console.log(currentObj.menuName + " diableClick: " + currentObj.diableClick);
        $('#' + currentObj.menuId).removeClass("list-group-item-action");
        //$('#' + currentObj.menuId).removeClass("slide-menu-l-active");
        $('#' + currentObj.menuId).removeClass("slide-menu-l-item");
        $('#' + currentObj.menuId).addClass("slide-thirdMenu-disable");
      }else{
        $('#' + currentObj.menuId).on('click', function(event) {
          $('#' + currentObj.menuId).addClass("slide-menu-l-active");
          //console.log("thirdMenu currentObj: " + currentObj.menuId);
          //某一个三级菜单发生点击时要做的其它操作
          thirdMenuClicked(thirdMenuArray, currentObj);
        });
      }
    });
    //$('#' + thirdMenuArray[0].menuId).click();
    //依次遍历，点击第一个没有禁用的三级菜单
    $.each(thirdMenuArray, function(i, currentObj) {
      if(currentObj.hasOwnProperty("diableClick") && currentObj.diableClick){
        return true;//same as continue
      }else{
        /* Add by wenxudong for thirdMenu default view index */
        if (currentObj.hasOwnProperty("whoInvisible")) {
          var whoInvisible = currentObj.whoInvisible;
          if (2 == whoInvisible) {
            return true;
          }
          else if ((0 == whoInvisible) && (0 == curUser)) {
            return true;
          }
          else if ((1 == whoInvisible) && (1 == curUser))
          {
            return true;
          }
        }
        /* Add end */
        //console.log("thirdMenuArray menuId["+i+"]: " + thirdMenuArray[i].menuId);
        $('#' + thirdMenuArray[i].menuId).click();
        return false;//same as break
      }
    });
  }

  function renderMainMenu(){ 
    //获取主菜单模板内容
    var tmpContent = $("script[data-id='mainMenuList']").html();
    //主菜单模板数据
    var renderData = config.mainMenuList;
    //调用renderList将数据填充到模板中并重新渲染DOM树
    utils.renderList(tmpContent, renderData, document.querySelector("#mainMenuList"));
  }
  
  function renderSubMenu(currentObj){
    var subMenuName = currentObj.subMenuName;
    //console.log(subMenuName);
    //console.log(config[subMenuName]);
    //主页特殊处理,不需要侧边栏(二级菜单)
    if(subMenuName == null || subMenuName == undefined || subMenuName == ''){
      $('#contentfrm').attr('src', currentObj.href);
      if($('#slideMenu').hasClass('label-show')){
        $('#slideMenu').removeClass('label-show').addClass('label-hide');
      }
      if($('#contentfrm').hasClass('col-md-9')){
        $('#contentfrm').removeClass('col-md-9').addClass('col-md-12');
      }
    }else{//其它页面增加二级菜单显示
      //暂时没找到自适应的方法，手动调整iframe高度
      parent.document.getElementById('contentfrm').style.height="";
      if($('#slideMenu').hasClass('label-hide')){
        $('#slideMenu').removeClass('label-hide').addClass('label-show');
      }
      if($('#contentfrm').hasClass('col-md-12')){
        $('#contentfrm').removeClass('col-md-12').addClass('col-md-9');
      }
      var tmpContent = $("script[data-id='subMenuList']").html();
      var renderData = config[subMenuName];
      utils.renderList(tmpContent, renderData, document.querySelector("#subMenuList"));
      //默认将第一个二级菜单对应的URL设置到iframe src
      //$('#contentfrm').attr('src', config[subMenuName][0].href);

      //添加二级菜单的监听点击事件
      addListenerForSubMenu(config[subMenuName]);
    }
  }

  function renderThirdMenu(subMenuArray, currentSubMenuObj){
    var thirdMenuName = currentSubMenuObj.subMenuName;
    var tmpContent = $("script[data-id='thirdMenuList']").html();
    var renderData = config[thirdMenuName];
    var currentSubMenuObjId = "#collapse" + subMenuArray.indexOf(currentSubMenuObj);
    console.log("currentSubMenuObjId: " + currentSubMenuObjId);
    //"thirdMenuList_advance_WLAN"三级菜单需要根据当前mesh是否开启决定如何渲染，mesh关闭时默认隐藏部分菜单
    if(renderData[0].modules == "thirdMenuList_advance_WLAN"){
      $.get('/cgi-bin/json/meshStatus.json', function(jsonObject, status){
        var meshEn = jsonObject.meshEnable;
        if(!meshEn){  //jsonObject.meshEnable为null或undefined时默认为0
          renderData[0].meshEnable = 0;
        }else{
          renderData[0].meshEnable = meshEn;
        }
        console.log("renderData[0].meshEnable = " + renderData[0].meshEnable);
        utils.renderList(tmpContent, renderData, document.querySelector(currentSubMenuObjId));
        //默认将第一个三级菜单对应的URL设置到iframe src
        //$('#contentfrm').attr('src', config[thirdMenuName][0].href);
        $(currentSubMenuObjId).addClass('show')
    
        //添加三级菜单的监听点击事件
        addListenerForThirdMenu(config[thirdMenuName]);
      });
    }else{
      utils.renderList(tmpContent, renderData, document.querySelector(currentSubMenuObjId));
      //默认将第一个三级菜单对应的URL设置到iframe src
      //$('#contentfrm').attr('src', config[thirdMenuName][0].href);
      $(currentSubMenuObjId).addClass('show')
  
      //添加三级菜单的监听点击事件
      addListenerForThirdMenu(config[thirdMenuName]);
    }
  }
  
  function mainMenuClicked(currentObj){
    //渲染二级菜单
    renderSubMenu(currentObj);
    //再次遍历菜单，不属于当前点击事件的菜单增加class “text-light”
    $.each(config.mainMenuList, function(i, otherObj) {
      if(currentObj.menuId != otherObj.menuId){
        $('#' + otherObj.menuId + "_li").removeClass("menu-active");
        $('#' + otherObj.menuId).addClass("text-light");
      }
    });
  }
  
  function subMenuClicked(subMenuArray, currentObj){
    $.each(subMenuArray, function(i, otherObj) {
      //console.log(otherObj.menuId);
    //再次遍历菜单，不属于当前点击事件的菜单增加样式
      if(currentObj.menuId != otherObj.menuId){
        $('#' + otherObj.menuId).removeClass("slide-menu-active");
        var otherObjId = "#collapse" + subMenuArray.indexOf(otherObj);
        //console.log("other menu: "otherObj.menuName);
        //console.log("other menu template ID: " + otherObjId);
        if($(otherObjId).hasClass('show')){
          $(otherObjId).removeClass('show')
        }
      }
    });
    var thirdMenuName = currentObj.subMenuName;
    if(thirdMenuName == null || thirdMenuName == undefined || thirdMenuName == ''){//如果没有三级菜单，则只需要加载当前二级菜单的iframe
      $('#contentfrm').attr('src', currentObj.href);
    }else{
      //如果有三级菜单则渲染三级菜单
      renderThirdMenu(subMenuArray, currentObj);
    }
  }
  
  function thirdMenuClicked(thirdMenuArray, currentObj){
    $.each(thirdMenuArray, function(i, otherObj) {
      //console.log(otherObj.menuId);
      if(currentObj.menuId != otherObj.menuId){
        $('#' + otherObj.menuId).removeClass("slide-menu-l-active");
      }
    });
    //点击事件发生时改变iframe的源连接
    $('#contentfrm').attr('src', currentObj.href);
  }
  
});
