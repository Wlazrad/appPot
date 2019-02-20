<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="menu.mainPage"/></title>
</head>
<body>
<%@include file="/WEB-INF/incl/menu.app" %>
<div>

    <h1><s:message code="info.name"></s:message></h1>
    <h3><s:message code="info.description1"></s:message></h3>
    <h3><s:message code="info.description2"></s:message></h3>


    <%@include file="/WEB-INF/incl/footer.app" %>

</div>
</body>
</html>