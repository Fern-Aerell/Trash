import os
from os.path import isdir
from dotenv import load_dotenv

load_dotenv()

def getenv(id):
    return os.getenv(id)

# ENV
print("Setup env..")
source_folder = getenv("SOURCE_FOLDER")
appname = getenv("APPNAME")
appversion = getenv("APPVERSION")
appcreator = getenv("APPCREATOR")
trash_folder = getenv("TRASH_FOLDER")
trash_script = getenv("TRASH_SCRIPT")

# LIST FILE
print("Listing file...")
listFile = []

def getListFile(folder_path, list_file : list):
    items = os.listdir(folder_path)
    for item in items:
        item_path = os.path.join(folder_path, item)
        if os.path.isdir(item_path):
            getListFile(item_path, list_file)
        else:
            print(item_path)
            list_file.append(item_path)

getListFile(source_folder, listFile)

# BUILD FILE
print("Setup build...")
replace_build_id = {
    "%pybuild%appname%": appname,
    "%pybuild%appversion%": appversion,
    "%pybuild%appcreator%": appcreator,
    "%pybuild%trash_folder%": trash_folder,
    "%pybuild%trash_script%": trash_script,
}

def buildFile(source_path):
    destination_path = str(source_path).replace("src", "build")

    folder_path = os.path.dirname(destination_path)
    os.makedirs(folder_path, exist_ok=True)

    with open(source_path, "r") as file:
        file_content = file.read()

    modified_content = file_content

    for key in replace_build_id.keys():
        modified_content = modified_content.replace(key, str(replace_build_id.get(key)))
    
    with open(destination_path, "w+") as file:
        file.write(modified_content)

for file in listFile:
    print(f"Build file {file}")
    buildFile(file)

print("Build successfully...")
