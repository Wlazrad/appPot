<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <title><s:message code="admin.users.importUsers"/></title>
</head>
<body>
<c:if test="${msg}">
    <span text="${msg}"></span>
</c:if>
<div>


    <h5>Zdjęcie dodane pomyślnie, pojawi się po akceptacji administratora <span class="badge badge-secondary">New</span></h5>

    <span><a class="badge badge-secondary" style="width: 6rem;" href="/">Kliknij, powrót na stronę główną</a> </span>

</div>

</body>
</html>