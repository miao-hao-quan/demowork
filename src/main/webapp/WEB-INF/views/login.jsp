<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<%--登录界面--%>
<html>
<head>
    <title>登录页面</title>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        body{
            background-image:url("${path}/mystatic/img/backgroudlogin.jpg");
            background-repeat: no-repeat;
            background-position: center center;
        }
        #login{
            background: rgba(0, 0, 0, .4);
            width:23%;
            height:42%;
            text-align: center;
            padding:10px 0;
            position: absolute;
            left:27%;
            top:29%;
            color: white;
        }
        .btn-primary{
            width: 230px;
        }
    </style>
    <script>

    </script>
</head>
<script>

    <%--    禁止页面返回 退出当前页面--%>
    if (window.top !== window) {
        window.top.location.reload();
    }
    history.pushState(null, null, document.URL);
    window.addEventListener('popstate', function () {
        history.pushState(null, null, document.URL);
    });
</script>
<body>
<div id="login">
    <h2>用户登录</h2><br>
    <form class="form-inline " id="login_from" action="${path}/logintrue" method="post" onsubmit="return click_verify()">
        <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
            <input type="text" class="form-control" placeholder="Username" name="username" id="username">
        </div><br>
        <span></span><br>
        <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-pencil"></span></span>
            <input type="password" class="form-control" placeholder="Password" name="password" id="password">
        </div><br>
        <span></span><br>
        <label class="radio-inline">
            <input type="radio" name="usertype" value="1" checked>学生
        </label>
        <label class="radio-inline">
            <input type="radio" name="usertype" value="2">管理员
        </label><br><br>
        <span><c:if test="${msg!=null}">${msg}</c:if></span>
        <input type="submit" class="btn btn-primary" value="登录" id="btn_login">
    </form>
    <script>
        var userexist,passwordtrue;
        function click_verify(){
            var thisusername=$("#username").val();
            if(thisusername==""){
                verify("#username","用户名不能为空");
                return false;
            }if(thisusername != ""){
                verify("#username","");
                $.ajax({
                    url:"${path}/loginExist",
                    data:$("#login_from").serialize(),
                    async:false,
                    type:"get",
                    success:function (res){
                        console.log(res);
                        if(res=="not exist"){
                            userexist=false;
                        }if(res=="password error"){
                            userexist=true;
                            passwordtrue=false;
                        }
                        if(res=="success"){
                            userexist=true,passwordtrue=true;
                        }
                    }
                })
            }
            if (userexist==false){
                verify("#username","用户名不存在");
                verify("#password","");
                return false;
            }
                if(passwordtrue==false){
                    verify("#username","");
                    verify("#password","请输入正确密码");
                    return false;
                }


        }
        //登录失败提示
        function verify(inputId,message){
                $(inputId).parent().next().next().text("");
                $(inputId).parent().next().next().text(message);
        }
    </script>
</div>
</body>
</html>
