# TRASH

<img alt="trash icon" src="resources/icon/playstore.png" height="150px"> 

Trash is a program created using a shell language to move files to the trash folder, so they are not immediately deleted.

Note : I created this program so that I can delete files in Termux, which doesn't have a desktop environment, without deleting them directly.

WARN : This only support for linux in proot distro or udroid.

## The Technology Used Is
- Shell
- LunarVim
- Python

## How to install
- Run this command in your terminal
```
curl -o trash_installer.sh https://raw.githubusercontent.com/AerellDev/Trash/main/build/trash_installer.sh && bash trash_installer.sh && rm trash_installer.sh
```

## How to use
```
// help or more command
trash -h

// delete file/dir to trash folder
trash del <file/dir>
del <file/dir>
undel <file/dir> <newfile/newdir>

// cleaning trash folder
trash empty
```

## How to uninstall
- Run this command in your terminal
```
curl -o trash_uninstaller.sh https://raw.githubusercontent.com/AerellDev/Trash/main/build/trash_uninstaller.sh && bash trash_uninstaller.sh && rm trash_uninstaller.sh
```

Thanks for reading...!
