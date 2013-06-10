package ibmclub

class ActivityLog {

	Date dateCreated
	String note

	User prevCharger
	User nextCharger

	static belongsTo = [activity: Activity]

    static constraints = {
    	dateCreated ()
    	activity ()
    	note blank: true, maxSize: 100
    	prevCharger nullable: true
    	nextCharger nullable: true
    }

    static mapping = {
    	sort name: "dateCreated", order: "desc"
    }
}
