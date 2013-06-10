
<%@ page import="ibmclub.Domain" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'domain.label', default: 'Domain')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-domain" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-domain" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list domain">
			
				<g:if test="${domainInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="domain.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${domainInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="domain.type.label" default="Type" /></span>
					
						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${domainInstance}" field="type"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.introduction}">
				<li class="fieldcontain">
					<span id="introduction-label" class="property-label"><g:message code="domain.introduction.label" default="Introduction" /></span>
					
						<span class="property-value" aria-labelledby="introduction-label"><g:fieldValue bean="${domainInstance}" field="introduction"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="domain.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="user" action="show" id="${domainInstance?.admin?.id}">${domainInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.parent}">
				<li class="fieldcontain">
					<span id="parent-label" class="property-label"><g:message code="domain.parent.label" default="Parent" /></span>
					
						<span class="property-value" aria-labelledby="parent-label"><g:link controller="domain" action="show" id="${domainInstance?.parent?.id}">${domainInstance?.parent?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.area}">
				<li class="fieldcontain">
					<span id="area-label" class="property-label"><g:message code="domain.area.label" default="Area" /></span>
					
						<span class="property-value" aria-labelledby="area-label"><g:link controller="area" action="show" id="${domainInstance?.area?.id}">${domainInstance?.area?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainInstance?.users}">
				<li class="fieldcontain">
					<span id="users-label" class="property-label"><g:message code="domain.users.label" default="Users" /></span>
					
						<g:each in="${domainInstance.users}" var="u">
						<span class="property-value" aria-labelledby="users-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${domainInstance?.id}" />
					<g:link class="edit" action="edit" id="${domainInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
