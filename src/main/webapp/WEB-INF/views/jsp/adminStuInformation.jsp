<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/30
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%--管理员学生信息界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .select{
            text-align: center;
            margin-top: 20px;
            margin-left: 300px;
        }
        .information_table{
            float: none;
            display: block;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script>
<%--        初始化先获取所有班级--%>
        $(function (){
            $.ajax({
                url:"${path}/information/getAllClass",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item);
                            opt.attr("value",item);
                        var opt2=$("<option></option>").append(item);
                        opt2.attr("value",item);
                        if(index==0){
                            opt.attr("selected","true"); //默认选择该班
                            getAllStuByClassId(item); //默认显示该班学生信息
                        }
                        $('#select_class').append(opt);
                        $("#studentClass").append(opt2); //修改模态框中的所有班级
                    })
                }
            })
        })
        //根据下拉框班级名，显示该班所有学生信息的方法
        function getAllStuByClassId(class_Name){
            $("#tbody_content").empty();
            $.ajax({
                url:"${path}/information/getAllStuByClassId",
                data:{className:class_Name},
                type: "get",
                success:function (res){
                   $.each(res,function (index,item){
                       var studentUsername=$("<td></td>").append(item.studentUsername);
                       var studentPassword=$("<td></td>").append(item.studentPassword);
                       var studentName=$("<td></td>").append(item.studentName);
                       var studentGender=$("<td></td>").append(item.studentGender==1?"男":"女");
                       var studentNation=$("<td></td>").append(item.studentNation);
                       var studentAge=$("<td></td>").append(item.studentAge);
                       var studentCollege=$("<td></td>").append(item.studentCollege);
                       var studentClass=$("<td></td>").append(item.studentClass);
                       var studentDormNum=$("<td></td>").append(item.studentDormNum);
                       var editor=$("<button></button>").addClass("btn btn-primary btn-sm btn-update").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
                       editor.attr("editor_id",item.id);
                       var btn=$("<td></td>").append(editor);
                       $("<tr></tr>").append(studentUsername).append(studentPassword).append(studentName).append(studentGender)
                           .append(studentNation).append(studentAge).append(studentCollege).append(studentClass).append(studentDormNum).append(btn).appendTo("#tbody_content");
                   })
                }
            })
        }
        //修改模态框中的所有分院
        function getAllCollege(){
            $("#studentCollege").empty();
            $.ajax({
                url:"${path}/information/getAllCollege",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item);
                        opt.attr("value",item);
                        $("#studentCollege").append(opt);
                        $("#updateModal").modal('show');
                    })
                }
            })
        }

        //添加模态框中的下拉列表分院信息
        function getAllCollege_insert(){
            $("#insert_allCollege").empty();
            $.ajax({
                url:"${path}/information/getAllCollege",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item);
                        opt.attr("value",item);
                        $("#insert_allCollege").append(opt);
                    })
                }
            })
        }
//添加模态框中的下拉列表班级信息
        function getAllClass_insert(){
            $("#insert_allClass").empty();
            $.ajax({
                url:"${path}/information/getAllClass",
                type:"get",
                success:function (res){
                    $.each(res,function (index,item){
                        var opt=$("<option></option>").append(item);
                        opt.attr("value",item);
                        $('#insert_allClass').append(opt);
                    })
                }
            })
        }
        //根据下拉框班级，重新根据班级名，显示该班所有学生信息
        $(document).on("change","#select_class",function (){
            getAllStuByClassId($("#select_class").val());
        })
//点击弹出修改学生模态框
        $(document).on("click",".btn-update",function (){
            getAllCollege();
            var stu_id=$(this).attr("editor_id");
            $.ajax({
                url:"${path}/information/getStuById/"+stu_id,
                type:"get",
                success:function (res){
                    $("#iptId").val(res.id);
                    $("#studentUsername").val(res.studentUsername);
                    $("#studentPassword").val(res.studentPassword);
                    $("#studentName").val(res.studentName);
                    $(".update_form input[name=studentGender]").val([res.studentGender]);
                    $("#studentNation").val(res.studentNation);
                    $("#studentAge").val(res.studentAge);
                    $("#studentName").val(res.studentName);
                    $(".update_form select[name=studentCollege]").val([res.studentCollege]);
                    $(".update_form select[name=studentClass]").val([res.studentClass]);
                    $("#studentDormNum").val(res.studentDormNum);
                    $("#updateModal").modal('show');
                }
            })
        })
