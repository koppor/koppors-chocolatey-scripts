@echo off
mkdir c:\git-repositories
cd c:\git-repositories
git clone https://github.com/koppor/autohotkey-scripts.git

echo Open explorer and go to c:\git-repositories\autohotkey-scripts
echo Now run shell:startup
echo Drag'n'drop the .ahk scripts you like to the startup directory.
echo Use the right mouse key and select "Create shortcut"
rem Other ways are described at http://superuser.com/questions/392061/how-to-make-a-shortcut-from-cmd, but they are too complex