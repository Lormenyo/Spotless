from app.flaskHelper import app as application


app = application


if __name__ == '__main__':
    # main()
    app.run(debug=True)