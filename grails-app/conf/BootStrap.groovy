class BootStrap {

    def init = { servletContext ->
		extjstest.TestDataService.generateTestData()
    }
    def destroy = {
    }
}
