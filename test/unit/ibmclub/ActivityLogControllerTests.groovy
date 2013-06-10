package ibmclub



import org.junit.*
import grails.test.mixin.*

@TestFor(ActivityLogController)
@Mock(ActivityLog)
class ActivityLogControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/activityLog/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.activityLogInstanceList.size() == 0
        assert model.activityLogInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.activityLogInstance != null
    }

    void testSave() {
        controller.save()

        assert model.activityLogInstance != null
        assert view == '/activityLog/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/activityLog/show/1'
        assert controller.flash.message != null
        assert ActivityLog.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/activityLog/list'

        populateValidParams(params)
        def activityLog = new ActivityLog(params)

        assert activityLog.save() != null

        params.id = activityLog.id

        def model = controller.show()

        assert model.activityLogInstance == activityLog
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/activityLog/list'

        populateValidParams(params)
        def activityLog = new ActivityLog(params)

        assert activityLog.save() != null

        params.id = activityLog.id

        def model = controller.edit()

        assert model.activityLogInstance == activityLog
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/activityLog/list'

        response.reset()

        populateValidParams(params)
        def activityLog = new ActivityLog(params)

        assert activityLog.save() != null

        // test invalid parameters in update
        params.id = activityLog.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/activityLog/edit"
        assert model.activityLogInstance != null

        activityLog.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/activityLog/show/$activityLog.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        activityLog.clearErrors()

        populateValidParams(params)
        params.id = activityLog.id
        params.version = -1
        controller.update()

        assert view == "/activityLog/edit"
        assert model.activityLogInstance != null
        assert model.activityLogInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/activityLog/list'

        response.reset()

        populateValidParams(params)
        def activityLog = new ActivityLog(params)

        assert activityLog.save() != null
        assert ActivityLog.count() == 1

        params.id = activityLog.id

        controller.delete()

        assert ActivityLog.count() == 0
        assert ActivityLog.get(activityLog.id) == null
        assert response.redirectedUrl == '/activityLog/list'
    }
}
