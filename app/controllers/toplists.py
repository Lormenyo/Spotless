from flask_restx import Resource, Namespace

from app.models.spotifyModel import SpotifyGeneral


toplistsNamespace = Namespace('toplists', 'Top Playlists related endpoints')


@toplistsNamespace.route("/")
class MainClass(Resource):
	def get(self):
		return SpotifyGeneral.getCategoryPlaylists("toplists")
		
