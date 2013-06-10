<%@ page import="ibmclub.Activity" %>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'marks', 'error')} required">
	<label for="marks">
		<g:message code="activity.marks.label" default="Marks" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="marks" from="${0..5}" class="range" required="" value="${fieldValue(bean: activityInstance, field: 'marks')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'nrStudents', 'error')} required">
	<label for="nrStudents">
		<g:message code="activity.nrStudents.label" default="Nr Students" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nrStudents" type="number" min="0" value="${activityInstance.nrStudents}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'nrNonStudents', 'error')} required">
	<label for="nrNonStudents">
		<g:message code="activity.nrNonStudents.label" default="Nr Non Students" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nrNonStudents" type="number" min="0" value="${activityInstance.nrNonStudents}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: activityInstance, field: 'report', 'error')} ">
	<label for="report">
		<g:message code="activity.report.label" default="Report" />
		
	</label>
	<g:textArea name="report" cols="40" rows="5" value="${activityInstance?.report}"/>
</div>

