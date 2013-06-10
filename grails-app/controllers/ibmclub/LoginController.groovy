package ibmclub

class LoginController {

    def securityService

    def index(LoginCommand cmd) { 
    	if (request.method == 'GET') {
    		render(view: "login", model: [loginCommandInstance: new LoginCommand ()])
    		return
    	} else {
    		if (!cmd.validate()) {
                render(view: "login", model: [loginCommandInstance: cmd])
                return
            }

            def user = securityService.login(cmd.email, cmd.password)
            if (!user) {
                flash.message = "Login Failed"
                render(view: "login", model: [loginCommandInstance: cmd])
                return
            }

            session.user = user
            redirect(uri: "/")
    	}
    }
}

class LoginCommand {
	String email
	String password

	static constraints = {
		email email: true, blank: false
		password password: true, blank: false
	}
}
