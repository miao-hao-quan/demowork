<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/24
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%--学生风险地区界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .title{
            text-align: center;
            margin-bottom: 30px;
            margin-top: 30px;
        }
        .tallarea{
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
        .levelName{
            color: red;
        }
    </style>
</head>
<body>
<h2 class="title" style="color: red">高风险地区</h2>
<div class="col-md-6 tallarea">
    <table class="table table-hover">
        <thead style='text-align: center;'>
        <tr>
            <td>省份</td>
            <td>城市</td>
            <td>具体地址</td>
            <td class="levelName">风险级别</td>
        </tr>
        </thead>
        <tbody id="highArea" style='text-align: center;'>

        </tbody>
    </table>
    <div class="row">
        <div class="col-md-6" id="pageinfo_countHigh" style="color: #2e6da4;margin-left: 15px;margin-top: 10px;"></div>
        <div class="col-md-6" id="pageinfo_itemHigh" style="position: relative;bottom:45px;left: 280px;">

        </div>
    </div>
</div>
<h2 class="title" style="color: red">中风险地区</h2>
<div class="col-md-6 tallarea">
    <table class="table table-hover">
        <thead style='text-align: center;'>
        <tr>
            <td>省份</td>
            <td>城市</td>
            <td>具体地址</td>
            <td class="levelName">风险级别</td>
        </tr>
        </thead>
        <tbody id="mediumArea" style='text-align: center;'>

        </tbody>
    </table>
    <div class="row">
        <div  id="pageinfo_countMedium" style="color: #2e6da4;margin-left: 15px;margin-top: 10px;"></div>
        <div  id="pageinfo_itemMedium" style="position: relative;bottom:45px;left: 280px;">

        </div>
    </div>
</div>
<script>
<%--    获取该页的高风险地区信息--%>
    function getHighArea(mypn){
        $.ajax({
            url:"${path}/risk/getHighArea",
            data:{pn:mypn},
            type:"get",
            success:function (res){
                $("#highArea").empty();
                message(res,"#highArea");
                count(res,"#pageinfo_countHigh");
                item(res,"#pageinfo_itemHigh");
            }
        })
    }

<%--    获取该页的中风险地区信息--%>
    function getMediumArea(mypn){
        $.ajax({
            url:"${path}/risk/getMediumArea",
            data:{pn:mypn},
            type:"get",
            success:function (res){
                $("#mediumArea").empty();
                message(res,"#mediumArea");
                count(res,"#pageinfo_countMedium");
                item(res,"#pageinfo_itemMedium");
            }
        })
    }

    //页面初始化高风险地区和低风险地区都为第一页
    $(function (){
        getHighArea(1);
        getMediumArea(1);
    })


     //当前页详细信息遍历方法
    function message(res,tbodyId){
        var high= res.map.pageInfo.list;
        $.each(high,function (index,item){
            var province=$("<td></td>").append(item.province);
            var city=$("<td></td>").append(item.city);
            var address=$("<td></td>").append(item.address);
            var Level_name=$("<td></td>").append(item.riskLevel.name);
            Level_name.attr("class","levelName");
            $("<tr></tr>").append(province).append(city).append(address).append(Level_name).appendTo(tbodyId);
        })
    }
//当前页分页条信息获取方法
    function count(res,aId){
        $(aId).empty();
        var pagecount=res.map.pageInfo;
        $(aId).append("当前第"+pagecount.pageNum+"页 总"+pagecount.pages+"页 总"+pagecount.total+"条数据");
    }

   //当前页分页导航栏获取方法
    function item(res,aId){
        var getWhichArea;
        if(aId=="#pageinfo_itemHigh"){
            getWhichArea="getHighArea";
        }
        if (aId=="#pageinfo_itemMedium"){
            getWhichArea="getMediumArea";
        }
        $(aId).empty();
        var nav=$("<nav></nav>").attr("aria-label","Page navigation");
        var ul=$("<ul></ul>").addClass("pagination");
        var first=$("<li></li>").append($("<a></a>").append("首页"));
        var end=$("<li></li>").append($("<a></a>").append("尾页"));
        var previous=$("<li></li>").append($("<a></a>").append("&laquo;"));
        var next=$("<li></li>").append($("<a></a>").append("&raquo;"));
        if(res.map.pageInfo.hasPreviousPage==false){
            first.addClass("disabled");
            previous.addClass("disabled")
        }else {
            first.click(function (){
                if(getWhichArea=="getHighArea"){
                    getHighArea(1);
                }else{
                    getMediumArea(1);
                }
            });
            previous.click(function (){
                if(getWhichArea=="getHighArea"){
                    getHighArea(res.map.pageInfo.pageNum-1);
                }else{
                    getMediumArea(res.map.pageInfo.pageNum-1);
                }
            });
        }
        if(res.map.pageInfo.hasNextPage==false){
            end.addClass("disabled");
            next.addClass("disabled");
        }else{
            end.click(function (){
                if(getWhichArea=="getHighArea"){
                    getHighArea(res.map.pageInfo.pages);
                }else{
                    getMediumArea(res.map.pageInfo.pages);
                };
            });
            next.click(function (){
                if(getWhichArea=="getHighArea"){
                    getHighArea(res.map.pageInfo.pageNum+1);
                }else{
                    getMediumArea(res.map.pageInfo.pageNum+1);
                };
            });
        }
        var pageitem=res.map.pageInfo.navigatepageNums;
        ul.append(first).append(previous);
        $.each(pageitem,function (index,item){
            var dex=$("<li></li>").append($("<a></a>").append(item));
            if(res.map.pageInfo.pageNum==item){
                dex.addClass("active");
            }else {
                dex.click(function (){
                    if(getWhichArea=="getHighArea"){
                        getHighArea(item);
                    }else{
                        getMediumArea(item);
                    };
                })
            }

            ul.append(dex);
        })
        ul.append(next).append(end);
        nav.append(ul);
        nav.appendTo(aId);
    }
</script>
</body>
</html>
