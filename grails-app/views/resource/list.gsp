
<%@ page import="extjstest.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-resource" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'resource.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="validFrom" title="${message(code: 'resource.validFrom.label', default: 'Valid From')}" />
					
						<g:sortableColumn property="validTo" title="${message(code: 'resource.validTo.label', default: 'Valid To')}" />
					
						<th><g:message code="resource.division.label" default="Division" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${resourceInstanceList}" status="i" var="resourceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${resourceInstance.id}">${fieldValue(bean: resourceInstance, field: "name")}</g:link></td>
					
						<td><g:formatDate date="${resourceInstance.validFrom}" /></td>
					
						<td><g:formatDate date="${resourceInstance.validTo}" /></td>
					
						<td>${fieldValue(bean: resourceInstance, field: "division")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${resourceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
