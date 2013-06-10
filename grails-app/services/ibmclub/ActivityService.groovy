package ibmclub
import org.springframework.context.i18n.LocaleContextHolder 


class ActivityService {

    def messageSource

    def create(Activity activity, User user) {
    	assert user != null

    	activity.creator = user

    	// assign to ac manager
    	if (activity.hasAC) {
    		activity.state = ActivityState.TO_BE_PROCESSED
    		activity.currentCharger = user.chargedDomain.area.admin

    	// or wait for report
    	} else {
    		activity.state = ActivityState.REPORT_PENDING
    		activity.currentCharger = user
    	}

        // save it
    	if (!activity.save(flush: true)) {
    		activity.errors.each { 
    			log.error(it)
    		}
    	}

        // logging
        def log = new ActivityLog(
            activity: activity, 
            note: messageSource.getMessage(
                "logging.activity.created", 
                [activity.creator.toString()] as Object[], 
                new Locale("")), 
            nextCharger: activity.currentCharger).save()

    	return activity
    }

    def openApplication(Activity activity, User user) {

    }


}
