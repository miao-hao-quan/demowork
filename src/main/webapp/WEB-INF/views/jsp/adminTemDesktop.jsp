<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/28
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>

<%--管理员学生体温登记界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>

<html>
<head>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <style>
        body{
            width: 100%;
            height: 100%;
        }
        #now_time{
            margin-top: 30px;
        }
        #ipt_temperature{
            font-size: 18px;
            color: #A8A8A8;
            text-align: center;
            width: 30%;
            margin: 0 auto;
        }
        .select{
            text-align: center;
            margin-top: 20px;
            margin-left: 300px;
        }
        .temperature_table{
            float: none;
            display: block;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script>
        $(function (){
            getAll();
        })
        //获取所有学生体温填写记录
        function getAll(){
            var myDate = new Date();
            var myYear = myDate.getFullYear();
            var myMonth = myDate.getMonth() + 1;
            var myToday = myDate.getDate();
            mytime=myYear+'-'+myMonth+'-'+myToday;
            $("#now_time").text(mytime);
            $.ajax({
                url:"${path}/temperature/getTodayAllTem",
                data:{date:$("#now_time").html()},
                type:"get",
                success:function (res){
                    message(res);
                }
            })
        }
        //获取所有学生体温记录的方法
        function message(res){
            $("#tbody_content").empty();
            $.each(res,function (index,item){
                var stu_name=$("<td></td>").append(item.student_name);
                var stu_class=$("<td></td>").append(item.student_class).css("color","#23238E");
                var morningTem;
                var eveningTem;
                if(item.morning_temperature==0){
                    morningTem=$("<td></td>").html("未登记").css("color","red");
                }else{
                    if(item.morning_temperature>37.3){
                        morningTem=$("<td></td>").append(item.morning_temperature).append("℃").css("color","red");
                    }else{
                        morningTem=$("<td></td>").append(item.morning_temperature).append("℃");
                    }

                }
                //    根据体温记录，检查是否有异常
                if(item.evening_temperature==0){
                    eveningTem=$("<td></td>").html("未登记").css("color","red");
                }else{
                    if(item.evening_temperature>37.3){
                        eveningTem=$("<td></td>").append(item.evening_temperature).append("℃").css("color","red");
                    }else{
                        eveningTem=$("<td></td>").append(item.evening_temperature).append("℃");
                    }
                }
                var editor=$("<button></button>").addClass("btn btn-primary btn-sm btn-update").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
                editor.attr("stu_id",item.stu_id);
                var btn=$("<td></td>").append(editor);
                $("<tr></tr>").append(stu_name).append(stu_class).append(morningTem).append(eveningTem).append(btn).appendTo("#tbody_content");
            })
        }

        //点击修改，弹出修改模态框
        $(document).on("click",".btn-update",function (){
            var stu_id=$(this).attr("stu_id");
            var name= $(this).parent().parent().find("td:first").text();
            var stuClass=$(this).parent().parent().find("td").eq(1).text();
            $.ajax({
                url:"${path}/temperature/getTodayTemById",
                data:{stuid:stu_id,date:$("#now_time").html()},
                type:"get",
                success:function (res){
                    $("#stuName").val(name);
                    $("#stuClass").val(stuClass);
                    if(res){
                        if(res.morning_temperature!=0){
                            $("#morningTem").val(res.morning_temperature);
                        }else{
                            $("#morningTem").val("");
                        }
                        if(res.evening_temperature!=0){
                            $("#eveningTem").val(res.evening_temperature);
                        }else{
                            $("#eveningTem").val("");
                        }
                    }else{
                        $("#morningTem").val("");
                        $("#eveningTem").val("");
                    }
                    $("#update_save").attr("stu_id",stu_id);
                    $("#updateModal").modal('show');
                }
            })
        })
        //保存修改体温按钮
        $(document).on("click","#update_save",function (){
            $.ajax({
                url:"${path}/temperature/updateTodayById",
                data:{stuId:$(this).attr("stu_id"),date:$("#now_time").html(),morningTem:$("#morningTem").val(),eveningTem: $("#eveningTem").val()},
                type:"put",
                success:function (res){
                    getAll();
                    $("#updateModal").modal('hide');
                }
            })
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
                <h4 class="modal-title" id="myupdateModalLabel">修改体温</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_form">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control " name="morningTem" id="stuName"  readonly="readonly">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">班级</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control " name="morningTem" id="stuClass"  readonly="readonly">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">体温(晨)</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control " name="morningTem" id="morningTem">
                            <span class="help-block"></span>
                        </div>
                        <span>℃</span>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">体温(晚)</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="eveningTem" id="eveningTem">
                            <span class="help-block"></span>
                        </div>
                        <span>℃</span>
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

<h2 style="color: #A8A8A8;text-align: center;margin-top: 20px;margin-top: 40px;">今日体温</h2>

</div>
<div id="ipt_temperature">
    <div id="now_time">
    </div>
</div>
    <div class="col-md-4 temperature_table">
        <table class="table table-hover">
            <thead style='text-align: center;'>
            <tr>
                <td>姓名</td>
                <td>班级</td>
                <td>晨</td>
                <td>晚</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody id="tbody_content" style='text-align: center;'>

            </tbody>
        </table>
</div>
</body>
</html>
