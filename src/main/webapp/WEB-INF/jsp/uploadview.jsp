<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%--<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />--%>
    <title><s:message code="admin.users.importUsers"/></title>
</head>
<body>

<%@include file="/WEB-INF/incl/menu.app" %>
<h2><s:message code="admin.users.importUsers"/></h2>


<sf:form id="uploadForm" action="${pageContext.request.contextPath}/upload/${expert_id}"
         method="POST" modelAttribute="fileupload" enctype="multipart/form-data">
    <input type="file"  name="files" id="filename"/>
    <input type="submit" class="btn btn-primary" value="<s:message code="button.upload"/>"/>
</sf:form>

</body>
</html>
