from flask import request
from flask_restx import Resource, Namespace, reqparse
from app.models.spotifyModel import SpotifyGeneral

parser = reqparse.RequestParser()
parser.add_argument('songtitle', type=str, location='args')
parser.add_argument('artist', type=str, location='args')
# parser.add_argument('User-Agent', location='headers')


lyricsNamespace = Namespace('lyrics', 'Lyrics related endpoints')

@lyricsNamespace.route("/")
@lyricsNamespace.expect(parser)
class MainClass(Resource):
	def get(self):
		song  = request.args.get('songtitle', None)
		artist  = request.args.get('artist', None)
		return SpotifyGeneral.getLyrics(song, artist)
		

