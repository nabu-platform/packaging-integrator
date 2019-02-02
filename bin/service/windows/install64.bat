REM more information: http://commons.apache.org/proper/commons-daemon/procrun.html
REM any settings that start with PR_ followed by the parameter name override settings passed in using the "--" syntax below but this does not seem to work well for some reason
REM apparently prunsrv is very sensitive to quotes, if you add any (or just in the wrong place?) it simply ignores much of what follows leading to a failed installation
REM for this reason it is best to install the nabu server in a directory that has no spaces in its path
REM log files are found: C:\Windows\System32\LogFiles\Apache (or presumably in a similar folder for 64 bit systems)

set BAT_PATH=%~dp0
set SERVICE_NAME=Nabu
set PRR_INSTALL=%BAT_PATH%amd64\nabu.exe
 
set PRR_CLASSPATH=%BAT_PATH%..\..\lib\*;%BAT_PATH%..\..\
set PRR_PARAMS=properties=%BAT_PATH%..\..\server.properties
set PRR_JVMOPTIONS=-Dglass.platform=Monocle;-Dmonocle.platform=Headless;-Ddevelopment=false;-Dversion=2

prunsrv.exe //IS//%SERVICE_NAME% --Install=%PRR_INSTALL% --Description="Nabu Development Platform Server"^
 --Jvm=auto --StartMode=jvm --StopMode=jvm^
 --JvmMs=256 --JvmMx=4096^
 --StartClass=be.nabu.eai.server.Standalone^
 --StopClass=be.nabu.eai.server.Standalone^
 ++StartParams=%PRR_PARAMS%^
 ++StopParams=stop^
 --Startup=auto^
 --Classpath=%PRR_CLASSPATH%^
 --LogPrefix=%SERVICE_NAME%^
 --JvmOptions=%PRR_JVMOPTIONS%^
 --StdError=auto^
 --StdOutput=auto^
 --LogLevel=Debug