import os
from pprint import PrettyPrinter
import re
from bs4 import BeautifulSoup
# from polyglot.detect import Detector
import langid

import requests
from app.spotifyHelper import genius, sp
import translators as ts
from korean_romanizer.romanizer import Romanizer

from app.util.proxy import get_scrapeops_url

HEADER = {
    'User-Agent': 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Mobile Safari/537.36',
    }

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
        self.song_id = 0
        self.artist_id = 0
        possibleArtistIds = []
        self.song_url = ""

        artistsResponse = requests.get('https://genius.com/api/search/artist', params={'q': artistName}, headers=HEADER).json()['response']
      
        artists = artistsResponse['sections'][0]['hits']
        for artist in artists:
            if artistName in artist['result']['name'].split('&')[0]:
                possibleArtistIds.append(artist['result']['id'])

        for artistId in possibleArtistIds:
            artist_songs = genius.search_artist_songs(artist_id=artistId, search_term=songName)

            if artist_songs['total_entries']:
                self.song_id = artist_songs['songs'][0]['id']
                self.artist_id = artistId
                self.song_url = artist_songs['songs'][0]['url']
       
               
                break
      
        self.song = genius.song(self.song_id)
        self.artist = genius.artist(self.artist_id)
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