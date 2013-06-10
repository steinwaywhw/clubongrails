package ibmclub

class SecurityService {



    def login(String email, String password) {

    	def user = User.findByEmail(email)
    	if (user?.password == password)
    		return user
    	else 
    		return null
    }
}
