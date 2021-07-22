<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/29
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>

<%--管理员和学生的修改密码界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <style>
        #information{
            margin-top: 20px;
            text-align: center;
            color: #A8A8A8;
        }
    </style>
    <script>
        var thisPassword;
        var userType=${usertype};
        //初始化先获取当前用户的名字，再根据名字查原密码
        $(function (){
            if(userType==1){
               var username='${username}';
                $.ajax({
                    url:"${path}/updatePasword/getStuPwd/"+username,
                    type:"get",
                    success:function (res){
                        thisPassword=res;
                    }
                })
            } else {
                var adminName='${adminname}';
                $.ajax({
                    url:"${path}/updatePasword/getAdmPwd/"+adminName,
                    type:"get",
                    success:function (res){
                        thisPassword=res;
                    }
                })
            }
        })
        //判断原密码和新密码是否符合，符合则修改成功
        $(document).on("click",".btn_save",function (){
                if($("#usedPsw").val()!=thisPassword){
                    $("#usedVerify").text("请输入正确原密码");
                    return;
                }
                if ($("#nowPsw1").val()==""){
                    $("#usedVerify").text("");
                    $("#nowVerify1").text("请输入新密码");
                    return;
                }
                if($("#nowPsw1").val()!=$("#nowPsw2").val()){
                    $("#usedVerify").text("");
                    $("#nowVerify1").text("");
                    $("#nowVerify2").text("两次密码不一致");
                }else {
                    $("#usedVerify").text("");
                    $("#nowVerify1").text("");
                    $("#nowVerify2").text("");
                    if(userType==1){
                        thisPassword=$("#nowPsw2").val();
                        $.ajax({
                            url:"${path}/updatePasword/updateStuPwd",
                            data:{userName:'${username}',nowpasswd:$("#nowPsw2").val()},
                            type:"put",
                            success:function (res){
                                alert("修改成功！");
                            }
                        })
                    }else{
                        thisPassword=$("#nowPsw2").val();
                        $.ajax({
                            url:"${path}/updatePasword/updateAdmPwd",
                            data:{adminName:'${adminname}',nowpasswd:$("#nowPsw2").val()},
                            type:"put",
                            success:function (res){
                                alert("修改成功！");
                            }
                        })
                    }
                }

        })
    </script>
</head>
<body>
<div id="information">
    <h2 style="margin-top: 30px;margin-bottom:30px ;">修改密码</h2>
    <form class="form-inline">
        <span>原密码：</span><input type="password" class="form-control ipt" id="usedPsw" style="width: 150px;height: 27px;margin-left: 15px;"><br>
            <span style="margin-left:70px;color: red" id="usedVerify"></span>
        <br>
        <span>新密码：</span><input type="password" class="form-control ipt" id="nowPsw1" style="width: 150px;height: 27px;margin-left: 15px;"><br>
            <span style="margin-left:70px;color: red" id="nowVerify1"></span>
        <br>
        <span style="margin-right: 15px;">确认新密码：</span><input type="password" id="nowPsw2" class="form-control ipt" name="student_age" style="width: 150px;height: 27px;margin-right: 28px;"><br>
            <span style="margin-left:70px;color: red" id="nowVerify2"></span>
        <br>
        <button type="button" class="btn btn-primary btn_save" style="width: 235px;margin-top: 10px;">保存</button>
    </form>
</div>
</body>
</html>
