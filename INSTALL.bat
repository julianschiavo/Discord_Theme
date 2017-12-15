@echo off

:: Settings
set Update=0
set Canary=0


:: Do not change anything under this line
:: Unless you know what you're doing...

cls
echo Welcome to BeautifulDiscord install tool
echo --------------------------------------------------
set Download=https://github.com/leovoel/BeautifulDiscord/archive/master.zip

if {%Update%}=={1} (
  cd %UserProfile%\Documents && mkdir DiscordTheme && cd DiscordTheme && wget https://raw.githubusercontent.com/AlexFlipnote/Discord_Theme/master/autotheme.css
  cd %UserProfile%\Documents\DiscordTheme && beautifuldiscord --css autotheme.css
  cls
  echo Successfully Updated!
  echo ---------------------
  pause
  exit
)

if {%Canary%}=={1} (
  set Download=https://github.com/leovoel/BeautifulDiscord/archive/canary.zip
)

:CheckAdmin
  :: Check if admin permissions are placed
  >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
  if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto RequestAdmin
    exit
  ) else (
    goto Install
  )

:RequestAdmin
  echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
  set params = %*:"=""
  echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

  "%temp%\getadmin.vbs"
  del "%temp%\getadmin.vbs"
  exit


:Install
  cls
  echo Install list:
  echo   - choco               Downloading and Installing...
  echo   - Python              Waiting...
  echo   - BeautifulDiscord    Waiting...
  echo   - wget                Waiting...
  echo   - Dicord Theme        Waiting...
  echo   - Inserting themed    Waiting...
  echo --------------------------------------------------
  @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
  :: Disabling annoying confirm
  choco feature enable -n allowGlobalConfirmation

  :: Python
  cls
  echo Install list:
  echo   - choco               Complete!
  echo   - Python              Downloading and Installing...
  echo   - BeautifulDiscord    Waiting...
  echo   - wget                Waiting...
  echo   - Dicord Theme        Waiting...
  echo   - Inserting themed    Waiting...
  echo --------------------------------------------------
  choco install python

  :: BeautifulDiscord
  cls
  echo Install list:
  echo   - choco               Complete!
  echo   - Python              Complete!
  echo   - BeautifulDiscord    Downloading and Installing...
  echo   - wget                Waiting...
  echo   - Dicord Theme        Waiting...
  echo   - Inserting themed    Waiting...
  echo --------------------------------------------------
  pip install -U %Download%

  :: wget
  cls
  echo Install list:
  echo   - choco               Complete!
  echo   - Python              Complete!
  echo   - BeautifulDiscord    Complete!
  echo   - wget                Downloading and Installing...
  echo   - Dicord Theme        Waiting...
  echo   - Inserting themed    Waiting...
  echo --------------------------------------------------
  choco install wget

  :: Download theme
  cls
  echo Install list:
  echo   - choco               Complete!
  echo   - Python              Complete!
  echo   - BeautifulDiscord    Complete!
  echo   - wget                Complete!
  echo   - Dicord Theme        Downloading and Installing...
  echo   - Inserting themed    Waiting...
  echo --------------------------------------------------
  cd %UserProfile%\Documents && mkdir DiscordTheme && cd DiscordTheme && wget https://raw.githubusercontent.com/AlexFlipnote/Discord_Theme/master/autotheme.css

  :: Insert Theme
  cls
  echo Install list:
  echo   - choco               Complete!
  echo   - Python              Complete!
  echo   - BeautifulDiscord    Complete!
  echo   - wget                Complete!
  echo   - Dicord Theme        Complete!
  echo   - Inserting themed    Loading...
  echo --------------------------------------------------
  cd %UserProfile%\Documents\DiscordTheme && beautifuldiscord --css autotheme.css

  cls
  echo You have now installed the following:
  echo    - chocolatey (Used to install Python)
  echo    - Python 3.6.3
  echo    - BeautifulDiscord
  echo    - wget (To download the theme)
  echo    - AlexFlipnote/Discord_Theme (The theme)
  echo --------------------------------------------------
  pause
  exit
