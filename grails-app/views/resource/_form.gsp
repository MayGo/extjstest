<%@ page import="extjstest.Resource" %>



<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="resource.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${resourceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'validFrom', 'error')} required">
	<label for="validFrom">
		<g:message code="resource.validFrom.label" default="Valid From" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validFrom" precision="day"  value="${resourceInstance?.validFrom}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'validTo', 'error')} required">
	<label for="validTo">
		<g:message code="resource.validTo.label" default="Valid To" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validTo" precision="day"  value="${resourceInstance?.validTo}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: resourceInstance, field: 'division', 'error')} required">
	<label for="division">
		<g:message code="resource.division.label" default="Division" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="division" name="division.id" from="${extjstest.Division.list()}" optionKey="id" required="" value="${resourceInstance?.division?.id}" class="many-to-one"/>
</div>

