from flask_restx import Resource, Namespace


lyricsNamespace = Namespace('lyrics', 'Lyrics related endpoints')


@lyricsNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return {
			"status": "Got new data"
		}
	def post(self):
		return {
			"status": "Posted new data"
		}
