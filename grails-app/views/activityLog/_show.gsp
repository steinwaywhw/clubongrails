
<%@ page import="ibmclub.ActivityLog" %>

<div id="show-activityLog" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
	<div class="message" role="status">${flash.message}</div>
	</g:if>
	<ol class="property-list activityLog">
	
		<g:if test="${activityLogInstance?.dateCreated}">
		<li class="fieldcontain">
			<span id="dateCreated-label" class="property-label"><g:message code="activityLog.dateCreated.label" default="Date Created" /></span>
			
				<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${activityLogInstance?.dateCreated}" /></span>
			
		</li>
		</g:if>
	
		<g:if test="${activityLogInstance?.activity}">
		<li class="fieldcontain">
			<span id="activity-label" class="property-label"><g:message code="activityLog.activity.label" default="Activity" /></span>
			
				<span class="property-value" aria-labelledby="activity-label"><g:link controller="activity" action="show" id="${activityLogInstance?.activity?.id}">${activityLogInstance?.activity?.encodeAsHTML()}</g:link></span>
			
		</li>
		</g:if>
	
		<g:if test="${activityLogInstance?.note}">
		<li class="fieldcontain">
			<span id="note-label" class="property-label"><g:message code="activityLog.note.label" default="Note" /></span>
			
				<span class="property-value" aria-labelledby="note-label"><g:fieldValue bean="${activityLogInstance}" field="note"/></span>
			
		</li>
		</g:if>
	
		<g:if test="${activityLogInstance?.prevCharger}">
		<li class="fieldcontain">
			<span id="prevCharger-label" class="property-label"><g:message code="activityLog.prevCharger.label" default="Prev Charger" /></span>
			
				<span class="property-value" aria-labelledby="prevCharger-label"><g:link controller="user" action="show" id="${activityLogInstance?.prevCharger?.id}">${activityLogInstance?.prevCharger?.encodeAsHTML()}</g:link></span>
			
		</li>
		</g:if>
	
		<g:if test="${activityLogInstance?.nextCharger}">
		<li class="fieldcontain">
			<span id="nextCharger-label" class="property-label"><g:message code="activityLog.nextCharger.label" default="Next Charger" /></span>
			
				<span class="property-value" aria-labelledby="nextCharger-label"><g:link controller="user" action="show" id="${activityLogInstance?.nextCharger?.id}">${activityLogInstance?.nextCharger?.encodeAsHTML()}</g:link></span>
			
		</li>
		</g:if>
	
	</ol>
</div>
