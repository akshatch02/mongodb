import pymongo
import json
import sys
from configparser import ConfigParser

my_list=sys.argv
for ele in my_list:
   print(ele)
configur = ConfigParser()
configur.read('config.ini')
print ("Server****** : ", configur.get(my_list[1],'server'))
print ("Port****** : ", configur.getint(my_list[1],'port'))
server_val = configur.get(my_list[1],'server')
port_val = configur.getint(my_list[1],'port')
myclient = pymongo.MongoClient("mongodb://server_val:port_val/")
mydb = myclient["test"]
mycol = mydb["mycollection"]

with open('mongo-insert-script.json') as f:
   mydict = json.load(f)
x = mycol.insert_one(mydict)
