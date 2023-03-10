from flask_restx import Resource, Namespace

from app.models.spotifyModel import SpotifyGeneral


releaseNamespace = Namespace('release', 'New Release related endpoints')


@releaseNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return SpotifyGeneral.getNewReleases()
		
