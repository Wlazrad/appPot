<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</head>
<body>
<%@include file="/WEB-INF/incl/menu.app" %>

<h2><s:message code="expert.page"/></h2>

<p align="center">
    <c:out value="${message }" />
</p>



<sf:form id="usersForm" action="addexpert1" modelAttribute="expert"
         enctype="expert" method="POST">

    <table width="500" border="0" cellpadding="4" cellspacing="1"
           align="center">
        <tr >
            <td width="130" align="right" ><s:message code="expert.name"/></td>
            <td width="270" align="left"><sf:input path="name"
            /></td>
        </tr>

        <tr >
            <td width="130" align="right" ><s:message code="expert.job"/></td>
            <td width="270" align="left"><sf:input path="job"
                                                   /></td>
        </tr>

        <tr>
                <td width="130" align="right"><s:message code="expert.location"/></td>
                <td width="270" align="left">
            <sf:select class="custom-select" id="inputGroupSelect02" path="location">
                <option selected>Choose...</option>
                <option value="Warszawa">Warszawa</option>
                <option value="Lublin">Lublin</option>
                <option value="Okolice Warszawy">Okolice Warszawy</option>
                <option value="Okolice Lublina">Okolice Lublina</option>
                <option value="Cała Polska">Cała Polska</option>
            </sf:select>
        </td>
        </tr>

        <tr>
            <td width="130" align="right"><s:message code="expert.details"/></td>
            <td width="270" align="left"><sf:input path="details"
                                                   size="28" /></td>
        </tr>

        <tr>
            <td width="130" align="right"><s:message code="expert.number"/></td>
            <td width="270" align="left"><sf:input path="number"
                                                   size="28" /></td>
        </tr>







        <tr>
            <td colspan="2" align="center" bgcolor="#fff">
                <input type="submit" class="btn btn-primary" value="<s:message code="button.register"/>" />
                <input type="button" class="btn btn-primary" value="<s:message code="button.cancel"/>"
                       onclick="window.location.href='${pageContext.request.contextPath}/'"/>
            </td>
        </tr>



    </table>
</sf:form>
</body>
</html>