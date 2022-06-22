Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

Install-Package -Name docker -ProviderName DockerMsftProvider

Restart-Computer -Force

Get-Package -Name Docker -ProviderName DockerMsftProvider

Find-Package -Name Docker -ProviderName DockerMsftProvider

Find-Package -Name Docker -ProviderName DockerMsftProvider

Install-Package -Name Docker -ProviderName DockerMsftProvider -Update -Force

Start-Service Docker

#Ersten Container installieren (BasisImage)

docker pull mcr.microsoft.com/windows/nanoserver:ltsc2022

#überprüfen, ob Image vorhanden ist

docker images
#Ausgabe:
#REPOSITORY             TAG                 IMAGE ID            CREATED             SIZE
#microsoft/nanoserver   latest              105d76d0f40e        4 days ago          652 MB

docker run -it mcr.microsoft.com/windows/nanoserver:ltsc2022 cmd.exe

#Textdatei erstellen und Docker schliessen
echo "Hello World!" > c:\Hello.txt
exit

docker ps -a

docker stop eda25071763f 

docker commit eda25071763f helloworld

docker start eda25071763f

docker images

#prüfen ob Image mit "Hello World" erstellt wurde
##REPOSITORY                             TAG                 IMAGE ID            CREATED             SIZE
#helloworld                             latest              a1064f2ec798        10 seconds ago      258MB
#mcr.microsoft.com/windows/nanoserver   2022                2b9c381d0911        3 weeks ago         256MB


docker run --rm helloworld2 cmd.exe /s /c type C:\Hello.txt



Get-ExecutionPolicy
Set-ExecutionPolicy Unrestricted
##URLs zu Container
#https://docs.microsoft.com/de-de/virtualization/windowscontainers/quick-start/set-up-environment?tabs=Windows-Server
#https://docs.microsoft.com/de-de/virtualization/windowscontainers/quick-start/run-your-first-container