class BootStrap {

    def init = { servletContext ->
		if(extjstest.Division.count()==0)
		 	extjstest.TestDataService.generateTestData()
    }
    def destroy = {
    }
}
