<table width="100%" border="0" cellpadding="8" cellspacing="4" class="tableMenuBg" bgcolor="#FFD700">
	<tr>
		<td align="left" width="600">
			<a class="btn btn-primary" role="button" href="/"><s:message code="menu.mainPage"/></a>&nbsp;&nbsp;
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/admin"><s:message code="menu.adminPage"/></a>
			</sec:authorize>
		</td>
		<td  align="right" width="600">
		<sec:authorize access="hasRole('ANONYMOUS')">
<a class="btn btn-primary" role="button" href="/login"><s:message code="menu.login"/></a>&nbsp;&nbsp;
<a class="btn btn-primary" role="button" href="/register"><s:message code="menu.register"/></a>&nbsp;&nbsp;
<a class="btn btn-primary" role="button" href="/addexpert"><s:message code="menu.addexpert"/></a>&nbsp;&nbsp;
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a class="btn btn-primary" role="button" href="/profil"><s:message code="menu.profil"/></a>
			<a class="btn btn-primary" role="button" href="/logout"><s:message code="menu.logout"/></a>
			<a class="btn btn-primary" role="button" href="/addexpert"><s:message code="menu.addexpert"/></a>
		</sec:authorize>
		</td>
	</tr>
</table>

