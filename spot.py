import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json
import lyricsgenius
import translators as ts
from korean_romanizer.romanizer import Romanizer

# this one is based on python 2, so not pretty nice
# can use https://pythonhosted.org/doodle-translate/intro.html for 
# translation but the installation is not working
# it also has romanization and can detect other languages

#this one is based on python 3, not so good either
# https://pypi.org/project/googletrans/
#from googletrans import Translator


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

song = genius.search_song("Breath", "Sam Kim")
lyrics = song.lyrics
# print(lyrics)
r = Romanizer(lyrics)
print(r.romanize())
# returns 'annyeonghaseyo'

translation = ts.translate_text(song.lyrics,from_language='ko', to_language='en', if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)



class SpotifySong:
    def __init__(self, songName, artistName) -> None:
        self.songName = songName
        self.artist = genius.search_artist(artistName, max_songs=1, sort="title", include_features=True)
        self.song = genius.search_song(songName, self.artist.name)

    def getSongArtist(self,):
        return self.artist.name

    def getSongLyrics(self,):
        return self.song.lyrics

    def getFullSongTranslation(self,fromLang, toLang):
        return ts.translate_text(self.song.lyrics,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)


    def getLyricsAndTranslation(self,fromLang, toLang):
        lineLyrics = self.song.lyrics.split("\n")

        for line in lineLyrics:
            print(lineLyrics, '->', ts.translate_text(line,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000))
        return

    def getKoreanSongRomanization(self):
        r = Romanizer(self.getSongLyrics())
        return r.romanize()

    def getLanguage(self):
        return
        