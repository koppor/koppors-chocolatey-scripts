# koppor's chocolatey scripts

This repository contains installation and update scripts, I use in my daily work.
They depend on [chocolatey](http://chocolatey.org/), which is the package manager, I like most on Windows.
Please start `cmd.exe` as administrator and run [install.bat](install.bat).
You might want to modify `install.bat` to ensure only packages you like are installed.

You can simply switch from manual installation to chocolatey, because chocolatey uses the installers provided by the software vendors.
They should be capabale to recognize an existing installation.

Run [update-all.bat](update-all.bat) from time to time to ensure that all packages are up to date.
