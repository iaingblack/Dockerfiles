If you need to swap shells, make sure you swap like this;

`SHELL ["cmd /c"]`
`SHELL ["powershell"]`

If you just just put `["cmd"]` then commands will NOT run, it just displays a prompt per RUN step.

Or, if you need to run one command in a specific shell run something like this;

`RUN ["powershell.exe", "Install-WindowsFeature NET-Framework-45-ASPNET"]`


