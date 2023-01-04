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
echo .

powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco feature enable -n=allowGlobalConfirmation
pause

echo Now chocolatey should be ready and we can go ahead
echo .
pause

rem enable clicking on choco:// links in the browser
rem https://community.chocolatey.org/packages/choco-protocol-support
rem choco install choco-protocol-support

choco install dropbox

choco install keepass

choco install firefox
choco pin add -n=firefox

choco install googlechrome
choco pin add -n=googlechrome

rem Required for advanced Window management
choco install powertoys
choco pin add -n=powertoys

rem Enable tabbed terminal
rem https://conemu.github.io/
choco install conemu

rem Enable bash shortcuts
rem https://chrisant996.github.io/clink/
choco install clink-maintained
rem enable normal files also to be treated as executable - see https://github.com/mridgers/clink/issues/311#issuecomment-95330570
rem otherwise, you have to add a space before the filename
rem clink set exec_match_style -1

choco install git.install -y --params "/GitAndUnixToolsOnPath /NoAutoCrlf /WindowsTerminal"
call refreshenv
rem always have Linux line endings in text files
git config --global core.autocrlf input
rem support more than 260 characters on Windows
rem See https://stackoverflow.com/a/22575737/873282 for details
git config --global core.longpaths true
rem some color and diff tweaks
rem   Use SVN's ||| also in git - and remove matching lines in the conflict region
rem   See https://git-scm.com/docs/git-config#Documentation/git-config.txt-mergeconflictStyle for details
git config --global merge.configStyle "zdiff3"
rem Always push to the branch we pulled from
rem   See https://git-scm.com/docs/git-config#Documentation/git-config.txt-pushdefault for details
git config --global push.default current
rem  Source: https://stackoverflow.com/a/72401899/873282
git config --global push.autoSetupRemote true
rem  Colors in output
rem  Source: https://unix.stackexchange.com/a/44297/18033
git config --global color.ui auto
rem Sort branches at "git branch -v" by committer date
git config --global branch.sort -committerdate

rem Update from PowerShell 5 to PowerShell 7
rem See https://docs.microsoft.com/de-de/powershell/scripting/install/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7
choco install powershell-core

rem see https://github.com/github/hub for more information on this git tool
rem choco install hub
choco install gh

rem Nice UI from GitHub
rem Currently not used
rem choco install github-desktop

rem This is an alternative GUI for git
rem Typically slows down Windows Explorer, so  not installed
rem choco install tortoisegit

rem PowerShell environment for Git - http://dahlbyk.github.io/posh-git/
rem disabled, because it depends on powershell, which is provided by Windows itself
rem choco install poshgit

rem In case one (still) owns SVN repositories
rem choco install tortoisesvn

choco install autohotkey.install

rem https://github.com/Open-Shell/Open-Shell-Menu
rem choco install open-shell

choco install notepadplusplus

rem Advanced search for file names - https://www.voidtools.com/
choco install everything

rem Skype is included in Windows 10 store - no need to install it
rem choco install skype
rem choco pin add -n=skype

rem choco install microsoft-teams

choco install 7zip

rem Context menu for Windows Explorer to offer "Copy Unix Path", "Copy Long UNC Path", ...
rem https://pathcopycopy.github.io/
choco install path-copy-copy

choco install vscode
choco pin add -n vscode

choco install putty.install
choco install winscp.install

rem AdoptOpenJDK on stereoids
choco install libericajdkfull

choco install jetbrainstoolbox
choco pin add -n=jetbrainstoolbox

rem choco install pdfcreator

choco install lockhunter

choco install windirstat

choco install sysinternals
choco install procexp
choco install procmon

rem This is interactive - therefore no installation
rem choco install windowsessentials

rem choco install autoruns

choco install strawberryperl python3
rem choco install ruby

choco install texstudio
choco install sumatrapdf
choco install jabref
choco install imagemagick

choco install nodejs-lts

rem choco install jsonedit

rem choco install fiddler4

rem choco install winmerge

choco install f.lux
choco pin add -n=f.lux

choco install teamviewer

choco install vlc

rem enable editing the Outlook auto completion
rem choco install nk2edit.install

choco install docker-desktop
choco pin add -n=docker-desktop

rem This allows to burn ISOs - see https://rufus.akeo.ie/
rem choco install rufus

rem choco install totalcommander

rem advanced grep
rem better then the alternative "ack"
rem Hopmepage: https://github.com/ggreer/the_silver_searcher
choco install ag

rem advanced find
rem Homepage: https://github.com/sharkdp/fd
choco install fd

choco install adobereader

choco install font-awesome-font

choco install discord

choco install pandoc

choco install xmlstarlet

choco install jq

rem Tool for renaming pictures according to EXIF date
choco install exiftool

rem Advanced copy tool
rem Homepage: https://www.codesector.com/teracopy
rem choco install teracopy

rem music player
rem choco install foobar2000 opencodecs

rem picture viewer
rem choco install honeyview

rem peer-to-peer file share
rem choco install synctrayzor
rem choco pin add -n=synctrayzor

rem Manually: msys2

rem Free file-based encryption for the cloud
rem See https://cryptomator.org/ for details
choco install cryptomator

rem VeraCrypt
rem This package requires manual intervention
rem choco install veracrypt

rem QDir
rem Advanced File Explorer
rem https://community.chocolatey.org/packages/qdir
choco install qdir

rem Tabbed File Explorer via QTTabBar
rem Requieres a reboot directly after installation
rem Otherwise, Windows does not recognize a click any more
rem choco install QTTabBar

:END

echo To keep your system updated, run update-all.bat regularly from an administrator CMD.exe.
echo .
echo Please follow the steps described at https://conemu.github.io/en/DefaultTerminal.html#Description
echo .
echo Follow the steps described at http://tech.brookins.info/2015/11/07/my-git-setup-in-windows.html to get git running with putty and an SSH key
echo Install "Snipaste" from the Windows Store
echo Optional: Install "paint.net" from the Windows Store
echo Optional: Afterwards, follow the instructions at https://github.com/tj/git-extras/blob/master/Installation.md#windows to install git-extras
echo Optional: Install MikTeX by following https://github.com/latextemplates/scientific-thesis-template/tree/master/docs#recommended-setup-of-miktex
echo .
pause
