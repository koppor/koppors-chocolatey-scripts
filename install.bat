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

rem For Windows 11: Tweaker for Windows Explorer
rem Not installable via Chocolatey, but via winget
winget install --id=valinet.ExplorerPatcher -e --accept-source-agreements --accept-package-agreements

rem Required for advanced Window management
winget install --id Microsoft.PowerToys -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id Microsoft.PowerToys -e

rem enable clicking on choco:// links in the browser
rem https://community.chocolatey.org/packages/choco-protocol-support
rem choco install choco-protocol-support

rem choco install dropbox

winget install --id DominikReichl.KeePass -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id Mozilla.Firefox -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id Mozilla.Firefox -e --blocking

winget install --id Google.Chrome -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id Google.Chrome -e --blocking

rem Enable tabbed terminal
rem https://conemu.github.io/
rem Disabled, because Windows Terminal is now "good enough"
rem choco install conemu

rem Enable bash shortcuts
rem https://chrisant996.github.io/clink/
winget install --id chrisant996.Clink -e --source winget --accept-source-agreements --accept-package-agreements
rem enable normal files also to be treated as executable - see https://github.com/mridgers/clink/issues/311#issuecomment-95330570
rem otherwise, you have to add a space before the filename
rem clink set exec_match_style -1

rem Kept at chocolatey, because winget does not support these installer parameters
rem All arguments are listed at https://github.com/chocolatey-community/chocolatey-packages/blob/master/automatic/git.install/ARGUMENTS.md
choco install git.install -y --params "/GitAndUnixToolsOnPath /WindowsTerminal /WindowsTerminalProfile /Editor:VisualStudioCode"
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
rem tabs are 4 spaces wide
git config --global gui.tabsize 4

rem Update from PowerShell 5 to PowerShell 7
rem See https://docs.microsoft.com/de-de/powershell/scripting/install/migrating-from-windows-powershell-51-to-powershell-7?view=powershell-7
winget install --id Microsoft.PowerShell -e --source winget --accept-source-agreements --accept-package-agreements

rem see https://github.com/github/hub for more information on this git tool
rem choco install hub
winget install --id GitHub.cli -e --source winget --accept-source-agreements --accept-package-agreements
call refreshenv

rem gh-worktree - checkout pull requests and branches into separate git worktrees - https://github.com/knqyf263/gh-worktree
gh extension install knqyf263/gh-worktree

rem Go - required to install gwq
winget install --id GoLang.Go -e --source winget --accept-source-agreements --accept-package-agreements
call refreshenv

rem ghq - remote repository management - https://github.com/x-motemen/ghq
winget install --id=x-motemen.ghq -e --accept-source-agreements --accept-package-agreements
rem clone all repositories below c:\git-repositories
git config --global ghq.root c:/git-repositories

rem gwq - git worktree manager - https://github.com/d-kuro/gwq
rem not available via chocolatey or winget, thus installed with go
go install github.com/d-kuro/gwq/cmd/gwq@latest
rem put worktrees next to the ghq clones - c:\git-repositories\host\owner\repository=branch
rem gwq is not on the PATH yet, thus it is called with its full path
"%USERPROFILE%\go\bin\gwq.exe" config set worktree.basedir "c:/git-repositories"
"%USERPROFILE%\go\bin\gwq.exe" config set naming.template "{{.Host}}/{{.Owner}}/{{.Repository}}={{.Branch}}"

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

winget install --id AutoHotkey.AutoHotkey -e --source winget --accept-source-agreements --accept-package-agreements

rem https://github.com/Open-Shell/Open-Shell-Menu
rem choco install open-shell

winget install --id Notepad++.Notepad++ -e --source winget --accept-source-agreements --accept-package-agreements

rem Advanced search for file names - https://www.voidtools.com/
winget install --id voidtools.Everything -e --source winget --accept-source-agreements --accept-package-agreements

rem Skype is included in Windows 10 store - no need to install it
rem choco install skype
rem choco pin add -n=skype

rem choco install microsoft-teams

winget install --id 7zip.7zip -e --source winget --accept-source-agreements --accept-package-agreements

rem Context menu for Windows Explorer to offer "Copy Unix Path", "Copy Long UNC Path", ...
rem https://pathcopycopy.github.io/
winget install --id CLechasseur.PathCopyCopy -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id Microsoft.VisualStudioCode -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id Microsoft.VisualStudioCode -e --blocking

