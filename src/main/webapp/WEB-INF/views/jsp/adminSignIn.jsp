<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/28
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%--管理员学生打卡界面--%>
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
        //获取当前时间
        var mytime;
        var mytimeChiese;
        function getAll(){
            var myDate = new Date();
            var myYear = myDate.getFullYear();
            var myMonth = myDate.getMonth() + 1;
            var myToday = myDate.getDate();
            mytimeChiese=myYear+'年'+myMonth+'月'+myToday+'日';
            if(myMonth<10){
                myMonth='0'+myMonth;
            }
            if(myToday<10){
                myToday='0'+myToday;
            }
            mytime=myYear+'-'+myMonth+'-'+myToday;

            $("#now_time").text(mytimeChiese);
            //获取所有学生打卡情况
            $.ajax({
                url:"${path}/signIn/getAll",
                data:{date:mytime},
                type:"get",
                success:function (res){
                    message(res);
                }
            })
        }


        var exitAbnormal="";
        //获取所有打卡情况的方法
        function message(res){
            $("#tbody_content").empty();
            $.each(res,function (index,item){
                var stu_name=$("<td></td>").append(item.studentName);
                var stu_class=$("<td></td>").append(item.studentClass).css("color","#23238E");
                var signState;
                if(mytime!=item.stuDate){
                    signState=$("<td></td>").html("未登记").css("color","red");
                }else{
                    var check=checkAbnormal(item.stuId);
                    if(check=='true'){
                        signState=$("<td></td>").html("异常").css("color","red");
                    }else{
                        signState=$("<td></td>").html("正常");
                    }
                }
                $("<tr></tr>").append(stu_name).append(stu_class).append(signState).appendTo("#tbody_content");
            })
        }
        //根据打卡情况，检查是否异常方法
        function checkAbnormal(stuId){
            $.ajax({
                url:"${path}/signIn/getAbnormal/"+stuId,
                type:"get",
                async: false,
                success:function (res){
                    console.log();
                    if(res.stuOne!=2||res.stuTwo!=2||res.stuThree!=2||res.stuFour!=2||res.stuFive!=2||res.stuSix!=2||res.stuSeven!=2||res.stuEight!=2||res.stuNine!=2||res.stuTen!=1||res.stuEleven!=2){
                        exitAbnormal='true';

                    }else{
                        exitAbnormal='false';

                    }
                }
            })
            return exitAbnormal;
        }

    </script>
</head>
<body>


<h2 style="color: #A8A8A8;text-align: center;margin-top: 20px;margin-top: 40px;">今日打卡</h2>

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
            <td>登记状态</td>
        </tr>
        </thead>
        <tbody id="tbody_content" style='text-align: center;'>

        </tbody>
    </table>
</div>
</body>
</html>
