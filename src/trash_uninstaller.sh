#!/bin/bash

appName=%pybuild%appname%
appVersion=%pybuild%appversion%
appCreator=%pybuild%appcreator%

local_folder=%pybuild%trash_script%

print() {
  echo "$appName: $1"
}

checking_local_folder() {
  if [ ! -d "$local_folder" ]; then
    mkdir "$local_folder"
  fi
}

delete_file() {
  rm -r "$1"
}

main() {
  print "uninstalling..."
  print "v$appVersion"
  print "create by $appCreator"

  checking_local_folder

  print "delete file..."
  delete_file "$local_folder/trash"
  delete_file "$local_folder/del"
  delete_file "$local_folder/undel"
  print "do you want delete trash folder? all trash file will be deleted (y/n) default=n : "
  read input
  input_lower="${input,,}"
  if [ "$input_lower" == "y" ]; then
    delete_file "$HOME/.trash"
  fi
  print "delete file success..."

  print "uninstalling successfuly..."
}

main
