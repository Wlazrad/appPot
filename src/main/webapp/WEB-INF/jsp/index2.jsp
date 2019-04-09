<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <%--<!-- css custom styling-->--%>
    <%--&lt;%&ndash;<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />&ndash;%&gt;--%>

    <%--&lt;%&ndash;&lt;%&ndash;<link rel="stylesheet" type="text/css" href="/resources/css/style.css" />&ndash;%&gt;&ndash;%&gt;--%>

    <script type="text/javascript">
        function changeTrBg(row) {
            row.style.backgroundColor = "#e6e6e6";
        }

        function defaultTrBg(row) {
            row.style.backgroundColor = "white";
        }

        function startSerach() {
            var searchWord = document.getElementById('searchString').value;

            if (searchWord.length < 3) {
                document.getElementById("errorSearch").innerHTML = "<s:message code="error.searchString.toShort"/>";
                return false;
            } else {
                document.getElementById("errorSearch").innerHTML = "";
                var searchLink = '${pageContext.request.contextPath}/search/' + searchWord;
                window.location.href = searchLink;
            }
        }
    </script>


<body>
<div>
    <%@include file="/WEB-INF/incl/menu.app" %>



</div>
<div class="tableback">
    <p><s:message code="info.description2"/></p>
    <div class="shadow p-3 mb-5 bg-white rounded">Wpisz słowa kluczowe np. Lokalizację, która Cię intersuje

        <div type="text" style="width: 1000px; padding: 10px;" class="input-group mb-3">
            <input type="text" id="searchString"/>&nbsp;&nbsp;<input type="button" class="btn btn-primary"
                                                                     value="<s:message code="button.search"/>"
                                                                     onclick="startSerach();"/>
            <span id="errorSearch" style="color: red;"></span>
        </div>
    </div>
</div>

<%--<div class="container-fluid" style="background-color:#e6c943">--%>

<div class="row">
    <c:forEach var="e" items="${expertList }">
        <div class="col-sm-10 col-md-4" style="text-align: center;">
            <div class="card" style="width: 15rem;">
                <img src="data:image/jpeg;base64,${e.image_url}" class="card-img-top" alt="${e.image_url}">
                <div class="card-body">
                    <h5 class="card-title"><c:out value="${e.name }"/></h5>
                    <p class="card-text"><c:out value="${e.job }"/></p>
                    <a href="${pageContext.request.contextPath}/viewexpert/${e.expert_id } " class="btn btn-primary">Info</a>
                    <a href="${pageContext.request.contextPath}/viewexpert/comment/${e.expert_id} "
                       class="btn btn-primary">Wystaw opinie</a>
                    <a href="${pageContext.request.contextPath}/photo/${e.expert_id} " class="btn btn-primary">Zdjęcie</a>
                    <a href="${pageContext.request.contextPath}/myexperts/delete/${e.expert_id} " class="btn btn-primary">Usuń</a>
                </div>
            </div>
        </div>
    </c:forEach>
    <br>
    <br>
</div>
</div>
</body>
</html>