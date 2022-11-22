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
myclient = pymongo.MongoClient("mongodb://configur.get(my_list[1],'server'):configur.get(my_list[1],'port')/")
mydb = myclient["test"]
mycol = mydb["mycollection"]

with open('mongo-insert-script.json') as f:
   mydict = json.load(f)
x = mycol.insert_one(mydict)
