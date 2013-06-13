<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title><g:layoutTitle default="IBMCLUB"/></title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- TODO -->

<!-- 	<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">	 -->
<!-- 	<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}"> -->
<!-- 	<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}"> -->
	
<!-- 	<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css"> -->
<!-- 	<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css"> -->

	<!-- google fonts api -->
	<link href='http://fonts.googleapis.com/css?family=Roboto+Slab|Roboto' rel='stylesheet' type='text/css'>
	
	<!-- common required resources -->
	<r:require module="bootstrap"/>

	<g:layoutHead/>
	<r:layoutResources />
</head>
<body>
	<div id="grailsLogo" role="banner">
		<a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a>
	</div>
	<g:layoutBody/>
	<div class="footer" role="contentinfo"></div>
	<div id="spinner" class="spinner" style="display:none;">
		<g:message code="spinner.alt" default="Loading&hellip;"/>
	</div>
	<g:javascript library="application"/>
	<r:layoutResources />
</body>
</html>
