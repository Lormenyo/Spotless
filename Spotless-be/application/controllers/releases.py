from flask_restx import Resource, Namespace

from application.models.spotifyModel import SpotifyGeneral


releaseNamespace = Namespace('release', 'New Release related endpoints')


@releaseNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return {
			"status": "Got new data",
            "data": SpotifyGeneral.getNewReleases()
		}
