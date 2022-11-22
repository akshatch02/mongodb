import pymongo
import json
import sys
from configparser import ConfigParser

my_list=sys.argv
for ele in my_list:
   print(ele)
configur = ConfigParser()
print ("Server****** : ", configur.get('DEV','server'))
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["test"]
mycol = mydb["mycollection"]

with open('mongo-insert-script.json') as f:
   mydict = json.load(f)
x = mycol.insert_one(mydict)
