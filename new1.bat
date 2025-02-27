@echo off
color 0A
title Node.js CMD

:banner
echo.
echo.
echo =======================================================================================================================
echo =======================================================================================================================
echo 				         Node.js CMD Made by Milen
echo				                 This tool i made in batch
echo				                 It's made for react and typescript
echo				                 And it's made for system features
echo                                          Type "commands -help" to show all of the commands
echo =======================================================================================================================
echo =======================================================================================================================
echo.
echo.
:: Početni direktorijum
cd /d %USERPROFILE%

:loop
set /p komanda=Node.js CMD %CD%^> 

:: Ako je uneta komanda `cd ...`
if /i "%komanda:~0,3%"=="cd " (
    cd /d "%komanda:~3%" 2>nul
    goto loop
)

if /i "%komanda%" == "list" (
    dir
    goto loop
)

if /i "%komanda%" == "list/w" (
	dir/w
	goto loop
)

if /i "%komanda%" == "list react-features" (
	@echo React Features for Node.js cmd for React :
    @echo.
			echo npm start - start the app
			echo npm init - add json file
			echo npm install - install the modules for react
			echo npx create-react-app my-app - make react app
			echo npm run build
			echo cd my-app - change location to your react app
	@echo.
)

if /i "%komanda%" == "npm start" (
	npm start
	goto loop
)

if /i "%komanda%" == "npm init" (
	npm init
	goto loop
)

if /i "%komanda%" == "npm install" (
	npm install
	goto loop
)

if /i "%komanda%"=="mkapp" (
    set "appname=%komanda%"
    echo Creating new react app: %appname%...
    
    :: Pokreće instalaciju u istom CMD prozoru i čeka završetak
    call npx create-react-app "%appname%"
	
    goto loop
)

if /i "%komanda%" == "npm run build" (
	npm start
	goto loop
)

:: Windows commands
if /i "%komanda%" == "lsall" (
	tree
	goto loop
)

if /i "%komanda%" == "tskm" (
	taskmgr
	goto loop
)

if /i "%komanda:~0,8%"=="tskkill " (
    setlocal enabledelayedexpansion
    set "proc=%komanda:~8%"
    
    if "!proc!"=="" (
        echo You need to put any program to end it
        endlocal
        goto loop
    )

    echo !proc! is off
    taskkill /IM "!proc!" /F 2>nul
    
    if !errorlevel! NEQ 0 (
        echo Procces "!proc!" is not finded or recognized
    )

    endlocal
    goto loop
)

if /i "%komanda%" == "service" (
	services.msc
	goto loop
)

if /i "%komanda%" == "newcmd" (
	start "C:\Users\W Milen\CMD Made by W Milen\new1.bat"
	goto loop
)

if /i "%komanda%" == "clearcommands" (
	cls
	goto loop
)

if /i "%komanda:~0,9%"=="checknet " (
    setlocal enabledelayedexpansion
    set "host=%komanda:~9%"
    
    if "!host!"=="" (
        echo You need to put an ip address! Like: checknet google.com
        endlocal
        goto loop
    )
    
    echo Checking !host!...
    ping -n 4 !host!
    endlocal
    goto loop
)

if /i "%komanda%" == "openeditor" (
	cmd /k "code ."
)

if /i "%komanda%" == "github" (
	start "" "https://github.com/MilenGit12"
	goto loop
)

if /i "%komanda%" == "shutdown" (
	shutdown -I
	goto loop
)

if /i "%komanda%" == "turnoff" (
	shutdown -s -t 0
	goto loop
)

if /i "%komanda%" == "connectedip" (
	arp -a
	goto loop
)

if /i "%komanda%" == "ts json" (
	cmd /k "tsc --init"
)

if /i "%komanda:~0,3%"=="ts " (
    setlocal enabledelayedexpansion
    set "args=%komanda:~3%"
    
    if "!args!"=="" (
        echo You need to put file name! Like: ts file.ts
        endlocal
        goto loop
    )

    :: Pokretanje TypeScript kompajlera
    echo Pokrecem TypeScript kompajler...
    tsc !args!
    
    if !errorlevel! neq 0 (
        echo Greska pri kompajliranju!
    ) else (
        echo Kompajliranje zavrseno!
    )

    endlocal
    goto loop
)

