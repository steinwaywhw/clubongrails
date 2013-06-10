<%@ page import="ibmclub.Area" %>



<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="area.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="30" required="" value="${areaInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="area.introduction.label" default="Introduction" />
		
	</label>
	<g:textArea name="introduction" cols="40" rows="5" maxlength="500" value="${areaInstance?.introduction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'admin', 'error')} ">
	<label for="admin">
		<g:message code="area.admin.label" default="Admin" />
		
	</label>
	<g:select id="admin" name="admin.id" from="${ibmclub.User.list()}" optionKey="id" value="${areaInstance?.admin?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: areaInstance, field: 'domains', 'error')} ">
	<label for="domains">
		<g:message code="area.domains.label" default="Domains" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${areaInstance?.domains?}" var="d">
    <li><g:link controller="domain" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="domain" action="create" params="['area.id': areaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'domain.label', default: 'Domain')])}</g:link>
</li>
</ul>

</div>

