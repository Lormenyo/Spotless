import pprint

from spotifyHelper import sp
from models.spotifyModel import SpotifySong;

def main():
    song = SpotifySong(songName='Breath', artistName='Sam Kim')
    

    ser = sp.search('Shape of you', limit=1, offset=0, type='track', market=None)
    pprint.pprint(ser)

    

    


if __name__ == '__main__':
    main()