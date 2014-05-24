package extjstest

class Division {

	String name
	Division headDivision
	String idTrail
	String nameTrail

	static mapping = { sort "nameTrail" }

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
	String calcNameTrail(){
		String trail="/"
		trail = (headDivision)?headDivision?.calcNameTrail():''
		trail += "/$name"
	}
	String calcIdTrail(){
		String trail="/"
		trail = (headDivision)?headDivision?.calcIdTrail():''
		trail += "/$id"
	}
	def afterInsert() {
		idTrail=calcIdTrail()
		nameTrail=calcNameTrail()
	}
	def beforeUpdate() {
		idTrail=calcIdTrail()
		nameTrail=calcNameTrail()
	}

	String toString() {
		"$name"
	}
}
