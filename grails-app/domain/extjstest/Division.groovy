package extjstest

class Division {

    String name
	Division headDivision

    static mapping = { sort "name" }

    static constraints = {
        name nullable:false, blank:false, unique:['headDivision']
		headDivision nullable:true
    }
	def getResources() {
		Resource.findAllByDivision(this, [sort:"name"])
	}
	
	def getSubDivisions() {
		Division.findAllByHeadDivision(this, [sort:"name"])
	}

    String toString() {
        "$name"
    }
}
