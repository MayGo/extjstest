package extjstest



import org.junit.*
import grails.test.mixin.*

@TestFor(WorkerController)
@Mock(Worker)
class WorkerControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/worker/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.workerInstanceList.size() == 0
        assert model.workerInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.workerInstance != null
    }

    void testSave() {
        controller.save()

        assert model.workerInstance != null
        assert view == '/worker/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/worker/show/1'
        assert controller.flash.message != null
        assert Worker.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/worker/list'

        populateValidParams(params)
        def worker = new Worker(params)

        assert worker.save() != null

        params.id = worker.id

        def model = controller.show()

        assert model.workerInstance == worker
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/worker/list'

        populateValidParams(params)
        def worker = new Worker(params)

        assert worker.save() != null

        params.id = worker.id

        def model = controller.edit()

        assert model.workerInstance == worker
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/worker/list'

        response.reset()

        populateValidParams(params)
        def worker = new Worker(params)

        assert worker.save() != null

        // test invalid parameters in update
        params.id = worker.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/worker/edit"
        assert model.workerInstance != null

        worker.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/worker/show/$worker.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        worker.clearErrors()

        populateValidParams(params)
        params.id = worker.id
        params.version = -1
        controller.update()

        assert view == "/worker/edit"
        assert model.workerInstance != null
        assert model.workerInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/worker/list'

        response.reset()

        populateValidParams(params)
        def worker = new Worker(params)

        assert worker.save() != null
        assert Worker.count() == 1

        params.id = worker.id

        controller.delete()

        assert Worker.count() == 0
        assert Worker.get(worker.id) == null
        assert response.redirectedUrl == '/worker/list'
    }
}
