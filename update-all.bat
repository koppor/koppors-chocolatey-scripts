@echo off

echo Disabling proxies...
set HTTP_PROXY=
set HTTPS_PROXY=
echo .

echo Updating all winget packages...
winget upgrade -h --all

echo Updating chocolatey all packages...
call choco upgrade all
echo .

echo Updating pip...
python.exe -m pip install --upgrade pip
echo Updating all pip packages...
pip --disable-pip-version-check list --outdated --format=json | python -c "import json, sys; print('\n'.join([x['name'] for x in json.load(sys.stdin)]))" | xargs -n1 pip install -U

echo Updating all npm packages...
npm update -g

echo Updating all cargo packages...
rem requires  cargo install cargo-update
cargo install-update -a

echo Updating all MiKTeX packages...
call mpm --verbose --update-db
call mpm --verbose --update
call initexmf --update-fndb
call initexmf --mklinks --force
echo .

echo Updating texlive
rem call tlmgr update --self --all --reinstall-forcibly-removed
