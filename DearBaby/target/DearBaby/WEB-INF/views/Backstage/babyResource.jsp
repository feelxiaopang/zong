<%--
  Created by IntelliJ IDEA.
  User: wuxiaoyu
  Date: 2017/7/11
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@include file="../../../common/libBotstrap.jsp" %>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="container">
    <div class="col-lg-1 col-md-1 col-sm-1"></div>
    <div class="col-lg-10 col-md-10 col-sm-10">
<div class="bigDiv">
    <!-- 每页显示数据 -->
    <c:set var="pageSize" value="${pageModel.pageSize}"></c:set>
    <!-- 总数据数 -->
    <c:set var="recordCounts" value="${pageModel.recordCounts}"></c:set>
    <!-- 总页数 -->
    <c:set var="pageCounts" value="${pageModel.pageCounts}"></c:set>
    <!-- 当前页 -->
    <c:set var="pageNo" value="${pageModel.pageNo}"></c:set>
    <!-- 当前页面数据begin end -->
    <c:set var="beginItem" value="${pageSize*pageNo-pageSize}"></c:set>
    <c:set var="endItem" value="${beginItem+pageSize-1}"></c:set>

    <div class="smallDiv">
    <div class="table-responsive">
        <div class="col-lg-4 col-md-4 col-sm-4">
                    <button class="btn btn-info" id="insertButton">新增</button>
                   <button class="btn btn-info" id="updateButton" >修改</button>
                    <button class="btn btn-danger" id="deleteButton" >删除</button>
        </div>
        <div class="col-lg-8 col-md-8 col-sm-8" style="padding: 0">

        </div>
        <br/>
        <table class="table table-bordered">
            <thead>
            <tr>
                <td><input type="checkbox" id="allCheck"></td>
                <th>编号</th>
                <th>资源类型</th>
                <th>一级父级</th>
                <th>二级父级</th>
                <th>三级父级</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageModel.list}" var="res" varStatus="s" begin="${beginItem}" end="${endItem}">
                <c:if test="${res.brt_id>3}">
                <tr>
                    <td><input type="checkbox" class="myCheck" value="${res.brt_id}"></td>
                    <td>${s.index-2}</td>
                    <td>${res.brt_type}</td>
                    <td>${res.first_father}</td>
                    <td>${res.second_father}</td>
                    <td>${res.third_father}</td>
                </tr>
                </c:if>
            </c:forEach>
            </tbody>

        </table>

    <!-- 新增 -->
    <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 800px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">新增资源类型</h4>
                </div>
                <div class="modal-body">
                    <div class="input-group input-group-lg">
                        <span class="input-group-addon">类型名称</span>
                        <input type="text" class="form-control" name="brt_type" id="insertResourceType"
                               maxlength="6">
                    </div>
                    <p class="text-center" id="msg">&nbsp;</p>
                    <p>资源类型</p>
                    <table id="modifyRolePowerTable" class="table table-bordered">
                        <c:forEach items="${pageModel.list}" var="first">
                            <c:if test="${(first.first_father == null)}">
                                <tr style="font-size: 14px">
                                    <th style="font-size: 15px;width: 100px;vertical-align: middle"><label><input
                                            class="first"
                                            type="radio" name="first"
                                            value="${first.brt_id}"/>${first.brt_type}
                                    </label>
                                    </th>
                                    <c:forEach items="${pageModel.list}" var="second">
                                        <c:if test="${second.first_father==first.brt_type}">
                                            <td><label><input class="second"
                                                              type="radio"
                                                              name="second"
                                                              value="${second.brt_id}">${second.brt_type}
                                            </label>
                                                <c:if test="${first.brt_id==1}">
                                                <select class="thirdSelect">
                                                <option value="0">请选择</option>
                                            <c:forEach items="${pageModel.list}" var="third">
                                                <c:if test="${third.first_father==second.brt_type}">
                                                <option value="${third.brt_id}">${third.brt_type}</option>
                                                </c:if>
                                            </c:forEach>
                                            </select>
                                                </c:if>
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="insertSub">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
        <!-- 修改 -->
        <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
            <div class="modal-dialog">
                <div class="modal-content" style="width: 800px">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">修改资源类型</h4>
                    </div>
                    <div class="modal-body">
                        <div class="input-group input-group-lg">
                            <span class="input-group-addon">类型名称</span>
                            <input type="text" class="form-control" name="brt_type" id="updateResourceType"
                                   maxlength="6">
                        </div>
                        <p class="text-center" id="message">&nbsp;</p>
                        <p>资源类型</p>
                        <table class="table table-bordered">
                            <c:forEach items="${pageModel.list}" var="first">
                                <c:if test="${(first.first_father == null)}">
                                    <tr style="font-size: 14px">
                                        <th style="font-size: 15px;width: 100px;vertical-align: middle"><label><input
                                                class="first"
                                                type="radio" name="first"
                                                value="${first.brt_id}"/>${first.brt_type}
                                        </label>
                                        </th>
                                        <c:forEach items="${pageModel.list}" var="second">
                                            <c:if test="${second.first_father==first.brt_type}">
                                                <td><label><input class="second"
                                                                  type="radio"
                                                                  name="second"
                                                                  value="${second.brt_id}">${second.brt_type}
                                                </label>
                                                    <c:if test="${first.brt_id==1}">
                                                        <select class="thirdSelect">
                                                            <option value="0">请选择</option>
                                                            <c:forEach items="${pageModel.list}" var="third">
                                                                <c:if test="${third.first_father==second.brt_type}">
                                                                    <option value="${third.brt_id}">${third.brt_type}</option>
                                                                </c:if>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                </td>
                                            </c:if>
                                        </c:forEach>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="updateSub">提交更改</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    <div style="width: 100%;text-align: center">
        <ul class="pagination">
            <!--当前页数>1 显示 上一页按钮 -->
            <c:if test="${pageModel.pageNo>1}">
                <li><a class="use" href="babyResource.html?pageNo=${pageModel.pageNo-1}">上一页</a></li>
            </c:if>
            <!-- 总页数小于5时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts<=5}">
                <c:forEach var="i" begin="1" end="${pageModel.pageCounts}">
                    <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                </c:forEach>
            </c:if>
            <!-- 总页数为6页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==6}">
                <c:if test="${pageModel.pageNo<=3}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>3}">
                    <c:forEach var="i" begin="1" end="6">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数为7页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==7}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>4}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数为8页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==8}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo==5}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>5}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a class="use" href="babyResource.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="4" end="8">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数大于8页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts>8}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo==5}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo>5&&pageModel.pageNo<(pageModel.pageCounts-3)}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a class="use" href="babyResource.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="${pageModel.pageNo-2}" end="${pageModel.pageNo+2}">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo>=(pageModel.pageCounts-3)}">
                    <li><a class="use" href="babyResource.html?pageNo=1">1</a></li>
                    <li><a class="use" href="babyResource.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="${pageModel.pageCounts-4}" end="${pageModel.pageCounts}">
                        <li><a class="use" href="babyResource.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!--当前页数<总页数 显示 下一页按钮 -->
            <c:if test="${pageModel.pageNo<pageModel.pageCounts}">
                <li><a class="use" href="babyResource.html?pageNo=${pageModel.pageNo+1}">下一页</a></li>
            </c:if>

            <li><span>共${pageModel.pageCounts}页 当前第${pageModel.pageNo}页</span></li>
            <li><span>跳转到<select>
                <c:forEach var="i" begin="1" end="${pageModel.pageCounts}">
                    <option>${i}</option>
                </c:forEach>
            </select>页</span></li>
            <button class="btn btn-info" id="pageGo" >go</button>
        </ul>

    </div>
