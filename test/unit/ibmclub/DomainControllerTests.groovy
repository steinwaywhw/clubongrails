package ibmclub



import org.junit.*
import grails.test.mixin.*

@TestFor(DomainController)
@Mock(Domain)
class DomainControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/domain/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.domainInstanceList.size() == 0
        assert model.domainInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.domainInstance != null
    }

    void testSave() {
        controller.save()

        assert model.domainInstance != null
        assert view == '/domain/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/domain/show/1'
        assert controller.flash.message != null
        assert Domain.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/domain/list'

        populateValidParams(params)
        def domain = new Domain(params)

        assert domain.save() != null

        params.id = domain.id

        def model = controller.show()

        assert model.domainInstance == domain
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/domain/list'

        populateValidParams(params)
        def domain = new Domain(params)

        assert domain.save() != null

        params.id = domain.id

        def model = controller.edit()

        assert model.domainInstance == domain
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/domain/list'

        response.reset()

        populateValidParams(params)
        def domain = new Domain(params)

        assert domain.save() != null

        // test invalid parameters in update
        params.id = domain.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/domain/edit"
        assert model.domainInstance != null

        domain.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/domain/show/$domain.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        domain.clearErrors()

        populateValidParams(params)
        params.id = domain.id
        params.version = -1
        controller.update()

        assert view == "/domain/edit"
        assert model.domainInstance != null
        assert model.domainInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/domain/list'

        response.reset()

        populateValidParams(params)
        def domain = new Domain(params)

        assert domain.save() != null
        assert Domain.count() == 1

        params.id = domain.id

        controller.delete()

        assert Domain.count() == 0
        assert Domain.get(domain.id) == null
        assert response.redirectedUrl == '/domain/list'
    }
}
