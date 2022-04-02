@echo off
set SESSION=sftp://tester:password@ip:port/ -hostkey="ssh-rsa 2048 xxxxxxxxx" -privatekey="C:\Users\ahboy\Desktop\server-private-key-rsa.ppk"
set REMOTE_PATH=/
set SOURCE_PATH="C:\Users\ahboy\Desktop\area\files\*"
set WINSCP_SCRIPT_PATH="C:\Users\ahboy\Desktop\winscp\script.txt"
set WINSCP_EXE_PATH="C:\Program Files (x86)\WinSCP\winscp.com"
set WINSCP_LOG_PATH="C:\Users\ahboy\Desktop\winscp\script.log"

(
  echo open %SESSION%
  echo cd %REMOTE_PATH%
for %%f in (%SOURCE_PATH%) do (
 echo put "%%f"
)
echo exit
) > %WINSCP_SCRIPT_PATH%



%WINSCP_EXE_PATH% /ini=nul /log=%WINSCP_LOG_PATH% /script=%WINSCP_SCRIPT_PATH%
set RESULT=%ERRORLEVEL%
 
del %WINSCP_SCRIPT_PATH%
 
rem Propagating WinSCP exit code
exit /b %RESULT%
