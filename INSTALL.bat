@echo off
cls
echo Welcome to BeautifulDiscord install tool
echo --------------------------------------------------

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
  @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

  cls
  echo Done installing chocolatey, continuing to install Python and BeautifulDiscord
  echo Please do not close this window until it's done...
  echo --------------------------------------------------

  :: Python
  start /wait cmd.exe /c choco install python

  :: BeautifulDiscord
  start /wait cmd.exe /c pip install -U https://github.com/leovoel/BeautifulDiscord/archive/master.zip

  cls
  echo You have now installed the following:
  echo    - chocolatey
  echo    - Python 3.6.3
  echo    - BeautifulDiscord
  echo --------------------------------------------------
  pause
  exit
