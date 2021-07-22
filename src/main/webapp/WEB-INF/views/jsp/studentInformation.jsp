<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/29
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%--学生修改信息界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
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
<%--        初始获取该学生信息--%>
        $(function (){
            getAllClass();
            getAllCollege();
            getInformation();
        })
        //获取所有班级，遍历班级下拉列表
        function getAllClass(){
            $.ajax({
                url:"${path}/information/getAllClass",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item)
                        opt.attr("value",item);
                        $('#student_class').append(opt);
                    })
                }
            })
        }
        //获取所有学院，遍历学院下拉列表
        function getAllCollege(){
            $.ajax({
                url:"${path}/information/getAllCollege",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item);
                        opt.attr("value",item);
                        $("#student_college").append(opt);
                    })
                }
            })
        }
        //获取该学生所有信息的方法
        function getInformation(){
            var stuId=${studentId};
            $.ajax({
                url:"${path}/information/getById/"+stuId,
                type:"get",
                success:function (res){
                    $("#id").val(res.id);
                    $("#student_username").val(res.studentUsername);
                    $("#student_name").val(res.studentName);
                    $("#student_age").val(res.studentAge);
                    $("#information input[name=studentGender]").val([res.studentGender]);
                    $("#student_nation").val(res.studentNation);
                    $("#student_college").val(res.studentCollege);
                    $(".form_information select[name=studentCollege]").val([res.studentCollege]);
                    $(".form_information select[name=studentClass]").val([res.studentClass]);
                    $("#student_dormNum").val(res.studentDormNum);
                }
            })
        }

        //保存按钮验证信息
        $(document).on("click",".btn_save",function (){
            var list = document.getElementsByTagName("input");
            for (var i = 0; i < list.length; i++) {
                if (list[i].type == "text") {
                    if (list[i].value.length==0) {
                        alert("带*项不允许为空！");
                        getInformation();
                        return false;
                    }
                }
            }
                //修改成功
                $.ajax({
                    url:"${path}/information/updateById",
                    data:$(".form_information").serialize(),
                    type: "put",
                    success:function (res){
                        getInformation();
                        alert("修改成功！");
                    }
                })


        })
    </script>
</head>
<body>
<div id="information">
    <h2 style="margin-top: 30px;margin-bottom:30px ;">修改信息</h2>
    <form class="form-inline form_information">
        <input type="hidden" name="id" id="id" >
        用户名<span style="color:red;">*</span><input type="text" class="form-control ipt" name="studentUsername" id="student_username" style="width: 150px;height: 27px;margin-left: 15px;"><br><br>
        &nbsp;&nbsp;&nbsp;姓名<span style="color:red;">*</span><input type="text" class="form-control ipt" name="studentName" id="student_name" style="width: 100px;height: 27px;margin-left: 15px;"><br><br>
        &nbsp;&nbsp;&nbsp;年龄<span style="color:red;">*</span><input type="text" class="form-control ipt" name="studentAge" id="student_age" style="width: 100px;height: 27px;margin-left: 15px;"><br><br>
        &nbsp;&nbsp;&nbsp;民族<span style="color:red;">*</span><input type="text" class="form-control ipt" name="studentNation" id="student_nation" style="width: 100px;height: 27px;margin-left: 15px;"><br><br>
        性别<input type="radio" name="studentGender" value="1" style="margin-left: 23px;"> 男
        <input type="radio" name="studentGender" value="2" style="margin-left: 15px;"> 女<br><br>
        &nbsp;&nbsp;&nbsp;分院<select class="form-control ipt" name="studentCollege" id="student_college" style="width: 150px;height: 30px;margin-left: 15px;"></select><br><br>
        &nbsp;&nbsp;&nbsp;班级<select class="form-control ipt" name="studentClass" id="student_class" style="width: 150px;height: 30px;margin-left: 15px;"></select><br><br>
        寝室号<span style="color:red;">*</span><input type="text" class="form-control ipt" name="studentDormNum" id="student_dormNum" style="width: 150px;height: 27px;margin-left: 15px;"><br><br>
        <span style="color: red;font-size: 10px;">修改用户名，需重新登录后才生效</span><br>
        <button type="button" class="btn btn-primary btn_save" style="width: 210px;margin-top: 20px;">保存</button>
    </form>
</div>
</body>
</html>
