package ibmclub.commands
import ibmclub.*
import grails.validation.*


@Validateable
class SubmitReportCommand {
	Integer marks
	Integer nrStudents
	Integer nrNonStudents
	String report

	static constraints = {
		importFrom Activity	
	}
}