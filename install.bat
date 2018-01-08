@echo off

echo This will first install chocolatey, then other tools
echo .
echo Browse https://chocolatey.org/packages for packages
echo .
echo Ensure that your cmd.exe runs as Administrator
echo .
echo If at university, disable any proxy in the Internet Explorer Network settings.
echo .
pause
choco install git.install /GitAndUnixToolsOnPath
echo .

powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco feature enable -n=allowGlobalConfirmation
git config --global diff.indentHeuristic true
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"
git config --global core.longpaths true
choco install git-lfs.install

rem see https://github.com/github/hub for more information on this git tool
choco install hub
choco install tortoisegit

choco install dropbox
choco install keepass

choco install firefox flashplayerplugin
choco pin add -n=firefox

choco install googlechrome
choco pin add -n=googlechrome

choco install conemu clink
rem enable normal files also to be treated as executable - see https://github.com/mridgers/clink/issues/311#issuecomment-95330570
rem clink set exec_match_style -1

choco install autohotkey.install
choco install notepadplusplus
choco install classic-shell
choco install QTTabBar

choco install putty.install
choco install winscp.install
choco install tortoisesvn

choco install jdk8 jre8
choco install intellijidea-ultimate
choco pin add -n=intellijidea-ultimate

choco install skype
choco install pdfcreator

choco install lockhunter
choco install windirstat
choco install sysinternals
choco install procexp
choco install procmon
rem disabled, because it depends on powershell, which is provided by Windows itself
rem choco install poshgit
choco install autoruns

choco install ruby
choco install python2

choco install strawberryperl python3
choco install texstudio
choco install sumatrapdf.install
choco install jabref
choco isntall imagemagick

choco install 7zip
choco install nodejs-lts
choco install jsonedit
choco install fiddler4
choco install winmerge
choco install ack

choco install f.lux
choco pin add -n=f.lux
choco install teamviewer
choco install vlc

choco install owncloud-client
choco install virtualbox virtualbox.extensionpack
choco install postgresql-9.5 pgadmin3

rem choco install officeproplus2013
rem enable editing the Outlook auto completion
choco install nk2edit.install

rem interactive
rem choco install windowsessentials

choco install ruby2.devkit
call refreshenv
rem Apply steps from https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
ruby dk.rb init
echo "- C:/tools/ruby23" >> C:\tools\DevKit2\config.yml
cd C:\tools\DevKit2
ruby dk.rb install

choco install docker
choco pin add -n=docker

rem requires restart
choco install adobereader


goto END

rem These packages require manual intervention
choco install veracrypt

rem koppor's special tools
choco install paint.net
choco install foobar2000 opencodecs
choco install honeyview

rem koppor's very special tools
choco install pandoc
choco install xmlstarlet
choco install jq
choco install synctrayzor
choco pin add -n=synctrayzor

rem Final notes
rem http://tech.brookins.info/2015/11/07/my-git-setup-in-windows.html
rem Add C:\ProgramData\chocolatey\lib\python3\tools\Scripts to PATH
rem Admin: pip install pygments
rem (OR: C:\ProgramData\chocolatey\lib\python3\tools\Scripts\pip install pygments)

rem Manually: msys2

:END

echo To keep your system updates, run update-all.bat regularly from an administrator CMD.exe
echo .
echo Please follow the steps described at https://conemu.github.io/en/DefaultTerminal.html#Description
echo .
echo Optional: Afterwards, follow the instructions at https://github.com/tj/git-extras/blob/master/Installation.md#windows to install git-extras
echo Optional: Install MikTeX by following https://github.com/latextemplates/scientific-thesis-template#recommended-setup-of-miktex
echo .
pause
