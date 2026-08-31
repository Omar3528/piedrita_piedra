from flask import Flask, render_template 

CesetekApp = Flask(__name__)

@CesetekApp.route('/')
def home():
    return "hola mundo"
if __name__ == '__main__': 
    CesetekApp.run(debug=True, port=6767)