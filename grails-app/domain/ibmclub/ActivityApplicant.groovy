package ibmclub

class ActivityApplicant {

	User user
	Date dateCreated

	static belongsTo = [activity: Activity]

    static constraints = {
    	activity ()
    	dateCreated ()
    	user validator: {val, obj ->
    		return val.role == UserRole.ACADMIN || val.role == UserRole.ACMEMBER
    	}
    }
}
