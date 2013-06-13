<!-- <%@ page import="ibmclub.User" %> -->


<div class="container">
	<div class="navbar">
		<div class="navbar-inner">
			<a class="brand" href="${createLink(uri: '/')}">
				<g:message code="web.navbar.brand" default="Default Brand"/>
			</a>

			<ul class="nav">
				<li class="active"><a href="${createLink(uri: '/')}">Home</a></li>
			</ul>

			<form action="#" class="navbar-form pull-right">
				<input type="email" placeholder="Email" >
				<input type="password" placeholder="Password" >

				<button type="submit" class="btn btn-primary">Login</button>
				<button class="btn">Sign Up</button>
			</form>
		</div>
	</div>
</div>