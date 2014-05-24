package extjstest

class Laborforce {

    Worker worker
	Date validFrom
    Date validTo
    Resource resource
	Division division

    static mapping = { sort "worker" }

    static constraints = {
        worker nullable:false, blank:false, unique:['resource']
        validFrom nullable:false
		validTo nullable:false
		resource nullable:false
		division nullable:false
    }

    String toString() {
        "$worker $validFrom-$validTo $resource"
    }
}
