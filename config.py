class Config: 
    SECRET_KEY = 'K3y5xFramw0rk'
    DEBUG      = True

class Development_Config(Config):
    MYSQL_HOST     = 'localhost'
    MYSQL_USER     = 'root'
    MYSQL_PASSWORD = 'mysql'
    MYSQL_DB       = 'cesetek'


config = {
    'development': Development_Config
}