
<%@ page import="extjstest.Resource" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'resource.label', default: 'Resource')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-resource" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-resource" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list resource">
			
				<g:if test="${resourceInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="resource.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${resourceInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.validFrom}">
				<li class="fieldcontain">
					<span id="validFrom-label" class="property-label"><g:message code="resource.validFrom.label" default="Valid From" /></span>
					
						<span class="property-value" aria-labelledby="validFrom-label"><g:formatDate date="${resourceInstance?.validFrom}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.validTo}">
				<li class="fieldcontain">
					<span id="validTo-label" class="property-label"><g:message code="resource.validTo.label" default="Valid To" /></span>
					
						<span class="property-value" aria-labelledby="validTo-label"><g:formatDate date="${resourceInstance?.validTo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${resourceInstance?.division}">
				<li class="fieldcontain">
					<span id="division-label" class="property-label"><g:message code="resource.division.label" default="Division" /></span>
					
						<span class="property-value" aria-labelledby="division-label"><g:link controller="division" action="show" id="${resourceInstance?.division?.id}">${resourceInstance?.division?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${resourceInstance?.id}" />
					<g:link class="edit" action="edit" id="${resourceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
