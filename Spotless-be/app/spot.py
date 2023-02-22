import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
import json
import lyricsgenius
import pprint

from models.spotifyModel import SpotifySong;

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

ser = sp.search('Shape of you', limit=1, offset=0, type='track', market=None)
pprint.pprint(ser)

# sp.start_playback() Premium is required for playback

        

song = SpotifySong(songName='Breath', artistName='Sam Kim')
#song.getLyricsAndTranslation('ko', 'en')
# song.getKoreanSongRomanization()