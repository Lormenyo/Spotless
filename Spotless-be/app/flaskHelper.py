from flask import Flask, Blueprint
from flask_restx import Api
from controllers.search import searchNamespace
from controllers.lyrics import lyricsNamespace


app = Flask(__name__)

api = Api(app, version='1.0', title='Spotless API',
    description='API for Spotless',
)

api.add_namespace(searchNamespace)
api.add_namespace(lyricsNamespace)




