#  create redis connection

from redis import Redis
from get_config import read_config

CFG = read_config()

conn = Redis(host=CFG['NETWORK']['REDIS_IP'],
             port=CFG['NETWORK']['REDIS_PORT'],
             max_connections=20)
