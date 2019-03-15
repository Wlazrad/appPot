<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!-- css custom styling-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />

    <%--<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />--%>


<body>
<div>
    <%@include file="/WEB-INF/incl/menu.app" %>
</div>

<sf:form id="commentForm" action="addcomment1" modelAttribute="comment"
enctype="multipart/form-data" method="POST">
<div class="input-group">
    <div class="input-group-prepend">
        <span class="input-group-text">With textarea</span>
    </div>
    <sf:textarea path="content" />
    <sf:hidden path="createdAt"></sf:hidden>

</div>

<div>
    <button type="submit" class="btn btn-outline-primary">Primary</button>
</div>

</sf:form>


</body>
</html>