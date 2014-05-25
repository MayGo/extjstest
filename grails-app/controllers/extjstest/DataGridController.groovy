package extjstest

import grails.converters.JSON

class DataGridController {

	def index() {
	}
	//?_dc=1400945136794&page=4&start=300&limit=100&sort=threadid&dir=ASC&callback=Ext.data.JsonP.callback22
	def list(Integer limit, Integer start) {
		params.max = Math.min(limit ?: 100, 100)
		params.offset = start
		//params.remove('page')
		params.order = params.dir

		List<Resource> resources = Resource.list(params)

		String callback=params.callback

		String json = [
			'totalCount':resources.totalCount,
			'resources':resources.collect{resource->
				[
					'id':resource.id,
					'name':resource.name,
					'validFrom':resource.validFrom,
					'validTo':resource.validTo,
					'division':[
						'id':resource.division.id,
						'name':resource.division.name,
						'idTrail':resource.division.idTrail,
						'nameTrail':resource.division.nameTrail]
				]
			}
		] as JSON
		render "$callback($json)" //GSON
	}

}
