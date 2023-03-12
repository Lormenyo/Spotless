from flask_restx import Resource, Namespace

from app.models.spotifyModel import SpotifyGeneral


genreNamespace = Namespace('genre', 'Genre Playlists related endpoints')


@genreNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return SpotifyGeneral.getCategories()
		
