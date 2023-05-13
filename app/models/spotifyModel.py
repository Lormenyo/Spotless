from pprint import PrettyPrinter
from app.spotifyHelper import genius, sp
import translators as ts
from korean_romanizer.romanizer import Romanizer

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
        # return "lyrics"

class SpotifySong:
    def __init__(self, songName:str, artistName:str) -> None:
        self.songName = songName
        songs = genius.search_songs(songName)["hits"]
        self.song_id = 0
        self.artist_id = 0
        self.song_url = ""
        # print(songs)
        for song in songs:
            # pp = PrettyPrinter()
            # pp.pprint(song)
            # print('\n')
            if song['result']['title'].lower() == songName.lower() and song['result']['primary_artist']['name'].lower() == artistName.lower():
                # print(f"Matched song: {song['result']['title']}")
                self.song_id = song['result']['id']
                self.song_url = song['result']['url']
                self.artist_id = song['result']['primary_artist']['id']
            # else:
            #     print(f"false- not found: {song['result']['title']} {song['result']['primary_artist']['name']}")
        self.song = genius.song(self.song_id)
        # pp.pprint(self.song)
        # print("\n-----------Artist----------\n")
        self.artist = genius.artist(self.artist_id)
        self.lyrics = genius.lyrics(song_id=self.song_id, song_url=self.song_url)
        # pp.pprint(self.lyrics)
        

    def getSongArtist(self,):
        return self.artist.name

    def getSongLyrics(self,):
        return self.lyrics

    def getFullSongTranslation(self,fromLang, toLang):
        return ts.translate_text(self.song.lyrics,from_language=fromLang, to_language=toLang, if_ignore_empty_query=False, if_ignore_limit_of_length=False, limit_of_length=5000)


    def getLyricsAndTranslation(self,fromLang, toLang):
        lineLyrics = self.song.lyrics.split("\n")

        for line in lineLyrics:
            print(line, '->', ts.translate_text(line,from_language=fromLang, to_language=toLang, if_ignore_empty_query=True, if_ignore_limit_of_length=False, limit_of_length=5000))
        return

    def getKoreanSongRomanization(self):
        lineLyrics = self.song.lyrics.split("\n")
        
        for line in lineLyrics:
            print(line, '->', Romanizer(line).romanize())

        return 

    def getLanguage(self):
        return