package ibmclub

class Domain {

	String name = ""
	DomainType type
	String introduction = ""
	User admin
	Area area
	Domain parent

	static hasMany = [users: User]

	static mappedBy = [
		users: "domain",
		admin: "chargedDomain"
	]

    static constraints = {
    	name blank: false, maxSize: 30
    	type ()
    	introduction widget: 'textarea', maxSize: 500

    	// admin's type must match domain's type
    	admin nullable: true, unique: true, validator: {val, obj ->
    		if (val == null)
    			return true
    		switch (obj.type) {
    			case DomainType.CLUBDOMAIN: return val?.role == UserRole.CLUBDOMAIN
    			case DomainType.AREADOMAIN: return val?.role == UserRole.AREADOMAIN
    			case DomainType.SUPERDOMAIN: return val?.role == UserRole.SA
    			default: return false
    		}
    	}

    	// parent's type must match child's type
    	parent nullable: true, validator: {val, obj ->
    		if (val == null)
    			return true
    		switch(obj.type) {
    			case DomainType.CLUBDOMAIN: return val?.type == DomainType.AREADOMAIN
    			case DomainType.AREADOMAIN: return val?.type == DomainType.SUPERDOMAIN
    			case DomainType.SUPERDOMAIN: return val == null
    			default: return false
    		}
    	}

    	// only club domians have belonging areas
    	area nullable: true, validator: {val, obj ->
    		if (val != null)
    			return obj.type == DomainType.CLUBDOMAIN
    		else
    			return true
    	}

    	// only club domains have belonging users
    	users nullable: true, validator: {val, obj ->
    		if (val?.size() > 0)
    			return obj.type == DomainType.CLUBDOMAIN
    		else
    			return true
    	}
    }

    String toString () {
    	return name
    }
}

enum DomainType {
	CLUBDOMAIN ("俱乐部域"),
	AREADOMAIN ("地区域"),
	SUPERDOMAIN ("全国域")

	String name 

	DomainType (String name) {
		this.name = name
	}

	String toString () {
		return name
	}
}