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

<%--<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />--%>

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
                var searchLink = '${pageContext.request.contextPath}/admin/users/search/' + searchWord;
                window.location.href=searchLink;
            }
        }
    </script>
<body>
<div>
    <%@include file="/WEB-INF/incl/menu.app" %>
</div>
<div>
    <p><s:message code="info.description2"/></p>
</div>

<div type="text" style="width: 1000px; padding: 10px;" class="input-group mb-3">
    <input type="text" id="searchString"/>&nbsp;&nbsp;<input type="button" class="btn btn-primary" value="<s:message code="button.search"/>"
                                                             onclick="startSerach();"/>
    <span id="errorSearch" style="color: red;"></span>
</div>

<div class="tableback" style="background-image: url(/resources/images/backremont.png)" >


    <table class="tableback" style="opacity: 0.9">

        <tr>
            <td width="150" align="center"><b>  </b></td>
            <td width="150" align="center"><b><s:message code="expert.name"/></b></td>
            <td width="150" align="center"><b><s:message code="expert.location"/></b></td>
            <td width="150" align="center"><b><s:message code="expert.job"/></b></td>
            <td width="150" align="center"><b><s:message code="expert.number"/></b></td>
        </tr>
        <c:forEach var="e" items="${expertList }">
            <tr>
<%--                <td><img src="data:image/jpeg;base64,${e.image_url}" class="rounded float-left" alt="..."></td>--%>
                <td>
                <div class="card" style="width: 18rem;">
                    <img src="data:image/jpeg;base64,${e.image_url}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <p class="card-text">Zrealizowana usługa</p>
                    </div>
                </div>
                </td>
                <td align="center"  width="150" align="center"><c:out value="${e.name }" /></td>
                <td align="center"  width="150" align="center"><c:out value="${e.location }" /></td>
                <td align="center"  width="150" align="center"><c:out value="${e.job }" /></td>
                <td align="center"  width="150" align="center"><c:out value="${e.number }" /></td>



            </tr>
        </c:forEach>
    </table>

</div>





</body>
</html>