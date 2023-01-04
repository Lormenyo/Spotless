import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json
import lyricsgenius
import translators as ts

configFile = open("config.json")

config = json.load(configFile)

configFile.close()

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=config["clientId"],
                                                           client_secret=config["clientSecret"]))

genius = lyricsgenius.Genius(config["lyricsAccessToken"])

results = sp.search(q='weezer', limit=5)
for idx, track in enumerate(results['tracks']['items']):
    print(idx, track['name'])

print("-------------LYRICS-------------------")

artist = genius.search_artist("Sam Kim", max_songs=3, sort="title", include_features=True)
print(artist.songs)

song = genius.search_song("Breath", artist.name)
print(song.lyrics)

print(ts.translate_text(song.lyrics, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000))