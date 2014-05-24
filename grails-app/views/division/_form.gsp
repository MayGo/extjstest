<%@ page import="extjstest.Division" %>



<div class="fieldcontain ${hasErrors(bean: divisionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="division.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${divisionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: divisionInstance, field: 'headDivision', 'error')} ">
	<label for="headDivision">
		<g:message code="division.headDivision.label" default="Head Division" />
		
	</label>
	<g:select id="headDivision" name="headDivision.id" from="${extjstest.Division.list()}" optionKey="id" value="${divisionInstance?.headDivision?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: divisionInstance, field: 'idTrail', 'error')} ">
	<label for="idTrail">
		<g:message code="division.idTrail.label" default="Id Trail" />
		
	</label>
	<g:textField name="idTrail" value="${divisionInstance?.idTrail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: divisionInstance, field: 'nameTrail', 'error')} ">
	<label for="nameTrail">
		<g:message code="division.nameTrail.label" default="Name Trail" />
		
	</label>
	<g:textField name="nameTrail" value="${divisionInstance?.nameTrail}"/>
</div>

