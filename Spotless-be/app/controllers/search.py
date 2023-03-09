from flask_restx import Resource, Namespace


searchNamespace = Namespace('search', 'Search related endpoints')

@searchNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return {
			"status": "Got new data"
		}
	def post(self):
		return {
			"status": "Posted new data"
		}