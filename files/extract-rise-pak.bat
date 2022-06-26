@setlocal enableextensions
@pushd %~dp0
@echo off
set LISTFILE=mhrisePC.list
if "%~1"=="" (
    echo Drag re_chunk_000.pak from the Monster Hunter Rise folder onto extract-rise-pak.bat to extract it.
) else (
	if not exist "RETool.exe" (
		echo RETool is missing. Downloading it from GitHub...
		powershell wget https://raw.githubusercontent.com/mhvuze/MonsterHunterRiseModding/main/files/REtool.exe -OutFile "RETool.exe"
	) else (
	echo RETool.exe found.
	)
	
    if not exist "%LISTFILE%" (
		echo %LISTFILE% is missing. Downloading it from GitHub...
		powershell wget https://raw.githubusercontent.com/mhvuze/MonsterHunterRiseModding/main/files/%LISTFILE% -OutFile "%LISTFILE%"
	) else (
	echo %LISTFILE% found.
	)
	echo Running RETool.exe...
	.\REtool.exe -h %LISTFILE% -x -skipUnknowns %1
)
@popd
@pause