package ibmclub

class Area {

	String name = ""
	String introduction = ""
	User admin

	static hasMany = [domains: Domain]

    static constraints = {
    	name blank: false, maxSize: 30
    	introduction widget: "textarea", maxSize: 500

    	// only ac admin can manage ac area
    	admin unique: true, nullable: true, validator: {val, obj ->
    		if (val == null)
    			return true
    		else
    			return val.role == UserRole.ACADMIN
    	}

    	domains nullable: true
    }

    String toString () {
    	return name
    }
}
