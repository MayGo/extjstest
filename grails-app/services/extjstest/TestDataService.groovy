package extjstest

class TestDataService {

	static void generateTestData() {
		println "Generating test data."
		Date now=new Date()
		now.clearTime()
		(1..4).each{nr->
			Division headDivision=Division.build()
			
			
			(1..5).each{subNr->
				
				
				Division subHeadDivision=Division.build(name:"SubDivision $subNr", headDivision:headDivision)
				(1..10).each{subSubNr->
					
					
					Division subSubDivion = Division.build(name:"SubSubDivision $subSubNr", headDivision:subHeadDivision)
					(1..3).each{
						
						
						Resource resource=Resource.build(division: subSubDivion, validFrom:now-10, validTo:now+10)
						(1..3).each{validNr->
							Worker worker=Worker.build(division: subSubDivion)
							Laborforce.build(worker: worker, division: subSubDivion, validFrom:now-validNr, validTo:now-(validNr+1), resource:resource)
						}
					}
				}
			}
		}

		println "Generated test data."
	}
}
