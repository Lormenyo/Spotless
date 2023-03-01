from flask_restx import Resource, Namespace


trendingNamespace = Namespace('trending', 'Trending songs related endpoints')


@trendingNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return {
			"status": "Got new data"
		}
	def post(self):
		return {
			"status": "Posted new data"
		}