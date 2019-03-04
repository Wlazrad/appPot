<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="profil.userDane"/></title>

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

	<!-- css custom styling-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />

	<%--<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />--%>


</head>
<body>
<%@include file="/WEB-INF/incl/menu.app" %>
<div align="center">
	<h2><s:message code="profil.userDane"/></h2>
</div>

<table width="500" border="0" cellpadding="4" cellspacing="1" align="center">

	<tr>
		<td width="130" align="right" >
			<s:message code="register.email"/>
		</td>
		<td width="270" align="left">
			<c:out value="${user.email }"/>
		</td>
	</tr>
	
	<tr>
		<td width="130" align="right" >
			<s:message code="register.name"/>
		</td>
		<td width="270" align="left">
			<c:out value="${user.name }"/>
		</td>
	</tr>
	
	<tr>
		<td width="130" align="right" >
			<s:message code="register.lastName"/>
		</td>
		<td width="270" align="left">
			<c:out value="${user.lastName }"/>
		</td>
	</tr>
	
	<tr>
		<td width="130" align="right" >
			<s:message code="profil.czyAktywny"/>
		</td>
		<td width="270" align="left">
			<c:choose>
				<c:when test="${user.active == 1 }">
					<s:message code="word.tak"/>
				</c:when>
				<c:otherwise>
					<s:message code="word.nie"/>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	
	<tr>
		<td width="130" align="right" >
			<s:message code="profil.rola"/>
		</td>
		<td width="270" align="left">
			<c:choose>
				<c:when test="${user.nrRoli == 1 }">
					<s:message code="word.admin"/>
				</c:when>
				<c:otherwise>
					<s:message code="word.user"/>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>

</table>

<table width="500" border="0" cellpadding="4" cellspacing="1" align="center">

	<tr>
		<td align="center">
			<input type="button" class="btn btn-secondary" value="<s:message code="button.edycjaProfilu"/>"
					onclick="window.location.href='${pageContext.request.contextPath}/editprofil'"/>
		</td>
		<td align="center">
			<input type="button" class="btn btn-secondary" value="<s:message code="button.zmianaHasla"/>"
					onclick="window.location.href='${pageContext.request.contextPath}/editpassword'"/>
		</td>
	</tr>
</table>



</body>
</html>