<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<%--管理员主界面--%>
<html>
<head>
    <title>管理员界面</title>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${path}/mystatic/css/stuAndAdminMainDesktop.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(function(){
            $('.menux p').click(function(){
                $(this).next('ul').slideToggle(200);
            })
        })
        $(function(){
            $('.menux ul li a').click(function(){
                $('iframe').attr("src",$(this).attr("url"));
            })
            $('.user ul li a').click(function(){
                $('iframe').attr("src",$(this).attr("url"));
            })
        })
    </script>
</head>
<body>
<div class="header">
    <div>
        <h2 style="float: left;margin-left: 210px;color: white">学生健康打卡平台</h2>
    </div>
    <div class="user">
        <span class="glyphicon glyphicon-menu-down usericon"></span>
        <span class="glyphicon glyphicon-user"></span>
        <c:choose>
            <c:when test="${adminname!=null}">${adminname}</c:when>
            <c:otherwise>未登录</c:otherwise>
        </c:choose>
        <ul>
            <li><a url="${path}/updatePassword">修改密码</a></li>
            <li><a href="${path}/signOut/adm">退出登录</a></li>
        </ul>
    </div>
</div>
<div class="left">
    <div class="title">
        <span class="glyphicon glyphicon-home titleicon"></span>
        管理员系统
    </div>
    <div class="menux">
        <p>管理公告<span class="glyphicon glyphicon-chevron-right righticon"></span>
        </p>
        <ul>
            <li><a url="${path}/preventionControlKnowledge"><span class="glyphicon glyphicon-triangle-right itemicon"></span>防疫知识</a></li>
            <li><a url="${path}/adminRiskArea"><span class="glyphicon glyphicon-triangle-right itemicon"></span>风险地区</a></li>
        </ul>
        <p>查看打卡<span class="glyphicon glyphicon-chevron-right righticon"></span>
        </p>
        <ul>
            <li><a url="${path}/adminSignIn"><span class="glyphicon glyphicon-triangle-right itemicon"></span>今日打卡</a></li>
            <li><a url="${path}/adminTemDesktop"><span class="glyphicon glyphicon-triangle-right itemicon"></span>今日体温</a></li>
        </ul>
        <p>账号管理 <span class="glyphicon glyphicon-chevron-right righticon"></span>
        </p>
        <ul>
            <li><a url="${path}/adminStuInformation"><span class="glyphicon glyphicon-triangle-right itemicon"></span>学生信息</a></li>
            <li><a url="${path}/updatePassword"><span class="glyphicon glyphicon-triangle-right itemicon"></span>修改密码</a></li>
            <li><a href="${path}/signOut/adm"><span class="glyphicon glyphicon-triangle-right itemicon"></span>退出登录</a></li>
        </ul>
    </div>
</div>
<div class="main">
    <iframe width="100%" height="98%" frameborder="0px" src="${path}/preventionControlKnowledge"></iframe>
</div>
</body>
</html>
