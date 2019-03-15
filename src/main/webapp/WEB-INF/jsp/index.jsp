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

    <%--<!-- Bootstrap CSS -->--%>
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>

    <%--<!-- css custom styling-->--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />&ndash;%&gt;--%>

    <%--&lt;%&ndash;&lt;%&ndash;<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />&ndash;%&gt;&ndash;%&gt;--%>

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
                var searchLink = '${pageContext.request.contextPath}/search/' + searchWord;
                window.location.href=searchLink;
            }
        }
    </script>
<body>
<div>
    <%@include file="/WEB-INF/incl/menu.app" %>
</div>
    <div class="tableback">
<p><s:message code="info.description2"/></p>


    <div type="text" style="width: 1000px; padding: 10px;" class="input-group mb-3">
        <input type="text" id="searchString"/>&nbsp;&nbsp;<input type="button" class="btn btn-primary" value="<s:message code="button.search"/>"
                                                                 onclick="startSerach();"/>
        <span id="errorSearch" style="color: red;"></span>
    </div>


</div>







<div class="tableback" >


<table class="tableback" style="opacity: 0.9">

 <tr>
     <td width="150" align="center"><b><s:message code="admin.user.id"/></b></td>
     <td width="150" align="center"><b><s:message code="expert.job"/></b></td>
     <td width="150" align="center"><b><s:message code="expert.years"/></b></td>
     <td width="150" align="center"><b><s:message code="expert.location"/></b></td>
     <td width="150" align="center"><b><s:message code="expert.project"/></b></td>
     <td width="150" align="center"><b><s:message code="expert.project"/></b></td>
 </tr>
    <c:forEach var="e" items="${expertList }">
    <tr>
        <%--<td><img src="/resources/images/<c:out value="${e.id}"/>.jpg" alt="/resources/images/<c:out value="${e.id}"/>.jpg" class="img-thumbnail"></td>--%>
        <td align="center"  width="150" align="center"><c:out value="${e.job }" /></td>
        <td align="center"  width="150" align="center"><c:out value="${e.years }" /></td>
        <td align="center"  width="150" align="center"><c:out value="${e.location }" /></td>
        <td align="center"  width="150" align="center"><c:out value="${e.project }" /></td>
        <td align="center"  width="150" align="center"><a class="btn btn-primary" href="${pageContext.request.contextPath}/addcomment" role="button">Comment</a></td>
    </tr>



    </c:forEach>





</table>
</div>

</body>
</html>