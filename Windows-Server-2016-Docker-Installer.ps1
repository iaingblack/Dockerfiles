# https://blog.docker.com/2016/09/build-your-first-docker-windows-server-container/
# Add the containers feature and restart
Install-WindowsFeature containers
Restart-Computer -Force

# Download, install and configure Docker Engine
Invoke-WebRequest "https://download.docker.com/components/engine/windows-server/cs-1.12/docker.zip" -OutFile "$env:TEMP\docker.zip" -UseBasicParsing

Expand-Archive -Path "$env:TEMP\docker.zip" -DestinationPath $env:ProgramFiles

# For quick use, does not require shell to be restarted.
$env:path += ";c:\program files\docker"

# For persistent use, will apply even after a reboot. 
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Program Files\Docker", [EnvironmentVariableTarget]::Machine)

# Start a new PowerShell prompt before proceeding
dockerd --register-service
Start-Service docker
