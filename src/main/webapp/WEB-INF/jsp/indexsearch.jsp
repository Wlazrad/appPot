<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s"  uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><s:message code="menu.mainPage"/></title>

    <link rel="stylesheet" type="text/css" href="/resources/css/style.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function changeTrBg(row){
            row.style.backgroundColor = "#e6e6e6";
        }

        function defaultTrBg(row){
            row.style.backgroundColor = "white";
        }

        function startSerach(){
            var searchWord = document.getElementById('searchString').value;

            if(searchWord.length < 3){
                document.getElementById("errorSearch").innerHTML = "<s:message code="error.searchString.toShort"/>";
                return false;
            } else {
                document.getElementById("errorSearch").innerHTML = "";
                var searchLink = '${pageContext.request.contextPath}/' + searchWord;
                window.location.href=searchLink;
            }
        }
    </script>
</head>
<body>
<%@include file="/WEB-INF/incl/menu.app" %>
<div>
    <h1><s:message code="info.name"></s:message></h1>
    <h3><s:message code="info.description1"></s:message></h3>
    <h3><s:message code="info.description2"></s:message></h3>
    <%@include file="/WEB-INF/incl/footer.app" %>
</div>
<div align="right" style="width: 1000px; padding: 2px;">
    <input type="text" id="searchString"/>&nbsp;&nbsp;<input type="button" value="<s:message code="button.search"/>"
                                                             onclick="startSerach();"/><br/>
    <span id="errorSearch" style="color: red;"></span>
</div>


<div class="container">
    <h1>
        <c:out value="${lal}"/>

    </h1>

    <%--<c:forEach var="e" items="${expertList}">--%>
    <%--<table class="table table-striped">--%>
    <%--<td width="40" align="center"><b><s:message code="admin.user.id"/></b></td>--%>
    <%--<td width="190" align="center"><b><s:message code="register.name"/></b></td>--%>
    <%--<td width="190" align="center"><b><s:message code="register.lastName"/></b></td>--%>
    <%--<tr>--%>

    <%--<td>--%>
    <%--<div class="shadow-none p-3 mb-5 bg-light rounded">--%>
    <%--<div class="card" style="width: 18rem;">--%>
    <%--<img src="/resources/images/stamperror.jpg" alt="..." class="img-thumbnail">--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</td>--%>
    <%--<td><c:out value="${e.job}"/></td>--%>
    <%--<td><c:out value="${e.years}"/></td>--%>
    <%--<td><c:out value="${e.location}"/></td>--%>
    <%--<td><c:out value="${e.project}"/></td>--%>
    <%--<td>--%>
    <%--</td>--%>
    <%--</tr>--%>
    <%--</table>--%>
    <%--</c:forEach>--%>








</div>

</body>
</html>