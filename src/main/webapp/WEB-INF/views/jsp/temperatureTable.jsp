<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/27
  Time: 18:47
  To change this template use File | Settings | File Templates.
--%>
<%--学生今日体温--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <title>Title</title>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <style>
        body{
            width: 100%;
            height: 100%;
        }
        #now_time{
            margin-top: 20px;
        }
        .ipt_morning,.ipt_evening{
            width: 100px;
            height: 30px;
            margin-left: 10px;
            margin-right: 10px;
            display: inline;
        }
        #ipt_temperature{
            font-size: 18px;
            color: #A8A8A8;
            text-align: center;
            width: 30%;
            margin: 0 auto;
        }
        .temperature_table{
            float: none;
            display: block;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
    <script>
<%--        获取当前时间--%>
        var mytime;
        var moringbegin=21600;
        var moringend=28800;
        var eveningbegin=64800;
        var eveningend=72000;
        $(function(){
            var myDate = new Date();
            var myYear = myDate.getFullYear();
            var myMonth = myDate.getMonth() + 1;
            var myToday = myDate.getDate();
            mytime=myYear+'-'+myMonth+'-'+myToday;
            $("#now_time").text(mytime);

             $.ajax({
                 url:"${path}/temperature/getAllById?stu_id="+${studentId},
                 type:"get",
                 success:function (res){
                     getAll(res);
                 }
             })
            //获取该学生今天的体温填写记录
            $.ajax({
                url:"${path}/temperature/gettodaytem",
                data:{stu_id:${studentId},date:$("#now_time").html()},
                type:"get",
                success:function (res){
                    if(res){
                        if(res.morning_temperature!=0){
                            $(".ipt_morning").val(res.morning_temperature);
                            $(".ipt_morning").attr("readonly","readonly");
                            $(".btn_morning").attr("disabled","disabled");
                        }else{
                            $(".ipt_morning").removeAttr("readonly");
                            $(".btn_morning").removeAttr("disabled");
                        }
                        if(res.evening_temperature!=0){
                            $(".ipt_evening").val(res.evening_temperature);
                            $(".ipt_evening").attr("readonly","readonly");
                            $(".btn_evening").attr("disabled","disabled");
                        }else{
                            $(".ipt_evening").removeAttr("readonly");
                            $(".btn_evening").removeAttr("disabled");
                        }
                    }else {
                        $(".ipt_morning").val("");
                        $(".ipt_evening").val("");
                        $(".ipt_morning").removeAttr("readonly");
                        $(".btn_morning").removeAttr("disabled");
                        $(".ipt_evening").removeAttr("readonly");
                        $(".btn_evening").removeAttr("disabled");
                    }
                }
            })
        })

        //获取该学生之前的体温记录
        function getAll(res){
            $.each(res,function (index,item){
                var ipt_date=$("<td></td>").append(item.ipt_date);
                var morning_temperature=$("<td></td>").append(item.morning_temperature).append("℃");
                var evening_temperature=$("<td></td>").append(item.evening_temperature).append("℃");;
                $("<tr></tr>").append(ipt_date).append(morning_temperature).append(evening_temperature).appendTo("#tbody_content");
            })

            //体温(晨)保存按钮
            $(".btn_morning").click(function(){
                if($(".ipt_morning").val()==""){
                    alert("请输入体温(晨)!");
                }else{
                    if(moringbegin<=nowtime&&nowtime<=moringend){
                        var myDate = new Date();
                        var hour= myDate.getHours();
                        var minute=myDate.getMinutes();
                        var second=myDate.getSeconds();
                        var nowtime=hour*60*60+minute*60+second;
                        $.ajax({
                            url:"${path}/temperature/insertmorningtem",
                            type: "POST",
                            data:{stu_id:${studentId},morningtem:$(".ipt_morning").val(),date:$("#now_time").html()},
                            success:function (res){
                                if(res=="success"){
                                    alert("保存成功");
                                    $(".ipt_morning").attr("readonly","readonly");
                                    $(".btn_morning").attr("disabled","disabled");
                                }
                            }
                        })
                    }else{
                        alert("请在规定时间录入！");
                    }
                }

            });
//体温(晚)保存按钮
            $(".btn_evening").click(function(){
                if($(".ipt_evening").val()==""){
                    alert("请输入体温(晚)!");
                }else {
                    var myDate = new Date();
                    var hour= myDate.getHours();
                    var minute=myDate.getMinutes();
                    var second=myDate.getSeconds();
                    var nowtime=hour*60*60+minute*60+second;
                    if(eveningbegin<=nowtime&&nowtime<=eveningend){
                        $.ajax({
                            url:"${path}/temperature/inserteveningtem",
                            type: "PUT",
                            data:{stu_id:${studentId},eveningtem:$(".ipt_evening").val(),date:$("#now_time").html()},
                            success:function (res){
                                if(res=="success"){
                                    alert("保存成功");
                                    $(".ipt_evening").attr("readonly","readonly");
                                    $(".btn_evening").attr("disabled","disabled");
                                }
                            }
                        })
                    }else{
                        alert("请在规定时间录入！");
                    }
                }
            });
        }
    </script>
</head>
<body>
    <div id="ipt_temperature">
        <div style="color:#2e6da4; margin-top: 40px;">如体温填写有误，请找管理员更改！</div>
        <div id="now_time">
        </div>
        <div style="margin-top: 20px;margin-bottom: 8px;">6:00-8:00</div>
        <div class="ipt">
            体温(晨)<input type="text" class="form-control ipt_morning"/>℃
            <button type="button" class="btn btn-primary btn_morning">保存</button>
        </div>
        <div style="margin-top: 20px;margin-bottom: 8px;">18:00-20:00</div>
        <div class="ipt">
            体温(晚)<input type="text" class="form-control ipt_evening"/>℃
            <button type="button" class="btn btn-primary btn_evening">保存</button>
        </div>
    </div>
    <div class="col-md-4 temperature_table">
        <table class="table table-hover">
            <thead>
            <tr>
                <td>日期</td>
                <td>晨</td>
                <td>晚</td>
            </tr>
            </thead>
            <tbody id="tbody_content">

            </tbody>
        </table>
    </div>
</body>
</html>
