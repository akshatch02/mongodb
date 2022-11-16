import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["test"]
mycol = mydb["mycollection"]

with open('mongo-update-from.json') as f:
   myquery = json.load(f)
with open('mongo-update-to.json') as f:
   newvalues = json.load(f)

mycol.update_one(myquery, newvalues)

for x in mycol.find():
  print("Updated: ", x)
