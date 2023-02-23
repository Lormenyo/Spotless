from flaskHelper import app

@app.route('/')
def index():
    return 'Welcome to Spotless API'