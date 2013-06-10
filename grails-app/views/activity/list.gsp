
<%@ page import="ibmclub.Activity" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activity" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'activity.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="type" title="${message(code: 'activity.type.label', default: 'Type')}" />
					
						<g:sortableColumn property="state" title="${message(code: 'activity.state.label', default: 'State')}" />
					
						<th><g:message code="activity.creator.label" default="Creator" /></th>
					
						<th><g:message code="activity.currentCharger.label" default="Current Charger" /></th>
					
						<g:sortableColumn property="mainTopic" title="${message(code: 'activity.mainTopic.label', default: 'Main Topic')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activityInstanceList}" status="i" var="activityInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: activityInstance, field: "type")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "state")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "creator")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "currentCharger")}</td>
					
						<td>${fieldValue(bean: activityInstance, field: "mainTopic")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activityInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
