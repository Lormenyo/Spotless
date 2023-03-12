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
        return sp.album_tracks(id)

class SpotifySong:
    def __init__(self, songName:str, artistName:str) -> None:
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
            print(line, '->', ts.translate_text(line,from_language=fromLang, to_language=toLang, if_ignore_empty_query=True, if_ignore_limit_of_length=False, limit_of_length=5000))
        return

    def getKoreanSongRomanization(self):
        lineLyrics = self.song.lyrics.split("\n")
        
        for line in lineLyrics:
            print(line, '->', Romanizer(line).romanize())

        return 

    def getLanguage(self):
        return