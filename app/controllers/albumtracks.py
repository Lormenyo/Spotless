from flask_restx import Resource, Namespace

from app.models.spotifyModel import SpotifyGeneral


albumTracksNamespace = Namespace('albumTracks', 'Top Playlists related endpoints')


@albumTracksNamespace.route("/<id>")
class MainClass(Resource):
	def get(self, id):
		return SpotifyGeneral.getAlbumTracks(id)
		
