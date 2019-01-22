<%--
  Created by IntelliJ IDEA.
  User: onezqz
  Date: 2018/12/10
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/prism.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <script  src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script  src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
    <script  src="${pageContext.request.contextPath}/js/prism.js" type="text/javascript"></script>

    <c:if test="${empty user}">
        <title>新建用户</title>
    </c:if>
    <c:if test="${!empty user}">
        <title>编辑用户</title>
    </c:if>
</head>
<body>
<div class="container-fluid" style="padding-top: 10px">
        <div class="col-md-12 col-sm-12" id="main" role="main">
            <form class="form-horizontal" role="form" id="category-edit">
                <input type="hidden" name="uid" value="${user.uid}">
                <div class="introduction">
                    <h4><a href="${pageContext.request.contextPath}/user/list-user">首页</a></h4>
                    &nbsp;&nbsp;&nbsp;
                    <c:if test="${empty user}">
                        <h4>
                            新建&nbsp;
                        </h4>
                    </c:if>
                    <c:if test="${!empty user}">
                        <h4>
                            编辑&nbsp;
                        </h4>
                    </c:if>
                </div>
                <div class="row">
                    <div class="col-md-8 center-block">
                        <div class="form-group">
                            <label class="control-label col-md-2" for="username">用户名</label>
                            <div class="col-md-10">
                                <input class="form-control col-md-10" type="text" id="username" name="username" value="${user.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2" >性别</label>
                            <label class="radio-inline">
                                <c:if test="${empty user}">
                                    <input type="radio"  name="sex"  value="men" checked="checked" > 男
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio"  name="sex"  value="women" > 女
                                </c:if>
                                <c:if test="${!empty user}">
                                    <c:if test="${user.sex=='men'}">
                                        <input type="radio"  name="sex"  value="men" checked="checked"> 男
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio"  name="sex"  value="women" > 女
                                    </c:if>
                                    <c:if test="${user.sex=='women'}">
                                        <input type="radio"  name="sex"  value="men" > 男
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio"  name="sex"  value="women" checked="checked"> 女
                                    </c:if>
                                </c:if>
                            </label>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-2" for="age">年龄</label>
                            <div class="col-md-10">
                                <input class="form-control col-md-10" type="text" id="age" name="age" value="${user.age}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-2 pull-right">
                                <button type="submit" class="btn btn-default" id="meta-submit">提交</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
</div>
</body>
</html>
<script type="text/javascript">
    $('form').submit(function() {
        var data=$(this).serialize();
        var is_success=false;
        $.ajax({
            url:"${pageContext.request.contextPath}/user/insert-user",
            type:"post",
            async:true,
            data:data,
            dataType:"json",
            success:function (result) {
                if(result===1){
                    alert("修改成功");
                    is_success=true;
                }else{
                    alert("修改失败，请重新修改")
                }
                if(is_success){
                    window.location.href="${pageContext.request.contextPath}/user/list-user";
                }
            }
        });

        return false;
    });
</script>