//保存修改学生信息模
        $(document).on("click","#update_save",function (){
            var judge=true;
            $(".update_form :input").each(function(){
                if($(this).val().length==0){
                    alert("带*项不能为空！");
                    judge=false;
                    return false;
                }
            })
            if(judge){
                $.ajax({
                    url:"${path}/information/updateStuById",
                    data:$(".update_form").serialize(),
                    type:"put",
                    success:function (res){
                        $("#updateModal").modal('hide');
                        $("#select_class").val($("#studentClass").val());
                        getAllStuByClassId($("#select_class").val());
                        alert("修改成功！");
                    }
                })
            }

        })
        //点击显示添加学生模态框
        $(document).on("click",".btn_insert",function (){
            getAllCollege_insert();
            getAllClass_insert();
            $(".insert_form input[name=studentGender]").val([1]);
            $(".insert_form input[type=text]").val("");
            $("#insertModal").modal('show');
        })
        //保存添加学生信息
        $(document).on("click","#insert_save",function (){
            var judge=true;
            $(".insert_form :input").each(function(){
                if($(this).val().length==0){
                    alert("带*项不能为空！");
                    judge=false;
                    return false;
                }
            })
            if(judge){
                $.ajax({
                    url:"${path}/information/insertStu",
                    data:$(".insert_form").serialize(),
                    type:"post",
                    success:function (res){
                        $("#insertModal").modal('hide');
                        $("#select_class").val($("#insert_allClass").val());
                        getAllStuByClassId($("#select_class").val());
                        alert("保存成功！");
                    }
                })
            }

        })
    </script>
</head>
<body>
<%--修改模态框--%>
<div class="modal fade"  tabindex="-1" id="updateModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myupdateModalLabel">修改学生信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_form">
                    <input type="hidden" name="id" id="iptId">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span style="color: red"> *</span>用户名	</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentUsername" id="studentUsername">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" ><span style="color: red"> *</span>密码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentPassword" id="studentPassword" >
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>姓名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentName" id="studentName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="studentGender" value="1" checked="checked">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="studentGender" value="2">女
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>民族</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="studentNation" id="studentNation">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>年龄</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="studentAge" id="studentAge">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">分院</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="studentCollege" id="studentCollege">

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="studentClass" id="studentClass">

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>寝室号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="studentDormNum" id="studentDormNum">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_save">保存</button>
            </div>
        </div>
    </div>
</div>

<%--新增模态框--%>
<div class="modal fade"  tabindex="-1" id="insertModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增学生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal insert_form">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span style="color: red"> *</span>用户名	</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentUsername">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" ><span style="color: red"> *</span>密码</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentPassword">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>姓名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="studentName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="studentGender" value="1">男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="studentGender" value="2">女
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>民族</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="studentNation">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>年龄</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="studentAge">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">分院</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="studentCollege" id="insert_allCollege">

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="studentClass" id="insert_allClass">

                            </select>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>寝室号</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="studentDormNum">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="insert_save">保存</button>
            </div>
        </div>
    </div>
</div>

<h2 style="text-align: center;margin-top: 50px;color: #A8A8A8;">学生信息</h2>

<div class="select">
    班级：<select class="form-control" name="select_class" id="select_class" style="width: 100px;height: 35px;display: initial;">

    </select>
</div>

<div style="text-align: center;margin-top: 10px;float: right;margin-right: 245px;">
    <button type="button" class="btn btn-success btn_insert" >添加学生</button>
</div>
<div class="col-md-8 information_table">
    <table class="table table-hover">
        <thead style='text-align: center;color: #A8A8A8;'>
        <tr>
            <td>用户名</td>
            <td>密码</td>
            <td>姓名</td>
            <td>性别</td>
            <td>民族</td>
            <td>年龄</td>
            <td>分院</td>
            <td>班级</td>
            <td>寝室号</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody id="tbody_content" style="text-align: center">

        </tbody>
    </table>
</div>
</body>
</html>
