from flask import Flask
from flask_restx import Api
from controllers.search import searchNamespace
from controllers.lyrics import lyricsNamespace
from controllers.releases import releaseNamespace
from controllers.trending import trendingNamespace


app = Flask(__name__)

api = Api(app, version='1.0', title='Spotless API',
    description='API for Spotless',
)

api.add_namespace(searchNamespace)
api.add_namespace(lyricsNamespace)
api.add_namespace(releaseNamespace)
api.add_namespace(trendingNamespace)




