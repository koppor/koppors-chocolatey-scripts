@echo off
rem Browse https://chocolatey.org/packages for packages

rem Install chocolatey and disable the y/n prompts
powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco feature enable -n=allowGlobalConfirmation

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

choco install git.install /GitAndUnixToolsOnPath
git config --global color.diff.new "green bold"
git config --global color.status.updated "green bold"
git config --global color.branch.current "green bold"
choco install tortoisegit

choco install putty.install
choco install winscp.install
choco install tortoisesvn

choco install jdk8 jre8
choco install play
choco install intellijidea-ultimate
choco pin add -n=intellijidea-ultimate

choco install skype
choco install pdfcreator

choco install lockhunter
choco install windirstat
choco install sysinternals
choco install procexp
choco install procmon
choco install poshgit
choco install autoruns

choco install ruby
choco install python2

choco install miktex
choco pin add -n=miktex
choco install strawberryperl python3
choco install texstudio
choco install sumatrapdf.install
choco install jabref
choco install pandoc

choco install 7zip
choco install nodejs.install
choco install jsonedit
choco install xmlstarlet
choco install jq
choco install fiddler4
choco install winmerge
choco install ack

choco install paint.net
choco install foobar2000 opencodecs
choco install f.lux
choco install teamviewer
choco install vlc
choco install honeyview

choco install owncloud-client
choco install virtualbox virtualbox.extensionpack
choco install postgresql-9.5 pgadmin3

rem choco install officeproplus2013
rem enable editing the Outlook auto completion
choco install nk2edit.install

rem interactive
rem choco install windowsessentials

choco install synctrayzor

rem requires restart
choco install adobereader

choco install ruby2.devkit
rem Apply steps from https://github.com/oneclick/rubyinstaller/wiki/Development-Kit
echo "- C:/tools/ruby23" >> C:\tools\DevKit2\config.yml
cd C:\tools\DevKit2
call refreshenv
ruby dk.rb init
ruby dk.rb install

goto END

rem These packages require manual intervention
choco install veracrypt


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
