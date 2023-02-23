import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json
import lyricsgenius




configFile = open("config.json")
config = json.load(configFile)
configFile.close()
sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=config["clientId"],
                                                           client_secret=config["clientSecret"]))
genius = lyricsgenius.Genius(config["lyricsAccessToken"])
   