</div>
</div>
</div>
    </div>
        <div class="col-lg-1 col-md-1 col-sm-1"></div>
</div>
<script>
    $(document).ready(function () {
        $("#insertButton").click(function () {
            $("#insertModal").modal("show");
            $("#insertModal").attr("data-show","true");
        });

        $("#updateButton").click(function () {
            var str = "";
            $(".myCheck:checked").each(function (i) {
                if (i == 0) {
                    str = $(this).val();
                } else {
                    str += ("," + $(this).val())
                }
            })
            var arr = str.split(',');
            if (str.length == 0) {
                $.alert({
                    title: '错误！',
                    content: '请选择您要修改的用户！',
                });
            } else if (arr.length > 1) {
                $.alert({
                    title: '错误！',
                    content: '所选择的用户只能为一个！',
                });
            } else {
                $("#updateModal").modal("show");
                $("#updateModal").attr("data-show","true");
                console.log("2222:"+$(".myCheck:checked").closest("td").next().next().html());
                $("#updateResourceType").val($(".myCheck:checked").closest("td").next().next().html());

            }
        });


        $(".first").each(function () {
             $(this).click(function () {
                 $(this).closest("tr").siblings().find(".second").removeAttr("checked");
                 $(".thirdSelect option[value='0']").prop("selected","selected");
                 third = 0;
             });
        })

        $(".second").each(function () {
            $(this).click(function () {
                $(this).attr("checked")=="checked"? $(this).removeAttr("checked"):$(this).attr("checked","checked");
                if($(this).attr("checked")=="checked") {
                    $(this).closest("tr").find(".first").prop("checked", "checked");
                }
                $(".thirdSelect option[value='0']").prop("selected","selected");
                third = 0;
            });
        });

        var third = 0;
        $(".thirdSelect").change(function () {
            if($(this).val()!=0) {
                $(this).closest("td").find(".second").prop("checked", "checked").closest("tr").find(".first").prop("checked", "checked");
            }else {
                $(this).closest("td").find(".second").removeAttr("checked").closest("tr").find(".first").removeAttr("checked");
            }
            $(this).closest("td").siblings().find(".thirdSelect option[value='0']").prop("selected","selected");
            third = $(this).val();
        });
        $("#insertResourceType").change(function () {
            $.ajax({
                type:"get",
                url:"selectBabyResourceTypeByName?brt_type="+$(this).val(),
                success:function (data) {
                    if(data==2){
                        $("#msg").css("color","green").html("类型名可用");
                    }else{
                        $("#msg").css("color","red").html("类型名不可用");
                    }
                }
            },'html')
        })


        $("#insertSub").click(function () {
            var first = $(".first:checked").val();
            var second = $(".second:checked").val();
            if($("#insertResourceType").val()==''|| $("#msg").html()=="类型名不可用"){
                $.alert({
                    title: '错误！',
                    content: '请输入正确的类型名！',
                });
            }else if(first==undefined){
                $.alert({
                    title: '错误！',
                    content: '请选择所属的类型！',
                });
            }else{
                var url = ""
                if(second==undefined){
                    second = 0;
                    url = "insertBabyResourceType?brt_type="+$("#insertResourceType").val()+"&first_father="+first+
                        "&second_father="+second+"&third_father="+third;
                }else if(second!=undefined&&third==0){
                    url = "insertBabyResourceType?brt_type="+$("#insertResourceType").val()+"&first_father="+second+
                        "&second_father="+first+"&third_father="+third;
                }else{
                    url = "insertBabyResourceType?brt_type="+$("#insertResourceType").val()+"&first_father="+third+
                        "&second_father="+second+"&third_father="+first;
                }
                $.ajax({
                    type:"get",
                    url:url,
                    success:function (data) {
                        if(data==1){
                            $.alert({
                                title: '成功',
                                content: '添加成功！',
                                confirm:function () {
                                    window.location.reload();
                                }
                            });
                        }
                    }
                },'html')
            }
        });
        // delete按钮触发
        $("#deleteButton").click(function () {
            var str = "";
            $(".myCheck:checked").each(function (i) {
                if (i == 0) {
                    str = $(this).val();
                } else {
                    str += ("," + $(this).val())
                }
            });
            if (str.length == 0) {
                $.alert({
                    title: '错误！',
                    content: '请选择您要删除的用户！',
                });
            } else {
                $.confirm({
                    title: '确认!',
                    content: '确定删除!?',
                    confirm: function () {
                        $.ajax({
                            async:false,
                            type:'get',
                            url: "deleteBabyResourceType?brt_id="+str,
                            success:function (data) {
                                $.alert({
                                    title: '成功',
                                    content: '删除成功！',
                                    confirm:function () {
                                        window.location.reload();
                                    }
                                });
                            }
                        },'html')
                    },
                    cancel: function () {
                        $.alert('已取消!')
                    }
                });
            }
        });

    });
    $(function () {
        $(".bigDiv").css("height",$(".smallDiv").height()+200)
    })

</script>
</body>
</html>
