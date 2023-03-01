from flask_restx import Resource, Namespace


releaseNamespace = Namespace('release', 'New Release related endpoints')


@releaseNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return {
			"status": "Got new data"
		}
	def post(self):
		return {
			"status": "Posted new data"
		}