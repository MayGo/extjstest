testDataConfig {
    sampleData {
        'extjstest.Division' {
            def i = 1
            name = {-> "Division ${i++}" }   // creates "title1", "title2", ...."titleN"
        }
		'extjstest.Laborforce' {

		}
		'extjstest.Resource' {
			def i = 1
			name = {-> "Resource ${i++}" }   // creates "title1", "title2", ...."titleN"
		}
		'extjstest.Worker' {
			def i = 1
			idCode = {-> "111111${i++}" }
			name = {-> "Jaan Jalgratas ${i++}" }   // creates "title1", "title2", ...."titleN"
		}
    }
}