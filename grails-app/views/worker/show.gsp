
<%@ page import="extjstest.Worker" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'worker.label', default: 'Worker')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-worker" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-worker" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list worker">
			
				<g:if test="${workerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="worker.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${workerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workerInstance?.idCode}">
				<li class="fieldcontain">
					<span id="idCode-label" class="property-label"><g:message code="worker.idCode.label" default="Id Code" /></span>
					
						<span class="property-value" aria-labelledby="idCode-label"><g:fieldValue bean="${workerInstance}" field="idCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${workerInstance?.division}">
				<li class="fieldcontain">
					<span id="division-label" class="property-label"><g:message code="worker.division.label" default="Division" /></span>
					
						<span class="property-value" aria-labelledby="division-label"><g:link controller="division" action="show" id="${workerInstance?.division?.id}">${workerInstance?.division?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${workerInstance?.id}" />
					<g:link class="edit" action="edit" id="${workerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
