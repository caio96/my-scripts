# How to create update-alternative scripts

Get all files of the target llvm version 
```sh
ls "/usr/bin/*12*" >> files-12.txt
```

Check if they are actually from LLVM/Clang by creating and looking at core-packages-sorted.txt.
Remove them from files-12.txt if they are not from llvm or clang.
```sh
for i in $(cat files-12.txt); do
  dpkg -S $i >> core-packages.txt
done

sort core-packinges.txt >> core-packages-sorted.txt
```

Remove "-12" from the lines in files-12.txt to create files.txt and check if they exist.
Files that don't exist are in files-not.txt and they should be removed from files-12.txt.
```sh
for i in $(cat files.txt); do
if [ ! -f $i ]; then
  echo "$i" >> files-not.txt
fi
done
```

Now use files listed in files-12 to create the scripts.


## LLVM vsCode config

Put the file inside `vscode` in the `.vscode` of your LLVM project repo to fix includes and completion.
Just update the path to compile_commands.json to the one inside the build dir of llvm-project.
