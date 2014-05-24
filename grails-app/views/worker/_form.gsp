<%@ page import="extjstest.Worker" %>



<div class="fieldcontain ${hasErrors(bean: workerInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="worker.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${workerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workerInstance, field: 'idCode', 'error')} required">
	<label for="idCode">
		<g:message code="worker.idCode.label" default="Id Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="idCode" required="" value="${workerInstance?.idCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: workerInstance, field: 'division', 'error')} required">
	<label for="division">
		<g:message code="worker.division.label" default="Division" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="division" name="division.id" from="${extjstest.Division.list()}" optionKey="id" required="" value="${workerInstance?.division?.id}" class="many-to-one"/>
</div>

