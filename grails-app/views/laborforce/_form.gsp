<%@ page import="extjstest.Laborforce" %>



<div class="fieldcontain ${hasErrors(bean: laborforceInstance, field: 'worker', 'error')} required">
	<label for="worker">
		<g:message code="laborforce.worker.label" default="Worker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="worker" name="worker.id" from="${extjstest.Worker.list()}" optionKey="id" required="" value="${laborforceInstance?.worker?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: laborforceInstance, field: 'validFrom', 'error')} required">
	<label for="validFrom">
		<g:message code="laborforce.validFrom.label" default="Valid From" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validFrom" precision="day"  value="${laborforceInstance?.validFrom}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: laborforceInstance, field: 'validTo', 'error')} required">
	<label for="validTo">
		<g:message code="laborforce.validTo.label" default="Valid To" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validTo" precision="day"  value="${laborforceInstance?.validTo}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: laborforceInstance, field: 'resource', 'error')} required">
	<label for="resource">
		<g:message code="laborforce.resource.label" default="Resource" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="resource" name="resource.id" from="${extjstest.Resource.list()}" optionKey="id" required="" value="${laborforceInstance?.resource?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: laborforceInstance, field: 'division', 'error')} required">
	<label for="division">
		<g:message code="laborforce.division.label" default="Division" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="division" name="division.id" from="${extjstest.Division.list()}" optionKey="id" required="" value="${laborforceInstance?.division?.id}" class="many-to-one"/>
</div>

