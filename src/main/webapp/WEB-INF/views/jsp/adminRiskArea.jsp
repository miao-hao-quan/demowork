<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2021/1/24
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%--管理员风险地区界面--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% pageContext.setAttribute("path",request.getContextPath()); %>
<html>
<head>
    <script src="${path}/mystatic/js/jquery-3.4.1.js"></script>
    <link href="${path}/mystatic/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path}/mystatic/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .title1,.title2{
            text-align: center;
            margin-top: 30px;
        }
        .title2{
            margin-bottom: 30px;
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
        .btn_insert{
            margin:0 auto;
        }
    </style>
</head>
<body>
<%--新增模态框--%>
<div class="modal fade"  tabindex="-1" id="insertModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增地区</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal insert_form" id="insertForm">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">省份<span style="color: red"> *</span></label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="province">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >城市<span style="color: red"> *</span></label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="city">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">具体地址<span style="color: red"> *</span></label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="address">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">风险等级</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="riskLevel.id" id="insert_level">
                                <option value="1">高风险</option>
                                <option value="2">中风险</option>
                            </select>
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
<%--修改模态框--%>
<div class="modal fade"  tabindex="-1" id="updateModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myupdateModalLabel">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_form">
                    <input type="hidden" name="id" id="iptId">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span style="color: red"> *</span>省份</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="province" id="iptProvince">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" ><span style="color: red"> *</span>城市</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="city" id="iptCity">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><span style="color: red"> *</span>具体地址</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="address" id="iptAddress">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">风险等级</label>
                        <div class="col-sm-3">
                            <select class="form-control" name="riskLevel.id" id="iptRiskLevel">
                                <option value="1">高风险</option>
                                <option value="2">中风险</option>
                            </select>
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

    <h2 class="title1" style="color: red">高风险地区</h2>
    <div style="text-align:center;margin-left: 440px;">
        <button type="button" class="btn btn-success btn_insert">增加地区</button>
    </div>
    <div class="col-md-6 tallarea">
        <table class="table table-hover">
            <thead style='text-align: center;'>
            <tr>
                <td>省份</td>
                <td>城市</td>
                <td>具体地址</td>
                <td class="levelName">风险级别</td>
                <td>操作</td>
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
    <h2 class="title2" style="color: red">中风险地区</h2>
    <div class="col-md-6 tallarea">
        <table class="table table-hover">
            <thead style='text-align: center;'>
            <tr>
                <td>省份</td>
                <td>城市</td>
                <td>具体地址</td>
                <td class="levelName">风险级别</td>
                <td>操作</td>
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
<%--        获取当前页面的高风险地区--%>
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
<%--        获取当前页面的中风险地区--%>
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
        //初始化为第一页
        $(function (){
            getHighArea(1);
            getMediumArea(1);
        })
        //当前页详细信息遍历方法
        var totals,pageNumHigh,pageNumMedium,iptRiskLevel;
        function message(res,tbodyId){
            var high= res.map.pageInfo.list;
            if(tbodyId=="#mediumArea"){
                totals=res.map.pageInfo.total;
            }
            $.each(high,function (index,item){
                var province=$("<td></td>").append(item.province);
                var city=$("<td></td>").append(item.city);
                var address=$("<td></td>").append(item.address);
                var Level_name=$("<td></td>").append(item.riskLevel.name);
                Level_name.attr("class","levelName");
                var editor=$("<button></button>").addClass("btn btn-primary btn-sm btn-update").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editor.attr("editor_id",item.id);
                var remove=$("<button></button>").addClass("btn btn-danger btn-sm  btn-delete").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                remove.attr("delete_id",item.id)
                var btn=$("<td></td>").append(editor).append(" ").append(remove);
                $("<tr></tr>").append(province).append(city).append(address).append(Level_name).append(btn).appendTo(tbodyId);
            })
        }
        //当前页分页条信息获取方法
        function count(res,aId){
            $(aId).empty();
            if(aId=="#pageinfo_countHigh"){
                var pagecount=res.map.pageInfo;
                pageNumHigh=pagecount.pageNum;
            }else{
                var pagecount=res.map.pageInfo;
                pageNumMedium=pagecount.pageNum;
            }

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
        //删除该条地区记录
        $(document).on("click",".btn-delete",function (){
            var id=$(this).attr("delete_id");
            if(confirm("您确定要删除该条信息吗？")){
                $.ajax({
                    url:"${path}/risk/deleteArea?id="+id,
                    type:"delete",
                    success:function (){
                        getHighArea(pageNumHigh);
                        getMediumArea(pageNumMedium);
                    }
                })
            }
        })
        //点击显示修改地区信息模态框
        $(document).on("click",".btn-update",function (){
            var id=$(this).attr("editor_id");
                $.ajax({
                    url:"${path}/risk/getArea?id="+id,
                    type:"get",
                    success:function (res){
                        $("#iptId").val(res.id);
                        $("#iptProvince").val(res.province);
                        $("#iptCity").val(res.city);
                        $("#iptAddress").val(res.address);
                        $("#iptRiskLevel").val(res.riskLevel.id);
                        iptRiskLevel=res.riskLevel.id;
                        $('#updateModal').modal('show');
                    }
                })

        })
        //保存修改的地区信息
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
                    url:"${path}/risk/updateArea",
                    data:$(".update_form").serialize(),
                    type:"put",
                    success:function (res){
                        if(res=="success"){
                            console.log($("#iptRiskLevel").val());
                            if(iptRiskLevel==1){
                                if(iptRiskLevel==$("#iptRiskLevel").val()){
                                    getHighArea(pageNumHigh);

                                }else{
                                    getHighArea(pageNumHigh);
                                    getMediumArea(1);
                                }
                            }
                            if(iptRiskLevel==2){
                                if(iptRiskLevel!=$("#iptRiskLevel").val()){
                                    getMediumArea(pageNumMedium);
                                    getHighArea(totals);
                                }else{
                                    getMediumArea(pageNumMedium);
                                }
                            }
                            $('#updateModal').modal('hide');
                            alert("修改成功！");
                        }
                    }
                })
            }

        })
        //点击显示增加地区模态框
        $(document).on("click",".btn_insert",function (){
            $(".insert_form")[0].reset();
            $('#insertModal').modal('show');
        })
        //保存增加地区记录
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
                    url:"${path}/risk/insertArea",
                    data:$(".insert_form").serialize(),
                    type:"post",
                    success:function (res){
                        if(res=="success"){
                            if($("#insert_level").val()==1){
                                getHighArea(totals);
                            }else{
                                getMediumArea(totals);
                            }
                            $('#insertModal').modal('hide');
                            alert("增加成功！");
                        }
                    }
                })
            }

        })
    </script>
</body>
</html>
