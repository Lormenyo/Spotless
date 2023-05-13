import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json
import lyricsgenius
from decouple import config





sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=config("clientId"),
                                                           client_secret=config("clientSecret")))

print(f'>>>>>--------------- {config("lyricsAccessToken")}')
genius = lyricsgenius.Genius(config("lyricsAccessToken"))

   



