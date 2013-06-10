
<%@ page import="ibmclub.ActivityLog" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activityLog.label', default: 'ActivityLog')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activityLog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
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
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${activityLogInstance?.id}" />
					<g:link class="edit" action="edit" id="${activityLogInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
