package ibmclub

import ibmclub.commands.*
import org.springframework.dao.DataIntegrityViolationException

class ActivityController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def beforeInterceptor = [action: this.&addTestUser]
    
    private addTestUser() {
        if (!session.user) {
            session.user = User.findByEmail("club@admin.com")
        }
        if (!session.user.isAttached())
            session.user.attach()
    }

    ActivityService activityService 

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityInstanceList: Activity.list(params), activityInstanceTotal: Activity.count()]
    }

    def create() {
        [activityInstance: new Activity(params)]
    }

    def save() {
        def activityInstance = new Activity(params)
        if (!activityInstance.save(flush: true)) {
            render(view: "create", model: [activityInstance: activityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
        redirect(action: "show", id: activityInstance.id)
    }

    def savenew() {
        def activityInstance = new Activity()
        bindData(activityInstance, params, [include: [  
            "proposedBeginDate",
            "proposedEndDate",
            "coopOrg",
            "introduction",
            "mainTopic",
            "state",
            "title",
            "type",
            "note",
            "hasAC"]])

        activityInstance = activityService.create(activityInstance, session.user)

        if (activityInstance.hasErrors()) {
            render(view: "create", model: [activityInstance: activityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
        redirect(action: "show", id: activityInstance.id)
    }

    def openapp(Long id) {
        def activityInstance = Activity.get(id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
            return
        }

        
    }

    def show(Long id) {
        def activityInstance = Activity.get(id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
            return
        }

        [activityInstance: activityInstance]
    }

    def edit(Long id) {
        def activityInstance = Activity.get(id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
            return
        }

        [activityInstance: activityInstance]
    }

    def update(Long id, Long version) {
        def activityInstance = Activity.get(id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityInstance.version > version) {
                activityInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activity.label', default: 'Activity')] as Object[],
                          "Another user has updated this Activity while you were editing")
                render(view: "edit", model: [activityInstance: activityInstance])
                return
            }
        }

        activityInstance.properties = params

        if (!activityInstance.save(flush: true)) {
            render(view: "edit", model: [activityInstance: activityInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activity.label', default: 'Activity'), activityInstance.id])
        redirect(action: "show", id: activityInstance.id)
    }

    def delete(Long id) {
        def activityInstance = Activity.get(id)
        if (!activityInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
            return
        }

        try {
            activityInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activity.label', default: 'Activity'), id])
            redirect(action: "show", id: id)
        }
    }
}
