package ibmclub

import org.springframework.dao.DataIntegrityViolationException

class ActivityLogController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [activityLogInstanceList: ActivityLog.list(params), activityLogInstanceTotal: ActivityLog.count()]
    }

    def create() {
        [activityLogInstance: new ActivityLog(params)]
    }

    def save() {
        def activityLogInstance = new ActivityLog(params)
        if (!activityLogInstance.save(flush: true)) {
            render(view: "create", model: [activityLogInstance: activityLogInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), activityLogInstance.id])
        redirect(action: "show", id: activityLogInstance.id)
    }

    def show(Long id) {
        def activityLogInstance = ActivityLog.get(id)
        if (!activityLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "list")
            return
        }

        [activityLogInstance: activityLogInstance]
    }

    def edit(Long id) {
        def activityLogInstance = ActivityLog.get(id)
        if (!activityLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "list")
            return
        }

        [activityLogInstance: activityLogInstance]
    }

    def update(Long id, Long version) {
        def activityLogInstance = ActivityLog.get(id)
        if (!activityLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (activityLogInstance.version > version) {
                activityLogInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'activityLog.label', default: 'ActivityLog')] as Object[],
                          "Another user has updated this ActivityLog while you were editing")
                render(view: "edit", model: [activityLogInstance: activityLogInstance])
                return
            }
        }

        activityLogInstance.properties = params

        if (!activityLogInstance.save(flush: true)) {
            render(view: "edit", model: [activityLogInstance: activityLogInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), activityLogInstance.id])
        redirect(action: "show", id: activityLogInstance.id)
    }

    def delete(Long id) {
        def activityLogInstance = ActivityLog.get(id)
        if (!activityLogInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "list")
            return
        }

        try {
            activityLogInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'activityLog.label', default: 'ActivityLog'), id])
            redirect(action: "show", id: id)
        }
    }
}
