from flask import Flask, render_template 

CesetekApp = Flask(__name__)

@CesetekApp.route('/')
def home():
    return render_template('home.html')
if __name__ == '__main__': 
    CesetekApp.run(debug=True, port=6767)