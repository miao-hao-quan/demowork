<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/31
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%--学生每日打卡--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        body{
            width: 100%;
            height: 100%;
        }
        .title{
            margin: 0 auto;
            width: 50%;
        }
        .mytitle{
            margin: 0 auto;
            width: 50%;
        }
    </style>
    <script>
<%--        获取当前时间--%>
        var myDate = new Date();
        var myYear = myDate.getFullYear();
        var myMonth = myDate.getMonth() + 1;
        if(myMonth<10){
            myMonth = '0'+myMonth;
        }
        var myToday = myDate.getDate();
        if(myToday<10){
            myToday='0'+myToday;
        }
        var mytime=myYear+'-'+myMonth+'-'+myToday;
        $(function(){
            $(".nowDate").text(mytime);
            $("#stuId").val(${studentId});
            $("#stuDate").val(mytime);
            var studentId=${studentId};
                getStuMessage(studentId);
                getStuSignMess(studentId);
            })

//获取该学生姓名、班级
        function getStuMessage(studentId){
            $.ajax({
                url:"${path}/signIn/getStuMessage/"+studentId,
                type:"get",
                success:function (res){
                    $(".stuName").text(res.studentName);
                    $(".stuClass").text(res.studentClass);
                }
            })
        }
//获取该学生该天原有打卡信息
        function getStuSignMess(studentId){
            $.ajax({
                url:"${path}/signIn/getStuSignMess/"+studentId,
                type:"get",
                success:function (res){
                    if (res){
                        $("#get_form input[name=stuOne]").val([res.stuOne]);
                        $("#get_form input[name=stuTwo]").val([res.stuTwo]);
                        $("#get_form input[name=stuThree]").val([res.stuThree]);
                        $("#get_form input[name=stuFour]").val([res.stuFour]);
                        $("#get_form input[name=stuFive]").val([res.stuFive]);
                        $("#get_form input[name=stuSix]").val([res.stuSix]);
                        $("#get_form input[name=stuSeven]").val([res.stuSeven]);
                        $("#get_form input[name=stuEight]").val([res.stuEight]);
                        $("#get_form input[name=stuNine]").val([res.stuNine]);
                        $("#get_form input[name=stuTen]").val([res.stuTen]);
                        $("#get_form input[name=stuEleven]").val([res.stuEleven]);
                        if(res.stuDate==mytime){
                            $(".WhetherSign").text("今日已上报");
                        }else{
                            $(".WhetherSign").text("");
                        }
                    }
                }
            })
        }

        //保存按钮
        $(document).on("click",".btn_save",function (){
            if($('#save').is(':checked')) {
                $.ajax({
                    url:"${path}/signIn/updateStuSign",
                    data:$("#get_form").serialize(),
                    type:"put",
                    success:function (res){
                        getStuSignMess(${studentId});
                        alert("保存成功！");
                    }
                })
            }else{
                alert("请承诺以上所填信息属实！");
            }
        })
    </script>
</head>
<body>
        <h2 style="color: #A8A8A8;text-align: center;font-weight: 400;margin-top: 30px;">每日打卡</h2>
        <div class="title">
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;margin-bottom: 20px;"></div>
            <span>日期</span><span style="margin-left: 75px;"class="nowDate"></span><span style="float: right;margin-right: 30px;color: red;" class="WhetherSign"></span>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>
        <div class="title" style="margin-top: 20px;">
            <span>姓名</span><span style="margin-left: 75px;" class="stuName"></span>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>
        <div class="title" style="margin-top: 20px;">
            <span>班级</span><span style="margin-left: 75px;" class="stuClass"></span>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>
        <form id="get_form">
        <div style="margin-top: 20px;" class="mytitle">
            <p>1、当前居住地是否为风险地区（以国家卫生健康委疫情风险等级查询系统公布为准)?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuOne" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuOne" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>2、今日是否接触过新冠肺炎感染者?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuTwo" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio"  name="stuTwo" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>3、今日是否接触过新冠肺炎疑似感染者?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuThree" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuThree"  value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>


        <div style="margin-top: 20px;" class="mytitle">
            <p>4、是否社区(村)要求居家观察?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuFour" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuFour" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>5、是否在当地政府集中隔离点观察?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuFive" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuFive" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" style="margin-top: 20px;" class="mytitle">
            <p>6、是否在医院医学观察?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuSix" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuSix" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>7、是否存在发热情况(高于37.2℃)?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuSeven" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuSeven" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>


        <div style="margin-top: 20px;" class="mytitle">
            <p>8、是否为疑似感染新冠肺炎者?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuEight" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuEight" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>9、是否确认为感染新冠肺炎者?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuNine" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuNine" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>


        <div style="margin-top: 20px;" class="mytitle">
            <p>10、今日身体情况?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuTen" value="1" checked="checked">正常
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio"  name="stuTen" value="2">发热/咳嗽/气促
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuTen" value="3">腹泻/恶心/呕吐
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuTen" value="4">心悸/心慌/头疼
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuTen" value="5">其他不良症状
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>

        <div style="margin-top: 20px;" class="mytitle">
            <p>11、是否与境外回国人员共同居住?<span style="color: red;"> *</span></p>
            <label class="radio-inline">
                <input type="radio" name="stuEleven" value="1">是
            </label>
            <label class="radio-inline" style="margin-left: 20px;">
                <input type="radio" name="stuEleven" value="2" checked="checked">否
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 20px;width: 100%;"></div>
        </div>
            <input type="hidden" name="stuDate" id="stuDate">
            <input type="hidden" name="stuId" id="stuId">
        </form>
        <div class="mytitle" style="margin-top: 15px;">
            <label class="radio-inline">
                <input type="radio" name="save" id="save" ><span>本人承诺以上所填写信息属实<span style="color: red;"> *</span></span>
            </label>
            <div style="background-color: #C0C0C0;height:2px;margin-top: 15px;width: 100%;"></div>
        </div>
        <div class="mytitle" style="margin-top:10px;margin-bottom: 30px; text-align: center;">
            <button type="button" class="btn btn-primary btn_save" style="width:200px ;">保存</button>
        </div>
</body>
</html>
