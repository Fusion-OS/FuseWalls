from datetime import datetime
import json
import os
import posixpath
import ntpath
import glob
dateTimeNow = str(datetime.utcnow())
data = {
    "date" : dateTimeNow,
    "categories" : [],
}

sub_folders = [name for name in os.listdir(".") if os.path.isdir(os.path.join(".", name))]
sub_folders.remove("category_thumb")
for folderName in sub_folders:
    
    tempData = {
        "categoryName" : folderName,
        "paths" : [],
    }

    for filename in sorted((glob.glob(f"{folderName}/*.[jp]*")), reverse= True, key = lambda x: (len (x), x)):
        print(filename)
        originalPath =  filename.replace(ntpath.sep, posixpath.sep)
        compressedPath = "{0}/thumb/{1}".format(folderName, os.path.split(originalPath)[-1])
        tempData["paths"].append({"original" : originalPath, "compressed" : compressedPath, "isNew": False})
    data[f"{folderName}"] = tempData
    data["categories"].append({"name" : folderName, "thumb" : f"category_thumb/{folderName}.png",})
json.dump(data, open("wallpapers.json", "w"))

