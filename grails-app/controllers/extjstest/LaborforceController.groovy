package extjstest

import org.springframework.dao.DataIntegrityViolationException

class LaborforceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [laborforceInstanceList: Laborforce.list(params), laborforceInstanceTotal: Laborforce.count()]
    }

    def create() {
        [laborforceInstance: new Laborforce(params)]
    }

    def save() {
        def laborforceInstance = new Laborforce(params)
        if (!laborforceInstance.save(flush: true)) {
            render(view: "create", model: [laborforceInstance: laborforceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), laborforceInstance.id])
        redirect(action: "show", id: laborforceInstance.id)
    }

    def show(Long id) {
        def laborforceInstance = Laborforce.get(id)
        if (!laborforceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "list")
            return
        }

        [laborforceInstance: laborforceInstance]
    }

    def edit(Long id) {
        def laborforceInstance = Laborforce.get(id)
        if (!laborforceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "list")
            return
        }

        [laborforceInstance: laborforceInstance]
    }

    def update(Long id, Long version) {
        def laborforceInstance = Laborforce.get(id)
        if (!laborforceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (laborforceInstance.version > version) {
                laborforceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'laborforce.label', default: 'Laborforce')] as Object[],
                          "Another user has updated this Laborforce while you were editing")
                render(view: "edit", model: [laborforceInstance: laborforceInstance])
                return
            }
        }

        laborforceInstance.properties = params

        if (!laborforceInstance.save(flush: true)) {
            render(view: "edit", model: [laborforceInstance: laborforceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), laborforceInstance.id])
        redirect(action: "show", id: laborforceInstance.id)
    }

    def delete(Long id) {
        def laborforceInstance = Laborforce.get(id)
        if (!laborforceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "list")
            return
        }

        try {
            laborforceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'laborforce.label', default: 'Laborforce'), id])
            redirect(action: "show", id: id)
        }
    }
}
