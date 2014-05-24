package extjstest

import org.springframework.dao.DataIntegrityViolationException

class ResourceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [resourceInstanceList: Resource.list(params), resourceInstanceTotal: Resource.count()]
    }

    def create() {
        [resourceInstance: new Resource(params)]
    }

    def save() {
        def resourceInstance = new Resource(params)
        if (!resourceInstance.save(flush: true)) {
            render(view: "create", model: [resourceInstance: resourceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'resource.label', default: 'Resource'), resourceInstance.id])
        redirect(action: "show", id: resourceInstance.id)
    }

    def show(Long id) {
        def resourceInstance = Resource.get(id)
        if (!resourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "list")
            return
        }

        [resourceInstance: resourceInstance]
    }

    def edit(Long id) {
        def resourceInstance = Resource.get(id)
        if (!resourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "list")
            return
        }

        [resourceInstance: resourceInstance]
    }

    def update(Long id, Long version) {
        def resourceInstance = Resource.get(id)
        if (!resourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (resourceInstance.version > version) {
                resourceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'resource.label', default: 'Resource')] as Object[],
                          "Another user has updated this Resource while you were editing")
                render(view: "edit", model: [resourceInstance: resourceInstance])
                return
            }
        }

        resourceInstance.properties = params

        if (!resourceInstance.save(flush: true)) {
            render(view: "edit", model: [resourceInstance: resourceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'resource.label', default: 'Resource'), resourceInstance.id])
        redirect(action: "show", id: resourceInstance.id)
    }

    def delete(Long id) {
        def resourceInstance = Resource.get(id)
        if (!resourceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "list")
            return
        }

        try {
            resourceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'resource.label', default: 'Resource'), id])
            redirect(action: "show", id: id)
        }
    }
}
