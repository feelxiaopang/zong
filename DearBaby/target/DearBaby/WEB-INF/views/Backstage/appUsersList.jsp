<%--
  Created by IntelliJ IDEA.
  User: wuxiaoyu
  Date: 2017/6/30
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../../common/libBotstrap.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body style="background:url('<%=path%>/staticState/imgs/home_image.png') no-repeat -200px -20px;background-attachment:fixed">
<div class="bigDiv" style="height: 830px">
    <div class="smallDiv">
    <!-- 每页显示数据 -->
    <c:set var="pageSize" value="${pageModel.pageSize}"></c:set>
    <!-- 总数据数 -->
    <c:set var="recordCounts" value="${pageModel.recordCounts}"></c:set>
    <!-- 总页数 -->
    <c:set var="pageCounts" value="${pageModel.pageCounts}"></c:set>
    <!-- 当前页 -->
    <c:set var="pageNo" value="${pageModel.pageNo}"></c:set>
        <br/>
    <div class="table-responsive">
        <div class="col-lg-2 col-md-2 col-sm-2">
            <c:forEach items="${power}" var="res">
                <c:if test="${res.p_id==10}">
                    <button class="btn btn-danger" id="deleteButton" >删除</button>
                </c:if>
                <c:if test="${res.p_id==5}">
                    <button class="btn btn-info" id="updateButton" >修改</button>
                </c:if>
            </c:forEach>
        </div>
        <div class="col-lg-10 col-md-10 col-sm-10">

            <form class="form-inline" role="form" id="searchForm">
                <div class="form-group">
                    <input type="text" class="form-control" name="u_pNumber" placeholder="用户账号"  style="width: 120px">
                    <input type="text" class="form-control" name="u_name" placeholder="用户昵称" style="width: 120px">
                    <input type="date" class="form-control" id="beginDate" name="beginDate" style="width: 140px"><span>—</span><input type="date" class="form-control" id="endDate" name="endDate" style="width: 140px">
                    <span>用户状态：</span><select style="height: 34px" name="u_status">
                    <option value="0">请选择</option>
                    <option value="1">启用</option>
                    <option value="2">禁用</option>
                </select>
                </div>
                <input type="button" class="form-select-button" id="searchButton" style="width:50px;height:34px;" value="搜索"/>
            </form>
        </div>
        <br/><br/><br/>

        <table class="table table-bordered">
            <thead>
            <tr>
                <td><input type="checkbox" id="allCheck"></td>
                <th>编号</th>
                <th>账号</th>
                <th>昵称</th>
                <th>用户状态</th>
                <th>注册时间</th>
                <th>详细信息</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageModel.list}" var="res" varStatus="s">
                <tr class="trClass">
                    <td><input class="myCheck" type="checkbox" value="${res.u_id}"></td>
                    <td>${s.index+1}</td>
                    <td>${res.u_pNumber}</td>
                    <td>${res.u_name}</td>
                    <td><c:if test="${res.u_status==1}">启用</c:if>
                    <c:if test="${res.u_status==2}">禁用</c:if></td>
                    <td>${res.u_date}</td>
                    <td><a href="userDetails.html?u_id=${res.u_id}">查看</a></td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div style="width: 100%;text-align: center">
        <ul class="pagination">
            <!--当前页数>1 显示 上一页按钮 -->
            <c:if test="${pageModel.pageNo>1}">
                <li><a class="use" href="userList.html?pageNo=${pageModel.pageNo-1}">上一页</a></li>
            </c:if>
            <!-- 总页数小于5时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts<=5}">
                <c:forEach var="i" begin="1" end="${pageModel.pageCounts}">
                    <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                </c:forEach>
            </c:if>
            <!-- 总页数为6页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==6}">
                <c:if test="${pageModel.pageNo<=3}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>3}">
                    <c:forEach var="i" begin="1" end="6">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数为7页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==7}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>4}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数为8页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts==8}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo==5}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>
                <c:if test="${pageModel.pageNo>5}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a class="use" href="userList.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="4" end="8">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!-- 总页数大于8页时 页码的显示方式 -->
            <c:if test="${pageModel.pageCounts>8}">
                <c:if test="${pageModel.pageNo<=4}">
                    <c:forEach var="i" begin="1" end="5">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo==5}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="3" end="7">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo>5&&pageModel.pageNo<(pageModel.pageCounts-3)}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a class="use" href="userList.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="${pageModel.pageNo-2}" end="${pageModel.pageNo+2}">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                    <li><a>..</a></li>
                </c:if>

                <c:if test="${pageModel.pageNo>=(pageModel.pageCounts-3)}">
                    <li><a class="use" href="userList.html?pageNo=1">1</a></li>
                    <li><a class="use" href="userList.html?pageNo=2">2</a></li>
                    <li><a>..</a></li>
                    <c:forEach var="i" begin="${pageModel.pageCounts-4}" end="${pageModel.pageCounts}">
                        <li><a class="use" href="userList.html?pageNo=${i}">${i}</a></li>
                    </c:forEach>
                </c:if>
            </c:if>
            <!--当前页数<总页数 显示 下一页按钮 -->
            <c:if test="${pageModel.pageNo<pageModel.pageCounts}">
                <li><a class="use" href="userList.html?pageNo=${pageModel.pageNo+1}">下一页</a></li>
            </c:if>

            <li><span>共${pageModel.pageCounts}页 当前第${pageModel.pageNo}页</span></li>
            <li><span>跳转到<input type="number" id="pageInput" style="width: 50px;height: 20px;">页</span></li>
            <button class="btn btn-info" id="pageGo" >go</button>
        </ul>

    </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        $("li").each(function () {
            if ($(this).text() ==${pageModel.pageNo})
                $(this).addClass("active").siblings().removeClass("active");
        });
        $("#searchButton").click(function () {
                if($("#endDate").val()==""&&$("#beginDate").val()!=""){
                    $.alert({
                        title: '错误！',
                        content: '结束时间不能为空！',
                    });
                }else if($("#endDate").val()!=""&&$("#beginDate").val()==""){
                    $.alert({
                        title: '错误！',
                        content: '起始时间不能为空！',
                    });
                }else if($("#beginDate").val()>$("#endDate").val()){
                    $.alert({
                        title: '错误！',
                        content: '起始时间必须早于终止时间！',
                    });
                }else{
                    $("#searchForm").attr("action", "userList.html").submit();
                }
        });
        $(".use").each(function () {
            if (${u_pNumber!=null||u_name!=null||beginDate!=null||u_status!=null}) {
                var s = $(this).attr("href") + "&u_pNumber=${u_pNumber}&u_name=${u_name}&beginDate=${beginDate}&endDate=${endDate}&u_status=${u_status}";
                $(this).attr("href", s);
            };
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
                window.location.href = "userUpdate.html?u_id=" + str;
            }
        });

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
                            url: "updateAppUserStatusByList?u_id="+str,
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
        $("#pageGo").click(function () {
            if($("#pageInput").val()>${pageModel.pageCounts}){
                $.alert({
                    title: '错误！',
                    content: '超过总页数！',
                });
            }else if($("#pageInput").val()<=0){
                $.alert({
                    title: '错误！',
                    content: '请不要乱输！',
                });
            } else {
                if (${u_pNumber!=null||u_name!=null||beginDate!=null||u_status!=null}) {
                    window.location.href = "userList.html?pageNo="+ $("#pageInput").val()+
                        "&u_pNumber=${u_pNumber}&u_name=${u_name}&beginDate=${beginDate}&endDate=${endDate}&u_status=${u_status}";
                }else{
                    window.location.href = "userList.html?pageNo="+ $("#pageInput").val();
                }
            }
        });
        $(".trClass input").click(function () {
            $(this).prop("checked") == true ? $(this).removeProp("checked") : $(this).prop("checked", true);
        });
        $(".trClass").click(function () {
            $(this).find(":checkbox").prop("checked") == true ? $(this).find(":checkbox").removeAttr("checked") : $(this).find(":checkbox").prop("checked", true);
        });

        /*给行加上移入的css效果*/
        $('.trClass').hover(function () {
            $(this).attr("class", "info");
        });
        /* 给行加上移除的css效果*/
        $('.trClass').mouseout(function () {
            $(this).removeClass("info");
        });

        //全选
        $("#allCheck").click(function () {
            $("input:checkbox").prop("checked",this.checked);
        })

    });
</script>

</body>
</html>
