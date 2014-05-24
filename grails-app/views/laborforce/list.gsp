
<%@ page import="extjstest.Laborforce" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laborforce.label', default: 'Laborforce')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-laborforce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-laborforce" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="laborforce.worker.label" default="Worker" /></th>
					
						<g:sortableColumn property="validFrom" title="${message(code: 'laborforce.validFrom.label', default: 'Valid From')}" />
					
						<g:sortableColumn property="validTo" title="${message(code: 'laborforce.validTo.label', default: 'Valid To')}" />
					
						<th><g:message code="laborforce.resource.label" default="Resource" /></th>
					
						<th><g:message code="laborforce.division.label" default="Division" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${laborforceInstanceList}" status="i" var="laborforceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${laborforceInstance.id}">${fieldValue(bean: laborforceInstance, field: "worker")}</g:link></td>
					
						<td><g:formatDate date="${laborforceInstance.validFrom}" /></td>
					
						<td><g:formatDate date="${laborforceInstance.validTo}" /></td>
					
						<td>${fieldValue(bean: laborforceInstance, field: "resource")}</td>
					
						<td>${fieldValue(bean: laborforceInstance, field: "division")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${laborforceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
