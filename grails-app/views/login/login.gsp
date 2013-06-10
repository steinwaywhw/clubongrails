<%@ page import="ibmclub.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'login.label', default: 'Login')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<h1><g:message code="default.login.label" args="[entityName]" default="Login"/></h1>

			<!-- Flash Message -->
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			<!-- Error Message -->
			<g:hasErrors bean="${loginCommandInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${loginCommandInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>

			<g:form action="" >
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: loginCommandInstance, field: 'email', 'error')} required">
						<label for="email">
							<g:message code="login.email.label" default="Email" />
							<span class="required-indicator">*</span>
						</label>
						<g:field type="email" name="email" required="" value="${loginCommandInstance?.email}"/>
					</div>

					<div class="fieldcontain ${hasErrors(bean: loginCommandInstance, field: 'password', 'error')} ">
						<label for="password">
							<g:message code="login.password.label" default="Password" />
							
						</label>
						<g:field type="password" name="password" maxlength="30" value="${loginCommandInstance?.password}"/>
					</div>

				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="login" class="save" value="${message(code: 'default.button.login.label', default: 'Login')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>




		