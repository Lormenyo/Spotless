from flask import Flask
from flask_restx import Api
from app.controllers.search import searchNamespace
from app.controllers.lyrics import lyricsNamespace
from app.controllers.releases import releaseNamespace
from app.controllers.trending import trendingNamespace
from app.controllers.toplists import toplistsNamespace
from app.controllers.genrelist import genreNamespace
from app.controllers.albumtracks import albumTracksNamespace

app = Flask(__name__)

api = Api(app, version='1.0', title='Spotless API',
    description='API for Spotless',
)

api.add_namespace(searchNamespace)
api.add_namespace(lyricsNamespace)
api.add_namespace(releaseNamespace)
api.add_namespace(trendingNamespace)
api.add_namespace(toplistsNamespace)
api.add_namespace(genreNamespace)
api.add_namespace(albumTracksNamespace)


if __name__ == '__main__':
    # main()
    app.run(debug=True)