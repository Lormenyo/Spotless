from flaskHelper import app

@app.route('/')
def index():
    return 'Welcome to Spotless API'

@app.route('/search')
def search():
    """
    can be songs/artists
    """
    return 'Search results'

@app.route('/lyrics')
def getLyrics():
    return 'Lyrics'

@app.route('/trending')
def getTrending():
    return 'Trending'

@app.route('/new-releases')
def getNewReleases():
    return 'new releases'