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
lyrics = song.lyrics

translation = ts.translate_text(song.lyrics,from_language='ko', to_language='en', if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)

lyrisList = lyrics.split("\n\n")
translationList = translation.split("\n\n")

for l in lyrisList:
    for t in translationList:
        print(l)
        print("-----")
        print(t)
        print("\n")

# print(lyrislist)
# print(len(lyrislist))

class SpotifySong:
    def __init__(self, songName) -> None:
        self.songName = songName

    def getSongArtist():
        return

    def getSongLyrics():
        return

    def getFullSongTranslation(fromLang, toLang):
        return ts.translate_text(song.lyrics,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)


    def getLyricsAndTranslation(fromLang, toLang):
        translation = ts.translate_text(song.lyrics,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)

        lyrisList = lyrics.split("\n\n")
        translationList = translation.split("\n\n")
        lyrisList = lyrics.split("\n\n")
        translationList = translation.split("\n\n")

        for l in lyrisList:
            for t in translationList:
                print(l)
                print("-----")
                print(t)
                print("\n")
        return

    def getSongRomanization():
        return 