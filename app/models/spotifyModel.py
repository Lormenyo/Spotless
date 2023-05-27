from bs4 import BeautifulSoup
import langid

import requests
from app.spotifyHelper import genius, sp
import translators as ts
from korean_romanizer.romanizer import Romanizer

from app.util.proxy import get_scrapeops_url

class SpotifyGeneral:
    def __init__(self) -> None:
        pass

    @staticmethod
    def getCategories():
        return sp.categories()["categories"]["items"]
        
    @staticmethod
    def getCategoryPlaylists(id):
        return sp.category_playlists(category_id=id, limit=20)

    @staticmethod
    def getNewReleases():
        return sp.new_releases(limit=30)["albums"]["items"]
    
    @staticmethod
    def getTop50Global():
        return [track["track"]["album"] for track in sp.playlist("37i9dQZEVXbMDoHDwVN2tF")["tracks"]["items"]]
    
    @staticmethod
    def getAlbumTracks(id):
        return sp.album_tracks(id)["items"]
    
    @staticmethod
    def getLyrics(songTitle, artist):
        song = SpotifySong(songName=songTitle, artistName=artist)
        
        return song.getSongLyrics()
    
    @staticmethod
    def getTranslatedLyrics(songTitle, artist):
        song = SpotifySong(songName=songTitle, artistName=artist)
        
        return song.getLyricsAndTranslation()
        

class SpotifySong:
    def __init__(self, songName:str, artistName:str) -> None:
        self.songName = songName
        songs = genius.search_songs(songName)["hits"]
        self.song_id = 0
        self.artist_id = 0
        self.song_url = ""
    
        for song in songs:
            if song['result']['title'].lower() == songName.lower() and song['result']['primary_artist']['name'].lower() == artistName.lower():
                self.song_id = song['result']['id']
                self.song_url = song['result']['url']
                self.artist_id = song['result']['primary_artist']['id']

        self.song = genius.song(self.song_id)

        self.artist = genius.artist(self.artist_id)
        self.lyrics = requests.get(get_scrapeops_url(self.song_url)).text
        page = requests.get(get_scrapeops_url(self.song_url)).text
        html = BeautifulSoup(page, 'html.parser')
        lyrics = html.find('div', class_='Lyrics__Container-sc-1ynbvzw-5 Dzxov').get_text(separator="\n")
  
        self.lyrics = lyrics

        

    def getSongArtist(self,):
        return self.artist.name

    def getSongLyrics(self,):
        return self.lyrics

    def getFullSongTranslation(self,fromLang, toLang):
        return ts.translate_text(self.lyrics,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)


    def getLyricsAndTranslation(self):
        lang = langid.classify(self.lyrics)[0]

        lineLyrics = self.lyrics.split("\n")
        translatedLyrics = []

        if lang == 'en':
            for line in lineLyrics:
                translatedLine = ts.translate_text(line,from_language=lang, to_language='ko', if_ignore_empty_query=True, if_ignore_limit_of_length=False, limit_of_length=5000)
                translatedLyrics.append([line, translatedLine, Romanizer(translatedLine).romanize()])
        else:
            for line in lineLyrics:
                translatedLyrics.append([line, ts.translate_text(line,from_language=lang, to_language='en', if_ignore_empty_query=True, if_ignore_limit_of_length=False, limit_of_length=5000), Romanizer(line).romanize()])
        return translatedLyrics

    def getKoreanSongRomanization(self):

        return Romanizer(self.lyrics).romanize()

    def getLanguage(self):
        return