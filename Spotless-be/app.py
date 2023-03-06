import pprint
from app.spotifyHelper import sp
from app.models.spotifyModel import SpotifySong;

import app.controllers.search
from app.flaskHelper import app



# def main():
#     song = SpotifySong(songName='Breath', artistName='Sam Kim')
    

#     ser = sp.search('Shape of you', limit=1, offset=0, type='track', market=None)
#     pprint.pprint(ser)

    

    


if __name__ == '__main__':
    # main()
    app.run(debug=True)