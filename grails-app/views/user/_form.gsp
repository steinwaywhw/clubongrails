<%@ page import="ibmclub.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'realName', 'error')} required">
	<label for="realName">
		<g:message code="user.realName.label" default="Real Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="realName" maxlength="20" required="" value="${userInstance?.realName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} ">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		
	</label>
	<g:field type="password" name="password" maxlength="30" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="user.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="role" from="${ibmclub.UserRole?.values()}" keys="${ibmclub.UserRole.values()*.name()}" required="" value="${userInstance?.role?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'introduction', 'error')} ">
	<label for="introduction">
		<g:message code="user.introduction.label" default="Introduction" />
		
	</label>
	<g:textArea name="introduction" cols="40" rows="5" maxlength="140" value="${userInstance?.introduction}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="user.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" maxlength="50" value="${userInstance?.phone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="user.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="state" from="${ibmclub.UserState?.values()}" keys="${ibmclub.UserState.values()*.name()}" required="" value="${userInstance?.state?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'chargedDomain', 'error')} ">
	<label for="chargedDomain">
		<g:message code="user.chargedDomain.label" default="Charged Domain" />
		
	</label>
	<g:select id="chargedDomain" name="chargedDomain.id" from="${ibmclub.Domain.list()}" optionKey="id" value="${userInstance?.chargedDomain?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'chargedArea', 'error')} ">
	<label for="chargedArea">
		<g:message code="user.chargedArea.label" default="Charged Area" />
		
	</label>
	<g:select id="chargedArea" name="chargedArea.id" from="${ibmclub.Area.list()}" optionKey="id" value="${userInstance?.chargedArea?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'domain', 'error')} ">
	<label for="domain">
		<g:message code="user.domain.label" default="Domain" />
		
	</label>
	<g:select id="domain" name="domain.id" from="${ibmclub.Domain.list()}" optionKey="id" value="${userInstance?.domain?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'division', 'error')} ">
	<label for="division">
		<g:message code="user.division.label" default="Division" />
		
	</label>
	<g:textField name="division" maxlength="30" value="${userInstance?.division}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'position', 'error')} ">
	<label for="position">
		<g:message code="user.position.label" default="Position" />
		
	</label>
	<g:textField name="position" maxlength="30" value="${userInstance?.position}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="user.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${userInstance.constraints.gender.inList}" value="${userInstance?.gender}" valueMessagePrefix="user.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'isEmailVerified', 'error')} ">
	<label for="isEmailVerified">
		<g:message code="user.isEmailVerified.label" default="Is Email Verified" />
		
	</label>
	<g:checkBox name="isEmailVerified" value="${userInstance?.isEmailVerified}" />
</div>

