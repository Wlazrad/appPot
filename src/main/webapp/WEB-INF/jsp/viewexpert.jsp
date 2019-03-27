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

<h1>Dane o fachowcu</h1>

<tr>
        <%--<td><img src="/resources/images/<c:out value="${e.id}"/>.jpg" alt="/resources/images/<c:out value="${e.id}"/>.jpg" class="img-thumbnail"></td>--%>
            <h4>Imię : <td align="center"  width="150" align="center"><c:out value="${expert.name }" /></td></h4>
            <h4>Lokalizacja : <td align="center"  width="150" align="center"><c:out value="${expert.location }" /></td></h4>
            <br>
            <h4>Wykonywana praca : <td align="center"  width="150" align="center"><c:out value="${expert.job }" /></td></h4>
            <br>
            <h4>Numer telefonu : <td align="center"  width="150" align="center"><c:out value="${expert.number }" /></td></h4>
</tr>



<div class="tableback" >


    <table class="table table-striped" style="opacity: 0.9">


        <tr>

            <td width="150" align="center"><b><s:message code="comment.content"/></b></td>
            <td width="150" align="center"><b><s:message code="comment.createdAt"/></b></td>
        </tr>


        <c:forEach var="c" items="${comments }">
            <tr>
                    <%--<td><img src="/resources/images/<c:out value="${e.id}"/>.jpg" alt="/resources/images/<c:out value="${e.id}"/>.jpg" class="img-thumbnail"></td>--%>
                        <td class="text-break" align="center"  width="150" align="center"><c:out value="${c.content }" /></td>
                        <td align="center"  width="150" align="center"><c:out value="${c.createdAt }" /></td>





            </tr>
        </c:forEach>

    </table>
</div>

<%--<c:url var="viewexpert" value="${'/viewexpert'}">--%>
    <%--<c:param name="id" value="${e.id}"/>--%>
<%--</c:url>--%>

<a href="${pageContext.request.contextPath}/index " align="center" class="btn btn-primary">Wróć</a>

</body>
</html>