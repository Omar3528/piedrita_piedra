class Config: 
    SECRET_KEY = 'K3y5xFramw0rk'
    DEBUG      = True

class DevelopmentConfig(Config):
    MYSQL_HOST     = 'localhost'
    MYSQL_USER     = 'root'
    MYSQL_PASSWORD = 'mysql'
    MYSQL_DB       = 'cesetek'


config = {
    'development': DevelopmentConfig
}