<%@page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
    <title>角色更新</title>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="keywords" content="" />
    <meta http-equiv="description" content="" />
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${ctx}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/css/main.css">
    <script src="${ctx}/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#sub').click(function () {
                $("#theForm").submit();
                $(this).button('complete');
            });
            //定时关闭提示信息
            var errorMessage = '${errorMessage}';
            if (errorMessage != null && errorMessage != '') {
                close();
            }
            //回显
            $("#status option").each(function() {
                if ($(this).val() == '${roleForm.status}') {
                    $(this).attr("selected", "selected");
                }
            });
        })
        function close() {
            setTimeout("closeTip()",2000);
        }
        function closeTip(){
            $('#tip').click();
        }
    </script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">后台管理系统</a>
        </div>
    </div>
</div>
<div class="container">
    <div class="login-box text-center" >
        <div class="login-single-panel-header">
            <h3>角色添加</h3>
        </div>
        <form id="theForm" class="form-signup-heading" action="${ctx}/role/saveUpdate" method="post">
            <input type="hidden" name="id" value="${roleForm.id}"/>
            <c:if test="${errorMessage != null}" >
                <div class="alert alert-danger fade in">
                    <a class="close" data-dismiss="alert" href="#" id="tip">×</a>
                        ${errorMessage}
                </div>
            </c:if>
            <div class="input-group">
                <span class="input-group-addon">角色名称：</span>
                <input type="text" name="roleName" value="${roleForm.roleName}" class="form-control" placeholder="角色名称不能为空">
            </div>
            <br/>
            <div class="input-group">
                <span class="input-group-addon">角色描述：</span>
                <input type="text" name="roleDesc" value="${roleForm.roleDesc}" class="form-control" placeholder="角色描述">
            </div>
            <br/>
            <div class="input-group col-sm-5">
                <span class="input-group-addon ">是否有效：</span>
                <select class="form-control" name="status" id="status">
                    <c:forEach items="${yesNoStatuses}" var="yesNoStatuse">
                        <option value="${yesNoStatuse.value}">${yesNoStatuse.name}</option>
                    </c:forEach>
                </select>
            </div>
            <br/>
            <div class="input-group">
                <span class="input-group-btn">
                    <button class="btn btn-primary btn-lg" id="sub" name="sub" type="button" data-complete-text="正在提交...">更新</button>&nbsp;&nbsp;
                    <button class="btn btn-primary btn-lg" id="return" name="return" type="button" onclick="javascript:history.go(-1);">返回</button>
                </span>
            </div>
        </form>
    </div>
</div>
<div class="text-center bottom">
    Copyright &copy; 2007-2014 qatang.com All rights reserved.
</div>
</body>
</html>