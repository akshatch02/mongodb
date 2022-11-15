import pymongo
import json

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["test"]
mycol = mydb["mycollection"]

with open('mongo-insert-script.json') as f:
   mydict = json.load(f)
x = mycol.insert_one(mydict)
