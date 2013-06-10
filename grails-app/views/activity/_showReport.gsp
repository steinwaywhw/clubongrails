
<%@ page import="ibmclub.Activity" %>

<g:if test="${activityInstance?.marks}">
<li class="fieldcontain">
	<span id="marks-label" class="property-label"><g:message code="activity.marks.label" default="Marks" /></span>
	<span class="property-value" aria-labelledby="marks-label"><g:fieldValue bean="${activityInstance}" field="marks"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.nrStudents}">
<li class="fieldcontain">
	<span id="nrStudents-label" class="property-label"><g:message code="activity.nrStudents.label" default="Nr Students" /></span>
	<span class="property-value" aria-labelledby="nrStudents-label"><g:fieldValue bean="${activityInstance}" field="nrStudents"/></span>
</li>
</g:if>

<g:if test="${activityInstance?.nrNonStudents}">
<li class="fieldcontain">
	<span id="nrNonStudents-label" class="property-label">
		<g:message code="activity.nrNonStudents.label" default="Nr Non Students" />
	</span>
	<span class="property-value" aria-labelledby="nrNonStudents-label">
		<g:fieldValue bean="${activityInstance}" field="nrNonStudents"/>
	</span>
</li>
</g:if>

<g:if test="${activityInstance?.report}">
<li class="fieldcontain">
	<span id="report-label" class="property-label">
		<g:message code="activity.report.label" default="Report" />
	</span>
	<span class="property-value" aria-labelledby="report-label">
		<g:fieldValue bean="${activityInstance}" field="report"/>
	</span>
</li>
</g:if>
			
			