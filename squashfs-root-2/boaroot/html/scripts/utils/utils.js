define(['jquery'],function($){
  //1,define intenal variable area//变量定义区
  var utils = {};
  var moduleName = "utils";
  var version = "1.0.0";
  
  var curUser = '<%tcWebApi_get("WebCurSet_Entry","CurrentAccess","s")%>';
  if(0 == curUser)
    console.log("curUser(" + curUser + "): superadmin");
  else
    console.log("curUser(" + curUser + "): admin");

  var meshEnable = '<%tcWebApi_get("Mesh_dat","MapEnable","s")%>';
  
  //2,define intenal funciton area//函数定义区
  /*
    dscp: 渲染目录(循环)
    renderData: 	被渲染模板所需的数据
    tmpContent: 	模板内容
    wrappers:		渲染函数渲染内容所在的元素对象
  */
  var renderList = function(tmpContent, renderData, wrappers){
    var rederHtml = '';
    $.each(renderData, function(i, object) {

      if(object.hasOwnProperty("whoInvisible")){
        var whoInvisible = object.whoInvisible;
        if((0 == whoInvisible) && (0 == curUser)){//超级用户不可见
          return true;//same as continue
        }else if((1 == whoInvisible) && (1 == curUser)){//普通用户不可见
          return true;
        }else if(2 == whoInvisible){//whoInvisible为2时，超级用户及普通用户都不可见
          return true;
        }
      }

      //特殊处理，mesh关闭时，Advanced、Action、Status、Topology四个三级菜单隐藏
      //方法：通过main.js中传过来的renderData[0].meshEnable，实施获取当前mesh状态，若mesh关闭，则在相应的菜单css中添加"element-hide"类(main.css中定义)
      if(renderData[0].hasOwnProperty("meshEnable")){
        if( (renderData[0].meshEnable == 0) && ((object.menuId == "thirdMenuMeshAdvanced") || (object.menuId == "thirdMenuMeshAction") ||
          (object.menuId == "thirdMenuMeshStatus") || (object.menuId == "thirdMenuMeshInfo"))){
          object.show = "element-hide";
        }else{
          object.show = "";
        }
      }

      object.index= i;
      rederHtml += tmpContent.tmp(object);
    });
    if (wrappers) {
      while(wrappers.hasChildNodes()){
        wrappers.removeChild(wrappers.firstChild);
      }
      wrappers.appendHTML(rederHtml);
    }
  }
  
  var simpleAlert = function (opts) {
    //设置默认参数
    var opt = {
      "closeAll": false,
      "content": "",
      "buttons": {},
      "autoClose": 0//seconds
    }
    //合并参数
    var option = $.extend(opt, opts);
    //事件
    var dialog = {}
    var $simpleAlert = $('<div class="simpleAlert">');
    var $shelter = $('<div class="simpleAlertShelter">');
    var $simpleAlertBody = $('<div class="simpleAlertBody">');
    var $simpleAlertBodyClose = $('<img class="simpleAlertBodyClose" src="image/alertClose.png" height="24" width="24"/>');
    var $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent">' + option.content + '</p>');
    dialog.init = function () {
      $simpleAlertBody.append($simpleAlertBodyClose).append($simpleAlertBodyContent);
      var num = 0;
      var only = false;
      var onlyArr = [];
      for (var i = 0; i < 2; i++) {
        for (var key in option.buttons) {
          switch (i) {
            case 0:
              onlyArr.push(key);
              break;
            case 1:
              if (onlyArr.length <= 1) {
                only = true;
              } else {
                only = false;
              }
              num++;
              var $btn = $('<button class="simpleAlertBtn simpleAlertBtn' + num + '">' + key + '</button>')
              $btn.bind("click", option.buttons[key]);
              if (only) {
                $btn.addClass("onlyOne")
              }
              $simpleAlertBody.append($btn);
              break;
          }
        }
      }
      $simpleAlert.append($shelter).append($simpleAlertBody);
      top.$("body").append($simpleAlert);
      $simpleAlertBody.show().animate({"marginTop":"-128px","opacity":"1"},300);
      //添加倒计时自动关闭
      if(option.autoClose > 0){
        var $simpleAlertBodyWait = $('<p id="simpleAlertBodyWait" class="simpleAlertBodyWait">Please wait: '+ option.autoClose +'S</p>');
        $simpleAlertBody.append($simpleAlertBodyWait);
        setTimeout(function () {dialog.run(option.autoClose);}, 1000);
        if(option.autoClose >= 60)
          setTimeout(function(){top.location.href="/cgi-bin/logout.cgi";}, option.autoClose*1000);
        else
          setTimeout(function(){top.location.href="/";}, option.autoClose*1000);
        
      }
    }
    dialog.run = function(sec){
      if(sec < 1)
        return true;
      else{
        sec = sec - 1;
        top.$('#simpleAlertBodyWait').text('Please wait: '+ sec +'S');
        setTimeout(function () {dialog.run(sec);}, 1000)
      }
    }
    //右上角关闭按键事件
    $simpleAlertBodyClose.bind("click", function () {
      option.closeAll=false;
      dialog.close();
    })
    dialog.close = function () {
      if(option.closeAll){
        top.$(".simpleAlert").remove()
      }else {
        $simpleAlertBody.animate({"marginTop": "-188px", "opacity": "0"}, 200, function () {
          top.$(".simpleAlert").last().remove()
        });
      }
    }
    dialog.init();
    return dialog;
  }
  
  {
    //无需对外暴露
    String.prototype.tmp = function(obj) {
      var format = {  
        name: function(x) {  
          return x ; 
        }  
      };  
      return this.replace(/{(\w+)}/g, function(m1, m2) {  
        if (!m2)  
          return "";  
        return (format && format[m2]) ? format[m2](obj[m2]) : obj[m2];  
      });
    };
    HTMLElement.prototype.appendHTML = function(html) {
      var divTemp = document.createElement("div"),
      nodes = null,
      // 文档片段，一次性append，提高性能  
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
  }
  
  //3,should be return/output a object[exports/API] if other module need
  //如有需要暴露(返回)本模块API(相关定义的变量和函数)给外部其它模块使用
  
  utils.moduleName = moduleName;
  utils.version = version;
  utils.meshEnable = meshEnable;
  utils.renderList = renderList;
  utils.simpleAlert = simpleAlert;

  return utils;
  
  /*
  //this is same to four line code upper//跟上面四行一样
  return {
    "moduleName":"utils"
    ,"version":"1.0.0"
    ,render:render
    ,renderList:renderList
  };
  */
  
});