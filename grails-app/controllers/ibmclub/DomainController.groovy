package ibmclub

import org.springframework.dao.DataIntegrityViolationException

class DomainController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [domainInstanceList: Domain.list(params), domainInstanceTotal: Domain.count()]
    }

    def create() {
        [domainInstance: new Domain(params)]
    }

    def save() {
        def domainInstance = new Domain(params)
        if (!domainInstance.save(flush: true)) {
            render(view: "create", model: [domainInstance: domainInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'domain.label', default: 'Domain'), domainInstance.id])
        redirect(action: "show", id: domainInstance.id)
    }

    def show(Long id) {
        def domainInstance = Domain.get(id)
        if (!domainInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "list")
            return
        }

        [domainInstance: domainInstance]
    }

    def edit(Long id) {
        def domainInstance = Domain.get(id)
        if (!domainInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "list")
            return
        }

        [domainInstance: domainInstance]
    }

    def update(Long id, Long version) {
        def domainInstance = Domain.get(id)
        if (!domainInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (domainInstance.version > version) {
                domainInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'domain.label', default: 'Domain')] as Object[],
                          "Another user has updated this Domain while you were editing")
                render(view: "edit", model: [domainInstance: domainInstance])
                return
            }
        }

        domainInstance.properties = params

        if (!domainInstance.save(flush: true)) {
            render(view: "edit", model: [domainInstance: domainInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'domain.label', default: 'Domain'), domainInstance.id])
        redirect(action: "show", id: domainInstance.id)
    }

    def delete(Long id) {
        def domainInstance = Domain.get(id)
        if (!domainInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "list")
            return
        }

        try {
            domainInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'domain.label', default: 'Domain'), id])
            redirect(action: "show", id: id)
        }
    }
}
