import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json

configFile = open("config.json")

config = json.load(configFile)

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=config["clientId"],
                                                           client_secret=config["clientSecret"]))

results = sp.search(q='weezer', limit=20)
for idx, track in enumerate(results['tracks']['items']):
    print(idx, track['name'])