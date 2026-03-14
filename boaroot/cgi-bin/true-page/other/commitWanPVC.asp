<% TCWebApi_set("WanInfo_WanPVC","Action","OperatorStyle") %>
<% TCWebApi_commit("WanInfo_WanPVC") %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
  <head>
  </head>
  <body>
    <!--
      todo:
        当前页面设置WanInfo_WanPVC->Action为"Modify"不生效，需要设置成功后在该页面再次提交？
    -->
    <input type="hidden" name="OperatorStyle" value="Modify">
  </body>
</html>