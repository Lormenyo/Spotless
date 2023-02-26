from flask import Flask, Blueprint
from flask_restx import Api, Resource, Namespace
from controllers.search import searchNamespace


app = Flask(__name__)

api = Api(app, version='1.0', title='Spotless API',
    description='API for Spotless',
)

api.add_namespace(searchNamespace)