rem Fonts - not available via winget
choco install dejavufonts
choco install victormononf
choco install font-awesome-font

winget install --id PuTTY.PuTTY -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id WinSCP.WinSCP -e --source winget --accept-source-agreements --accept-package-agreements

rem AdoptOpenJDK on stereoids
rem Kept at chocolatey, because winget only offers version-specific packages (e.g., BellSoft.LibericaJDK.25.Full)
choco install libericajdkfull

winget install --id JetBrains.Toolbox -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id JetBrains.Toolbox -e --blocking

rem choco install pdfcreator

winget install --id CrystalRich.LockHunter -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id WinDirStat.WinDirStat -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id Microsoft.Sysinternals.Suite -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id Microsoft.Sysinternals.ProcessExplorer -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id Microsoft.Sysinternals.ProcessMonitor -e --source winget --accept-source-agreements --accept-package-agreements

rem This is interactive - therefore no installation
rem choco install windowsessentials

rem choco install autoruns

rem Kept at chocolatey, because winget only offers version-specific packages (e.g., Python.Python.3.13)
choco install python3
# alternatively
# choco install anaconda3 --params '"/AddToPath /JustMe"'

rem choco install strawberryperl
rem choco install ruby

winget install --id SumatraPDF.SumatraPDF -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id Adobe.Acrobat.Reader.64-bit -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id TeXstudio.TeXstudio -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id JabRef.JabRef -e --source winget --accept-source-agreements --accept-package-agreements
winget install --id ImageMagick.ImageMagick -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id OpenJS.NodeJS.LTS -e --source winget --accept-source-agreements --accept-package-agreements

rem choco install jsonedit

rem choco install fiddler4

rem choco install winmerge

winget install --id flux.flux -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id flux.flux -e --blocking

winget install --id TeamViewer.TeamViewer -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id VideoLAN.VLC -e --source winget --accept-source-agreements --accept-package-agreements

rem enable editing the Outlook auto completion
rem choco install nk2edit.install

winget install --id Docker.DockerDesktop -e --source winget --accept-source-agreements --accept-package-agreements
winget pin add --id Docker.DockerDesktop -e --blocking

rem This allows to burn ISOs - see https://rufus.akeo.ie/
rem choco install rufus

rem choco install totalcommander

rem advanced grep
rem better then the alternative "ack"
rem Hopmepage: https://github.com/ggreer/the_silver_searcher
winget install --id JFLarvoire.Ag -e --source winget --accept-source-agreements --accept-package-agreements

rem advanced find
rem Homepage: https://github.com/sharkdp/fd
winget install --id sharkdp.fd -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id Discord.Discord -e --source winget --accept-source-agreements --accept-package-agreements

winget install --id JohnMacFarlane.Pandoc -e --source winget --accept-source-agreements --accept-package-agreements

rem not available via winget
choco install xmlstarlet

winget install --id jqlang.jq -e --source winget --accept-source-agreements --accept-package-agreements

rem Tool for renaming pictures according to EXIF date
winget install --id OliverBetz.ExifTool -e --source winget --accept-source-agreements --accept-package-agreements

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
winget install --id Cryptomator.Cryptomator -e --source winget --accept-source-agreements --accept-package-agreements

rem VeraCrypt
rem This package requires manual intervention
rem choco install veracrypt

rem QDir
rem Advanced File Explorer
rem https://community.chocolatey.org/packages/qdir
rem choco install qdir

rem Tabbed File Explorer via QTTabBar
rem Requieres a reboot directly after installation
rem Otherwise, Windows does not recognize a click any more
rem choco install QTTabBar

rem Install WLAN Monitor
rem https://github.com/emoacht/Wifinian
winget install Wifinian --accept-source-agreements --accept-package-agreements

:END

echo To keep your system updated, run update-all.bat regularly from an administrator CMD.exe.
echo .
echo Please follow the steps described at https://conemu.github.io/en/DefaultTerminal.html#Description
echo .
echo Follow the steps described at http://tech.brookins.info/2015/11/07/my-git-setup-in-windows.html to get git running with putty and an SSH key
echo Optional: Afterwards, follow the instructions at https://github.com/tj/git-extras/blob/master/Installation.md#windows to install git-extras
echo Optional: Install "paint.net" from the Windows Store
echo Optional: Install MikTeX by following https://github.com/latextemplates/scientific-thesis-template/tree/master/docs#recommended-setup-of-miktex
echo .
pause
