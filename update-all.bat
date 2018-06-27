@echo off

echo Disabling proxies...
set HTTP_PROXY=
set HTTPS_PROXY=
echo .

echo Updating all packages...
call choco upgrade all
echo .

echo Updating all MiKTeX packages
call mpm --verbose --update-db
call mpm --verbose --update
call initexmf --update-fndb
call initexmf --mklinks --force
echo .

echo Updating texlive
call tlmgr update --self --all --reinstall-forcibly-removed
