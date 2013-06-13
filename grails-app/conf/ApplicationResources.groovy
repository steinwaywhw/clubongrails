modules = {
    application {
        resource url:'js/application.js'
    }

    bootstrap {
    	dependsOn 'jquery'

    	resource url: 'bootstrap/js/bootstrap.min.js'
    	resource url: 'bootstrap/css/bootstrap-responsive.min.css'
    	resource url: 'bootstrap/css/bootstrap.min.css'
    }

    ckeditor {
    	dependsOn 'jquery'

    	resource url: 'ckeditor/ckeditor.js'
    }

    tageditor {
    	dependsOn 'jquery, bootstrap'

    	resource url: 'js/bootstrap-tagmanager.js'
    	resource url: 'css/bootstrap-tagmanager.css'
    }

}