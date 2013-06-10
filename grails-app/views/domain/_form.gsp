<%@ page import="ibmclub.Domain" %>



<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="domain.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${domainInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="domain.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${ibmclub.DomainType?.values()}" keys="${ibmclub.DomainType.values()*.name()}" required="" value="${domainInstance?.type?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="domain.introduction.label" default="Introduction" />
		
	</label>
	<g:textArea name="introduction" cols="40" rows="5" maxlength="500" value="${domainInstance?.introduction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'admin', 'error')} ">
	<label for="admin">
		<g:message code="domain.admin.label" default="Admin" />
		
	</label>
	<g:select id="admin" name="admin.id" from="${ibmclub.User.list()}" optionKey="id" value="${domainInstance?.admin?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'parent', 'error')} ">
	<label for="parent">
		<g:message code="domain.parent.label" default="Parent" />
		
	</label>
	<g:select id="parent" name="parent.id" from="${ibmclub.Domain.list()}" optionKey="id" value="${domainInstance?.parent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="domain.area.label" default="Area" />
		
	</label>
	<g:select id="area" name="area.id" from="${ibmclub.Area.list()}" optionKey="id" value="${domainInstance?.area?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domainInstance, field: 'users', 'error')} ">
	<label for="users">
		<g:message code="domain.users.label" default="Users" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${domainInstance?.users?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['domain.id': domainInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>

</div>

