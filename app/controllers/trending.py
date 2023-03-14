from flask_restx import Resource, Namespace
from app.models.spotifyModel import SpotifyGeneral


trendingNamespace = Namespace('trending', 'Trending songs related endpoints')


@trendingNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return SpotifyGeneral.getTop50Global()