if /i "%komanda%"=="install ts" (
    echo Installing TypeScript...
    cmd /k "npm install -g typescript"
    echo Installation finished!
    goto loop
)

if /i "%komanda:~0,5%"=="runts " (
    setlocal enabledelayedexpansion
    set "args=%komanda:~5%"
    
    if "!args!"=="" (
        echo Put your file name! Primer: node app.js
        endlocal
        goto loop
    )

    :: Pokretanje Node.js skripte
    echo Starting node.js script...
    node !args!
    
    if !errorlevel! neq 0 (
        echo Error!
    ) else (
        echo Node.js script finished!
    )

    endlocal
    goto loop
)

if /i "%komanda:~0,9%"=="newfolder" (
    setlocal enabledelayedexpansion
    set "folder=%komanda:~10%"

    if "!folder!"=="" (
        echo You need to put the folder name! Like: newfolder folder
        endlocal
        goto loop
    )

    mkdir "!folder!" 2>nul
    if exist "!folder!\" (
        echo Folder "!folder!" is created!
    ) else (
        echo Error while creating a folder!
    )

    endlocal
    goto loop
)

if /i "%komanda:~0,7%"=="newfile" (
    setlocal enabledelayedexpansion
    set "fajl=%komanda:~8%"

    if "!fajl!"=="" (
        echo You need to put the name and extension of the file! Like: newfile my_file.txt
        endlocal
        goto loop
    )

    echo. > "!fajl!"
    if exist "!fajl!" (
        echo File "!fajl!" is created!
    ) else (
        echo Error while creating a file!
    )

    endlocal
    goto loop
)

if /i "%komanda:~0,6%"=="rmfile" (
    setlocal enabledelayedexpansion
    set "fajl=%komanda:~7%"

    if "!fajl!"=="" (
        echo You need to put the name and extension of the file! Primer: rmfile index.txt
        endlocal
        goto loop
    )

    if not exist "!fajl!" (
        echo Fajl "!fajl!" is not finded!
        endlocal
        goto loop
    )

    del /f /q "!fajl!"
    if not exist "!fajl!" (
        echo Fajl "!fajl!" is deleted!
    ) else (
        echo Error while deleting a file!
    )

    endlocal
    goto loop
)

if /i "%komanda:~0,8%"=="rmfolder" (
    setlocal enabledelayedexpansion
    set "folder=%komanda:~9%"

    if "!folder!"=="" (
        echo You need to put the folder name! Like: rmfolder myFolder
        endlocal
        goto loop
    )

    if not exist "!folder!\" (
        echo Folder "!folder!" is not finded!
        endlocal
        goto loop
    )

    rmdir /s /q "!folder!"
    if not exist "!folder!\" (
        echo Folder "!folder!" is deleted!
    ) else (
        echo Error while deleting a folder!
    )

    endlocal
    goto loop
)

if /i "%komanda%" == "pwr" (
	powershell
	goto loop
)

if /i "%komanda%" == "pshell" (
	powershell
	goto loop
)

if /i "%komanda%" == "shell" (
	powershell
	goto loop
)

if /i "%komanda%" == "commands -help" (
echo.
echo.
			echo cd - change directory
			echo list - list all of files and folders
			echo list react-features - list all of react-features
			echo lsall - list all of the files and folders in your system
			echo tskm - open task manager
			echo tskkill - end the process
			echo service - open all services
			echo newcmd - open the new terminal
			echo clearcommands - clear all of the commands which you typed
			echo checknet - check your internet (ping)
			echo github - open my GitHub account
			echo shutdown - open shutdown remote dialog
			echo turnoff - shutdown your computer
			echo connectedip - show your all ips which you are connected
			echo ts json - make tsconfig.json
			echo ts file.ts - make file.js
			echo install ts - install typescript
			echo runts file.js - run your typescript file
			echo newfolder nameofyourfolder - make new folder
			echo newfile - make new file
			echo rmfile - remove / delete new file
			echo rmfolder - remove / delete folder
			echo pwr / pshell / shell - open powershell
			echo commands -help - show all of the commands
echo.
echo.
)

:: Ako je uneta komanda `exit`
if /i "%komanda%"=="exit" exit

%komanda% 2>nul
if %errorlevel% NEQ 0 echo If you need some help type "commands -help"
goto loop