package ibmclub.commands
import ibmclub.*
import grails.validation.*


@Validateable
class CreateActivityCommand {
	"proposedBeginDate",
	"proposedEndDate",
	"coopOrg",
	"introduction",
	"mainTopic",
	"state",
	"title",
	"type",
	"note",
	"hasAC",

	static constraints = {
		importFrom Activity	
	}
}