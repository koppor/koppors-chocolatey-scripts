@echo off

goto start

rem Execute these lines to pin packages to keep them from updating

choco pin add -n=miktex
choco pin add -n=firefox
choco pin add -n=chrome
choco pin add -n=intellijidea-ultimate

:start
echo Updating all packages...
call choco upgrade all
echo.
echo Updating all MiKTeX packages
mpm --admin --update
