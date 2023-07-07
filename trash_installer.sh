#!/bin/bash

appName=trash
appVersion=1.2.0
appCreator=AerellDev
local_folder=$HOME/.local/bin

print() {
  echo "$appName: $1"
}

checking_local_folder() {
  if [ ! -d "$local_folder" ]; then
    mkdir "$local_folder"
  fi
}

curl_file() {
  curl -o "$1" "$2"
}

main() {
  print "installing..."
  print "v$appVersion"
  print "create by $appCreator"

  checking_local_folder

  print "downloading file..."
  curl_file "$local_folder/trash" "https://raw.githubusercontent.com/AerellDev/Trash/main/bin/trash"
  curl_file "$local_folder/del" "https://raw.githubusercontent.com/AerellDev/Trash/main/bin/del"
  curl_file "$local_folder/undel" "https://raw.githubusercontent.com/AerellDev/Trash/main/bin/undel"
  print "downloading success..."

  print "set permission"
  chmod +x "$local_folder/trash"
  chmod +x "$local_folder/del"
  chmod +x "$local_folder/undel"
  print "set permission successfuly..."

  print "Installing successfuly..."

  print "trash -h for more command and information."
}

main
