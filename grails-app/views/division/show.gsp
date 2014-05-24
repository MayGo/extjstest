
<%@ page import="extjstest.Division" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'division.label', default: 'Division')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-division" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-division" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list division">
			
				<g:if test="${divisionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="division.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${divisionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${divisionInstance?.headDivision}">
				<li class="fieldcontain">
					<span id="headDivision-label" class="property-label"><g:message code="division.headDivision.label" default="Head Division" /></span>
					
						<span class="property-value" aria-labelledby="headDivision-label"><g:link controller="division" action="show" id="${divisionInstance?.headDivision?.id}">${divisionInstance?.headDivision?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${divisionInstance?.idTrail}">
				<li class="fieldcontain">
					<span id="idTrail-label" class="property-label"><g:message code="division.idTrail.label" default="Id Trail" /></span>
					
						<span class="property-value" aria-labelledby="idTrail-label"><g:fieldValue bean="${divisionInstance}" field="idTrail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${divisionInstance?.nameTrail}">
				<li class="fieldcontain">
					<span id="nameTrail-label" class="property-label"><g:message code="division.nameTrail.label" default="Name Trail" /></span>
					
						<span class="property-value" aria-labelledby="nameTrail-label"><g:fieldValue bean="${divisionInstance}" field="nameTrail"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${divisionInstance?.id}" />
					<g:link class="edit" action="edit" id="${divisionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
