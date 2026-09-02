from flask import Flask, render_template 
from flask_mysqldb import MySQL
from config import config 

CesetekApp = Flask(__name__)
CesetekApp.config.from_object(config['development'])
db = MySQL (CesetekApp)

@CesetekApp.route('/')
def home():
    return render_template('home.html')
if __name__ == '__main__': 
    CesetekApp.run(debug=True, port=6767)

