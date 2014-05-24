package extjstest

class Resource {

    String name
	Date validFrom
	Date validTo
	Division division

    static mapping = { sort "name" }

    static constraints = {
        name nullable:false, blank:false, unique:true
		validFrom nullable:false
		validTo nullable:false
		division nullable:false
    }

   def beforeDelete() {
        //Citizen2.withNewSession { citizens*.delete() } <--- Slow
        //Citizen2.withNewSession { Citizen2.executeUpdate("delete Citizen2 where country=:country", [country: this]) } <--- do not think this is needed 
        Laborforce.executeUpdate("delete Laborforce where resource=:resource", [resource: this])
    }

    def getLaborforces() {
        Laborforce.findAllByResource(this, [sort:"name"])
    }

    String toString() {
        "Resource $name"
    }
}
