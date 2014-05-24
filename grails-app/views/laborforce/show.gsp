
<%@ page import="extjstest.Laborforce" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'laborforce.label', default: 'Laborforce')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-laborforce" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-laborforce" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list laborforce">
			
				<g:if test="${laborforceInstance?.worker}">
				<li class="fieldcontain">
					<span id="worker-label" class="property-label"><g:message code="laborforce.worker.label" default="Worker" /></span>
					
						<span class="property-value" aria-labelledby="worker-label"><g:link controller="worker" action="show" id="${laborforceInstance?.worker?.id}">${laborforceInstance?.worker?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${laborforceInstance?.validFrom}">
				<li class="fieldcontain">
					<span id="validFrom-label" class="property-label"><g:message code="laborforce.validFrom.label" default="Valid From" /></span>
					
						<span class="property-value" aria-labelledby="validFrom-label"><g:formatDate date="${laborforceInstance?.validFrom}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${laborforceInstance?.validTo}">
				<li class="fieldcontain">
					<span id="validTo-label" class="property-label"><g:message code="laborforce.validTo.label" default="Valid To" /></span>
					
						<span class="property-value" aria-labelledby="validTo-label"><g:formatDate date="${laborforceInstance?.validTo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${laborforceInstance?.resource}">
				<li class="fieldcontain">
					<span id="resource-label" class="property-label"><g:message code="laborforce.resource.label" default="Resource" /></span>
					
						<span class="property-value" aria-labelledby="resource-label"><g:link controller="resource" action="show" id="${laborforceInstance?.resource?.id}">${laborforceInstance?.resource?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${laborforceInstance?.division}">
				<li class="fieldcontain">
					<span id="division-label" class="property-label"><g:message code="laborforce.division.label" default="Division" /></span>
					
						<span class="property-value" aria-labelledby="division-label"><g:link controller="division" action="show" id="${laborforceInstance?.division?.id}">${laborforceInstance?.division?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${laborforceInstance?.id}" />
					<g:link class="edit" action="edit" id="${laborforceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
