package extjstest



import org.junit.*
import grails.test.mixin.*

@TestFor(LaborforceController)
@Mock(Laborforce)
class LaborforceControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/laborforce/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.laborforceInstanceList.size() == 0
        assert model.laborforceInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.laborforceInstance != null
    }

    void testSave() {
        controller.save()

        assert model.laborforceInstance != null
        assert view == '/laborforce/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/laborforce/show/1'
        assert controller.flash.message != null
        assert Laborforce.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/laborforce/list'

        populateValidParams(params)
        def laborforce = new Laborforce(params)

        assert laborforce.save() != null

        params.id = laborforce.id

        def model = controller.show()

        assert model.laborforceInstance == laborforce
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/laborforce/list'

        populateValidParams(params)
        def laborforce = new Laborforce(params)

        assert laborforce.save() != null

        params.id = laborforce.id

        def model = controller.edit()

        assert model.laborforceInstance == laborforce
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/laborforce/list'

        response.reset()

        populateValidParams(params)
        def laborforce = new Laborforce(params)

        assert laborforce.save() != null

        // test invalid parameters in update
        params.id = laborforce.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/laborforce/edit"
        assert model.laborforceInstance != null

        laborforce.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/laborforce/show/$laborforce.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        laborforce.clearErrors()

        populateValidParams(params)
        params.id = laborforce.id
        params.version = -1
        controller.update()

        assert view == "/laborforce/edit"
        assert model.laborforceInstance != null
        assert model.laborforceInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/laborforce/list'

        response.reset()

        populateValidParams(params)
        def laborforce = new Laborforce(params)

        assert laborforce.save() != null
        assert Laborforce.count() == 1

        params.id = laborforce.id

        controller.delete()

        assert Laborforce.count() == 0
        assert Laborforce.get(laborforce.id) == null
        assert response.redirectedUrl == '/laborforce/list'
    }
}
