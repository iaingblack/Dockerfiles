# DOCKERFILES

## Shells
If you need to swap shells, make sure you swap like this;

`SHELL ["cmd /c"]`
`SHELL ["powershell"]`

If you just just put `["cmd"]` then commands will NOT run, it just displays a prompt per RUN step.

Or, if you need to run one command in a specific shell run something like this;

`RUN ["powershell.exe", "Install-WindowsFeature NET-Framework-45-ASPNET"]`

# Images

## Saving and Loading Images
Given this type of image

`REPOSITORY                                    TAG                                IMAGE ID            CREATED             SIZE`
`microsoft/mssql-server-windows                latest                             6fb5a1dbd3c8        3 weeks ago         14.6 GB`

To save images run this type of command (this is uncompressed).

`docker save -o y:\images\microsoft_mssql-server-windows_6fb5a1dbd3c8.dockerimage 6fb5a1dbd3c8`

To load images load this type of command

`docker load -i microsoft_mssql-server-windows_6fb5a1dbd3c8.dockerimage`
