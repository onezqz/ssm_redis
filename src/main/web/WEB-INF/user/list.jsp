<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/prism.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script language="javascript" src="${pageContext.request.contextPath}/js/prism.js"></script>
    <script>
        function deleteFun(uid) {
            if(confirm("确定删除该项？")){
                window.location.href="${pageContext.request.contextPath}/user/del-userById?uid="+uid;
            }
        }

        function editFun(uid) {
            window.location.href="${pageContext.request.contextPath}/user/update-jsp?uid="+uid;
        }
    </script>
    <title>
        <c:if test="${type=='all'}">
              所有用户列表
        </c:if>
        <c:if test="${type!='all'}">
            ${type}&nbsp;下用户列表
        </c:if>
    </title>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
    <div class="col-md-12 col-sm-12" id="main" role="main">
        <div class="table-responsive">
            <table class="table table-striped">
                <caption>
                    <h4><a href="${pageContext.request.contextPath}/user/list-user">首页</a></h4>
                    &nbsp;&nbsp;&nbsp;
                    <label>用户管理</label>
                    &nbsp;&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/user/insert-jsp">新建</a>
                </caption>
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>用户名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                <c:if test="${empty userList}">
                    <tr>
                        <td>
                            暂无数据
                        </td>
                    </tr>
                </c:if>
                <c:if test="${!empty userList}">
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/find-userByKeyword?keyword=${user.uid}">
                                        ${user.uid}
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/find-userByKeyword?keyword=${user.username}">
                                    ${user.username}
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/find-userByKeyword?keyword=${user.sex}">
                                    ${user.sex}
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/user/find-userByKeyword?keyword=${user.age}">
                                        ${user.age}
                                </a>
                            </td>
                            <td>
                                <button class="btn btn-xs btn-danger" onclick="deleteFun('${user.uid}')">删除</button>
                                <button class="btn btn-sm btn-warning" onclick="editFun('${user.uid}')">编辑</button>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>
        <%--&lt;%&ndash;分页&ndash;%&gt;--%>
        <%--<div style="padding-left: 90%">--%>
            <%--<ul class="pagination">--%>
                <%--<c:forEach begin="1" end="${pageBean.totalPage}" var="page">--%>
                    <%--<c:if test="${pageBean.currentPage==page}">--%>
                        <%--<li class="active"><a href="javascript:void(0)">${page}</a></li>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${pageBean.currentPage!=page}">--%>
                        <%--<li class="">--%>
                            <%--<a href="${pageContext.request.contextPath}/admin/article/list?page=${page}">${page}</a>--%>
                        <%--</li>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>
            <%--</ul>--%>
        <%--</div>--%>
    </div>
</div>
</body>
</html>

