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
<title><s:message code="menu.register"/></title>

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</head>
<body>
<div>
<%@include file="/WEB-INF/incl/menu.app" %>
</div>

<h2 align="center"><s:message code="menu.register"/></h2>

<p align="center">
		<c:out value="${message }" />
</p>

	<sf:form id="usersForm" action="adduser" modelAttribute="user"
		enctype="multipart/form-data" method="POST">

		<table width="500" border="0" cellpadding="4" cellspacing="1"
			align="center">

			<tr>
				<td width="130" align="right" ><s:message code="register.name"/></td>
				<td width="270" align="left"><sf:input path="name" size="28" id="name" style="width: 200px; padding: 2px;" class="input-group mb-3"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><font color="red"><sf:errors path="name"/></font></td>
			</tr>

			<tr>
				<td width="130" align="right"><s:message code="register.lastName"/></td>
				<td width="270" align="left"><sf:input path="lastName"
						size="28" style="width: 200px; padding: 2px;" class="input-group mb-3"/></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><font color="red"><sf:errors path="lastName"/></font></td>
			</tr>

			<tr>
				<td width="130" align="right" ><s:message code="register.email"/></td>
				<td width="270" align="left"><sf:input path="email" size="28" style="width: 200px; padding: 2px;" class="input-group mb-3"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><font color="red"><sf:errors path="email"/></font></td>
			</tr>

			<tr>
				<td width="130" align="right" ><s:message code="register.password"/></td>
				<td width="270" align="left"><sf:password path="password" size="28" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><font color="red"><sf:errors path="password"/></font></td>
			</tr>

			<tr>
				<td colspan="2" align="center" bgcolor="#fff">
					<input class="form-control" type="submit" value="<s:message code="button.register"/>" />
					<input class="form-control" type="button"  value="<s:message code="button.cancel"/>"
						onclick="window.location.href='${pageContext.request.contextPath}/'"/>
				</td>
			</tr>

		</table>

	</sf:form>
	
	
</body>
</html>