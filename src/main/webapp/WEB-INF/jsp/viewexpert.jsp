<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <%--<!-- css custom styling-->--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />&ndash;%&gt;--%>

    <%--&lt;%&ndash;&lt;%&ndash;<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />&ndash;%&gt;&ndash;%&gt;--%>


</head>
<body>
lala


<tr>
        <%--<td><img src="/resources/images/<c:out value="${e.id}"/>.jpg" alt="/resources/images/<c:out value="${e.id}"/>.jpg" class="img-thumbnail"></td>--%>
    <td align="center"  width="150" align="center"><c:out value="${expert.name }" /></td>
    <td align="center"  width="150" align="center"><c:out value="${expert.location }" /></td>
    <td align="center"  width="150" align="center"><c:out value="${expert.job }" /></td>
    <td align="center"  width="150" align="center"><c:out value="${expert.number }" /></td>
</tr>
</>

<%--<c:url var="viewexpert" value="${'/viewexpert'}">--%>
    <%--<c:param name="id" value="${e.id}"/>--%>
<%--</c:url>--%>

</body>
</html>