<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><s:message code="logowanie.pageName"/></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <%--<!-- Bootstrap CSS -->--%>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>

    <%--&lt;%&ndash;<!-- css custom styling-->&ndash;%&gt;--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />&ndash;%&gt;--%>

    <%--&lt;%&ndash;<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />&ndash;%&gt;--%>
</head>
<body>
<%@include file="/WEB-INF/incl/menu.app" %>
<h2>
    <s:message code="logowanie.pageName"/>
</h2>

<form id="loginForm" action="/login" method="POST">

    <table width="350" border="0" cellpadding="4" cellspacing="1"
           align="center">

        <tr>
            <td colspan="2" align="center">
                <c:if test="${not empty param.error}">
                    <font color="red"><s:message code="error.logowanie"/></font>
                </c:if>
            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                <%--<p class="font-weight-normal"><s:message code="register.email"/></p>--%>

            </td>
            <td align="center">
                <div class="input-group mb-3" weight="600px">
                    <div class="input-group-prepend" weight="600px">
                        <span class="input-group-text" id="basic-addon1">Email</span>
                    </div>
                    <input type="text" name="email" id="email" class="form-control" placeholder="Email"
                           aria-label="Email" aria-describedby="basic-addon1" weight="600px">
                </div>

            </td>
        </tr>
        <tr>
            <td align="right" width="140">
                <%--<s:message code="register.password"/>--%>
            </td>
            <td align="left">
                <div class="input-group mb-3" weight="600px">
                    <div class="input-group-prepend" weight="600px">
                        <span class="input-group-text" id="basic-addon1">Hasło</span>
                    </div>
                    <input type="password" name="password" id="password" class="form-control" placeholder="Email"
                           aria-label="Email" aria-describedby="basic-addon1">
                </div>
                <input colspan="4" class="btn btn-success" type="submit" value="<s:message code="logging" />">
            </td>
        </tr>


    </table>
</form>
</body>
</html>